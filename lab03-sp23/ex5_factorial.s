.globl factorial

.data
n: .word 7

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE
    
    #prologue
    addi sp sp -8
    sw s0 0(sp)
    sw s1 4(sp)
    
    add s0 x0 a0   # set s0 = n
    addi s1 x0 1   # set s1 = factorial outcome
    Loop:
        beq s0 x0 End
        mul s1 s1 s0  # multiply s0 to s1
        addi s0 s0 -1 # decrease s0 by 1
        j Loop
    End:
        add a0 x0 s1 # set return factorial outcome
    
    # epilogue
    lw s0 0(sp)
    lw s1 4(sp)
    addi sp sp 8
    
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    jr ra
