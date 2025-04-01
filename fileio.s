.global _main

.align 4

open:
  stp x29, x30, [sp, -16]!
  mov x29, sp

  adrp x0, file@PAGE
  add x0, x0, file@PAGEOFF
  mov w1, 0102
  mov w2, 0600
  bl _open

  ldp x29, x30, [sp], 16
  ret

read:
  ; reading one byte from FD
  adrp x1, buf@PAGE
  add x1, x1, buf@PAGEOFF
  mov x2, 1

  ; backup FD
  mov x10, x0

  bl _read
  ; if read() returns 0, we have reached end of file
  cbz x0, exit

  ; restore FD
  mov x0, 1
  adrp x1, buf@PAGE
  add x1, x1, buf@PAGEOFF
  mov x2, 1
  bl _write

  add x20, x20, 1

  ; restore FD
  mov x0, x10
  mov x1, x20
  mov x2, 0
  bl _lseek

  ; restore FD
  mov x0, x10
  ; read the next byte
  b read

_main:
  stp x29, x30, [sp, -16]!
  mov x29, sp

  mov x0, xzr
  ; keep the file offset
  mov x20, xzr

  bl open
  b read

exit:
  ldp x29, x30, [sp], 16
  ret

.data

file: .asciz ".gitignore"
buf: .word 0
