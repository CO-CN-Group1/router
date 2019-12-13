#include "router_hal.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RIP_MAX_ENTRY 25
typedef struct {
  // all fields are big endian
  // we don't store 'family', as it is always 2(response) and 0(request)
  // we don't store 'tag', as it is always 0
  uint32_t addr;
  uint32_t mask;
  uint32_t nexthop;
  uint32_t metric;
} RipEntry;

typedef struct {
  uint32_t numEntries;
  // all fields below are big endian
  uint8_t command;
  // we don't store 'version', as it is always 2
  // we don't store 'zero', as it is always 0
  RipEntry entries[RIP_MAX_ENTRY];
} RipPacket;

// 路由表的一项
typedef struct {
    uint32_t addr; // 地址
    uint32_t len; // 前缀长度
    uint32_t if_index; // 出端口编号
    uint32_t nexthop; // 下一条的地址，0 表示直连
    uint32_t metric;
    uint32_t mask;
    uint32_t timer;
    // 为了实现 RIP 协议，需要在这里添加额外的字段
} RoutingTableEntry;

RoutingTableEntry routersList[55];
bool isDisable[55] = {0};
int cnt = 0, goal;

/**
 * @brief 进行 IP 头的校验和的验证
 * @param packet 完整的 IP 头和载荷
 * @param len 即 packet 的长度，单位是字节，保证包含完整的 IP 头
 * @return 校验和无误则返回 true ，有误则返回 false
 */
bool validateIPChecksum(uint8_t *packet, size_t len) {
  
  uint16_t fcsm = ((uint16_t)packet[10] << 8) + packet[11];
  int length = ((int)packet[0] & ((1 << 4) - 1)) * 4;
  packet[10] = 0;
  packet[11] = 0;
  uint32_t checksum = 0, cur, filter = (1 << 16) - 1;
  for (int i = 0; i < length; i += 2){
      cur = ((uint16_t)packet[i] << 8) + packet[i + 1];
      checksum += cur;
  }
  for (;(checksum >> 16); checksum = (checksum & filter) + (checksum >> 16));
  uint16_t csm = ~(uint16_t)(checksum & filter);
  packet[10] = csm >> 8;
  packet[11] = csm & ((1 << 8) - 1);
  return fcsm == csm;
}

/**
 * @brief 插入/删除一条路由表表项
 * @param insert 如果要插入则为 true ，要删除则为 false
 * @param entry 要插入/删除的表项
 * 
 * 插入时如果已经存在一条 addr 和 len 都相同的表项，则替换掉原有的。
 * 删除时按照 addr 和 len 匹配。
 */
void update(bool insert, RoutingTableEntry entry) {
  if(insert){
    int i;
    for (i = 0; i < cnt; i++)
      if(entry.addr == routersList[i].addr){
        routersList[i] = entry;
        isDisable[i] = false;
      }
    if(i==cnt)routersList[cnt++] = entry;
  }
  else{
    for (int i = 0; i < cnt; i++)
      if(entry.addr == routersList[i].addr){
        isDisable[i] = true;
      }
  }
}

/**
 * @brief 进行一次路由表的查询，按照最长前缀匹配原则
 * @param addr 需要查询的目标地址，大端序
 * @param nexthop 如果查询到目标，把表项的 nexthop 写入
 * @param if_index 如果查询到目标，把表项的 if_index 写入
 * @return 查到则返回 true ，没查到则返回 false
 */
bool query(uint32_t addr, uint32_t *nexthop, uint32_t *if_index) {
  *nexthop = 0;
  *if_index = 0;
  goal = -1;
  int lstMatchSize = -1;
  for (int i = 0; i < cnt; i++){
    bool equal = true;
    int MatchSize = 4;
    uint32_t xx = routersList[i].addr;
    uint32_t yy = addr;
    for (int j = 0; j < 4; j++){
      uint32_t x = xx & ((1<<8)-1);
      uint32_t y = yy & ((1<<8)-1);
      if(x != y && x != 0) equal = false;
      if(x != y)MatchSize--;
      xx >>= 8;
      yy >>= 8;
    }
    if(!isDisable[i] && equal && MatchSize > lstMatchSize){
      *nexthop = routersList[i].nexthop;
      *if_index = routersList[i].if_index;
      goal = i;
      lstMatchSize = MatchSize;
    }
  }
  if(lstMatchSize >= 0) return true;
  return false;
}

/**
 * @brief 进行转发时所需的 IP 头的更新：
 *        你需要先检查 IP 头校验和的正确性，如果不正确，直接返回 false ；
 *        如果正确，请更新 TTL 和 IP 头校验和，并返回 true 。
 *        你可以从 checksum 题中复制代码到这里使用。
 * @param packet 收到的 IP 包，既是输入也是输出，原地更改
 * @param len 即 packet 的长度，单位为字节
 * @return 校验和无误则返回 true ，有误则返回 false
 */
