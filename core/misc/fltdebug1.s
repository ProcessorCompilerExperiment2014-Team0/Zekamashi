    LDAH $0, -19840($31)
    LDAH $1, -16768($31)
    LDAH $2, -16768($31)
    LDAH $4, 16384($31)
    ITOFS $0, $f0
    ITOFS $1, $f1
    ITOFS $2, $f2
    ITOFS $4, $f4
    MULS $f4, $f0, $f0
    MULS $f0, $f1, $f0
    ADDS $f0, $f2, $f1
hoge:
    BR $31, hoge
