	LDAH $4, 16($31)
hoge:
	LDL $0, 0($4)
	BEQ $0, hoge
	LDL $1, 1($4)
poyo:
	LDL $0, 2($4)
	BEQ $0, poyo
	STL $1, 3($4)
	BR $31, hoge
