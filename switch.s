.global _main

.align 4

_main:
  stp x29, x30, [sp, -16]!
  mov x0, xzr
  bl _time
  ; srand(time(0))
  bl _srand
  bl _rand
  and x0, x0, 4
  adrp x1, jt@PAGE
  add x1, x1, jt@PAGEOFF
  ; all the instructions are 4 bytes
  ; directly go to the offset in jt by multiplying by 4
  add x1, x1, x0, lsl 2
  br x1

jt:
  b 0f
  b 1f
  b 2f
  b 3f
  b 4f

0:
  adrp x0, ZR@PAGE
  add x0, x0, ZR@PAGEOFF
  bl _puts
  b exit
1:
  adrp x0, ON@PAGE
  add x0, x0, ON@PAGEOFF
  bl _puts
  b exit
2:
  adrp x0, TW@PAGE
  add x0, x0, TW@PAGEOFF
  bl _puts
  b exit
3:
  adrp x0, TH@PAGE
  add x0, x0, TH@PAGEOFF
  bl _puts
  b exit
4:
  adrp x0, FR@PAGE
  add x0, x0, FR@PAGEOFF
  bl _puts
  b exit

exit:
  ldp x29, x30, [sp], 16
  mov x0, xzr
  ret

.data

ZR: .asciz "branch zero"
ON: .asciz "branch one"
TW: .asciz "branch two"
TH: .asciz "branch three"
FR: .asciz "branch four"
