.global _main

_main:
  stp   x21, x30, [sp, -16]!
  ; in apple platform, loading has to be two instructions
  ; load the base page address
  adrp  x0, msg@PAGE
  ; load the page offset
  add   x0, x0, msg@PAGEOFF
  bl    _puts
  ldp   x21, x30, [sp], 16
  mov   x0, xzr
  ret


.data
msg: 
  .asciz "Hello world"

.end
