	lda $2, 100($31)
loop:
    addl $2, $0, $0
    lda $2, -1($2)
    bne $2, loop
    ldah $3, 16($31)
    stl $0, 3($3)
stop:
    br $31, stop
