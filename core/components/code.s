	lda $0, 64($31)
	lda $3, 10($31)
	br $1, fib
	ldah $4, 16($31)
	stl $3, 3($4)
	br $31, stop
fib:
	addl $0, 2, $0
	beq $3, border
	cmpeq $3, 1, $5
	bne $5, border
	stl $3, -2($0)
	stl $1, -1($0)
	subl $3, 1, $3
	br $1, fib
	ldl $4, -2($0)
	stl $3, -2($0)
	subl $4, 2, $3
	br $1, fib
	ldl $4, -2($0)
	addl $3, $4, $3
	ldl $1, -1($0)
	subl $0, 2, $0
	jmp $31, ($1)
border:
	lda $3, 1($31)
	subl $0, 2, $0
	jmp $31, ($1)
stop:
	br $31, stop
