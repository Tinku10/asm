.global _main

_main:
  stp x21, x30, [sp, -16]!
  mov x0, 1
  mov x1, 2
  cmp x0, x1
  ble lessthan
  b greaterthan

lessthan:
  adrp x0, less@PAGE
  add x0, x0, less@PAGEOFF
  b exit

greaterthan:
  adrp x0, greater@PAGE
  add x0, x0, greater@PAGEOFF
  b exit

exit:
  bl _puts
  ldp x21, x30, [sp], 16
  mov x0, xzr
  ret

.data

less: 
  .asciz "Less than"
greater: 
  .asciz "Greater than"

.end
