	ldah $4, 16($31)
start:
	lda $0, 10($31)
	lda $1, 1($31)
	lda $2, 1($31)
hoge:
	ldl $5, 2($4)
	beq $5, hoge
	stl $1, 3($4)
	beq $0, start
	addl $1, $2, $3
	addl $2, 0, $1
	addl $3, 0, $2
	subl $0, 1, $0
	br $31, hoge
