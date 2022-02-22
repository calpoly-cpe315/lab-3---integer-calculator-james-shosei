
  .global main
main:
    stp    x29, x30, [sp, -32]!

while:
    adr x0, prompt1
    bl printf
    
    adr x0, scannum
    add x1, sp, 16

    bl scanf

    ldr x19, [sp, 16] //int 1

    adr x0, prompt2
    bl printf

    adr x0, scannum
    add x1, sp, 16

    bl scanf

    ldr x20, [sp, 16] // int 2

    adr x0, operation
    bl printf

    adr x0, scanchar
    add x1, sp, 16

    bl scanf

    ldr x21, [sp, 16] // operation

    mov x0, x19
    mov x1, x20

    mov x2, #43
    cmp x2, x21
    B.eq addi

    mov x2, #45
    cmp x2, x21
    B.eq subt

    mov x2, #42
    cmp x2, x21
    B.eq mult

//Negative numbers in the second operand only work for subt
//if we rearrange the code so that subt is before addi
//And the same is for add if we rearrange the code so that 
//addi is before subt in main.s 
//And the same is for mult, etc. 

//We believe this is because of how scanf works and %d, but
//addi, subt, mult on their own *work as intended* with negative numbers
//They each have code to handle negative values but main doens't interact with them very well. 

//Also putting a negative in the second operand causes the program to not loop
//we believe for the same reasons above. 

subt:
  bl bitwise_sub
  b check

mult:
  bl mul
  b check

addi:
  bl bitwise_add
  b check


check:
    mov x19, x0
    adr x0, result
    bl printf

    adr x0, printnum
    mov x1, x19
    bl printf

    adr x0, again
    bl printf

    adr x0, scanchar
    add x1, sp, 16

    bl scanf

    ldr x0, [sp, 16]
    cmp x0, #121
    B.eq while

    ldp    x29, x30, [sp], 32
    ret
    


printnum: .asciz "%d\n"
scannum: .asciz "%d"
scanchar: .asciz "%s"
prompt1: .asciz "Enter Number 1: "
prompt2: .asciz "Enter Number 2: "
operation: .asciz "Enter Operation: "
result: .asciz "Result is: "
again: .asciz "Again? (y/n): "
