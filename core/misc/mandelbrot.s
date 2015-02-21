	LDA	$30, 12288($31)
	LDA	$27, 28672($31)
    # main program start

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, mandelbrot.403
	LDA	$30, -1($30)
	LDL	$29, 0($30)
    # main program end

	BR	$28, min_caml_main_end
min_caml_fless:
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.512
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.512:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fispos:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.513
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.513:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fisneg:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.514
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.514:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fiszero:
	FBNE	$f0, beq_else.515
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.515:
	LDA	$0, 0($31)
	RET	$28, ($29)
min_caml_fneg:
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
min_caml_fsqr:
	MULS	$f0, $f0, $f0
	RET	$28, ($29)
min_caml_fhalf:
	LDAH	$28, 16128($31)
	ITOFS	$28, $f1
    # 0.500000 : 1056964608

	MULS	$f0, $f1, $f0
	RET	$28, ($29)
min_caml_fabs:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.516
	RET	$28, ($29)
ble_else.516:
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
min_caml_abs_float:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.517
	RET	$28, ($29)
ble_else.517:
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
atan_sub.134:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f2
	LDA	$28, -21845($31)
	LDAH	$28, 16043($28)
	ITOFS	$28, $f3
    # 0.333333 : 1051372203

	MULS	$f0, $f0, $f4
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f5
    # 0.200000 : 1045220557

	MULS	$f0, $f0, $f6
	LDA	$28, 18725($31)
	LDAH	$28, 15890($28)
	ITOFS	$28, $f7
    # 0.142857 : 1041385765

	MULS	$f0, $f0, $f8
	LDA	$28, -29127($31)
	LDAH	$28, 15844($28)
	ITOFS	$28, $f9
    # 0.111111 : 1038323257

	MULS	$f0, $f0, $f10
	LDA	$28, 11916($31)
	LDAH	$28, 15802($28)
	ITOFS	$28, $f11
    # 0.090909 : 1035611788

	MULS	$f0, $f0, $f12
	LDA	$28, -30247($31)
	LDAH	$28, 15774($28)
	ITOFS	$28, $f13
    # 0.076923 : 1033734617

	MULS	$f0, $f0, $f14
	LDA	$28, -30583($31)
	LDAH	$28, 15753($28)
	ITOFS	$28, $f15
    # 0.066667 : 1032358025

	MULS	$f0, $f0, $f16
	LDA	$28, -3855($31)
	LDAH	$28, 15729($28)
	ITOFS	$28, $f17
    # 0.058824 : 1030811889

	MULS	$f0, $f0, $f18
	LDA	$28, -27594($31)
	LDAH	$28, 15704($28)
	ITOFS	$28, $f19
    # 0.052632 : 1029149750

	MULS	$f0, $f0, $f20
	LDA	$28, 3121($31)
	LDAH	$28, 15683($28)
	ITOFS	$28, $f21
    # 0.047619 : 1027804209

	MULS	$f0, $f0, $f22
	LDA	$28, 5699($31)
	LDAH	$28, 15666($28)
	ITOFS	$28, $f23
    # 0.043478 : 1026692675

	MULS	$f22, $f23, $f22
	SUBS	$f21, $f22, $f21
	MULS	$f20, $f21, $f20
	SUBS	$f19, $f20, $f19
	MULS	$f18, $f19, $f18
	SUBS	$f17, $f18, $f17
	MULS	$f16, $f17, $f16
	SUBS	$f15, $f16, $f15
	MULS	$f14, $f15, $f14
	SUBS	$f13, $f14, $f13
	MULS	$f12, $f13, $f12
	SUBS	$f11, $f12, $f11
	MULS	$f10, $f11, $f10
	SUBS	$f9, $f10, $f9
	MULS	$f8, $f9, $f8
	SUBS	$f7, $f8, $f7
	MULS	$f6, $f7, $f6
	SUBS	$f5, $f6, $f5
	MULS	$f4, $f5, $f4
	SUBS	$f3, $f4, $f3
	MULS	$f2, $f3, $f2
	SUBS	$f1, $f2, $f1
	MULS	$f0, $f1, $f0
	RET	$28, ($29)
