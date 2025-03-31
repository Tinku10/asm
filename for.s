.global _main

_main:
  stp x21, x30, [sp, -16]!
  mov x0, 0

for:
  cmp x0, 10
  bge exit
  add x0, x0, 1
  b for

exit:
  ldp x21, x30, [sp], 16]
  mov x0, xzr
  ret
