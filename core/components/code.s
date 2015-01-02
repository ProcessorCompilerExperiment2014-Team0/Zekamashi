	lda $2, 0($31)
loop:
	stl $2, 0($2)
	ldl $3, 0($2)
	addl $2, 1, $2
	br $31, loop
stop:
    br $31, stop