min_caml_atan:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.518
	LDA	$28, 5069($31)
	LDAH	$28, 16084($28)
	ITOFS	$28, $f1
    # 0.414214 : 1054086093

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.519
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.520
	LDA	$28, -32134($31)
	LDAH	$28, 16411($28)
	ITOFS	$28, $f1
    # 2.414214 : 1075479162

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.521
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f2, $f30, $f0
	STS	$f1, 0($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, atan_sub.134
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDS	$f1, 0($30)
	SUBS	$f1, $f0, $f0
	RET	$28, ($29)
ble_else.521:
	LDA	$28, 4059($31)
	LDAH	$28, 16201($28)
	ITOFS	$28, $f1
    # 0.785398 : 1061752795

	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	SUBS	$f0, $f2, $f2
	LDAH	$28, 16256($31)
	ITOFS	$28, $f3
    # 1.000000 : 1065353216

	ADDS	$f0, $f3, $f0
	INVS	$f0, $f30
	MULS	$f2, $f30, $f0
	STS	$f1, 2($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, atan_sub.134
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDS	$f1, 2($30)
	ADDS	$f1, $f0, $f0
	RET	$28, ($29)
ble_else.520:
	LDA	$28, 4059($31)
	LDAH	$28, 16201($28)
	ITOFS	$28, $f1
    # 0.785398 : 1061752795

	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	SUBS	$f2, $f0, $f2
	LDAH	$28, 16256($31)
	ITOFS	$28, $f3
    # 1.000000 : 1065353216

	ADDS	$f3, $f0, $f0
	INVS	$f0, $f30
	MULS	$f2, $f30, $f0
	STS	$f1, 4($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, atan_sub.134
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDS	$f1, 4($30)
	SUBS	$f1, $f0, $f0
	RET	$28, ($29)
ble_else.519:
	BR	$28, atan_sub.134
ble_else.518:
	SUBS	$f31, $f0, $f0
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_atan
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
sin_sub.270:
	CMPLT	$0, 7, $28
	BNE	$28, bge_else.522
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	RET	$28, ($29)
bge_else.522:
	LDA	$1, 1($0)
	SUBS	$f31, $f1, $f2
	ADDL	$0, $0, $2
	STS	$f1, 0($30)
	STL	$1, 2($30)
	STS	$f0, 4($30)
	STL	$0, 6($30)
	STS	$f2, 8($30)
	LDA	$0, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDS	$f1, 8($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 6($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 10($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 10($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 4($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 2($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, sin_sub.270
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 0($30)
	ADDS	$f1, $f0, $f0
	RET	$28, ($29)
min_caml_sin:
	LDA	$28, 4059($31)
	LDAH	$28, 16457($28)
	ITOFS	$28, $f1
    # 3.141593 : 1078530011

	LDAH	$28, 16384($31)
	ITOFS	$28, $f2
    # 2.000000 : 1073741824

	INVS	$f2, $f30
	MULS	$f0, $f30, $f2
	INVS	$f1, $f30
	MULS	$f2, $f30, $f2
	STS	$f1, 0($30)
	STS	$f0, 2($30)
	ADDS	$f2, $f31, $f0
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_floor
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$28, 4059($31)
	LDAH	$28, 16585($28)
	ITOFS	$28, $f1
    # 6.283185 : 1086918619

	MULS	$f1, $f0, $f0
	LDS	$f1, 2($30)
	SUBS	$f1, $f0, $f0
	LDA	$28, -13340($31)
	LDAH	$28, 16535($28)
	ITOFS	$28, $f1
    # 4.712389 : 1083624420

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.525
	LDA	$28, 4059($31)
	LDAH	$28, 16585($28)
	ITOFS	$28, $f1
    # 6.283185 : 1086918619

	SUBS	$f1, $f0, $f0
	LDA	$0, 1($31)
	ADDS	$f0, $f31, $f1
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, sin_sub.270
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
ble_else.525:
	LDS	$f1, 0($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.526
	SUBS	$f0, $f1, $f0
	LDA	$0, 1($31)
	ADDS	$f0, $f31, $f1
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, sin_sub.270
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
ble_else.526:
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f2
    # 1.570796 : 1070141403

	CMPSLE	$f2, $f0, $f30
	FBEQ	$f30, ble_else.527
	SUBS	$f1, $f0, $f0
	LDA	$0, 1($31)
	ADDS	$f0, $f31, $f1
	BR	$28, sin_sub.270
ble_else.527:
	LDA	$0, 1($31)
	ADDS	$f0, $f31, $f1
	BR	$28, sin_sub.270
min_caml_cos:
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f0
	BR	$28, min_caml_sin
loop.465:
	LDS	$f2, 2($26)
	LDS	$f3, 1($26)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.528
	LDA	$0, 255($31)
	RET	$28, ($29)
ble_else.528:
	LDAH	$28, 16512($31)
	ITOFS	$28, $f4
    # 4.000000 : 1082130432

	MULS	$f0, $f0, $f5
	MULS	$f1, $f1, $f6
	ADDS	$f5, $f6, $f5
	CMPSLE	$f4, $f5, $f30
	FBEQ	$f30, ble_else.529
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.529:
	LDA	$0, -1($0)
	MULS	$f0, $f0, $f4
	MULS	$f1, $f1, $f5
	SUBS	$f4, $f5, $f4
	ADDS	$f4, $f3, $f3
	LDAH	$28, 16384($31)
	ITOFS	$28, $f4
    # 2.000000 : 1073741824

	MULS	$f4, $f0, $f0
	MULS	$f0, $f1, $f0
	ADDS	$f0, $f2, $f1
	ADDS	$f3, $f31, $f0
	LDL	$28, 0($26)
	JMP	$25, ($28)
mandelbrot_at.398:
	LDA	$26, 0($27)
	LDA	$27, 3($27)
	MOV	$0, loop.465
	STL	$0, 0($26)
	STS	$f1, 2($26)
	STS	$f0, 1($26)
	LDA	$0, 200($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	LDL	$28, 0($26)
	JMP	$25, ($28)
loop2.422:
	LDS	$f1, 1($26)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	CMPSLE	$f2, $f0, $f30
	FBEQ	$f30, ble_else.530
	RET	$28, ($29)
ble_else.530:
	STL	$26, 0($30)
	STS	$f0, 2($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, mandelbrot_at.398
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDAH	$28, 16($31)
mcpc.533:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.533
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDAH	$28, 16($31)
mcpc.534:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.534
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDAH	$28, 16($31)
mcpc.535:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.535
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDAH	$28, 15616($31)
	ITOFS	$28, $f0
    # 0.031250 : 1023410176

	LDS	$f1, 2($30)
	ADDS	$f1, $f0, $f0
	LDL	$26, 0($30)
	LDL	$28, 0($26)
	JMP	$25, ($28)
loop1.419:
	LDA	$26, 0($27)
	LDA	$27, 2($27)
	MOV	$0, loop2.422
	STL	$0, 0($26)
	STS	$f0, 1($26)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.536
	RET	$28, ($29)
ble_else.536:
	LDAH	$28, -16384($31)
	ITOFS	$28, $f1
    # -2.000000 : -1073741824

	STS	$f0, 0($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 2($30)
	LDA	$30, 3($30)
	LDL	$28, 0($26)
	JSR	$29, ($28)
	LDA	$30, -3($30)
	LDL	$28, 2($30)
	LDA	$29, 0($28)
	LDAH	$28, 15616($31)
	ITOFS	$28, $f0
    # 0.031250 : 1023410176

	LDS	$f1, 0($30)
	ADDS	$f1, $f0, $f0
	BR	$28, loop1.419
mandelbrot.403:
	LDA	$0, 80($31)
	LDAH	$28, 16($31)
mcpc.538:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.538
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 54($31)
	LDAH	$28, 16($31)
mcpc.539:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.539
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.540:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.540
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 57($31)
	LDAH	$28, 16($31)
mcpc.541:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.541
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 54($31)
	LDAH	$28, 16($31)
mcpc.542:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.542
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.543:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.543
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 54($31)
	LDAH	$28, 16($31)
mcpc.544:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.544
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 52($31)
	LDAH	$28, 16($31)
mcpc.545:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.545
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.546:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.546
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.547:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.547
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.548:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.548
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.549:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.549
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 10($31)
	LDAH	$28, 16($31)
mcpc.550:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.550
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDAH	$28, -16512($31)
	ITOFS	$28, $f0
    # -1.000000 : -1082130432

	BR	$28, loop1.419
min_caml_print_int:
# while ((*0x100002 & 1) == 0) {}
#   *0x100003 = data & 255;
	LDAH $1, 16($31)
	LDA $2, 0($0)
mcpi0:
	LDL $3, 2($1)
	AND $3, 1, $4
	BEQ $4, mcpi0
	AND $0, 255, $4
	STL $4, 3($1)
	SRL $0, 8, $0
mcpi1:
	LDL $3, 2($1)
	AND $3, 1, $4
	BEQ $4, mcpi1
	AND $0, 255, $4
	STL $4, 3($1)
	SRL $0, 8, $0
mcpi2:
	LDL $3, 2($1)
	AND $3, 1, $4
	BEQ $4, mcpi2
	AND $0, 255, $4
	STL $4, 3($1)
	SRL $0, 8, $0
mcpi3:
	LDL $3, 2($1)
	AND $3, 1, $4
	BEQ $4, mcpi3
	AND $0, 255, $4
	STL $4, 3($1)
	LDA $0, 0($2)
	RET $28, ($29)
min_caml_print_char:
# while ((*0x100002 & 1) == 0) {}
#   *0x100003 = data & 255;
	LDAH $1, 16($31)
	LDA $2, 0($0)
mcpc:
	LDL $3, 2($1)
	AND $3, 1, $4
	BEQ $4, mcpc
	AND $0, 255, $4
	STL $4, 3($1)
	RET $28, ($29)

min_caml_read_int:
# while (*0x100000 & 1 == 0) {}
#   data = *0x100001;
	LDAH $1, 16($31)
	LDA $2, 0($0)
mcri0:
	LDL $3, 0($1)
	AND $3, 1, $4
	BEQ $4, mcri0
	LDL $0, 1($1)
mcri1:
	LDL $3, 0($1)
	AND $3, 1, $4
	BEQ $4, mcri1
	LDL $4, 1($1)
	SLL $4, 8, $4
	BIS $0, $4, $0
mcri2:
	LDL $3, 0($1)
	AND $3, 1, $4
	BEQ $4, mcri2
	LDL $4, 1($1)
	SLL $4, 16, $4
	BIS $0, $4, $0
mcri3:
	LDL $3, 0($1)
	AND $3, 1, $4
	BEQ $4, mcri3
	LDL $4, 1($1)
	SLL $4, 24, $4
	BIS $0, $4, $0

	RET $28, ($29)

min_caml_read_float:
	STL $29, 0($30)
	LDA $30, 1($30)
	BSR $29, min_caml_read_int
	LDA $30, -1($30)
	LDL $29, 0($30)
	ITOFS $0, $f0
	RET $28, ($29)

min_caml_int_of_float:
min_caml_truncate:
	CVTSL/C $f0, $f0
	FTOIS $f0, $0
	RET $28, ($29)

min_caml_float_of_int:
	LDA $23, 0($0)
	ITOFS $23, $f19
	CVTLS $f19, $f0
	RET $28, ($29)

min_caml_floor:
	CMPSLE $f0, $f31, $f1
	FBNE $f1, mcf_neg
	#positive
	CVTSL/C $f0, $f0
	CVTLS $f0, $f0
	RET $28, ($29)
mcf_neg: #negative
	CVTSL/C $f0, $f1
	CVTLS $f1, $f1
	CMPSEQ $f0, $f1, $f2
	FBNE $f2, mcf_neg_exact
	# if not exact, subtract 1.0 from given value
	LDAH $15, 0x3f80($31)
	ITOFS $15, $f17
	SUBS $f1, $f17, $f0
mcf_neg_exact:
	RET $28, ($29)

min_caml_sqrt:
	SQRTS $f0, $f0
	RET $28, ($29)

min_caml_create_array: # int -> 'a -> 'a array
	LDA $3, 0($27)
	LDA $6, 0($3) # old_min_caml_hp
	LDA $4, 0($0)
lmcca2:
	BEQ $4, lmcca3
	STL $1, 0($3)
	ADDL $3, 1, $3   # sizeof(int) = 1
	SUBL $4, 1, $4
	BR $28, lmcca2
lmcca3:
	LDA $27, 0($3)
	LDA $0, 0($6)
	RET $28, ($29)
min_caml_create_float_array: # int -> float -> float array
	LDA $3, 0($27)
	LDA $6, 0($3) # old_min_caml_hp
	LDA $4, 0($0)
lmccfa2:
	BEQ $4, lmccfa3
	STS $f0, 0($3)
	ADDL $3, 1, $3   # sizeof(float) = 1
	SUBL $4, 1, $4
	BR $28, lmccfa2
lmccfa3:
	LDA $27, 0($3)
	LDA $0, 0($6)
	RET $28, ($29)
min_caml_print_newline:
	RET $28, ($29)

min_caml_main_end:
	BR $31, min_caml_main_end
