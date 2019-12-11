#include "router.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

/*
  RoutingTable Entry 的定义如下：
  typedef struct {
    uint32_t addr; // 大端序，IPv4 地址
    uint32_t len; // 小端序，前缀长度
    uint32_t if_index; // 小端序，出端口编号
    uint32_t nexthop; // 大端序，下一跳的 IPv4 地址
  } RoutingTableEntry;

  约定 addr 和 nexthop 以 **大端序** 存储。
  这意味着 1.2.3.4 对应 0x04030201 而不是 0x01020304。
  保证 addr 仅最低 len 位可能出现非零。
  当 nexthop 为零时这是一条直连路由。
  你可以在全局变量中把路由表以一定的数据结构格式保存下来。
*/

RoutingTableEntry routersList[55];
bool isDisable[55] = {0};
int cnt = 0;
uint32_t qmetric;

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
    routersList[cnt++] = entry;
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
  qmetric = 16;
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
      qmetric = routersList[i].metric;
      lstMatchSize = MatchSize;
    }
  }
  if(lstMatchSize >= 0) return true;
  return false;
}