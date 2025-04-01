.global _find_oldest_person

.align 4

; struct Person {                    
;     char * fname;
;     char * lname;
;     int age;
; }; 

_find_oldest_person:
  stp x29, x30, [sp, -16]!
  ; x0 contains the pointer to person struct
  ; x1 contains the length of the person array
  ; size of person struct is hardcoded (8 bytes with alignment and padding)
  cbz x0, exit

  ; person is 24 bytes
  mov x5, 24
  ; x1 = x0 + (w1 * w5)
  ; signed multiply add long
  smaddl x1, w1, w5, x0
  ; mul x5, x1, x5
  ; x1 now stores the end address of the array
  ; add x1, x0, x5
  ; store the max age
  mov w4, 0

while:
  cmp x0, x1
  beq exit

  ; age is at 16 byte offset
  ldr w2, [x0, 16]
  cmp w2, w4
  ; use greater condition from the cmp
  ; if true, select w2, else select w4
  ; ternery operation
  csel w4, w2, w4, gt

  ; move to the next pointer
  add x0, x0, 24
  b while

exit:
  ldp x29, x30, [sp], 16
  mov x0, x4
  ret
