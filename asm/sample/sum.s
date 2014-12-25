        lda $2, 100($31)
loop:   
        addl $2, $0, $0
        lda $2, -1($2)
        bne $2, loop
