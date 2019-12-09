#include "rip.h"
#include "router.h"
#include "router_hal.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern bool validateIPChecksum(uint8_t *packet, size_t len);
extern void update(bool insert, RoutingTableEntry entry);
extern bool query(uint32_t addr, uint32_t *nexthop, uint32_t *if_index);
extern bool forward(uint8_t *packet, size_t len);
extern bool disassemble(const uint8_t *packet, uint32_t len, RipPacket *output);
extern uint32_t assemble(const RipPacket *rip, uint8_t *buffer);

uint8_t packet[2048];
uint8_t output[2048];
// 0: 10.0.1.1
// 1: 10.0.2.1
// 2: 10.0.3.1
// 3: 10.0.4.1
// 你可以按需进行修改，注意端序
in_addr_t addrs[N_IFACE_ON_BOARD] = {0x0101000a, 0x0102000a, 0x0103000a,
                                     0x0104000a};

int main(int argc, char *argv[]) {
  // 0a.
  int res = HAL_Init(1, addrs);
  if (res < 0) {
    return res;
  }

  // 0b. Add direct routes
  // For example:
  // 10.0.1.0/24 if 0
  // 10.0.2.0/24 if 1
  // 10.0.3.0/24 if 2
  // 10.0.4.0/24 if 3
  for (uint32_t i = 0; i < N_IFACE_ON_BOARD; i++) {
    RoutingTableEntry entry = {
        .addr = addrs[i] & 0x00FFFFFF, // big endian
        .len = 24,        // small endian
        .if_index = i,    // small endian
        .nexthop = 0      // big endian, means direct
    };
    update(true, entry);
  }

  uint64_t last_time = 0;
  while (1) {
    uint64_t time = HAL_GetTicks();
    if (time > last_time + 30 * 1000) {
      // What to do?
      // send complete routing table to every interface
      // ref. RFC2453 3.8
      // multicast MAC for 224.0.0.9 is 01:00:5e:00:00:09
      printf("30s Timer\n");
      last_time = time;
      // TODO: broadcast everything
      resp.command = 2;
          resp.numEntries = 0;
          for(int i = 0; i < cnt; i++)
            if(!isDisable[i]){
              resp.entries[resp.numEntries].addr = routersList[i].addr;
              //resp.entries[resp.numEntries].mask
              resp.entries[resp.numEntries].nexthop = routersList[i].nexthop;
              resp.entries[resp.numEntries].metric = 16;
              resp.numEntries++;
            }
          // assemble
          // IP
          output[0] = 0x45;
          // ...
          // UDP
          // port = 520
          output[20] = 0x02;
          output[21] = 0x08;
          // ...
          // RIP
          uint32_t rip_len = assemble(&resp, &output[20 + 8]);
          // checksum calculation for ip and udp
          // if you don't want to calculate udp checksum, set it to zero
          // send it back
          HAL_SendIPPacket(if_index, output, rip_len + 20 + 8, src_mac);
    }

    int mask = (1 << N_IFACE_ON_BOARD) - 1;
    macaddr_t src_mac;
    macaddr_t dst_mac;
    int if_index;
    res = HAL_ReceiveIPPacket(mask, packet, sizeof(packet), src_mac, dst_mac,
                              1000, &if_index);
    if (res == HAL_ERR_EOF) {
      break;
    } else if (res < 0) {
      return res;
    } else if (res == 0) {
      // Timeout
      continue;
    } else if (res > sizeof(packet)) {
      // packet is truncated, ignore it
      continue;
    }

    // 1. validate
    if (!validateIPChecksum(packet, res)) {
      printf("Invalid IP Checksum\n");
      continue;
    }
    in_addr_t src_addr, dst_addr;
    // extract src_addr and dst_addr from packet
    // big endian

    // 2. check whether dst is me
    bool dst_is_me = false;
    for (int i = 0; i < N_IFACE_ON_BOARD; i++) {
      if (memcmp(&dst_addr, &addrs[i], sizeof(in_addr_t)) == 0) {
        dst_is_me = true;
        break;
      }
    }
    // TODO: Handle rip multicast address(224.0.0.9)?

    if (dst_is_me) {
      // 3a.1
      RipPacket rip;
      // check and validate
      if (disassemble(packet, res, &rip)) {
        if (rip.command == 1) {
          // 3a.3 request, ref. RFC2453 3.9.1
          // only need to respond to whole table requests in the lab
          RipPacket resp;
          // TODO: fill resp
          resp.command = 2;
          resp.numEntries = 0;
          for(int i = 0; i < cnt; i++)
            if(!isDisable[i]){
              resp.entries[resp.numEntries].addr = routersList[i].addr;
              //resp.entries[resp.numEntries].mask
              resp.entries[resp.numEntries].nexthop = routersList[i].nexthop;
              resp.entries[resp.numEntries].metric = 16;
              resp.numEntries++;
            }
          // assemble
          // IP
          output[0] = 0x45;
          // ...
          // UDP
          // port = 520
          output[20] = 0x02;
          output[21] = 0x08;
          // ...
          // RIP
          uint32_t rip_len = assemble(&resp, &output[20 + 8]);
          // checksum calculation for ip and udp
          // if you don't want to calculate udp checksum, set it to zero
          // send it back
          HAL_SendIPPacket(if_index, output, rip_len + 20 + 8, src_mac);
        } else {
          // 3a.2 response, ref. RFC2453 3.9.2
          // update routing table
          // new metric = ?
          // update metric, if_index, nexthop
          // what is missing from RoutingTableEntry?
          // TODO: use query and update
          for (int i = 0; i < rip.numEntries; i++){
            uint32_t ifindex, nxthop;
            bool hasroute = query(rip.entries[i].addr, &nxthop, &ifindex);
            RoutingTableEntry routingentry;
            routingentry.addr = rip.entries[i].addr;
            if(hasroute&&nxthop==rip.entries[i].nexthop&&ifindex==if_index){
              // nothing to do
            }
            else {
              update(false, routingentry);
              routingentry.nexthop = rip.entries[i].nexthop;
              routingentry.if_index = if_index;
              //routingentry.len = 24;
              update(true, routingentry);
              // assemble
              // IP
              output[0] = 0x45;
              // ...
              // UDP
              // port = 520
              output[20] = 0x02;
              output[21] = 0x08;
              // ...
              // RIP
              RipPacket resp;
              resp.command = 2;
              resp.numEntries = 1;
              resp.entries[0] = rip.entries[i];
              uint32_t rip_len = assemble(&resp, &output[20 + 8]);
              // checksum calculation for ip and udp
              // if you don't want to calculate udp checksum, set it to zero
              // send it back
              HAL_SendIPPacket(if_index, output, rip_len + 20 + 8, src_mac);
            }
          }

          // triggered updates? ref. RFC2453 3.10.1
        }
      }
    } else {
      // 3b.1 dst is not me
      // forward
      // beware of endianness
      uint32_t nexthop, dest_if;
      if (query(dst_addr, &nexthop, &dest_if)) {
        // found
        macaddr_t dest_mac;
        // direct routing
        if (nexthop == 0) {
          nexthop = dst_addr;
        }
        if (HAL_ArpGetMacAddress(dest_if, nexthop, dest_mac) == 0) {
          // found
          memcpy(output, packet, res);
          // update ttl and checksum
          forward(output, res);
          // TODO: you might want to check ttl=0 case
          // Send ICMP Time Exceeded
          
          HAL_SendIPPacket(dest_if, output, res, dest_mac);
        } else {
          // not found
          // you can drop it
          printf("ARP not found for %x\n", nexthop);
        }
      } else {
        // not found
        // optionally you can send ICMP Host Unreachable
        printf("IP not found for %x\n", src_addr);
      }
    }
  }
  return 0;
}
