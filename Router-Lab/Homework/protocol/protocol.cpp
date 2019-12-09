#include "rip.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

/*
  在头文件 rip.h 中定义了如下的结构体：
  #define RIP_MAX_ENTRY 25
  typedef struct {
    // all fields are big endian
    // we don't store 'family', as it is always 2(for response) and 0(for request)
    // we don't store 'tag', as it is always 0
    uint32_t addr;
    uint32_t mask;
    uint32_t nexthop;
    uint32_t metric;
  } RipEntry;

  typedef struct {
    uint32_t numEntries;
    // all fields below are big endian
    uint8_t command; // 1 for request, 2 for response, otherwsie invalid
    // we don't store 'version', as it is always 2
    // we don't store 'zero', as it is always 0
    RipEntry entries[RIP_MAX_ENTRY];
  } RipPacket;

  你需要从 IPv4 包中解析出 RipPacket 结构体，也要从 RipPacket 结构体构造出对应的 IP 包
  由于 Rip 包结构本身不记录表项的个数，需要从 IP 头的长度中推断，所以在 RipPacket 中额外记录了个数。
  需要注意这里的地址都是用 **大端序** 存储的，1.2.3.4 对应 0x04030201 。
*/

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