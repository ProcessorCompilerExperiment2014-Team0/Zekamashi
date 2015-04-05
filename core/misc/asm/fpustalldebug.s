        LDAH $0, 16464($31)
        LDAH $5, 15($31)
        LDAH $6, 13($31)
        ITOFS $0, $f0
        LDS $f29, 0($5)
        LDS $f30, 0($6)
        SQRTS $f0, $f2
hoge:   BR $31, hoge
