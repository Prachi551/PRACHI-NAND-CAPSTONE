
// Box.asm for K = 19
// Draws a 64x20 pixel black box starting at Row 19
// Starting Screen Address = 16384 + (32 * 19) = 16992

(LOOP)
    @KBD
    D=M
    @SET_BLACK
    D;JNE

    @color
    M=0
    @DRAW_INIT
    0;JMP

(SET_BLACK)
    @color
    M=-1

(DRAW_INIT)
    @16992
    D=A
    @addr
    M=D

    @20
    D=A
    @rows
    M=D

(ROW_LOOP)
    @rows
    D=M
    @LOOP
    D;JEQ

    // Word 0
    @color
    D=M
    @addr
    A=M
    M=D

    // Word 1
    @color
    D=M
    @addr
    A=M+1
    M=D

    // Word 2
    @color
    D=M
    @addr
    A=M+1
    A=A+1
    M=D

    // Word 3
    @color
    D=M
    @addr
    A=M+1
    A=A+1
    A=A+1
    M=D

    // Move to next row
    @32
    D=A
    @addr
    M=D+M

    @rows
    M=M-1

    @ROW_LOOP
    0;JMP
