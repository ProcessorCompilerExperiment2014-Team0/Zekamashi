	ldah $4, 16($31)
hoge:
	lda $0, 10($31)
	lda $1, 1($31)
	lda $2, 1($31)
tako:
	ldl $5, 2($4)
	beq $5, tako
	stl $1, 3($4)
	beq $0, hoge
	lda $3, 0($1)
	lda $1, 0($2)
	addl $1, $3, $2
	subl $0, 1, $0
	br $31, tako
