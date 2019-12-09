#include <stdint.h>
#include <stdlib.h>

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