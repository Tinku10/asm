.global _main

_main:
  stp x21, x30, [sp, -16]!
  mov x1, 1
  mov x2, 10

while:
  cmp x1, x2
  bgt exit
  ; all registers from x0 to x7 can be altered by _puts
  mov x20, x1
  mov x21, x2

  adrp x0, less@PAGE
  add x0, x0, less@PAGEOFF
  bl _puts

  mov x1, x20
  mov x2, x21
  add x1, x1, 1
  b while

exit:
  ldp x21, x30, [sp], 16
  mov x0, xzr
  ret

.data
less:
  .asciz "less"

.end

