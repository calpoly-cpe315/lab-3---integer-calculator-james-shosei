.arch armv8-a
.text

//x0 - x1
.global bitwise_sub
bitwise_sub:
  stp    x29, x30, [sp, -48]!
  stp    x19, x20, [sp, 16]
  str    x21, [sp, 32]

  mov x19, x0 //arg1

  cmp x1, 0
  B.lt negative

  eor x1, x1, 0xFFFFFFFF
  mov x0, #1
  bl bitwise_add

  b calculate

negative:
  mov x0, #-1
  bl bitwise_add
  eor x0, x0, 0xFFFFFFFF

calculate:
  
  mov x1, x19
  bl bitwise_add

  ldp    x19, x20, [sp, 16]
  ldr    x21, [sp, 32]
  ldp    x29, x30, [sp], 48
  ret


