80000000
9fffffff

1.
receiver bb000000~bb0007ff // 收包
listen to bb0007ff:
case 0: no datagram

case ffff: datagram 
length->bb0007f(c,d,e)小端
after: bb0007ff->0

2.
sender   bc000000~bc0003ff // 发包
listen to bc0003ff:
case 0: can send
first write all datagram
then length->bc0003f(c,d,e)小端
after: bb0003ff->ffff

case ffff: idle

3. Maintain router table?
router_table bd000000~bd07ffff
can read at any time
write all at same time
Trie format:
root: 1
each vertex: 64 bits-> 2 int (nexthop?0, leftson, rightson)
port bf000000~bf00ffff

a tag: 
if writing, set bd000000~bd000007 to all '1'.
after, reset

4. timer
mfc0 : cp0 count (9) -> reg