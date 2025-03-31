.global _main

.text
.align 4
; x0 is the number of bytes in the array
; x1 is the pointer to the array
; x3 stores the sum

_main:
  stp x21, x30, [sp, -16]!
  mov x3, xzr
  adrp x1, array@PAGE
  add x1, x1, array@PAGEOFF
  ; stores the total byte length
  mov x0, 5
  ; lsl x0, x0, 2
  ; end address of the array
  ; add x0, x1, x0
  add x0, x1, x0, lsl 2

while:
  cmp x1, x0
  beq exit

  ldr x2, [x1], 4
  add x3, x3, x2
  b while

exit:
  ldp x21, x30, [sp], 16
  mov x0, x3
  ret

.data

array:
  .word 1, 2, 3, 4, 5
