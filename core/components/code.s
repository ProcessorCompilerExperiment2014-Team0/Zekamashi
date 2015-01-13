	ldah $4, 16($31)
hoge:
	ldl $1, 0($4)
	beq $1, hoge
	ldl $0, 1($4)
poyo:
	ldl $1, 2($4)
	beq $1, poyo
	stl $0, 3($4)
	br $31, hoge
