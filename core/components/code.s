        LDA $28, 1024($31)      # counter for loop
        LDA $29, 64($31)      # entry point
        LDA $30, 64($31)      # address
	LDAH $4, 16($31)
read0:	LDL $0, 0($4)
	BEQ $0, read0
	LDL $1, 1($4)
        ADDL $1, 0, $2
read1:	LDL $0, 0($4)
	BEQ $0, read1
	LDL $1, 1($4)
        SLL $1, 8, $1
        ADDL $1, $2, $2
read2:  LDL $0, 0($4)
	BEQ $0, read2
	LDL $1, 1($4)
        SLL $1, 16, $1
        ADDL $1, $2, $2
read3:  LDL $0, 0($4)
	BEQ $0, read3
	LDL $1, 1($4)
        SLL $1, 24, $1
        ADDL $1, $2, $2
        BEQ $2, run
        STL $2, 0($30)
        ADDL $30, 1, $30
        BR $31, read0
run:    SUBL $28, 1, $28
        BNE $28, run
        JMP $31, ($29)