bool forward(uint8_t *packet, size_t len) {
  uint16_t fcsm = ((uint16_t)packet[10] << 8) + packet[11];
  int length = ((int)packet[0] & ((1 << 4) - 1)) * 4;
  packet[10] = 0;
  packet[11] = 0;
  uint32_t checksum = 0, cur, filter = (1 << 16) - 1;
  for (int i = 0; i < length; i += 2){
      cur = ((uint16_t)packet[i] << 8) + packet[i + 1];
      checksum += cur;
  }
  for (;(checksum >> 16); checksum = (checksum & filter) + (checksum >> 16));
  uint16_t csm = ~(uint16_t)(checksum & filter);
  if (fcsm != csm) return false;
  packet[8] -= 1;
  checksum = 0;
  for (int i = 0; i < length; i += 2){
      cur = ((uint16_t)packet[i] << 8) + packet[i + 1];
      checksum += cur;
  }
  for (;(checksum >> 16); checksum = (checksum & filter) + (checksum >> 16));
  csm = ~(uint16_t)(checksum & filter);
  packet[10] = csm >> 8;
  packet[11] = csm & ((1 << 8) - 1);
  return true;
}

/**
 * @brief 从接受到的 IP 包解析出 Rip 协议的数据
 * @param packet 接受到的 IP 包
 * @param len 即 packet 的长度
 * @param output 把解析结果写入 *output
 * @return 如果输入是一个合法的 RIP 包，把它的内容写入 RipPacket 并且返回 true；否则返回 false
 * 
 * IP 包的 Total Length 长度可能和 len 不同，当 Total Length 大于 len 时，把传入的 IP 包视为不合法。
 * 你不需要校验 IP 头和 UDP 的校验和是否合法。
 * 你需要检查 Command 是否为 1 或 2，Version 是否为 2， Zero 是否为 0，
 * Family 和 Command 是否有正确的对应关系（见上面结构体注释），Tag 是否为 0，
 * Metric 转换成小端序后是否在 [1,16] 的区间内，
 * Mask 的二进制是不是连续的 1 与连续的 0 组成等等。
 */
bool disassemble(const uint8_t *packet, uint32_t len, RipPacket *output) {
  output->numEntries = 0;
  output->command = packet[28];
  if(packet[29]!=2)return false;
  if(output->command < 1 || output->command > 2)return false;
  int offset, j;
  for (offset = 0, j = 0; offset + 52 <= len; j++, offset += 20){
    output->numEntries++;
    for(int i = 39+offset; i >= 36+offset; i--){
      output->entries[j].addr = (output->entries[j].addr << 8) + packet[i];
    }
    for(int i = 43+offset; i >= 40+offset; i--){
      output->entries[j].mask = (output->entries[j].mask << 8) + packet[i];
      if(packet[i]>0&&packet[i]<255)return false;
    }
    for(int i = 47+offset; i >= 44+offset; i--){
      output->entries[j].nexthop = (output->entries[j].nexthop << 8) + packet[i];
    }
    if(packet[51+offset]==0)return false;
    for(int i = 51+offset; i >= 48+offset; i--){
      output->entries[j].metric = (output->entries[j].metric << 8) + packet[i];
    }
  }
  return (len-52)%20==0;
}

/**
 * @brief 从 RipPacket 的数据结构构造出 RIP 协议的二进制格式
 * @param rip 一个 RipPacket 结构体
 * @param buffer 一个足够大的缓冲区，你要把 RIP 协议的数据写进去
 * @return 写入 buffer 的数据长度
 * 
 * 在构造二进制格式的时候，你需要把 RipPacket 中没有保存的一些固定值补充上，包括 Version、Zero、Address Family 和 Route Tag 这四个字段
 * 你写入 buffer 的数据长度和返回值都应该是四个字节的 RIP 头，加上每项 20 字节。
 * 需要注意一些没有保存在 RipPacket 结构体内的数据的填写。
 */
uint32_t assemble(const RipPacket *rip, uint8_t *buffer) {
  buffer[0] = rip->command;
  buffer[1] = 2;
  buffer[2] = 0;
  buffer[3] = 0;
  for(int i = 0, offset = 0; i < rip->numEntries; i++, offset += 20){
    buffer[4+offset] = 0;
    buffer[5+offset] = (rip->command-1)<<1;
    buffer[6+offset] = 0;
    buffer[7+offset] = 0;
    uint32_t des = rip->entries[i].addr;
    buffer[8+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[9+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[10+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[11+offset] = des & ((1<<8)-1);
    des >>= 8;
    des = rip->entries[i].mask;
    buffer[12+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[13+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[14+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[15+offset] = des & ((1<<8)-1);
    des >>= 8;
    des = rip->entries[i].nexthop;
    buffer[16+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[17+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[18+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[19+offset] = des & ((1<<8)-1);
    des >>= 8;
    des = rip->entries[i].metric;
    buffer[20+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[21+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[22+offset] = des & ((1<<8)-1);
    des >>= 8;
    buffer[23+offset] = des & ((1<<8)-1);
    des >>= 8;
  }
  return 4 + rip->numEntries * 20;
}

uint8_t packet[2048];
uint8_t output[2048];
// 0: 10.0.1.1
// 1: 10.0.2.1
// 2: 10.0.3.1
// 3: 10.0.4.1
// 你可以按需进行修改，注意端序
uint32_t addrs[N_IFACE_ON_BOARD] = {0x0101000a, 0x0102000a, 0x0103000a,
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
      /*
            RipPacket resp;
            resp.command = 2;
            resp.numEntries = 0;
            for(int i = 0; i < cnt; i++)
              if(!isDisable[i]){
                resp.entries[resp.numEntries].addr = routersList[i].addr;
                resp.entries[resp.numEntries].mask = routersList[i].mask;
                resp.entries[resp.numEntries].nexthop = routersList[i].nexthop;
                resp.entries[resp.numEntries].metric = routersList[i].metric;
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
          //for(int j = 0; j < 4; j++)HAL_SendIPPacket(j, output, rip_len + 20 + 8, src_mac);
          */
    }

    int mask = (1 << N_IFACE_ON_BOARD) - 1;
    macaddr_t src_mac;
    macaddr_t dst_mac;
    int if_index;

    // TODO: Implement Receive packet
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
          if(rip.numEntries == 1 && rip.entries[0].metric == 16){
            resp.command = 2;
            resp.numEntries = 0;
            for(int i = 0; i < cnt; i++)
              if(!isDisable[i]){
                resp.entries[resp.numEntries].addr = routersList[i].addr;
                resp.entries[resp.numEntries].mask = routersList[i].mask;
                resp.entries[resp.numEntries].nexthop = routersList[i].nexthop;
                resp.entries[resp.numEntries].metric = routersList[i].metric;
                resp.numEntries++;
              }
          }
          else{
            resp.command = 2;
            resp.numEntries = 0;
            for(int i = 0; i < rip.numEntries; i++){
              uint32_t qnexthop, qifindex;
              resp.entries[resp.numEntries].addr = rip.entries[i].addr;
              resp.entries[resp.numEntries].mask = rip.entries[i].mask;
              if(query(rip.entries[i].addr, &qnexthop, &qifindex)){
                resp.entries[resp.numEntries].nexthop = qnexthop;
                resp.entries[resp.numEntries].metric = routersList[goal].metric;
              }
              else{
                resp.entries[resp.numEntries].nexthop = 0;
                resp.entries[resp.numEntries].metric = 16;
              }
              resp.numEntries++;
            }
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
          RipPacket resp;
          resp.numEntries = 0;
          for (int i = 0; i < rip.numEntries; i++){
            uint32_t ifindex, nxthop;
            bool hasroute = query(rip.entries[i].addr, &nxthop, &ifindex);
            RoutingTableEntry routingentry;
            routingentry.addr = rip.entries[i].addr;
            if(hasroute){
              if(routersList[goal].metric>rip.entries[i].metric + 1){
                //update(false, routingentry);
                routingentry.metric = rip.entries[i].metric + 1;
                routingentry.mask = rip.entries[i].mask;
                routingentry.nexthop = rip.entries[i].nexthop;
                routingentry.if_index = if_index;
                routingentry.timer = time;
                routersList[goal] = routingentry;
                //update(true, routingentry);
              }
              else if(routersList[goal].if_index == if_index && routersList[goal].metric!=rip.entries[i].metric + 1){
                update(false, routingentry);
                routingentry.metric = rip.entries[i].metric + 1;
                routingentry.mask = rip.entries[i].mask;
                routingentry.nexthop = rip.entries[i].nexthop;
                routingentry.if_index = if_index;
                routingentry.timer = time;
                //routersList[goal] = routingentry;
                if(routingentry.metric < 16)update(true, routingentry);
              }
              else{
                routersList[goal].timer = time;
              }
            }
            else{
              routingentry.metric = rip.entries[i].metric + 1;
              if(routingentry.metric>=16)continue;
              routingentry.mask = rip.entries[i].mask;
              routingentry.nexthop = rip.entries[i].nexthop;
              routingentry.if_index = if_index;
              routingentry.timer = time;
              //routersList[goal] = routingentry;
              update(true, routingentry);
              resp.entries[resp.numEntries].addr = rip.entries[i].addr;
              resp.entries[resp.numEntries].mask = rip.entries[i].mask;
              resp.entries[resp.numEntries].nexthop = rip.entries[i].nexthop;
              resp.entries[resp.numEntries].metric = routingentry.metric;
              resp.numEntries++;
            }
          }
          // triggered updates? ref. RFC2453 3.10.1
          resp.command = 2;
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
          for(int i = 0; i < 4; i++)HAL_SendIPPacket(i, output, rip_len + 20 + 8, src_mac);
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
