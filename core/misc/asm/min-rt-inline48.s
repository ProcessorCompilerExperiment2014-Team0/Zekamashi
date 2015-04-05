	LDA	$30, 16384($31)
	LDA	$27, 28672($31)
    # main program start

	BSR	$29, n_objects.init
	BSR	$29, objects.init
	BSR	$29, screen.init
	BSR	$29, viewpoint.init
	BSR	$29, light.init
	BSR	$29, beam.init
	BSR	$29, and_net.init
	BSR	$29, or_net.init
	BSR	$29, solver_dist.init
	BSR	$29, intsec_rectside.init
	BSR	$29, tmin.init
	BSR	$29, intersection_point.init
	BSR	$29, intersected_object_id.init
	BSR	$29, nvector.init
	BSR	$29, texture_color.init
	BSR	$29, diffuse_ray.init
	BSR	$29, rgb.init
	BSR	$29, image_size.init
	BSR	$29, image_center.init
	BSR	$29, scan_pitch.init
	BSR	$29, startp.init
	BSR	$29, startp_fast.init
	BSR	$29, screenx_dir.init
	BSR	$29, screeny_dir.init
	BSR	$29, screenz_dir.init
	BSR	$29, ptrace_dirvec.init
	BSR	$29, dirvecs.init
	BSR	$29, light_dirvec.init
	BSR	$29, reflections.init
	BSR	$29, n_reflections.init
	LDA	$0, 128($31)
	LDA	$1, 128($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, rt.3673
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 0($31)
    # main program end

	BR	$28, min_caml_main_end
min_caml_fless:
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17017
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17017:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fispos:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.17018
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17018:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fisneg:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17019
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17019:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fiszero:
	FBNE	$f0, beq_else.17020
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17020:
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
	FBEQ	$f30, ble_else.17021
	RET	$28, ($29)
ble_else.17021:
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
min_caml_abs_float:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17022
	RET	$28, ($29)
ble_else.17022:
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
	FBEQ	$f30, ble_else.17023
	LDA	$28, 5069($31)
	LDAH	$28, 16084($28)
	ITOFS	$28, $f1
    # 0.414214 : 1054086093

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17024
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17025
	LDA	$28, -32134($31)
	LDAH	$28, 16411($28)
	ITOFS	$28, $f1
    # 2.414214 : 1075479162

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17026
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
ble_else.17026:
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
ble_else.17025:
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
ble_else.17024:
	BR	$28, atan_sub.134
ble_else.17023:
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
	BNE	$28, bge_else.17027
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	RET	$28, ($29)
bge_else.17027:
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
	CMPLT	$0, 7, $28
	BNE	$28, bge_else.17030
	LDS	$f0, 0($30)
	RET	$28, ($29)
bge_else.17030:
	LDA	$1, 1($0)
	SUBS	$f31, $f0, $f2
	ADDL	$0, $0, $2
	STS	$f0, 12($30)
	STL	$1, 14($30)
	STS	$f2, 16($30)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDS	$f1, 16($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 2($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 18($30)
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	LDS	$f1, 18($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 4($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 14($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, sin_sub.270
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	LDS	$f1, 12($30)
	ADDS	$f1, $f0, $f0
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
	FBEQ	$f30, ble_else.17032
	LDA	$28, 4059($31)
	LDAH	$28, 16585($28)
	ITOFS	$28, $f1
    # 6.283185 : 1086918619

	SUBS	$f1, $f0, $f0
	LDA	$0, 1($31)
	LDA	$1, 2($31)
	SUBS	$f31, $f0, $f1
	ADDL	$0, $0, $2
	STL	$1, 4($30)
	STS	$f0, 6($30)
	STL	$0, 8($30)
	STS	$f1, 10($30)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 10($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 8($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 12($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 12($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 6($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 4($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, sin_sub.270
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 6($30)
	ADDS	$f1, $f0, $f0
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
ble_else.17032:
	LDS	$f1, 0($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17035
	SUBS	$f0, $f1, $f0
	LDA	$0, 1($31)
	LDA	$1, 2($31)
	SUBS	$f31, $f0, $f1
	ADDL	$0, $0, $2
	STL	$1, 14($30)
	STS	$f0, 16($30)
	STL	$0, 18($30)
	STS	$f1, 20($30)
	LDA	$0, 0($2)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	LDS	$f1, 20($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 18($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 22($30)
	STL	$29, 24($30)
	LDA	$30, 25($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -25($30)
	LDL	$29, 24($30)
	LDS	$f1, 22($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 16($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 14($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 24($30)
	LDA	$30, 25($30)
	BSR	$29, sin_sub.270
	LDA	$30, -25($30)
	LDL	$29, 24($30)
	LDS	$f1, 16($30)
	ADDS	$f1, $f0, $f0
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
ble_else.17035:
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f2
    # 1.570796 : 1070141403

	CMPSLE	$f2, $f0, $f30
	FBEQ	$f30, ble_else.17038
	SUBS	$f1, $f0, $f0
	LDA	$0, 1($31)
	LDA	$1, 2($31)
	SUBS	$f31, $f0, $f1
	ADDL	$0, $0, $2
	STL	$1, 24($30)
	STS	$f0, 26($30)
	STL	$0, 28($30)
	STS	$f1, 30($30)
	LDA	$0, 0($2)
	STL	$29, 32($30)
	LDA	$30, 33($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -33($30)
	LDL	$29, 32($30)
	LDS	$f1, 30($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 28($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 32($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDS	$f1, 32($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 26($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 24($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, sin_sub.270
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDS	$f1, 26($30)
	ADDS	$f1, $f0, $f0
	RET	$28, ($29)
ble_else.17038:
	LDA	$0, 1($31)
	LDA	$1, 2($31)
	SUBS	$f31, $f0, $f1
	ADDL	$0, $0, $2
	STL	$1, 34($30)
	STS	$f0, 36($30)
	STL	$0, 38($30)
	STS	$f1, 40($30)
	LDA	$0, 0($2)
	STL	$29, 42($30)
	LDA	$30, 43($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -43($30)
	LDL	$29, 42($30)
	LDS	$f1, 40($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 38($30)
	ADDL	$0, $0, $0
	LDA	$0, 1($0)
	STS	$f0, 42($30)
	STL	$29, 44($30)
	LDA	$30, 45($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -45($30)
	LDL	$29, 44($30)
	LDS	$f1, 42($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 36($30)
	MULS	$f0, $f1, $f0
	MULS	$f0, $f1, $f0
	LDL	$0, 34($30)
	ADDS	$f1, $f31, $f30
	ADDS	$f0, $f31, $f1
	ADDS	$f30, $f31, $f0
	STL	$29, 44($30)
	LDA	$30, 45($30)
	BSR	$29, sin_sub.270
	LDA	$30, -45($30)
	LDL	$29, 44($30)
	LDS	$f1, 36($30)
	ADDS	$f1, $f0, $f0
	RET	$28, ($29)
min_caml_cos:
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f0
	BR	$28, min_caml_sin
vecunit_sgn.3218:
	LDS	$f0, 0($0)
	MULS	$f0, $f0, $f0
	LDS	$f1, 1($0)
	MULS	$f1, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	MULS	$f1, $f1, $f1
	ADDS	$f0, $f1, $f0
	SQRTS	$f0, $f0
	FBNE	$f0, nt_fbeq_else.17043
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.17044
nt_fbeq_else.17043:
	LDA	$2, 0($31)
nt_fbeq_cont.17044:
	BNE	$2, beq_else.17045
	BNE	$1, beq_else.17046
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 0($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 0($0)
	LDS	$f1, 1($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 1($0)
	LDS	$f1, 2($0)
	MULS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17046:
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 0($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 0($0)
	LDS	$f1, 1($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 1($0)
	LDS	$f1, 2($0)
	MULS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17045:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 0($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 0($0)
	LDS	$f1, 1($0)
	MULS	$f1, $f0, $f1
	STS	$f1, 1($0)
	LDS	$f1, 2($0)
	MULS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
vecaccumv.3242:
	LDS	$f0, 0($0)
	LDS	$f1, 0($1)
	LDS	$f2, 0($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDS	$f0, 1($0)
	LDS	$f1, 1($1)
	LDS	$f2, 1($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($0)
	LDS	$f0, 2($0)
	LDS	$f1, 2($1)
	LDS	$f2, 2($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
read_screen_settings.3319:
	MOV	$0, min_caml_screen
	LDL	$0, 0($0)
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$0, 0($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_screen
	LDL	$0, 0($0)
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	STS	$f0, 1($0)
	MOV	$0, min_caml_screen
	LDL	$0, 0($0)
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	STS	$f0, 2($0)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f1
	STS	$f0, 4($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_sin
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDS	$f1, 4($30)
	STS	$f0, 6($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_sin
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STS	$f0, 8($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f1
	STS	$f0, 10($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_sin
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 10($30)
	STS	$f0, 12($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_sin
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDS	$f1, 6($30)
	MULS	$f1, $f0, $f2
	LDAH	$28, 17224($31)
	ITOFS	$28, $f3
    # 200.000000 : 1128792064

	MULS	$f2, $f3, $f2
	STS	$f2, 0($0)
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDAH	$28, -15544($31)
	ITOFS	$28, $f2
    # -200.000000 : -1018691584

	LDS	$f3, 8($30)
	MULS	$f3, $f2, $f2
	STS	$f2, 1($0)
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDS	$f2, 12($30)
	MULS	$f1, $f2, $f4
	LDAH	$28, 17224($31)
	ITOFS	$28, $f5
    # 200.000000 : 1128792064

	MULS	$f4, $f5, $f4
	STS	$f4, 2($0)
	MOV	$0, min_caml_screenx_dir
	LDL	$0, 0($0)
	STS	$f2, 0($0)
	MOV	$0, min_caml_screenx_dir
	LDL	$0, 0($0)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	STS	$f4, 1($0)
	MOV	$0, min_caml_screenx_dir
	LDL	$0, 0($0)
	SUBS	$f31, $f0, $f4
	STS	$f4, 2($0)
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	SUBS	$f31, $f3, $f4
	MULS	$f4, $f0, $f0
	STS	$f0, 0($0)
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	SUBS	$f31, $f1, $f0
	STS	$f0, 1($0)
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	SUBS	$f31, $f3, $f0
	MULS	$f0, $f2, $f0
	STS	$f0, 2($0)
	MOV	$0, min_caml_viewpoint
	LDL	$0, 0($0)
	MOV	$1, min_caml_screen
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	MOV	$1, min_caml_screenz_dir
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	SUBS	$f0, $f1, $f0
	STS	$f0, 0($0)
	MOV	$0, min_caml_viewpoint
	LDL	$0, 0($0)
	MOV	$1, min_caml_screen
	LDL	$1, 0($1)
	LDS	$f0, 1($1)
	MOV	$1, min_caml_screenz_dir
	LDL	$1, 0($1)
	LDS	$f1, 1($1)
	SUBS	$f0, $f1, $f0
	STS	$f0, 1($0)
	MOV	$0, min_caml_viewpoint
	LDL	$0, 0($0)
	MOV	$1, min_caml_screen
	LDL	$1, 0($1)
	LDS	$f0, 2($1)
	MOV	$1, min_caml_screenz_dir
	LDL	$1, 0($1)
	LDS	$f1, 2($1)
	SUBS	$f0, $f1, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
read_light.3321:
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	STS	$f0, 0($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_sin
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	SUBS	$f31, $f0, $f0
	STS	$f0, 1($0)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	LDS	$f2, 0($30)
	ADDS	$f2, $f1, $f1
	STS	$f0, 2($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_sin
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDS	$f1, 2($30)
	STS	$f0, 4($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_sin
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f1, 4($30)
	MULS	$f1, $f0, $f0
	STS	$f0, 0($0)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f0
    # 1.570796 : 1070141403

	LDS	$f2, 2($30)
	ADDS	$f2, $f0, $f0
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_sin
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f1, 4($30)
	MULS	$f1, $f0, $f0
	STS	$f0, 2($0)
	MOV	$0, min_caml_beam
	LDL	$0, 0($0)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	STS	$f0, 0($0)
	RET	$28, ($29)
rotate_quadratic_matrix.3323:
	LDS	$f0, 0($1)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f0
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_sin
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDS	$f1, 0($0)
	STS	$f0, 2($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_sin
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 1($30)
	LDS	$f1, 1($0)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f2
    # 1.570796 : 1070141403

	ADDS	$f1, $f2, $f1
	STS	$f0, 4($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_sin
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 1($30)
	LDS	$f1, 1($0)
	STS	$f0, 6($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_sin
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 1($30)
	LDS	$f1, 2($0)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f2
    # 1.570796 : 1070141403

	ADDS	$f1, $f2, $f1
	STS	$f0, 8($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_sin
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 1($30)
	LDS	$f1, 2($0)
	STS	$f0, 10($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_sin
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 10($30)
	LDS	$f2, 6($30)
	MULS	$f2, $f1, $f3
	LDS	$f4, 8($30)
	LDS	$f5, 4($30)
	MULS	$f5, $f4, $f6
	MULS	$f6, $f1, $f6
	LDS	$f7, 2($30)
	MULS	$f7, $f0, $f8
	SUBS	$f6, $f8, $f6
	MULS	$f7, $f4, $f8
	MULS	$f8, $f1, $f8
	MULS	$f5, $f0, $f9
	ADDS	$f8, $f9, $f8
	MULS	$f2, $f0, $f9
	MULS	$f5, $f4, $f10
	MULS	$f10, $f0, $f10
	MULS	$f7, $f1, $f11
	ADDS	$f10, $f11, $f10
	MULS	$f7, $f4, $f11
	MULS	$f11, $f0, $f0
	MULS	$f5, $f1, $f1
	SUBS	$f0, $f1, $f0
	SUBS	$f31, $f4, $f1
	MULS	$f5, $f2, $f4
	MULS	$f7, $f2, $f2
	LDL	$0, 0($30)
	LDS	$f5, 0($0)
	LDS	$f7, 1($0)
	LDS	$f11, 2($0)
	MULS	$f3, $f3, $f12
	MULS	$f5, $f12, $f12
	MULS	$f9, $f9, $f13
	MULS	$f7, $f13, $f13
	ADDS	$f12, $f13, $f12
	MULS	$f1, $f1, $f13
	MULS	$f11, $f13, $f13
	ADDS	$f12, $f13, $f12
	STS	$f12, 0($0)
	MULS	$f6, $f6, $f12
	MULS	$f5, $f12, $f12
	MULS	$f10, $f10, $f13
	MULS	$f7, $f13, $f13
	ADDS	$f12, $f13, $f12
	MULS	$f4, $f4, $f13
	MULS	$f11, $f13, $f13
	ADDS	$f12, $f13, $f12
	STS	$f12, 1($0)
	MULS	$f8, $f8, $f12
	MULS	$f5, $f12, $f12
	MULS	$f0, $f0, $f13
	MULS	$f7, $f13, $f13
	ADDS	$f12, $f13, $f12
	MULS	$f2, $f2, $f13
	MULS	$f11, $f13, $f13
	ADDS	$f12, $f13, $f12
	STS	$f12, 2($0)
	LDAH	$28, 16384($31)
	ITOFS	$28, $f12
    # 2.000000 : 1073741824

	MULS	$f5, $f6, $f13
	MULS	$f13, $f8, $f13
	MULS	$f7, $f10, $f14
	MULS	$f14, $f0, $f14
	ADDS	$f13, $f14, $f13
	MULS	$f11, $f4, $f14
	MULS	$f14, $f2, $f14
	ADDS	$f13, $f14, $f13
	MULS	$f12, $f13, $f12
	LDL	$0, 1($30)
	STS	$f12, 0($0)
	LDAH	$28, 16384($31)
	ITOFS	$28, $f12
    # 2.000000 : 1073741824

	MULS	$f5, $f3, $f13
	MULS	$f13, $f8, $f8
	MULS	$f7, $f9, $f13
	MULS	$f13, $f0, $f0
	ADDS	$f8, $f0, $f0
	MULS	$f11, $f1, $f8
	MULS	$f8, $f2, $f2
	ADDS	$f0, $f2, $f0
	MULS	$f12, $f0, $f0
	STS	$f0, 1($0)
	LDAH	$28, 16384($31)
	ITOFS	$28, $f0
    # 2.000000 : 1073741824

	MULS	$f5, $f3, $f2
	MULS	$f2, $f6, $f2
	MULS	$f7, $f9, $f3
	MULS	$f3, $f10, $f3
	ADDS	$f2, $f3, $f2
	MULS	$f11, $f1, $f1
	MULS	$f1, $f4, $f1
	ADDS	$f2, $f1, $f1
	MULS	$f0, $f1, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
read_nth_object.3326:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17055
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17055:
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	STL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 4($30)
	LDA	$0, 0($1)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$0, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	STS	$f0, 0($0)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	STS	$f0, 1($0)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	STS	$f0, 2($0)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	LDA	$0, 0($1)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	STS	$f0, 0($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	STS	$f0, 1($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	STS	$f0, 2($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17056
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17057
nt_fble_else.17056:
	LDA	$0, 1($31)
nt_fble_cont.17057:
	LDA	$1, 2($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 7($30)
	LDA	$0, 0($1)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$0, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$0, 8($30)
	STS	$f0, 0($0)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$0, 8($30)
	STS	$f0, 1($0)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	LDA	$0, 0($1)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	STL	$0, 9($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	STS	$f0, 0($0)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	STS	$f0, 1($0)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	STS	$f0, 2($0)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	LDA	$0, 0($1)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$1, 4($30)
	BNE	$1, beq_else.17058
	BR	$28, beq_cont.17059
beq_else.17058:
	STL	$0, 10($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDL	$0, 10($30)
	STS	$f0, 0($0)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDL	$0, 10($30)
	STS	$f0, 1($0)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_read_float
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$28, -1483($31)
	LDAH	$28, 15503($28)
	ITOFS	$28, $f1
    # 0.017453 : 1016003125

	MULS	$f0, $f1, $f0
	LDL	$0, 10($30)
	STS	$f0, 2($0)
beq_cont.17059:
	LDL	$1, 2($30)
	LDA	$28, -2($1)
	BNE	$28, beq_else.17060
	LDA	$2, 1($31)
	BR	$28, beq_cont.17061
beq_else.17060:
	LDL	$2, 7($30)
beq_cont.17061:
	LDA	$3, 4($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$2, 11($30)
	STL	$0, 10($30)
	LDA	$0, 0($3)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$1, 0($27)
	LDA	$27, 11($27)
	STL	$0, 10($1)
	LDL	$0, 10($30)
	STL	$0, 9($1)
	LDL	$2, 9($30)
	STL	$2, 8($1)
	LDL	$2, 8($30)
	STL	$2, 7($1)
	LDL	$2, 11($30)
	STL	$2, 6($1)
	LDL	$2, 6($30)
	STL	$2, 5($1)
	LDL	$2, 5($30)
	STL	$2, 4($1)
	LDL	$3, 4($30)
	STL	$3, 3($1)
	LDL	$4, 3($30)
	STL	$4, 2($1)
	LDL	$4, 2($30)
	STL	$4, 1($1)
	LDL	$5, 1($30)
	STL	$5, 0($1)
	MOV	$5, min_caml_objects
	LDL	$5, 0($5)
	LDL	$6, 0($30)
	ADDL	$5, $6, $28
	STL	$1, 0($28)
	LDA	$28, -3($4)
	BNE	$28, beq_else.17062
	LDS	$f0, 0($2)
	FBNE	$f0, nt_fbeq_else.17064
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17065
nt_fbeq_else.17064:
	LDA	$1, 0($31)
nt_fbeq_cont.17065:
	BNE	$1, beq_else.17066
	FBNE	$f0, nt_fbeq_else.17068
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17069
nt_fbeq_else.17068:
	LDA	$1, 0($31)
nt_fbeq_cont.17069:
	BNE	$1, beq_else.17070
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17072
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	BR	$28, nt_fble_cont.17073
nt_fble_else.17072:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

nt_fble_cont.17073:
	BR	$28, beq_cont.17071
beq_else.17070:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

beq_cont.17071:
	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 0($2)
	LDS	$f0, 1($2)
	FBNE	$f0, nt_fbeq_else.17074
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17075
nt_fbeq_else.17074:
	LDA	$1, 0($31)
nt_fbeq_cont.17075:
	BNE	$1, beq_else.17076
	FBNE	$f0, nt_fbeq_else.17078
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17079
nt_fbeq_else.17078:
	LDA	$1, 0($31)
nt_fbeq_cont.17079:
	BNE	$1, beq_else.17080
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17082
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17083
nt_fble_else.17082:
	LDA	$1, 1($31)
nt_fble_cont.17083:
	BNE	$1, beq_else.17084
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17086
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17087
nt_fbeq_else.17086:
	FBNE	$f0, nt_fbeq_else.17088
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17089
nt_fbeq_else.17088:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17090
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17091
nt_fble_else.17090:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17091:
nt_fbeq_cont.17089:
nt_fbeq_cont.17087:
	BR	$28, beq_cont.17085
beq_else.17084:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17092
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17093
nt_fbeq_else.17092:
	FBNE	$f0, nt_fbeq_else.17094
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17095
nt_fbeq_else.17094:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17096
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17097
nt_fble_else.17096:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17097:
nt_fbeq_cont.17095:
nt_fbeq_cont.17093:
beq_cont.17085:
	BR	$28, beq_cont.17081
beq_else.17080:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17098
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17099
nt_fbeq_else.17098:
	FBNE	$f0, nt_fbeq_else.17100
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17101
nt_fbeq_else.17100:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17102
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17103
nt_fble_else.17102:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17103:
nt_fbeq_cont.17101:
nt_fbeq_cont.17099:
beq_cont.17081:
	BR	$28, beq_cont.17077
beq_else.17076:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17104
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17105
nt_fbeq_else.17104:
	FBNE	$f0, nt_fbeq_else.17106
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17107
nt_fbeq_else.17106:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17108
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17109
nt_fble_else.17108:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17109:
nt_fbeq_cont.17107:
nt_fbeq_cont.17105:
beq_cont.17077:
	BR	$28, beq_cont.17067
beq_else.17066:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($2)
	LDS	$f0, 1($2)
	FBNE	$f0, nt_fbeq_else.17110
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17111
nt_fbeq_else.17110:
	LDA	$1, 0($31)
nt_fbeq_cont.17111:
	BNE	$1, beq_else.17112
	FBNE	$f0, nt_fbeq_else.17114
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.17115
nt_fbeq_else.17114:
	LDA	$1, 0($31)
nt_fbeq_cont.17115:
	BNE	$1, beq_else.17116
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17118
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17119
nt_fble_else.17118:
	LDA	$1, 1($31)
nt_fble_cont.17119:
	BNE	$1, beq_else.17120
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17122
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17123
nt_fbeq_else.17122:
	FBNE	$f0, nt_fbeq_else.17124
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17125
nt_fbeq_else.17124:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17126
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17127
nt_fble_else.17126:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17127:
nt_fbeq_cont.17125:
nt_fbeq_cont.17123:
	BR	$28, beq_cont.17121
beq_else.17120:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17128
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17129
nt_fbeq_else.17128:
	FBNE	$f0, nt_fbeq_else.17130
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17131
nt_fbeq_else.17130:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17132
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17133
nt_fble_else.17132:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17133:
nt_fbeq_cont.17131:
nt_fbeq_cont.17129:
beq_cont.17121:
	BR	$28, beq_cont.17117
beq_else.17116:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17134
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17135
nt_fbeq_else.17134:
	FBNE	$f0, nt_fbeq_else.17136
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17137
nt_fbeq_else.17136:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17138
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17139
nt_fble_else.17138:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17139:
nt_fbeq_cont.17137:
nt_fbeq_cont.17135:
beq_cont.17117:
	BR	$28, beq_cont.17113
beq_else.17112:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($2)
	LDS	$f0, 2($2)
	FBNE	$f0, nt_fbeq_else.17140
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17141
nt_fbeq_else.17140:
	FBNE	$f0, nt_fbeq_else.17142
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fbeq_cont.17143
nt_fbeq_else.17142:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17144
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
	BR	$28, nt_fble_cont.17145
nt_fble_else.17144:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	MULS	$f0, $f0, $f0
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 2($2)
nt_fble_cont.17145:
nt_fbeq_cont.17143:
nt_fbeq_cont.17141:
beq_cont.17113:
beq_cont.17067:
	BR	$28, beq_cont.17063
beq_else.17062:
	LDA	$28, -2($4)
	BNE	$28, beq_else.17146
	LDL	$1, 7($30)
	BNE	$1, beq_else.17148
	LDA	$1, 1($31)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, vecunit_sgn.3218
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	BR	$28, beq_cont.17149
beq_else.17148:
	LDA	$1, 0($31)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, vecunit_sgn.3218
	LDA	$30, -13($30)
	LDL	$29, 12($30)
beq_cont.17149:
	BR	$28, beq_cont.17147
beq_else.17146:
beq_cont.17147:
beq_cont.17063:
	LDL	$0, 4($30)
	BNE	$0, beq_else.17150
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17150:
	LDL	$0, 5($30)
	LDL	$1, 10($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, rotate_quadratic_matrix.3323
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$0, 1($31)
	RET	$28, ($29)
read_object.3328:
	CMPLT	$0, 60, $28
	BNE	$28, bge_else.17151
	RET	$28, ($29)
bge_else.17151:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, read_nth_object.3326
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	BNE	$0, beq_else.17153
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 0($30)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.17153:
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	CMPLT	$0, 60, $28
	BNE	$28, bge_else.17155
	RET	$28, ($29)
bge_else.17155:
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, read_nth_object.3326
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	BNE	$0, beq_else.17157
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 1($30)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.17157:
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	CMPLT	$0, 60, $28
	BNE	$28, bge_else.17159
	RET	$28, ($29)
bge_else.17159:
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, read_nth_object.3326
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17161
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.17161:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	CMPLT	$0, 60, $28
	BNE	$28, bge_else.17163
	RET	$28, ($29)
bge_else.17163:
	STL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, read_nth_object.3326
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.17165
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.17165:
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	BR	$28, read_object.3328
read_net_item.3332:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17167
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	LDA	$1, -1($31)
	BR	$28, min_caml_create_array
beq_else.17167:
	LDL	$1, 0($30)
	LDA	$2, 1($1)
	STL	$0, 1($30)
	STL	$2, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17168
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDA	$1, -1($31)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17168:
	LDL	$1, 2($30)
	LDA	$2, 1($1)
	STL	$0, 3($30)
	STL	$2, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17169
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDA	$1, -1($31)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17169:
	LDL	$1, 4($30)
	LDA	$2, 1($1)
	STL	$0, 5($30)
	STL	$2, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17170
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDA	$1, -1($31)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17170:
	LDL	$1, 6($30)
	LDA	$2, 1($1)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$1, 6($30)
	LDL	$2, 7($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
read_or_network.3334:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17171
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17172
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	BR	$28, min_caml_create_array
beq_else.17172:
	LDL	$0, 0($30)
	LDA	$2, 1($0)
	STL	$1, 1($30)
	STL	$2, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17173
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$1, 0($0)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17174
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17174:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 3($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17173:
	STL	$0, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17175
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$1, 0($0)
	LDL	$0, 4($30)
	STL	$0, 0($1)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17176
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17176:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 5($30)
	LDA	$0, 0($2)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 2($30)
	LDL	$2, 5($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17175:
	LDA	$1, 2($31)
	STL	$0, 6($30)
	LDA	$0, 0($1)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($0)
	LDL	$0, 6($30)
	STL	$0, 1($1)
	LDL	$0, 4($30)
	STL	$0, 0($1)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17177
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17177:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$1, 2($30)
	LDL	$2, 7($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17171:
	STL	$0, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17178
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$1, 0($0)
	BR	$28, beq_cont.17179
beq_else.17178:
	STL	$0, 9($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17180
	LDA	$0, 3($31)
	LDA	$1, -1($31)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$1, 9($30)
	STL	$1, 1($0)
	LDA	$1, 0($0)
	BR	$28, beq_cont.17181
beq_else.17180:
	LDA	$1, 3($31)
	STL	$0, 10($30)
	LDA	$0, 0($1)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDL	$1, 10($30)
	STL	$1, 2($0)
	LDL	$1, 9($30)
	STL	$1, 1($0)
	LDA	$1, 0($0)
beq_cont.17181:
beq_cont.17179:
	LDL	$0, 8($30)
	STL	$0, 0($1)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17182
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	BR	$28, min_caml_create_array
beq_else.17182:
	LDL	$0, 0($30)
	LDA	$2, 1($0)
	STL	$1, 11($30)
	STL	$2, 2($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17183
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$1, 0($0)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17184
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17184:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 3($30)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17183:
	STL	$0, 12($30)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17185
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	LDA	$1, 0($0)
	LDL	$0, 12($30)
	STL	$0, 0($1)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17186
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17186:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 13($30)
	LDA	$0, 0($2)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$1, 2($30)
	LDL	$2, 13($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17185:
	LDA	$1, 2($31)
	STL	$0, 14($30)
	LDA	$0, 0($1)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDA	$1, 0($0)
	LDL	$0, 14($30)
	STL	$0, 1($1)
	LDL	$0, 12($30)
	STL	$0, 0($1)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17187
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
beq_else.17187:
	LDL	$0, 2($30)
	LDA	$2, 1($0)
	STL	$1, 15($30)
	LDA	$0, 0($2)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	LDL	$1, 2($30)
	LDL	$2, 15($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	LDL	$1, 0($30)
	LDL	$2, 11($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
read_and_network.3336:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17188
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17189
	RET	$28, ($29)
beq_else.17189:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17191
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17192
	RET	$28, ($29)
beq_else.17192:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
beq_else.17191:
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17194
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 2($30)
	STL	$1, 0($0)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17195
	RET	$28, ($29)
beq_else.17195:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
beq_else.17194:
	LDA	$1, 2($31)
	STL	$0, 3($30)
	LDA	$0, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$1, 3($30)
	STL	$1, 1($0)
	LDL	$1, 2($30)
	STL	$1, 0($0)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17197
	RET	$28, ($29)
beq_else.17197:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
beq_else.17188:
	STL	$0, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17199
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, beq_cont.17200
beq_else.17199:
	STL	$0, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17201
	LDA	$0, 3($31)
	LDA	$1, -1($31)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 5($30)
	STL	$1, 1($0)
	BR	$28, beq_cont.17202
beq_else.17201:
	LDA	$1, 3($31)
	STL	$0, 6($30)
	LDA	$0, 0($1)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 6($30)
	STL	$1, 2($0)
	LDL	$1, 5($30)
	STL	$1, 1($0)
beq_cont.17202:
beq_cont.17200:
	LDL	$1, 4($30)
	STL	$1, 0($0)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17203
	RET	$28, ($29)
beq_else.17203:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	STL	$0, 1($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17205
	LDA	$0, 1($31)
	LDA	$1, -1($31)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17206
	RET	$28, ($29)
beq_else.17206:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
beq_else.17205:
	STL	$0, 7($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.17208
	LDA	$0, 2($31)
	LDA	$1, -1($31)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$1, 7($30)
	STL	$1, 0($0)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17209
	RET	$28, ($29)
beq_else.17209:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
beq_else.17208:
	LDA	$1, 2($31)
	STL	$0, 8($30)
	LDA	$0, 0($1)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, read_net_item.3332
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$1, 8($30)
	STL	$1, 1($0)
	LDL	$1, 7($30)
	STL	$1, 0($0)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17211
	RET	$28, ($29)
beq_else.17211:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3336
solver_rect_surface.3340:
	ADDL	$1, $2, $28
	LDS	$f3, 0($28)
	FBNE	$f3, nt_fbeq_else.17213
	LDA	$5, 1($31)
	BR	$28, nt_fbeq_cont.17214
nt_fbeq_else.17213:
	LDA	$5, 0($31)
nt_fbeq_cont.17214:
	BNE	$5, beq_else.17215
	LDL	$5, 4($0)
	LDL	$0, 6($0)
	ADDL	$1, $2, $28
	LDS	$f3, 0($28)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.17216
	LDA	$6, 0($31)
	BR	$28, nt_fble_cont.17217
nt_fble_else.17216:
	LDA	$6, 1($31)
nt_fble_cont.17217:
	BNE	$0, beq_else.17218
	LDA	$0, 0($6)
	BR	$28, beq_cont.17219
beq_else.17218:
	BNE	$6, beq_else.17220
	LDA	$0, 1($31)
	BR	$28, beq_cont.17221
beq_else.17220:
	LDA	$0, 0($31)
beq_cont.17221:
beq_cont.17219:
	ADDL	$5, $2, $28
	LDS	$f3, 0($28)
	BNE	$0, beq_else.17222
	SUBS	$f31, $f3, $f3
	BR	$28, beq_cont.17223
beq_else.17222:
beq_cont.17223:
	SUBS	$f3, $f0, $f0
	ADDL	$1, $2, $28
	LDS	$f3, 0($28)
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	ADDL	$1, $3, $28
	LDS	$f3, 0($28)
	MULS	$f0, $f3, $f3
	ADDS	$f3, $f1, $f1
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f1, $f30
	FBEQ	$f30, ble_else.17224
	ADDL	$5, $3, $28
	LDS	$f3, 0($28)
	CMPSLE	$f3, $f1, $f30
	FBEQ	$f30, ble_else.17225
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17225:
	ADDL	$1, $4, $28
	LDS	$f1, 0($28)
	MULS	$f0, $f1, $f1
	ADDS	$f1, $f2, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17226
	ADDL	$5, $4, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17227
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17227:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
ble_else.17226:
	SUBS	$f31, $f1, $f1
	ADDL	$5, $4, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17228
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17228:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
ble_else.17224:
	SUBS	$f31, $f1, $f1
	ADDL	$5, $3, $28
	LDS	$f3, 0($28)
	CMPSLE	$f3, $f1, $f30
	FBEQ	$f30, ble_else.17229
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17229:
	ADDL	$1, $4, $28
	LDS	$f1, 0($28)
	MULS	$f0, $f1, $f1
	ADDS	$f1, $f2, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17230
	ADDL	$5, $4, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17231
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17231:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
ble_else.17230:
	SUBS	$f31, $f1, $f1
	ADDL	$5, $4, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, ble_else.17232
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17232:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17215:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_surface.3355:
	LDL	$0, 4($0)
	LDS	$f3, 0($1)
	LDS	$f4, 0($0)
	MULS	$f3, $f4, $f3
	LDS	$f4, 1($1)
	LDS	$f5, 1($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	LDS	$f4, 2($1)
	LDS	$f5, 2($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f4, $f30
	FBEQ	$f30, ble_else.17233
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17233:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f4, 0($0)
	MULS	$f4, $f0, $f0
	LDS	$f4, 1($0)
	MULS	$f4, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	SUBS	$f31, $f0, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($1)
	LDA	$0, 1($31)
	RET	$28, ($29)
quadratic.3361:
	MULS	$f0, $f0, $f3
	LDL	$1, 4($0)
	LDS	$f4, 0($1)
	MULS	$f3, $f4, $f3
	MULS	$f1, $f1, $f4
	LDL	$1, 4($0)
	LDS	$f5, 1($1)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	MULS	$f2, $f2, $f4
	LDL	$1, 4($0)
	LDS	$f5, 2($1)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	LDL	$1, 3($0)
	BNE	$1, beq_else.17234
	ADDS	$f3, $f31, $f0
	RET	$28, ($29)
beq_else.17234:
	MULS	$f1, $f2, $f4
	LDL	$1, 9($0)
	LDS	$f5, 0($1)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	MULS	$f2, $f0, $f2
	LDL	$1, 9($0)
	LDS	$f4, 1($1)
	MULS	$f2, $f4, $f2
	ADDS	$f3, $f2, $f2
	MULS	$f0, $f1, $f0
	LDL	$0, 9($0)
	LDS	$f1, 2($0)
	MULS	$f0, $f1, $f0
	ADDS	$f2, $f0, $f0
	RET	$28, ($29)
bilinear.3366:
	MULS	$f0, $f3, $f6
	LDL	$1, 4($0)
	LDS	$f7, 0($1)
	MULS	$f6, $f7, $f6
	MULS	$f1, $f4, $f7
	LDL	$1, 4($0)
	LDS	$f8, 1($1)
	MULS	$f7, $f8, $f7
	ADDS	$f6, $f7, $f6
	MULS	$f2, $f5, $f7
	LDL	$1, 4($0)
	LDS	$f8, 2($1)
	MULS	$f7, $f8, $f7
	ADDS	$f6, $f7, $f6
	LDL	$1, 3($0)
	BNE	$1, beq_else.17235
	ADDS	$f6, $f31, $f0
	RET	$28, ($29)
beq_else.17235:
	MULS	$f2, $f4, $f7
	MULS	$f1, $f5, $f8
	ADDS	$f7, $f8, $f7
	LDL	$1, 9($0)
	LDS	$f8, 0($1)
	MULS	$f7, $f8, $f7
	MULS	$f0, $f5, $f5
	MULS	$f2, $f3, $f2
	ADDS	$f5, $f2, $f2
	LDL	$1, 9($0)
	LDS	$f5, 1($1)
	MULS	$f2, $f5, $f2
	ADDS	$f7, $f2, $f2
	MULS	$f0, $f4, $f0
	MULS	$f1, $f3, $f1
	ADDS	$f0, $f1, $f0
	LDL	$0, 9($0)
	LDS	$f1, 2($0)
	MULS	$f0, $f1, $f0
	ADDS	$f2, $f0, $f0
	LDAH	$28, 16128($31)
	ITOFS	$28, $f1
    # 0.500000 : 1056964608

	MULS	$f0, $f1, $f0
	ADDS	$f6, $f0, $f0
	RET	$28, ($29)
solver_second.3374:
	LDS	$f3, 0($1)
	LDS	$f4, 1($1)
	LDS	$f5, 2($1)
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$0, 6($30)
	STL	$1, 7($30)
	ADDS	$f5, $f31, $f2
	ADDS	$f4, $f31, $f1
	ADDS	$f3, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, quadratic.3361
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	FBNE	$f0, nt_fbeq_else.17236
	LDA	$0, 1($31)
	BR	$28, nt_fbeq_cont.17237
nt_fbeq_else.17236:
	LDA	$0, 0($31)
nt_fbeq_cont.17237:
	BNE	$0, beq_else.17238
	LDL	$0, 7($30)
	LDS	$f1, 0($0)
	LDS	$f2, 1($0)
	LDS	$f3, 2($0)
	LDS	$f4, 4($30)
	LDS	$f5, 2($30)
	LDS	$f6, 0($30)
	LDL	$0, 6($30)
	STS	$f0, 8($30)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	ADDS	$f4, $f31, $f3
	ADDS	$f5, $f31, $f4
	ADDS	$f6, $f31, $f5
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, bilinear.3366
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDS	$f1, 4($30)
	LDS	$f2, 2($30)
	LDS	$f3, 0($30)
	LDL	$0, 6($30)
	STS	$f0, 10($30)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, quadratic.3361
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 6($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.17239
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDS	$f1, 10($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 8($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17240
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17240:
	SQRTS	$f0, $f0
	LDL	$0, 6($0)
	BNE	$0, beq_else.17241
	SUBS	$f31, $f0, $f0
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SUBS	$f0, $f1, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17241:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SUBS	$f0, $f1, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17239:
	LDS	$f1, 10($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 8($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17242
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17242:
	SQRTS	$f0, $f0
	LDL	$0, 6($0)
	BNE	$0, beq_else.17243
	SUBS	$f31, $f0, $f0
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SUBS	$f0, $f1, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17243:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SUBS	$f0, $f1, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17238:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver.3380:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDS	$f0, 0($2)
	LDL	$3, 5($0)
	LDS	$f1, 0($3)
	SUBS	$f0, $f1, $f0
	LDS	$f1, 1($2)
	LDL	$3, 5($0)
	LDS	$f2, 1($3)
	SUBS	$f1, $f2, $f1
	LDS	$f2, 2($2)
	LDL	$2, 5($0)
	LDS	$f3, 2($2)
	SUBS	$f2, $f3, $f2
	LDL	$2, 1($0)
	LDA	$28, -1($2)
	BNE	$28, beq_else.17244
	LDA	$2, 0($31)
	LDA	$3, 1($31)
	LDA	$4, 2($31)
	STS	$f0, 0($30)
	STS	$f2, 2($30)
	STS	$f1, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.17245
	LDA	$2, 1($31)
	LDA	$3, 2($31)
	LDA	$4, 0($31)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$0, 7($30)
	LDL	$1, 6($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.17246
	LDA	$2, 2($31)
	LDA	$3, 0($31)
	LDA	$4, 1($31)
	LDS	$f0, 2($30)
	LDS	$f1, 0($30)
	LDS	$f2, 4($30)
	LDL	$0, 7($30)
	LDL	$1, 6($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.17247
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17247:
	LDA	$0, 3($31)
	RET	$28, ($29)
beq_else.17246:
	LDA	$0, 2($31)
	RET	$28, ($29)
beq_else.17245:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17244:
	LDA	$28, -2($2)
	BNE	$28, beq_else.17248
	LDL	$0, 4($0)
	LDS	$f3, 0($1)
	LDS	$f4, 0($0)
	MULS	$f3, $f4, $f3
	LDS	$f4, 1($1)
	LDS	$f5, 1($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	LDS	$f4, 2($1)
	LDS	$f5, 2($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f4, $f30
	FBEQ	$f30, ble_else.17249
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17249:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f4, 0($0)
	MULS	$f4, $f0, $f0
	LDS	$f4, 1($0)
	MULS	$f4, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	SUBS	$f31, $f0, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($1)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17248:
	BR	$28, solver_second.3374
solver_rect_fast.3384:
	LDS	$f3, 0($2)
	SUBS	$f3, $f0, $f3
	LDS	$f4, 1($2)
	MULS	$f3, $f4, $f3
	LDS	$f4, 1($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f1, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17250
	BR	$28, nt_fble_cont.17251
nt_fble_else.17250:
	SUBS	$f31, $f4, $f4
nt_fble_cont.17251:
	LDL	$3, 4($0)
	LDS	$f5, 1($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17252
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17253
nt_fble_else.17252:
	LDA	$3, 1($31)
nt_fble_cont.17253:
	BNE	$3, beq_else.17254
	LDA	$3, 0($31)
	BR	$28, beq_cont.17255
beq_else.17254:
	LDS	$f4, 2($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f2, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17256
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17258
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17259
nt_fble_else.17258:
	LDS	$f4, 1($2)
	FBNE	$f4, nt_fbeq_else.17260
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.17261
nt_fbeq_else.17260:
	LDA	$3, 1($31)
nt_fbeq_cont.17261:
nt_fble_cont.17259:
	BR	$28, nt_fble_cont.17257
nt_fble_else.17256:
	SUBS	$f31, $f4, $f4
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17262
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17263
nt_fble_else.17262:
	LDS	$f4, 1($2)
	FBNE	$f4, nt_fbeq_else.17264
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.17265
nt_fbeq_else.17264:
	LDA	$3, 1($31)
nt_fbeq_cont.17265:
nt_fble_cont.17263:
nt_fble_cont.17257:
beq_cont.17255:
	BNE	$3, beq_else.17266
	LDS	$f3, 2($2)
	SUBS	$f3, $f1, $f3
	LDS	$f4, 3($2)
	MULS	$f3, $f4, $f3
	LDS	$f4, 0($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f0, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17267
	BR	$28, nt_fble_cont.17268
nt_fble_else.17267:
	SUBS	$f31, $f4, $f4
nt_fble_cont.17268:
	LDL	$3, 4($0)
	LDS	$f5, 0($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17269
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17270
nt_fble_else.17269:
	LDA	$3, 1($31)
nt_fble_cont.17270:
	BNE	$3, beq_else.17271
	LDA	$3, 0($31)
	BR	$28, beq_cont.17272
beq_else.17271:
	LDS	$f4, 2($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f2, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17273
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17275
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17276
nt_fble_else.17275:
	LDS	$f4, 3($2)
	FBNE	$f4, nt_fbeq_else.17277
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.17278
nt_fbeq_else.17277:
	LDA	$3, 1($31)
nt_fbeq_cont.17278:
nt_fble_cont.17276:
	BR	$28, nt_fble_cont.17274
nt_fble_else.17273:
	SUBS	$f31, $f4, $f4
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.17279
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.17280
nt_fble_else.17279:
	LDS	$f4, 3($2)
	FBNE	$f4, nt_fbeq_else.17281
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.17282
nt_fbeq_else.17281:
	LDA	$3, 1($31)
nt_fbeq_cont.17282:
nt_fble_cont.17280:
nt_fble_cont.17274:
beq_cont.17272:
	BNE	$3, beq_else.17283
	LDS	$f3, 4($2)
	SUBS	$f3, $f2, $f2
	LDS	$f3, 5($2)
	MULS	$f2, $f3, $f2
	LDS	$f3, 0($1)
	MULS	$f2, $f3, $f3
	ADDS	$f3, $f0, $f0
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.17284
	BR	$28, nt_fble_cont.17285
nt_fble_else.17284:
	SUBS	$f31, $f0, $f0
nt_fble_cont.17285:
	LDL	$3, 4($0)
	LDS	$f3, 0($3)
	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, ble_else.17286
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17286:
	LDS	$f0, 1($1)
	MULS	$f2, $f0, $f0
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17287
	LDL	$0, 4($0)
	LDS	$f1, 1($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17288
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17288:
	LDS	$f0, 5($2)
	FBNE	$f0, beq_else.17289
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17289:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f2, 0($0)
	LDA	$0, 3($31)
	RET	$28, ($29)
ble_else.17287:
	SUBS	$f31, $f0, $f0
	LDL	$0, 4($0)
	LDS	$f1, 1($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17290
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17290:
	LDS	$f0, 5($2)
	FBNE	$f0, beq_else.17291
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17291:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f2, 0($0)
	LDA	$0, 3($31)
	RET	$28, ($29)
beq_else.17283:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f3, 0($0)
	LDA	$0, 2($31)
	RET	$28, ($29)
beq_else.17266:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f3, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
solver_second_fast.3397:
	LDS	$f3, 0($1)
	FBNE	$f3, nt_fbeq_else.17292
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.17293
nt_fbeq_else.17292:
	LDA	$2, 0($31)
nt_fbeq_cont.17293:
	BNE	$2, beq_else.17294
	LDS	$f4, 1($1)
	MULS	$f4, $f0, $f4
	LDS	$f5, 2($1)
	MULS	$f5, $f1, $f5
	ADDS	$f4, $f5, $f4
	LDS	$f5, 3($1)
	MULS	$f5, $f2, $f5
	ADDS	$f4, $f5, $f4
	STL	$1, 0($30)
	STS	$f3, 2($30)
	STS	$f4, 4($30)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, quadratic.3361
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.17296
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDS	$f1, 4($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 2($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17297
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17297:
	LDL	$0, 6($0)
	BNE	$0, beq_else.17298
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	SUBS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17298:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	ADDS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17296:
	LDS	$f1, 4($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 2($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17299
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17299:
	LDL	$0, 6($0)
	BNE	$0, beq_else.17300
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	SUBS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17300:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	ADDS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17294:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_fast.3403:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $0, $28
	LDL	$3, 0($28)
	LDS	$f0, 0($2)
	LDL	$4, 5($3)
	LDS	$f1, 0($4)
	SUBS	$f0, $f1, $f0
	LDS	$f1, 1($2)
	LDL	$4, 5($3)
	LDS	$f2, 1($4)
	SUBS	$f1, $f2, $f1
	LDS	$f2, 2($2)
	LDL	$2, 5($3)
	LDS	$f3, 2($2)
	SUBS	$f2, $f3, $f2
	LDL	$2, 1($1)
	ADDL	$2, $0, $28
	LDL	$2, 0($28)
	LDL	$0, 1($3)
	LDA	$28, -1($0)
	BNE	$28, beq_else.17301
	LDL	$1, 0($1)
	LDA	$0, 0($3)
	BR	$28, solver_rect_fast.3384
beq_else.17301:
	LDA	$28, -2($0)
	BNE	$28, beq_else.17302
	LDS	$f3, 0($2)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, ble_else.17303
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17303:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f3, 1($2)
	MULS	$f3, $f0, $f0
	LDS	$f3, 2($2)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 3($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17302:
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	BR	$28, solver_second_fast.3397
solver_second_fast2.3414:
	LDS	$f3, 0($1)
	FBNE	$f3, nt_fbeq_else.17304
	LDA	$3, 1($31)
	BR	$28, nt_fbeq_cont.17305
nt_fbeq_else.17304:
	LDA	$3, 0($31)
nt_fbeq_cont.17305:
	BNE	$3, beq_else.17306
	LDS	$f4, 1($1)
	MULS	$f4, $f0, $f0
	LDS	$f4, 2($1)
	MULS	$f4, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 3($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 3($2)
	MULS	$f0, $f0, $f2
	MULS	$f3, $f1, $f1
	SUBS	$f2, $f1, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f2, $f30
	FBEQ	$f30, ble_else.17307
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17307:
	LDL	$0, 6($0)
	BNE	$0, beq_else.17308
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f1, $f1
	SUBS	$f0, $f1, $f0
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17308:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17306:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_fast2.3421:
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $0, $28
	LDL	$2, 0($28)
	LDL	$3, 10($2)
	LDS	$f0, 0($3)
	LDS	$f1, 1($3)
	LDS	$f2, 2($3)
	LDL	$4, 1($1)
	ADDL	$4, $0, $28
	LDL	$0, 0($28)
	LDL	$4, 1($2)
	LDA	$28, -1($4)
	BNE	$28, beq_else.17309
	LDL	$1, 0($1)
	LDA	$28, 0($2)
	LDA	$2, 0($0)
	LDA	$0, 0($28)
	BR	$28, solver_rect_fast.3384
beq_else.17309:
	LDA	$28, -2($4)
	BNE	$28, beq_else.17310
	LDS	$f0, 0($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17311
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17311:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($0)
	LDS	$f1, 3($3)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($1)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17310:
	LDA	$1, 0($0)
	LDA	$0, 0($2)
	LDA	$2, 0($3)
	BR	$28, solver_second_fast2.3414
setup_rect_table.3424:
	LDA	$2, 6($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 1($30)
	LDS	$f0, 0($1)
	FBNE	$f0, nt_fbeq_else.17312
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.17313
nt_fbeq_else.17312:
	LDA	$2, 0($31)
nt_fbeq_cont.17313:
	BNE	$2, beq_else.17314
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17316
	BNE	$3, beq_else.17318
	LDL	$3, 4($2)
	LDS	$f0, 0($3)
	SUBS	$f31, $f0, $f0
	STS	$f0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 0($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 1($0)
	BR	$28, beq_cont.17319
beq_else.17318:
	LDL	$3, 4($2)
	LDS	$f0, 0($3)
	STS	$f0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 0($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 1($0)
beq_cont.17319:
	BR	$28, nt_fble_cont.17317
nt_fble_else.17316:
	BNE	$3, beq_else.17320
	LDL	$3, 4($2)
	LDS	$f0, 0($3)
	STS	$f0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 0($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 1($0)
	BR	$28, beq_cont.17321
beq_else.17320:
	LDL	$3, 4($2)
	LDS	$f0, 0($3)
	SUBS	$f31, $f0, $f0
	STS	$f0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 0($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 1($0)
beq_cont.17321:
nt_fble_cont.17317:
	BR	$28, beq_cont.17315
beq_else.17314:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($0)
beq_cont.17315:
	LDS	$f0, 1($1)
	FBNE	$f0, nt_fbeq_else.17322
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.17323
nt_fbeq_else.17322:
	LDA	$2, 0($31)
nt_fbeq_cont.17323:
	BNE	$2, beq_else.17324
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 1($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17325
	LDA	$4, 0($31)
	BR	$28, nt_fble_cont.17326
nt_fble_else.17325:
	LDA	$4, 1($31)
nt_fble_cont.17326:
	BNE	$3, beq_else.17327
	LDA	$3, 0($4)
	BR	$28, beq_cont.17328
beq_else.17327:
	BNE	$4, beq_else.17329
	LDA	$3, 1($31)
	BR	$28, beq_cont.17330
beq_else.17329:
	LDA	$3, 0($31)
beq_cont.17330:
beq_cont.17328:
	LDL	$4, 4($2)
	LDS	$f0, 1($4)
	BNE	$3, beq_else.17331
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.17332
beq_else.17331:
beq_cont.17332:
	STS	$f0, 2($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 1($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 3($0)
	LDS	$f0, 2($1)
	FBNE	$f0, beq_else.17333
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17333:
	LDL	$3, 6($2)
	LDS	$f0, 2($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17334
	BNE	$3, beq_else.17335
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17335:
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
ble_else.17334:
	BNE	$3, beq_else.17336
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17336:
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17324:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 3($0)
	LDS	$f0, 2($1)
	FBNE	$f0, beq_else.17337
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17337:
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 2($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17338
	BNE	$3, beq_else.17339
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17339:
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
ble_else.17338:
	BNE	$3, beq_else.17340
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
beq_else.17340:
	LDL	$2, 4($2)
	LDS	$f0, 2($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	RET	$28, ($29)
setup_surface_table.3427:
	LDA	$2, 4($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 1($30)
	LDS	$f0, 0($1)
	LDL	$2, 0($30)
	LDL	$3, 4($2)
	LDS	$f1, 0($3)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($1)
	LDL	$3, 4($2)
	LDS	$f2, 1($3)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	LDL	$1, 4($2)
	LDS	$f2, 2($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17341
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17342
nt_fble_else.17341:
	LDA	$1, 1($31)
nt_fble_cont.17342:
	BNE	$1, beq_else.17343
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($0)
	RET	$28, ($29)
beq_else.17343:
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	INVS	$f0, $f30
	MULS	$f1, $f30, $f1
	STS	$f1, 0($0)
	LDL	$1, 4($2)
	LDS	$f1, 0($1)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f1
	SUBS	$f31, $f1, $f1
	STS	$f1, 1($0)
	LDL	$1, 4($2)
	LDS	$f1, 1($1)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f1
	SUBS	$f31, $f1, $f1
	STS	$f1, 2($0)
	LDL	$1, 4($2)
	LDS	$f1, 2($1)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	SUBS	$f31, $f0, $f0
	STS	$f0, 3($0)
	RET	$28, ($29)
setup_second_table.3430:
	LDA	$2, 5($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 1($30)
	LDS	$f0, 0($1)
	LDS	$f1, 1($1)
	LDS	$f2, 2($1)
	LDL	$2, 0($30)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, quadratic.3361
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 1($30)
	LDS	$f1, 0($0)
	LDL	$1, 0($30)
	LDL	$2, 4($1)
	LDS	$f2, 0($2)
	MULS	$f1, $f2, $f1
	SUBS	$f31, $f1, $f1
	LDS	$f2, 1($0)
	LDL	$2, 4($1)
	LDS	$f3, 1($2)
	MULS	$f2, $f3, $f2
	SUBS	$f31, $f2, $f2
	LDS	$f3, 2($0)
	LDL	$2, 4($1)
	LDS	$f4, 2($2)
	MULS	$f3, $f4, $f3
	SUBS	$f31, $f3, $f3
	LDL	$2, 2($30)
	STS	$f0, 0($2)
	LDL	$3, 3($1)
	BNE	$3, beq_else.17344
	STS	$f1, 1($2)
	STS	$f2, 2($2)
	STS	$f3, 3($2)
	BR	$28, beq_cont.17345
beq_else.17344:
	LDS	$f4, 2($0)
	LDL	$3, 9($1)
	LDS	$f5, 1($3)
	MULS	$f4, $f5, $f4
	LDS	$f5, 1($0)
	LDL	$3, 9($1)
	LDS	$f6, 2($3)
	MULS	$f5, $f6, $f5
	ADDS	$f4, $f5, $f4
	LDAH	$28, 16128($31)
	ITOFS	$28, $f5
    # 0.500000 : 1056964608

	MULS	$f4, $f5, $f4
	SUBS	$f1, $f4, $f1
	STS	$f1, 1($2)
	LDS	$f1, 2($0)
	LDL	$3, 9($1)
	LDS	$f4, 0($3)
	MULS	$f1, $f4, $f1
	LDS	$f4, 0($0)
	LDL	$3, 9($1)
	LDS	$f5, 2($3)
	MULS	$f4, $f5, $f4
	ADDS	$f1, $f4, $f1
	LDAH	$28, 16128($31)
	ITOFS	$28, $f4
    # 0.500000 : 1056964608

	MULS	$f1, $f4, $f1
	SUBS	$f2, $f1, $f1
	STS	$f1, 2($2)
	LDS	$f1, 1($0)
	LDL	$3, 9($1)
	LDS	$f2, 0($3)
	MULS	$f1, $f2, $f1
	LDS	$f2, 0($0)
	LDL	$0, 9($1)
	LDS	$f4, 1($0)
	MULS	$f2, $f4, $f2
	ADDS	$f1, $f2, $f1
	LDAH	$28, 16128($31)
	ITOFS	$28, $f2
    # 0.500000 : 1056964608

	MULS	$f1, $f2, $f1
	SUBS	$f3, $f1, $f1
	STS	$f1, 3($2)
beq_cont.17345:
	FBNE	$f0, beq_else.17346
	LDA	$0, 0($2)
	RET	$28, ($29)
beq_else.17346:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 4($2)
	LDA	$0, 0($2)
	RET	$28, ($29)
iter_setup_dirvec_constants.3433:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.17347
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDL	$3, 1($0)
	LDL	$4, 0($0)
	LDL	$5, 1($2)
	LDA	$28, -1($5)
	BNE	$28, beq_else.17348
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17349
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 0($30)
	LDL	$3, 1($2)
	LDL	$4, 0($2)
	LDL	$5, 1($1)
	LDA	$28, -1($5)
	BNE	$28, beq_else.17350
	STL	$0, 3($30)
	STL	$3, 4($30)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17350:
	LDA	$28, -2($5)
	BNE	$28, beq_else.17351
	STL	$0, 3($30)
	STL	$3, 4($30)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17351:
	STL	$0, 3($30)
	STL	$3, 4($30)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
bge_else.17349:
	RET	$28, ($29)
beq_else.17348:
	LDA	$28, -2($5)
	BNE	$28, beq_else.17353
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17354
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 0($30)
	LDL	$3, 1($2)
	LDL	$4, 0($2)
	LDL	$5, 1($1)
	LDA	$28, -1($5)
	BNE	$28, beq_else.17355
	STL	$0, 3($30)
	STL	$3, 5($30)
	LDA	$0, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 3($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17355:
	LDA	$28, -2($5)
	BNE	$28, beq_else.17356
	STL	$0, 3($30)
	STL	$3, 5($30)
	LDA	$0, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 3($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17356:
	STL	$0, 3($30)
	STL	$3, 5($30)
	LDA	$0, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 3($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
bge_else.17354:
	RET	$28, ($29)
beq_else.17353:
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17358
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 0($30)
	LDL	$3, 1($2)
	LDL	$4, 0($2)
	LDL	$5, 1($1)
	LDA	$28, -1($5)
	BNE	$28, beq_else.17359
	STL	$0, 3($30)
	STL	$3, 6($30)
	LDA	$0, 0($4)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 3($30)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17359:
	LDA	$28, -2($5)
	BNE	$28, beq_else.17360
	STL	$0, 3($30)
	STL	$3, 6($30)
	LDA	$0, 0($4)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 3($30)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17360:
	STL	$0, 3($30)
	STL	$3, 6($30)
	LDA	$0, 0($4)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$1, 3($30)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
bge_else.17358:
	RET	$28, ($29)
bge_else.17347:
	RET	$28, ($29)
setup_dirvec_constants.3436:
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.17363
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDL	$3, 1($0)
	LDL	$4, 0($0)
	LDL	$5, 1($2)
	LDA	$28, -1($5)
	BNE	$28, beq_else.17364
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17364:
	LDA	$28, -2($5)
	BNE	$28, beq_else.17365
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
beq_else.17365:
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3433
bge_else.17363:
	RET	$28, ($29)
setup_startp_constants.3438:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.17367
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDL	$3, 10($2)
	LDL	$4, 1($2)
	LDS	$f0, 0($0)
	LDL	$5, 5($2)
	LDS	$f1, 0($5)
	SUBS	$f0, $f1, $f0
	STS	$f0, 0($3)
	LDS	$f0, 1($0)
	LDL	$5, 5($2)
	LDS	$f1, 1($5)
	SUBS	$f0, $f1, $f0
	STS	$f0, 1($3)
	LDS	$f0, 2($0)
	LDL	$5, 5($2)
	LDS	$f1, 2($5)
	SUBS	$f0, $f1, $f0
	STS	$f0, 2($3)
	LDA	$28, -2($4)
	BNE	$28, beq_else.17368
	LDL	$2, 4($2)
	LDS	$f0, 0($3)
	LDS	$f1, 1($3)
	LDS	$f2, 2($3)
	LDS	$f3, 0($2)
	MULS	$f3, $f0, $f0
	LDS	$f3, 1($2)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 3($3)
	LDA	$1, -1($1)
	BR	$28, setup_startp_constants.3438
beq_else.17368:
	CMPLE	$4, 2, $28
	BEQ	$28, ble_else.17369
	LDA	$1, -1($1)
	BR	$28, setup_startp_constants.3438
ble_else.17369:
	LDS	$f0, 0($3)
	LDS	$f1, 1($3)
	LDS	$f2, 2($3)
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	STL	$4, 3($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, quadratic.3361
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.17370
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDL	$0, 2($30)
	STS	$f0, 3($0)
	LDL	$0, 1($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, setup_startp_constants.3438
beq_else.17370:
	LDL	$0, 2($30)
	STS	$f0, 3($0)
	LDL	$0, 1($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, setup_startp_constants.3438
bge_else.17367:
	RET	$28, ($29)
is_rect_outside.3443:
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.17372
	BR	$28, nt_fble_cont.17373
nt_fble_else.17372:
	SUBS	$f31, $f0, $f0
nt_fble_cont.17373:
	LDL	$1, 4($0)
	LDS	$f3, 0($1)
	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, ble_else.17374
	LDL	$0, 6($0)
	BNE	$0, beq_else.17375
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17375:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17374:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.17376
	LDL	$1, 4($0)
	LDS	$f0, 1($1)
	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.17377
	LDL	$0, 6($0)
	BNE	$0, beq_else.17378
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17378:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17377:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17379
	LDL	$1, 4($0)
	LDS	$f0, 2($1)
	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17380
	LDL	$0, 6($0)
	BNE	$0, beq_else.17381
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17381:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17380:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17379:
	SUBS	$f31, $f2, $f0
	LDL	$1, 4($0)
	LDS	$f1, 2($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17382
	LDL	$0, 6($0)
	BNE	$0, beq_else.17383
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17383:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17382:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17376:
	SUBS	$f31, $f1, $f0
	LDL	$1, 4($0)
	LDS	$f1, 1($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17384
	LDL	$0, 6($0)
	BNE	$0, beq_else.17385
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17385:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17384:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17386
	LDL	$1, 4($0)
	LDS	$f0, 2($1)
	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17387
	LDL	$0, 6($0)
	BNE	$0, beq_else.17388
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17388:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17387:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17386:
	SUBS	$f31, $f2, $f0
	LDL	$1, 4($0)
	LDS	$f1, 2($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17389
	LDL	$0, 6($0)
	BNE	$0, beq_else.17390
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17390:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17389:
	LDL	$0, 6($0)
	RET	$28, ($29)
is_outside.3458:
	LDL	$1, 5($0)
	LDS	$f3, 0($1)
	SUBS	$f0, $f3, $f0
	LDL	$1, 5($0)
	LDS	$f3, 1($1)
	SUBS	$f1, $f3, $f1
	LDL	$1, 5($0)
	LDS	$f3, 2($1)
	SUBS	$f2, $f3, $f2
	LDL	$1, 1($0)
	LDA	$28, -1($1)
	BNE	$28, beq_else.17391
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.17392
	BR	$28, nt_fble_cont.17393
nt_fble_else.17392:
	SUBS	$f31, $f0, $f0
nt_fble_cont.17393:
	LDL	$1, 4($0)
	LDS	$f3, 0($1)
	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, ble_else.17394
	LDL	$0, 6($0)
	BNE	$0, beq_else.17395
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17395:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17394:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.17396
	LDL	$1, 4($0)
	LDS	$f0, 1($1)
	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.17397
	LDL	$0, 6($0)
	BNE	$0, beq_else.17398
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17398:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17397:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17399
	LDL	$1, 4($0)
	LDS	$f0, 2($1)
	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17400
	LDL	$0, 6($0)
	BNE	$0, beq_else.17401
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17401:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17400:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17399:
	SUBS	$f31, $f2, $f0
	LDL	$1, 4($0)
	LDS	$f1, 2($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17402
	LDL	$0, 6($0)
	BNE	$0, beq_else.17403
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17403:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17402:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17396:
	SUBS	$f31, $f1, $f0
	LDL	$1, 4($0)
	LDS	$f1, 1($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17404
	LDL	$0, 6($0)
	BNE	$0, beq_else.17405
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17405:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17404:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17406
	LDL	$1, 4($0)
	LDS	$f0, 2($1)
	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, ble_else.17407
	LDL	$0, 6($0)
	BNE	$0, beq_else.17408
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17408:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17407:
	LDL	$0, 6($0)
	RET	$28, ($29)
ble_else.17406:
	SUBS	$f31, $f2, $f0
	LDL	$1, 4($0)
	LDS	$f1, 2($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17409
	LDL	$0, 6($0)
	BNE	$0, beq_else.17410
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17410:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17409:
	LDL	$0, 6($0)
	RET	$28, ($29)
beq_else.17391:
	LDA	$28, -2($1)
	BNE	$28, beq_else.17411
	LDL	$1, 4($0)
	LDS	$f3, 0($1)
	MULS	$f3, $f0, $f0
	LDS	$f3, 1($1)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17412
	BNE	$0, beq_else.17413
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17413:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17412:
	BNE	$0, beq_else.17414
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17414:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17411:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, quadratic.3361
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$0, 0($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.17415
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17416
	BNE	$0, beq_else.17417
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17417:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17416:
	BNE	$0, beq_else.17418
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17418:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17415:
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17419
	BNE	$0, beq_else.17420
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17420:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17419:
	BNE	$0, beq_else.17421
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17421:
	LDA	$0, 1($31)
	RET	$28, ($29)
check_all_inside.3463:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17422
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17422:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDL	$3, 5($2)
	LDS	$f3, 0($3)
	SUBS	$f0, $f3, $f3
	LDL	$3, 5($2)
	LDS	$f4, 1($3)
	SUBS	$f1, $f4, $f4
	LDL	$3, 5($2)
	LDS	$f5, 2($3)
	SUBS	$f2, $f5, $f5
	LDL	$3, 1($2)
	LDA	$28, -1($3)
	BNE	$28, beq_else.17423
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	ADDS	$f5, $f31, $f2
	ADDS	$f4, $f31, $f1
	ADDS	$f3, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, is_rect_outside.3443
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.17424
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17425
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17425:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, is_outside.3458
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	BNE	$0, beq_else.17426
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17426:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17424:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17423:
	LDA	$28, -2($3)
	BNE	$28, beq_else.17427
	LDL	$3, 4($2)
	LDS	$f6, 0($3)
	MULS	$f6, $f3, $f3
	LDS	$f6, 1($3)
	MULS	$f6, $f4, $f4
	ADDS	$f3, $f4, $f3
	LDS	$f4, 2($3)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	LDL	$2, 6($2)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, ble_else.17428
	BNE	$2, beq_else.17429
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17429:
	LDA	$0, 1($0)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17430
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17430:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, is_outside.3458
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	BNE	$0, beq_else.17431
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17431:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17428:
	BNE	$2, beq_else.17432
	LDA	$0, 1($0)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17433
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17433:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, is_outside.3458
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	BNE	$0, beq_else.17434
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17434:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17432:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17427:
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	STL	$2, 9($30)
	LDA	$0, 0($2)
	ADDS	$f5, $f31, $f2
	ADDS	$f4, $f31, $f1
	ADDS	$f3, $f31, $f0
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, quadratic.3361
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.17435
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17436
	BNE	$0, beq_else.17437
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17437:
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17438
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17438:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, is_outside.3458
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17439
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17439:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17436:
	BNE	$0, beq_else.17440
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17441
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17441:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, is_outside.3458
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17442
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17442:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17440:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17435:
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17443
	BNE	$0, beq_else.17444
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17444:
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17445
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17445:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, is_outside.3458
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17446
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17446:
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.17443:
	BNE	$0, beq_else.17447
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17448
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17448:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	STL	$0, 8($30)
	LDA	$0, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, is_outside.3458
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17449
	LDL	$0, 8($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3463
beq_else.17449:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17447:
	LDA	$0, 0($31)
	RET	$28, ($29)
shadow_check_and_group.3469:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17450
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17450:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_light_dirvec
	LDL	$3, 0($3)
	MOV	$4, min_caml_intersection_point
	LDL	$4, 0($4)
	MOV	$5, min_caml_objects
	LDL	$5, 0($5)
	ADDL	$5, $2, $28
	LDL	$5, 0($28)
	LDS	$f0, 0($4)
	LDL	$6, 5($5)
	LDS	$f1, 0($6)
	SUBS	$f0, $f1, $f0
	LDS	$f1, 1($4)
	LDL	$6, 5($5)
	LDS	$f2, 1($6)
	SUBS	$f1, $f2, $f1
	LDS	$f2, 2($4)
	LDL	$4, 5($5)
	LDS	$f3, 2($4)
	SUBS	$f2, $f3, $f2
	LDL	$4, 1($3)
	ADDL	$4, $2, $28
	LDL	$4, 0($28)
	LDL	$6, 1($5)
	STL	$1, 0($30)
	STL	$0, 1($30)
	STL	$2, 2($30)
	LDA	$28, -1($6)
	BNE	$28, beq_else.17451
	LDL	$3, 0($3)
	LDA	$2, 0($4)
	LDA	$1, 0($3)
	LDA	$0, 0($5)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solver_rect_fast.3384
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BR	$28, beq_cont.17452
beq_else.17451:
	LDA	$28, -2($6)
	BNE	$28, beq_else.17453
	LDS	$f3, 0($4)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.17455
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17456
nt_fble_else.17455:
	MOV	$3, min_caml_solver_dist
	LDL	$3, 0($3)
	LDS	$f3, 1($4)
	MULS	$f3, $f0, $f0
	LDS	$f3, 2($4)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 3($4)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($3)
	LDA	$0, 1($31)
nt_fble_cont.17456:
	BR	$28, beq_cont.17454
beq_else.17453:
	LDA	$1, 0($4)
	LDA	$0, 0($5)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solver_second_fast.3397
	LDA	$30, -4($30)
	LDL	$29, 3($30)
beq_cont.17454:
beq_cont.17452:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	BNE	$0, beq_else.17457
	LDA	$0, 0($31)
	BR	$28, beq_cont.17458
beq_else.17457:
	LDA	$28, -13107($31)
	LDAH	$28, -16819($28)
	ITOFS	$28, $f1
    # -0.200000 : -1102263091

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17459
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17460
nt_fble_else.17459:
	LDA	$0, 1($31)
nt_fble_cont.17460:
beq_cont.17458:
	BNE	$0, beq_else.17461
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.17462
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17462:
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_and_group.3469
beq_else.17461:
	LDA	$28, -10486($31)
	LDAH	$28, 15396($28)
	ITOFS	$28, $f1
    # 0.010000 : 1008981770

	ADDS	$f0, $f1, $f0
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	MULS	$f1, $f0, $f1
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f2, 0($0)
	ADDS	$f1, $f2, $f1
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f2, 1($0)
	MULS	$f2, $f0, $f2
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f3, 1($0)
	ADDS	$f2, $f3, $f2
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f3, 2($0)
	MULS	$f3, $f0, $f0
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f3, 2($0)
	ADDS	$f0, $f3, $f0
	LDL	$0, 0($30)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17463
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17463:
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	STS	$f0, 4($30)
	STS	$f2, 6($30)
	STS	$f1, 8($30)
	LDA	$0, 0($1)
	ADDS	$f2, $f31, $f30
	ADDS	$f0, $f31, $f2
	ADDS	$f1, $f31, $f0
	ADDS	$f30, $f31, $f1
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, is_outside.3458
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17465
	LDA	$0, 1($31)
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	LDL	$1, 0($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, check_all_inside.3463
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17466
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_and_group.3469
beq_else.17466:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17465:
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_and_group.3469
shadow_check_one_or_group.3472:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17467
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17467:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	BNE	$0, beq_else.17468
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17469
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17469:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	STL	$0, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17470
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17471
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17471:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	STL	$0, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.17472
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17473
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17473:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	STL	$0, 4($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BNE	$0, beq_else.17474
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_group.3472
beq_else.17474:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17472:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17470:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17468:
	LDA	$0, 1($31)
	RET	$28, ($29)
shadow_check_one_or_matrix.3475:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$3, 0($2)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17475
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.17475:
	LDA	$28, -99($3)
	BNE	$28, beq_else.17476
	LDL	$3, 1($2)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17477
	LDA	$0, 1($0)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17477:
	MOV	$4, min_caml_and_net
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$3, 0($28)
	LDA	$4, 0($31)
	STL	$1, 0($30)
	STL	$0, 1($30)
	STL	$2, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17478
	LDA	$0, 2($31)
	LDL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_one_or_group.3472
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17479
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17479:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17478:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17476:
	MOV	$4, min_caml_light_dirvec
	LDL	$4, 0($4)
	MOV	$5, min_caml_intersection_point
	LDL	$5, 0($5)
	STL	$2, 2($30)
	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$2, 0($5)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solver_fast.3403
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17480
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17480:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17481
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17482
nt_fble_else.17481:
	LDA	$0, 1($31)
nt_fble_cont.17482:
	BNE	$0, beq_else.17483
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17483:
	LDA	$0, 1($31)
	LDL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_one_or_group.3472
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17484
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17484:
	LDL	$0, 2($30)
	LDL	$1, 1($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17485
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17485:
	MOV	$2, min_caml_and_net
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDA	$2, 0($31)
	LDA	$0, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_and_group.3469
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17486
	LDA	$0, 2($31)
	LDL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_one_or_group.3472
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.17487
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_matrix.3475
beq_else.17487:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.17486:
	LDA	$0, 1($31)
	RET	$28, ($29)
solve_each_element.3478:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17488
	RET	$28, ($29)
beq_else.17488:
	MOV	$4, min_caml_startp
	LDL	$4, 0($4)
	MOV	$5, min_caml_objects
	LDL	$5, 0($5)
	ADDL	$5, $3, $28
	LDL	$5, 0($28)
	LDS	$f0, 0($4)
	LDL	$6, 5($5)
	LDS	$f1, 0($6)
	SUBS	$f0, $f1, $f0
	LDS	$f1, 1($4)
	LDL	$6, 5($5)
	LDS	$f2, 1($6)
	SUBS	$f1, $f2, $f1
	LDS	$f2, 2($4)
	LDL	$4, 5($5)
	LDS	$f3, 2($4)
	SUBS	$f2, $f3, $f2
	LDL	$4, 1($5)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$28, -1($4)
	BNE	$28, beq_else.17490
	LDA	$4, 0($31)
	LDA	$6, 1($31)
	LDA	$7, 2($31)
	STS	$f0, 4($30)
	STS	$f2, 6($30)
	STS	$f1, 8($30)
	STL	$5, 10($30)
	LDA	$3, 0($6)
	LDA	$1, 0($2)
	LDA	$0, 0($5)
	LDA	$2, 0($4)
	LDA	$4, 0($7)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	BNE	$0, beq_else.17492
	LDA	$2, 1($31)
	LDA	$3, 2($31)
	LDA	$4, 0($31)
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	LDL	$0, 10($30)
	LDL	$1, 0($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	BNE	$0, beq_else.17494
	LDA	$2, 2($31)
	LDA	$3, 0($31)
	LDA	$4, 1($31)
	LDS	$f0, 6($30)
	LDS	$f1, 4($30)
	LDS	$f2, 8($30)
	LDL	$0, 10($30)
	LDL	$1, 0($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, solver_rect_surface.3340
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	BNE	$0, beq_else.17496
	LDA	$0, 0($31)
	BR	$28, beq_cont.17497
beq_else.17496:
	LDA	$0, 3($31)
beq_cont.17497:
	BR	$28, beq_cont.17495
beq_else.17494:
	LDA	$0, 2($31)
beq_cont.17495:
	BR	$28, beq_cont.17493
beq_else.17492:
	LDA	$0, 1($31)
beq_cont.17493:
	BR	$28, beq_cont.17491
beq_else.17490:
	LDA	$28, -2($4)
	BNE	$28, beq_else.17498
	LDA	$1, 0($2)
	LDA	$0, 0($5)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, solver_surface.3355
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	BR	$28, beq_cont.17499
beq_else.17498:
	LDA	$1, 0($2)
	LDA	$0, 0($5)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, solver_second.3374
	LDA	$30, -12($30)
	LDL	$29, 11($30)
beq_cont.17499:
beq_cont.17491:
	BNE	$0, beq_else.17500
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.17501
	RET	$28, ($29)
beq_else.17501:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_each_element.3478
beq_else.17500:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17503
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17504
nt_fble_else.17503:
	LDA	$1, 1($31)
nt_fble_cont.17504:
	BNE	$1, beq_else.17505
	BR	$28, beq_cont.17506
beq_else.17505:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17507
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17508
nt_fble_else.17507:
	LDA	$1, 1($31)
nt_fble_cont.17508:
	BNE	$1, beq_else.17509
	BR	$28, beq_cont.17510
beq_else.17509:
	LDA	$28, -10486($31)
	LDAH	$28, 15396($28)
	ITOFS	$28, $f1
    # 0.010000 : 1008981770

	ADDS	$f0, $f1, $f0
	LDL	$2, 0($30)
	LDS	$f1, 0($2)
	MULS	$f1, $f0, $f1
	MOV	$1, min_caml_startp
	LDL	$1, 0($1)
	LDS	$f2, 0($1)
	ADDS	$f1, $f2, $f1
	LDS	$f2, 1($2)
	MULS	$f2, $f0, $f2
	MOV	$1, min_caml_startp
	LDL	$1, 0($1)
	LDS	$f3, 1($1)
	ADDS	$f2, $f3, $f2
	LDS	$f3, 2($2)
	MULS	$f3, $f0, $f3
	MOV	$1, min_caml_startp
	LDL	$1, 0($1)
	LDS	$f4, 2($1)
	ADDS	$f3, $f4, $f3
	LDL	$1, 1($30)
	LDL	$3, 0($1)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17511
	MOV	$3, min_caml_tmin
	LDL	$3, 0($3)
	STS	$f0, 0($3)
	MOV	$3, min_caml_intersection_point
	LDL	$3, 0($3)
	STS	$f1, 0($3)
	STS	$f2, 1($3)
	STS	$f3, 2($3)
	MOV	$3, min_caml_intersected_object_id
	LDL	$3, 0($3)
	LDL	$4, 3($30)
	STL	$4, 0($3)
	MOV	$3, min_caml_intsec_rectside
	LDL	$3, 0($3)
	STL	$0, 0($3)
	BR	$28, beq_cont.17512
beq_else.17511:
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$3, 0($28)
	STL	$0, 11($30)
	STS	$f0, 12($30)
	STS	$f3, 14($30)
	STS	$f2, 16($30)
	STS	$f1, 18($30)
	LDA	$0, 0($3)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, is_outside.3458
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	BNE	$0, beq_else.17513
	LDA	$0, 1($31)
	LDS	$f0, 18($30)
	LDS	$f1, 16($30)
	LDS	$f2, 14($30)
	LDL	$1, 1($30)
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, check_all_inside.3463
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	BNE	$0, beq_else.17515
	BR	$28, beq_cont.17516
beq_else.17515:
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 12($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f0, 18($30)
	STS	$f0, 0($0)
	LDS	$f0, 16($30)
	STS	$f0, 1($0)
	LDS	$f0, 14($30)
	STS	$f0, 2($0)
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	STL	$1, 0($0)
	MOV	$0, min_caml_intsec_rectside
	LDL	$0, 0($0)
	LDL	$1, 11($30)
	STL	$1, 0($0)
beq_cont.17516:
	BR	$28, beq_cont.17514
beq_else.17513:
beq_cont.17514:
beq_cont.17512:
beq_cont.17510:
beq_cont.17506:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_each_element.3478
solve_one_or_network.3482:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17517
	RET	$28, ($29)
beq_else.17517:
	MOV	$4, min_caml_and_net
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$3, 0($28)
	LDA	$4, 0($31)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17519
	RET	$28, ($29)
beq_else.17519:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17521
	RET	$28, ($29)
beq_else.17521:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 4($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17523
	RET	$28, ($29)
beq_else.17523:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 5($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_one_or_network.3482
trace_or_matrix.3486:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDL	$4, 0($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.17525
	RET	$28, ($29)
beq_else.17525:
	LDA	$28, -99($4)
	BNE	$28, beq_else.17527
	LDL	$4, 1($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.17528
	LDA	$0, 1($0)
	BR	$28, trace_or_matrix.3486
beq_else.17528:
	MOV	$5, min_caml_and_net
	LDL	$5, 0($5)
	ADDL	$5, $4, $28
	LDL	$4, 0($28)
	LDA	$5, 0($31)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$1, 0($4)
	LDA	$0, 0($5)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDL	$1, 2($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17529
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3486
beq_else.17529:
	MOV	$2, min_caml_and_net
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDA	$2, 0($31)
	LDL	$3, 0($30)
	LDA	$0, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element.3478
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$0, 3($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network.3482
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3486
beq_else.17527:
	MOV	$5, min_caml_startp
	LDL	$5, 0($5)
	STL	$3, 3($30)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	LDA	$2, 0($5)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solver.3380
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.17530
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3486
beq_else.17530:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17531
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3486
ble_else.17531:
	LDA	$0, 1($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network.3482
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3486
solve_each_element_fast.3492:
	LDL	$3, 0($2)
	ADDL	$1, $0, $28
	LDL	$4, 0($28)
	LDA	$28, 1($4)
	BNE	$28, beq_else.17532
	RET	$28, ($29)
beq_else.17532:
	MOV	$5, min_caml_objects
	LDL	$5, 0($5)
	ADDL	$5, $4, $28
	LDL	$5, 0($28)
	LDL	$6, 10($5)
	LDS	$f0, 0($6)
	LDS	$f1, 1($6)
	LDS	$f2, 2($6)
	LDL	$7, 1($2)
	ADDL	$7, $4, $28
	LDL	$7, 0($28)
	LDL	$8, 1($5)
	STL	$3, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$0, 3($30)
	STL	$4, 4($30)
	LDA	$28, -1($8)
	BNE	$28, beq_else.17534
	LDL	$6, 0($2)
	LDA	$2, 0($7)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, solver_rect_fast.3384
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, beq_cont.17535
beq_else.17534:
	LDA	$28, -2($8)
	BNE	$28, beq_else.17536
	LDS	$f0, 0($7)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17538
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17539
nt_fble_else.17538:
	MOV	$5, min_caml_solver_dist
	LDL	$5, 0($5)
	LDS	$f0, 0($7)
	LDS	$f1, 3($6)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($5)
	LDA	$0, 1($31)
nt_fble_cont.17539:
	BR	$28, beq_cont.17537
beq_else.17536:
	LDA	$2, 0($6)
	LDA	$1, 0($7)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, solver_second_fast2.3414
	LDA	$30, -6($30)
	LDL	$29, 5($30)
beq_cont.17537:
beq_cont.17535:
	BNE	$0, beq_else.17540
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.17541
	RET	$28, ($29)
beq_else.17541:
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	BR	$28, solve_each_element_fast.3492
beq_else.17540:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17543
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17544
nt_fble_else.17543:
	LDA	$1, 1($31)
nt_fble_cont.17544:
	BNE	$1, beq_else.17545
	BR	$28, beq_cont.17546
beq_else.17545:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17547
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.17548
nt_fble_else.17547:
	LDA	$1, 1($31)
nt_fble_cont.17548:
	BNE	$1, beq_else.17549
	BR	$28, beq_cont.17550
beq_else.17549:
	LDA	$28, -10486($31)
	LDAH	$28, 15396($28)
	ITOFS	$28, $f1
    # 0.010000 : 1008981770

	ADDS	$f0, $f1, $f0
	LDL	$1, 0($30)
	LDS	$f1, 0($1)
	MULS	$f1, $f0, $f1
	MOV	$2, min_caml_startp_fast
	LDL	$2, 0($2)
	LDS	$f2, 0($2)
	ADDS	$f1, $f2, $f1
	LDS	$f2, 1($1)
	MULS	$f2, $f0, $f2
	MOV	$2, min_caml_startp_fast
	LDL	$2, 0($2)
	LDS	$f3, 1($2)
	ADDS	$f2, $f3, $f2
	LDS	$f3, 2($1)
	MULS	$f3, $f0, $f3
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDS	$f4, 2($1)
	ADDS	$f3, $f4, $f3
	LDL	$1, 2($30)
	LDL	$2, 0($1)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17551
	MOV	$2, min_caml_tmin
	LDL	$2, 0($2)
	STS	$f0, 0($2)
	MOV	$2, min_caml_intersection_point
	LDL	$2, 0($2)
	STS	$f1, 0($2)
	STS	$f2, 1($2)
	STS	$f3, 2($2)
	MOV	$2, min_caml_intersected_object_id
	LDL	$2, 0($2)
	LDL	$3, 4($30)
	STL	$3, 0($2)
	MOV	$2, min_caml_intsec_rectside
	LDL	$2, 0($2)
	STL	$0, 0($2)
	BR	$28, beq_cont.17552
beq_else.17551:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	STL	$0, 5($30)
	STS	$f0, 6($30)
	STS	$f3, 8($30)
	STS	$f2, 10($30)
	STS	$f1, 12($30)
	LDA	$0, 0($2)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, is_outside.3458
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	BNE	$0, beq_else.17553
	LDA	$0, 1($31)
	LDS	$f0, 12($30)
	LDS	$f1, 10($30)
	LDS	$f2, 8($30)
	LDL	$1, 2($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, check_all_inside.3463
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	BNE	$0, beq_else.17555
	BR	$28, beq_cont.17556
beq_else.17555:
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 6($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f0, 12($30)
	STS	$f0, 0($0)
	LDS	$f0, 10($30)
	STS	$f0, 1($0)
	LDS	$f0, 8($30)
	STS	$f0, 2($0)
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	STL	$1, 0($0)
	MOV	$0, min_caml_intsec_rectside
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	STL	$1, 0($0)
beq_cont.17556:
	BR	$28, beq_cont.17554
beq_else.17553:
beq_cont.17554:
beq_cont.17552:
beq_cont.17550:
beq_cont.17546:
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	BR	$28, solve_each_element_fast.3492
solve_one_or_network_fast.3496:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.17557
	RET	$28, ($29)
beq_else.17557:
	MOV	$4, min_caml_and_net
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$3, 0($28)
	LDA	$4, 0($31)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17559
	RET	$28, ($29)
beq_else.17559:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17561
	RET	$28, ($29)
beq_else.17561:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 4($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.17563
	RET	$28, ($29)
beq_else.17563:
	MOV	$3, min_caml_and_net
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDL	$4, 0($30)
	STL	$0, 5($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_one_or_network_fast.3496
trace_or_matrix_fast.3500:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDL	$4, 0($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.17565
	RET	$28, ($29)
beq_else.17565:
	LDA	$28, -99($4)
	BNE	$28, beq_else.17567
	LDL	$4, 1($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.17568
	LDA	$0, 1($0)
	BR	$28, trace_or_matrix_fast.3500
beq_else.17568:
	MOV	$5, min_caml_and_net
	LDL	$5, 0($5)
	ADDL	$5, $4, $28
	LDL	$4, 0($28)
	LDA	$5, 0($31)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$1, 0($4)
	LDA	$0, 0($5)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDL	$1, 2($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.17569
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3500
beq_else.17569:
	MOV	$2, min_caml_and_net
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDA	$2, 0($31)
	LDL	$3, 0($30)
	LDA	$0, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_each_element_fast.3492
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$0, 3($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network_fast.3496
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3500
beq_else.17567:
	STL	$3, 3($30)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solver_fast2.3421
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.17570
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3500
beq_else.17570:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17571
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3500
ble_else.17571:
	LDA	$0, 1($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network_fast.3496
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3500
get_nvector_second.3510:
	MOV	$1, min_caml_intersection_point
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	LDL	$1, 5($0)
	LDS	$f1, 0($1)
	SUBS	$f0, $f1, $f0
	MOV	$1, min_caml_intersection_point
	LDL	$1, 0($1)
	LDS	$f1, 1($1)
	LDL	$1, 5($0)
	LDS	$f2, 1($1)
	SUBS	$f1, $f2, $f1
	MOV	$1, min_caml_intersection_point
	LDL	$1, 0($1)
	LDS	$f2, 2($1)
	LDL	$1, 5($0)
	LDS	$f3, 2($1)
	SUBS	$f2, $f3, $f2
	LDL	$1, 4($0)
	LDS	$f3, 0($1)
	MULS	$f0, $f3, $f3
	LDL	$1, 4($0)
	LDS	$f4, 1($1)
	MULS	$f1, $f4, $f4
	LDL	$1, 4($0)
	LDS	$f5, 2($1)
	MULS	$f2, $f5, $f5
	LDL	$1, 3($0)
	BNE	$1, beq_else.17572
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f3, 0($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f4, 1($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f5, 2($1)
	BR	$28, beq_cont.17573
beq_else.17572:
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 9($0)
	LDS	$f6, 2($2)
	MULS	$f1, $f6, $f6
	LDL	$2, 9($0)
	LDS	$f7, 1($2)
	MULS	$f2, $f7, $f7
	ADDS	$f6, $f7, $f6
	LDAH	$28, 16128($31)
	ITOFS	$28, $f7
    # 0.500000 : 1056964608

	MULS	$f6, $f7, $f6
	ADDS	$f3, $f6, $f3
	STS	$f3, 0($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 9($0)
	LDS	$f3, 2($2)
	MULS	$f0, $f3, $f3
	LDL	$2, 9($0)
	LDS	$f6, 0($2)
	MULS	$f2, $f6, $f2
	ADDS	$f3, $f2, $f2
	LDAH	$28, 16128($31)
	ITOFS	$28, $f3
    # 0.500000 : 1056964608

	MULS	$f2, $f3, $f2
	ADDS	$f4, $f2, $f2
	STS	$f2, 1($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 9($0)
	LDS	$f2, 1($2)
	MULS	$f0, $f2, $f0
	LDL	$2, 9($0)
	LDS	$f2, 0($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDAH	$28, 16128($31)
	ITOFS	$28, $f1
    # 0.500000 : 1056964608

	MULS	$f0, $f1, $f0
	ADDS	$f5, $f0, $f0
	STS	$f0, 2($1)
beq_cont.17573:
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$0, 6($0)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	BR	$28, vecunit_sgn.3218
utexture.3515:
	LDL	$2, 0($0)
	MOV	$3, min_caml_texture_color
	LDL	$3, 0($3)
	LDL	$4, 8($0)
	LDS	$f0, 0($4)
	STS	$f0, 0($3)
	MOV	$3, min_caml_texture_color
	LDL	$3, 0($3)
	LDL	$4, 8($0)
	LDS	$f0, 1($4)
	STS	$f0, 1($3)
	MOV	$3, min_caml_texture_color
	LDL	$3, 0($3)
	LDL	$4, 8($0)
	LDS	$f0, 2($4)
	STS	$f0, 2($3)
	LDA	$28, -1($2)
	BNE	$28, beq_else.17574
	LDS	$f0, 0($1)
	LDL	$2, 5($0)
	LDS	$f1, 0($2)
	SUBS	$f0, $f1, $f0
	LDA	$28, -13107($31)
	LDAH	$28, 15693($28)
	ITOFS	$28, $f1
    # 0.050000 : 1028443341

	MULS	$f0, $f1, $f1
	STL	$0, 0($30)
	STL	$1, 1($30)
	STS	$f0, 2($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_floor
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDAH	$28, 16800($31)
	ITOFS	$28, $f1
    # 20.000000 : 1101004800

	MULS	$f0, $f1, $f0
	LDS	$f1, 2($30)
	SUBS	$f1, $f0, $f0
	LDAH	$28, 16672($31)
	ITOFS	$28, $f1
    # 10.000000 : 1092616192

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17575
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17576
nt_fble_else.17575:
	LDA	$0, 1($31)
nt_fble_cont.17576:
	LDL	$1, 1($30)
	LDS	$f0, 2($1)
	LDL	$1, 0($30)
	LDL	$1, 5($1)
	LDS	$f1, 2($1)
	SUBS	$f0, $f1, $f0
	LDA	$28, -13107($31)
	LDAH	$28, 15693($28)
	ITOFS	$28, $f1
    # 0.050000 : 1028443341

	MULS	$f0, $f1, $f1
	STL	$0, 4($30)
	STS	$f0, 6($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_floor
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDAH	$28, 16800($31)
	ITOFS	$28, $f1
    # 20.000000 : 1101004800

	MULS	$f0, $f1, $f0
	LDS	$f1, 6($30)
	SUBS	$f1, $f0, $f0
	LDAH	$28, 16672($31)
	ITOFS	$28, $f1
    # 10.000000 : 1092616192

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17578
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	BNE	$1, beq_else.17579
	LDAH	$28, 17279($31)
	ITOFS	$28, $f0
    # 255.000000 : 1132396544

	STS	$f0, 1($0)
	RET	$28, ($29)
beq_else.17579:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($0)
	RET	$28, ($29)
ble_else.17578:
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	BNE	$1, beq_else.17582
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($0)
	RET	$28, ($29)
beq_else.17582:
	LDAH	$28, 17279($31)
	ITOFS	$28, $f0
    # 255.000000 : 1132396544

	STS	$f0, 1($0)
	RET	$28, ($29)
beq_else.17574:
	LDA	$28, -2($2)
	BNE	$28, beq_else.17585
	LDS	$f0, 1($1)
	LDAH	$28, 16000($31)
	ITOFS	$28, $f1
    # 0.250000 : 1048576000

	MULS	$f0, $f1, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_sin
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	MULS	$f0, $f0, $f0
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	MULS	$f1, $f0, $f1
	STS	$f1, 0($0)
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	SUBS	$f2, $f0, $f0
	MULS	$f1, $f0, $f0
	STS	$f0, 1($0)
	RET	$28, ($29)
beq_else.17585:
	LDA	$28, -3($2)
	BNE	$28, beq_else.17587
	LDS	$f0, 0($1)
	LDL	$2, 5($0)
	LDS	$f1, 0($2)
	SUBS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	LDL	$0, 5($0)
	LDS	$f2, 2($0)
	SUBS	$f1, $f2, $f1
	MULS	$f0, $f0, $f0
	MULS	$f1, $f1, $f1
	ADDS	$f0, $f1, $f0
	SQRTS	$f0, $f0
	LDAH	$28, 16672($31)
	ITOFS	$28, $f1
    # 10.000000 : 1092616192

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 8($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_floor
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDS	$f1, 8($30)
	SUBS	$f1, $f0, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16457($28)
	ITOFS	$28, $f1
    # 3.141593 : 1078530011

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	ADDS	$f0, $f1, $f0
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_sin
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	MULS	$f0, $f0, $f0
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	MULS	$f0, $f1, $f1
	STS	$f1, 1($0)
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f1, $f0, $f0
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	MULS	$f0, $f1, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17587:
	LDA	$28, -4($2)
	BNE	$28, beq_else.17589
	LDS	$f0, 0($1)
	LDL	$2, 5($0)
	LDS	$f1, 0($2)
	SUBS	$f0, $f1, $f0
	LDL	$2, 4($0)
	LDS	$f1, 0($2)
	SQRTS	$f1, $f1
	MULS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	LDL	$2, 5($0)
	LDS	$f2, 2($2)
	SUBS	$f1, $f2, $f1
	LDL	$2, 4($0)
	LDS	$f2, 2($2)
	SQRTS	$f2, $f2
	MULS	$f1, $f2, $f1
	MULS	$f0, $f0, $f2
	MULS	$f1, $f1, $f3
	ADDS	$f2, $f3, $f2
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.17590
	ADDS	$f0, $f31, $f3
	BR	$28, nt_fble_cont.17591
nt_fble_else.17590:
	SUBS	$f31, $f0, $f3
nt_fble_cont.17591:
	LDA	$28, -18665($31)
	LDAH	$28, 14546($28)
	ITOFS	$28, $f4
    # 0.000100 : 953267991

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.17592
	LDA	$2, 0($31)
	BR	$28, nt_fble_cont.17593
nt_fble_else.17592:
	LDA	$2, 1($31)
nt_fble_cont.17593:
	STS	$f2, 10($30)
	STL	$0, 0($30)
	STL	$1, 1($30)
	BNE	$2, beq_else.17594
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17596
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_atan
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDAH	$28, 16880($31)
	ITOFS	$28, $f1
    # 30.000000 : 1106247680

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16457($28)
	ITOFS	$28, $f1
    # 3.141593 : 1078530011

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	BR	$28, nt_fble_cont.17597
nt_fble_else.17596:
	SUBS	$f31, $f0, $f0
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_atan
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDAH	$28, 16880($31)
	ITOFS	$28, $f1
    # 30.000000 : 1106247680

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16457($28)
	ITOFS	$28, $f1
    # 3.141593 : 1078530011

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
nt_fble_cont.17597:
	BR	$28, beq_cont.17595
beq_else.17594:
	LDAH	$28, 16752($31)
	ITOFS	$28, $f0
    # 15.000000 : 1097859072

beq_cont.17595:
	STS	$f0, 12($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_floor
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 12($30)
	SUBS	$f1, $f0, $f0
	LDL	$0, 1($30)
	LDS	$f1, 1($0)
	LDL	$0, 0($30)
	LDL	$1, 5($0)
	LDS	$f2, 1($1)
	SUBS	$f1, $f2, $f1
	LDL	$0, 4($0)
	LDS	$f2, 1($0)
	SQRTS	$f2, $f2
	MULS	$f1, $f2, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	LDS	$f3, 10($30)
	CMPSLE	$f2, $f3, $f30
	FBEQ	$f30, nt_fble_else.17598
	ADDS	$f3, $f31, $f2
	BR	$28, nt_fble_cont.17599
nt_fble_else.17598:
	SUBS	$f31, $f3, $f2
nt_fble_cont.17599:
	LDA	$28, -18665($31)
	LDAH	$28, 14546($28)
	ITOFS	$28, $f4
    # 0.000100 : 953267991

	CMPSLE	$f4, $f2, $f30
	FBEQ	$f30, nt_fble_else.17600
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17601
nt_fble_else.17600:
	LDA	$0, 1($31)
nt_fble_cont.17601:
	BNE	$0, beq_else.17602
	INVS	$f3, $f30
	MULS	$f1, $f30, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.17603
	BR	$28, nt_fble_cont.17604
nt_fble_else.17603:
	SUBS	$f31, $f1, $f1
nt_fble_cont.17604:
	STS	$f0, 14($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, min_caml_atan
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	LDAH	$28, 16880($31)
	ITOFS	$28, $f1
    # 30.000000 : 1106247680

	MULS	$f0, $f1, $f0
	LDA	$28, 4059($31)
	LDAH	$28, 16457($28)
	ITOFS	$28, $f1
    # 3.141593 : 1078530011

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 16($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, min_caml_floor
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDS	$f1, 16($30)
	SUBS	$f1, $f0, $f0
	LDA	$28, -26214($31)
	LDAH	$28, 15898($28)
	ITOFS	$28, $f1
    # 0.150000 : 1041865114

	LDAH	$28, 16128($31)
	ITOFS	$28, $f2
    # 0.500000 : 1056964608

	LDS	$f3, 14($30)
	SUBS	$f2, $f3, $f2
	MULS	$f2, $f2, $f2
	SUBS	$f1, $f2, $f1
	LDAH	$28, 16128($31)
	ITOFS	$28, $f2
    # 0.500000 : 1056964608

	SUBS	$f2, $f0, $f0
	MULS	$f0, $f0, $f0
	SUBS	$f1, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17605
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	MULS	$f1, $f0, $f0
	LDA	$28, -26214($31)
	LDAH	$28, 16026($28)
	ITOFS	$28, $f1
    # 0.300000 : 1050253722

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
ble_else.17605:
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17602:
	LDAH	$28, 16752($31)
	ITOFS	$28, $f1
    # 15.000000 : 1097859072

	STS	$f0, 14($30)
	STS	$f1, 16($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, min_caml_floor
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDS	$f1, 16($30)
	SUBS	$f1, $f0, $f0
	LDA	$28, -26214($31)
	LDAH	$28, 15898($28)
	ITOFS	$28, $f1
    # 0.150000 : 1041865114

	LDAH	$28, 16128($31)
	ITOFS	$28, $f2
    # 0.500000 : 1056964608

	LDS	$f3, 14($30)
	SUBS	$f2, $f3, $f2
	MULS	$f2, $f2, $f2
	SUBS	$f1, $f2, $f1
	LDAH	$28, 16128($31)
	ITOFS	$28, $f2
    # 0.500000 : 1056964608

	SUBS	$f2, $f0, $f0
	MULS	$f0, $f0, $f0
	SUBS	$f1, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17608
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f1
    # 255.000000 : 1132396544

	MULS	$f1, $f0, $f0
	LDA	$28, -26214($31)
	LDAH	$28, 16026($28)
	ITOFS	$28, $f1
    # 0.300000 : 1050253722

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
ble_else.17608:
	MOV	$0, min_caml_texture_color
	LDL	$0, 0($0)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17589:
	RET	$28, ($29)
add_light.3518:
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f3, $f30
	FBEQ	$f30, nt_fble_else.17612
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17613
nt_fble_else.17612:
	LDA	$0, 1($31)
nt_fble_cont.17613:
	BNE	$0, beq_else.17614
	BR	$28, beq_cont.17615
beq_else.17614:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_texture_color
	LDL	$1, 0($1)
	LDS	$f3, 0($0)
	LDS	$f4, 0($1)
	MULS	$f0, $f4, $f4
	ADDS	$f3, $f4, $f3
	STS	$f3, 0($0)
	LDS	$f3, 1($0)
	LDS	$f4, 1($1)
	MULS	$f0, $f4, $f4
	ADDS	$f3, $f4, $f3
	STS	$f3, 1($0)
	LDS	$f3, 2($0)
	LDS	$f4, 2($1)
	MULS	$f0, $f4, $f0
	ADDS	$f3, $f0, $f0
	STS	$f0, 2($0)
beq_cont.17615:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17616
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17617
nt_fble_else.17616:
	LDA	$0, 1($31)
nt_fble_cont.17617:
	BNE	$0, beq_else.17618
	RET	$28, ($29)
beq_else.17618:
	MULS	$f1, $f1, $f0
	MULS	$f0, $f0, $f0
	MULS	$f0, $f2, $f0
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	ADDS	$f1, $f0, $f1
	STS	$f1, 0($0)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 1($1)
	ADDS	$f1, $f0, $f1
	STS	$f1, 1($0)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 2($1)
	ADDS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
trace_reflections.3522:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17621
	MOV	$2, min_caml_reflections
	LDL	$2, 0($2)
	ADDL	$2, $0, $28
	LDL	$2, 0($28)
	LDL	$3, 1($2)
	MOV	$4, min_caml_tmin
	LDL	$4, 0($4)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f2
    # 1000000000.000000 : 1315859240

	STS	$f2, 0($4)
	LDA	$4, 0($31)
	MOV	$5, min_caml_or_net
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	STL	$0, 0($30)
	STS	$f1, 2($30)
	STL	$1, 4($30)
	STS	$f0, 6($30)
	STL	$3, 8($30)
	STL	$2, 9($30)
	LDA	$2, 0($3)
	LDA	$1, 0($5)
	LDA	$0, 0($4)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, trace_or_matrix_fast.3500
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17624
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17625
nt_fble_else.17624:
	LDA	$0, 1($31)
nt_fble_cont.17625:
	BNE	$0, beq_else.17626
	LDA	$0, 0($31)
	BR	$28, beq_cont.17627
beq_else.17626:
	LDA	$28, -17376($31)
	LDAH	$28, 19647($28)
	ITOFS	$28, $f1
    # 100000000.000000 : 1287568416

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17628
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17629
nt_fble_else.17628:
	LDA	$0, 1($31)
nt_fble_cont.17629:
beq_cont.17627:
	BNE	$0, beq_else.17630
	BR	$28, beq_cont.17631
beq_else.17630:
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	SLL	$0, 2, $0
	MOV	$1, min_caml_intsec_rectside
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	ADDL	$0, $1, $0
	LDL	$1, 9($30)
	LDL	$2, 0($1)
	SUBL	$0, $2, $28
	BNE	$28, beq_else.17632
	LDA	$0, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDA	$1, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, shadow_check_one_or_matrix.3475
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.17634
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	LDL	$1, 8($30)
	LDL	$2, 0($1)
	LDS	$f0, 0($0)
	LDS	$f1, 0($2)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($0)
	LDS	$f2, 1($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	LDS	$f2, 2($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDL	$0, 9($30)
	LDS	$f1, 2($0)
	LDS	$f2, 6($30)
	MULS	$f1, $f2, $f3
	MULS	$f3, $f0, $f0
	LDL	$0, 0($1)
	LDL	$1, 4($30)
	LDS	$f3, 0($1)
	LDS	$f4, 0($0)
	MULS	$f3, $f4, $f3
	LDS	$f4, 1($1)
	LDS	$f5, 1($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	LDS	$f4, 2($1)
	LDS	$f5, 2($0)
	MULS	$f4, $f5, $f4
	ADDS	$f3, $f4, $f3
	MULS	$f1, $f3, $f1
	LDS	$f3, 2($30)
	ADDS	$f3, $f31, $f2
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, add_light.3518
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BR	$28, beq_cont.17635
beq_else.17634:
beq_cont.17635:
	BR	$28, beq_cont.17633
beq_else.17632:
beq_cont.17633:
beq_cont.17631:
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDS	$f0, 6($30)
	LDS	$f1, 2($30)
	LDL	$1, 4($30)
	BR	$28, trace_reflections.3522
bge_else.17621:
	RET	$28, ($29)
trace_ray.3527:
	CMPLE	$0, 4, $28
	BEQ	$28, ble_else.17637
	LDL	$3, 2($2)
	MOV	$4, min_caml_tmin
	LDL	$4, 0($4)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f2
    # 1000000000.000000 : 1315859240

	STS	$f2, 0($4)
	LDA	$4, 0($31)
	MOV	$5, min_caml_or_net
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	STS	$f1, 0($30)
	STL	$2, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	STL	$3, 8($30)
	LDA	$2, 0($1)
	LDA	$0, 0($4)
	LDA	$1, 0($5)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, trace_or_matrix.3486
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17639
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17640
nt_fble_else.17639:
	LDA	$0, 1($31)
nt_fble_cont.17640:
	BNE	$0, beq_else.17641
	LDA	$0, 0($31)
	BR	$28, beq_cont.17642
beq_else.17641:
	LDA	$28, -17376($31)
	LDAH	$28, 19647($28)
	ITOFS	$28, $f1
    # 100000000.000000 : 1287568416

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17643
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17644
nt_fble_else.17643:
	LDA	$0, 1($31)
nt_fble_cont.17644:
beq_cont.17642:
	BNE	$0, beq_else.17645
	LDA	$0, -1($31)
	LDL	$1, 7($30)
	LDL	$2, 8($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	BNE	$1, beq_else.17646
	RET	$28, ($29)
beq_else.17646:
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDL	$1, 6($30)
	LDS	$f0, 0($1)
	LDS	$f1, 0($0)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($1)
	LDS	$f2, 1($0)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	LDS	$f2, 2($0)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	SUBS	$f31, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17648
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17649
nt_fble_else.17648:
	LDA	$0, 1($31)
nt_fble_cont.17649:
	BNE	$0, beq_else.17650
	RET	$28, ($29)
beq_else.17650:
	MULS	$f0, $f0, $f1
	MULS	$f1, $f0, $f0
	LDS	$f1, 4($30)
	MULS	$f0, $f1, $f0
	MOV	$0, min_caml_beam
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	MULS	$f0, $f1, $f0
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	ADDS	$f1, $f0, $f1
	STS	$f1, 0($0)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 1($1)
	ADDS	$f1, $f0, $f1
	STS	$f1, 1($0)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDS	$f1, 2($1)
	ADDS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17645:
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 2($1)
	LDL	$3, 7($1)
	LDS	$f0, 0($3)
	LDS	$f1, 4($30)
	MULS	$f0, $f1, $f0
	LDL	$3, 1($1)
	STL	$2, 9($30)
	STS	$f0, 10($30)
	STL	$0, 12($30)
	STL	$1, 13($30)
	LDA	$28, -1($3)
	BNE	$28, beq_else.17653
	MOV	$3, min_caml_intsec_rectside
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	MOV	$4, min_caml_nvector
	LDL	$4, 0($4)
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	STS	$f2, 0($4)
	STS	$f2, 1($4)
	STS	$f2, 2($4)
	MOV	$4, min_caml_nvector
	LDL	$4, 0($4)
	LDA	$5, -1($3)
	LDA	$3, -1($3)
	LDL	$6, 6($30)
	ADDL	$6, $3, $28
	LDS	$f2, 0($28)
	FBNE	$f2, nt_fbeq_else.17655
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	ADDL	$4, $5, $28
	STS	$f2, 0($28)
	BR	$28, nt_fbeq_cont.17656
nt_fbeq_else.17655:
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f3, $f30
	FBEQ	$f30, nt_fble_else.17657
	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	ADDL	$4, $5, $28
	STS	$f2, 0($28)
	BR	$28, nt_fble_cont.17658
nt_fble_else.17657:
	LDAH	$28, -16512($31)
	ITOFS	$28, $f2
    # -1.000000 : -1082130432

	ADDL	$4, $5, $28
	STS	$f2, 0($28)
nt_fble_cont.17658:
nt_fbeq_cont.17656:
	BR	$28, beq_cont.17654
beq_else.17653:
	LDA	$28, -2($3)
	BNE	$28, beq_else.17659
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDL	$4, 4($1)
	LDS	$f2, 0($4)
	SUBS	$f31, $f2, $f2
	STS	$f2, 0($3)
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDL	$4, 4($1)
	LDS	$f2, 1($4)
	SUBS	$f31, $f2, $f2
	STS	$f2, 1($3)
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDL	$4, 4($1)
	LDS	$f2, 2($4)
	SUBS	$f31, $f2, $f2
	STS	$f2, 2($3)
	BR	$28, beq_cont.17660
beq_else.17659:
	LDA	$0, 0($1)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, get_nvector_second.3510
	LDA	$30, -15($30)
	LDL	$29, 14($30)
beq_cont.17660:
beq_cont.17654:
	MOV	$0, min_caml_startp
	LDL	$0, 0($0)
	MOV	$1, min_caml_intersection_point
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	STS	$f0, 0($0)
	LDS	$f0, 1($1)
	STS	$f0, 1($0)
	LDS	$f0, 2($1)
	STS	$f0, 2($0)
	MOV	$0, min_caml_intersection_point
	LDL	$1, 0($0)
	LDL	$0, 13($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, utexture.3515
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$0, 12($30)
	SLL	$0, 2, $0
	MOV	$1, min_caml_intsec_rectside
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	ADDL	$0, $1, $0
	LDL	$1, 7($30)
	LDL	$2, 8($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDL	$0, 2($30)
	LDL	$3, 1($0)
	ADDL	$3, $1, $28
	LDL	$3, 0($28)
	MOV	$4, min_caml_intersection_point
	LDL	$4, 0($4)
	LDS	$f0, 0($4)
	STS	$f0, 0($3)
	LDS	$f0, 1($4)
	STS	$f0, 1($3)
	LDS	$f0, 2($4)
	STS	$f0, 2($3)
	LDL	$3, 3($0)
	LDL	$4, 13($30)
	LDL	$5, 7($4)
	LDS	$f0, 0($5)
	LDAH	$28, 16128($31)
	ITOFS	$28, $f1
    # 0.500000 : 1056964608

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17661
	LDA	$5, 0($31)
	BR	$28, nt_fble_cont.17662
nt_fble_else.17661:
	LDA	$5, 1($31)
nt_fble_cont.17662:
	BNE	$5, beq_else.17663
	LDA	$5, 1($31)
	ADDL	$3, $1, $28
	STL	$5, 0($28)
	LDL	$3, 4($0)
	ADDL	$3, $1, $28
	LDL	$5, 0($28)
	MOV	$6, min_caml_texture_color
	LDL	$6, 0($6)
	LDS	$f0, 0($6)
	STS	$f0, 0($5)
	LDS	$f0, 1($6)
	STS	$f0, 1($5)
	LDS	$f0, 2($6)
	STS	$f0, 2($5)
	ADDL	$3, $1, $28
	LDL	$3, 0($28)
	LDAH	$28, 15232($31)
	ITOFS	$28, $f0
    # 0.003906 : 998244352

	LDS	$f1, 10($30)
	MULS	$f0, $f1, $f0
	LDS	$f2, 0($3)
	MULS	$f2, $f0, $f2
	STS	$f2, 0($3)
	LDS	$f2, 1($3)
	MULS	$f2, $f0, $f2
	STS	$f2, 1($3)
	LDS	$f2, 2($3)
	MULS	$f2, $f0, $f0
	STS	$f0, 2($3)
	LDL	$3, 7($0)
	ADDL	$3, $1, $28
	LDL	$3, 0($28)
	MOV	$5, min_caml_nvector
	LDL	$5, 0($5)
	LDS	$f0, 0($5)
	STS	$f0, 0($3)
	LDS	$f0, 1($5)
	STS	$f0, 1($3)
	LDS	$f0, 2($5)
	STS	$f0, 2($3)
	BR	$28, beq_cont.17664
beq_else.17663:
	LDA	$5, 0($31)
	ADDL	$3, $1, $28
	STL	$5, 0($28)
beq_cont.17664:
	LDAH	$28, -16384($31)
	ITOFS	$28, $f0
    # -2.000000 : -1073741824

	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDL	$5, 6($30)
	LDS	$f1, 0($5)
	LDS	$f2, 0($3)
	MULS	$f1, $f2, $f1
	LDS	$f2, 1($5)
	LDS	$f3, 1($3)
	MULS	$f2, $f3, $f2
	ADDS	$f1, $f2, $f1
	LDS	$f2, 2($5)
	LDS	$f3, 2($3)
	MULS	$f2, $f3, $f2
	ADDS	$f1, $f2, $f1
	MULS	$f0, $f1, $f0
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDS	$f1, 0($5)
	LDS	$f2, 0($3)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 0($5)
	LDS	$f1, 1($5)
	LDS	$f2, 1($3)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 1($5)
	LDS	$f1, 2($5)
	LDS	$f2, 2($3)
	MULS	$f0, $f2, $f0
	ADDS	$f1, $f0, $f0
	STS	$f0, 2($5)
	LDL	$3, 7($4)
	LDS	$f0, 1($3)
	LDS	$f1, 4($30)
	MULS	$f1, $f0, $f0
	LDA	$3, 0($31)
	MOV	$6, min_caml_or_net
	LDL	$6, 0($6)
	LDL	$6, 0($6)
	STS	$f0, 14($30)
	LDA	$1, 0($6)
	LDA	$0, 0($3)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, shadow_check_one_or_matrix.3475
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	BNE	$0, beq_else.17665
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f0, 0($0)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($0)
	LDS	$f2, 1($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	LDS	$f2, 2($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	SUBS	$f31, $f0, $f0
	LDS	$f1, 10($30)
	MULS	$f0, $f1, $f0
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDL	$1, 6($30)
	LDS	$f2, 0($1)
	LDS	$f3, 0($0)
	MULS	$f2, $f3, $f2
	LDS	$f3, 1($1)
	LDS	$f4, 1($0)
	MULS	$f3, $f4, $f3
	ADDS	$f2, $f3, $f2
	LDS	$f3, 2($1)
	LDS	$f4, 2($0)
	MULS	$f3, $f4, $f3
	ADDS	$f2, $f3, $f2
	SUBS	$f31, $f2, $f2
	LDS	$f3, 14($30)
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, add_light.3518
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	BR	$28, beq_cont.17666
beq_else.17665:
beq_cont.17666:
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDS	$f0, 0($0)
	STS	$f0, 0($1)
	LDS	$f0, 1($0)
	STS	$f0, 1($1)
	LDS	$f0, 2($0)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$0, -1($0)
	LDS	$f0, 10($30)
	LDS	$f1, 14($30)
	LDL	$1, 6($30)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, trace_reflections.3522
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f0
    # 0.100000 : 1036831949

	LDS	$f1, 4($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17667
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17668
nt_fble_else.17667:
	LDA	$0, 1($31)
nt_fble_cont.17668:
	BNE	$0, beq_else.17669
	RET	$28, ($29)
beq_else.17669:
	LDL	$0, 7($30)
	CMPLT	$0, 4, $28
	BNE	$28, bge_else.17671
	LDL	$1, 9($30)
	LDA	$28, -2($1)
	BNE	$28, beq_else.17672
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$1, 13($30)
	LDL	$1, 7($1)
	LDS	$f2, 0($1)
	SUBS	$f0, $f2, $f0
	MULS	$f1, $f0, $f0
	LDA	$0, 1($0)
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	LDS	$f2, 0($30)
	ADDS	$f2, $f1, $f1
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	BR	$28, trace_ray.3527
beq_else.17672:
	RET	$28, ($29)
bge_else.17671:
	LDA	$1, 1($0)
	LDA	$2, -1($31)
	LDL	$3, 8($30)
	ADDL	$3, $1, $28
	STL	$2, 0($28)
	LDL	$1, 9($30)
	LDA	$28, -2($1)
	BNE	$28, beq_else.17674
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$1, 13($30)
	LDL	$1, 7($1)
	LDS	$f2, 0($1)
	SUBS	$f0, $f2, $f0
	MULS	$f1, $f0, $f0
	LDA	$0, 1($0)
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	LDS	$f2, 0($30)
	ADDS	$f2, $f1, $f1
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	BR	$28, trace_ray.3527
beq_else.17674:
	RET	$28, ($29)
ble_else.17637:
	RET	$28, ($29)
trace_diffuse_ray.3533:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f1
    # 1000000000.000000 : 1315859240

	STS	$f1, 0($1)
	LDA	$1, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	STS	$f0, 0($30)
	STL	$0, 2($30)
	LDA	$28, 0($2)
	LDA	$2, 0($0)
	LDA	$0, 0($1)
	LDA	$1, 0($28)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, trace_or_matrix_fast.3500
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17677
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17678
nt_fble_else.17677:
	LDA	$0, 1($31)
nt_fble_cont.17678:
	BNE	$0, beq_else.17679
	LDA	$0, 0($31)
	BR	$28, beq_cont.17680
beq_else.17679:
	LDA	$28, -17376($31)
	LDAH	$28, 19647($28)
	ITOFS	$28, $f1
    # 100000000.000000 : 1287568416

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17681
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17682
nt_fble_else.17681:
	LDA	$0, 1($31)
nt_fble_cont.17682:
beq_cont.17680:
	BNE	$0, beq_else.17683
	RET	$28, ($29)
beq_else.17683:
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	MOV	$1, min_caml_intersected_object_id
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$1, 2($30)
	LDL	$1, 0($1)
	LDL	$2, 1($0)
	STL	$0, 3($30)
	LDA	$28, -1($2)
	BNE	$28, beq_else.17685
	MOV	$2, min_caml_intsec_rectside
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($3)
	STS	$f0, 1($3)
	STS	$f0, 2($3)
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDA	$4, -1($2)
	LDA	$2, -1($2)
	ADDL	$1, $2, $28
	LDS	$f0, 0($28)
	FBNE	$f0, nt_fbeq_else.17687
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	ADDL	$3, $4, $28
	STS	$f0, 0($28)
	BR	$28, nt_fbeq_cont.17688
nt_fbeq_else.17687:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17689
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	ADDL	$3, $4, $28
	STS	$f0, 0($28)
	BR	$28, nt_fble_cont.17690
nt_fble_else.17689:
	LDAH	$28, -16512($31)
	ITOFS	$28, $f0
    # -1.000000 : -1082130432

	ADDL	$3, $4, $28
	STS	$f0, 0($28)
nt_fble_cont.17690:
nt_fbeq_cont.17688:
	BR	$28, beq_cont.17686
beq_else.17685:
	LDA	$28, -2($2)
	BNE	$28, beq_else.17691
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 4($0)
	LDS	$f0, 0($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 0($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 4($0)
	LDS	$f0, 1($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 1($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$2, 4($0)
	LDS	$f0, 2($2)
	SUBS	$f31, $f0, $f0
	STS	$f0, 2($1)
	BR	$28, beq_cont.17692
beq_else.17691:
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, get_nvector_second.3510
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.17692:
beq_cont.17686:
	MOV	$0, min_caml_intersection_point
	LDL	$1, 0($0)
	LDL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, utexture.3515
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$0, 0($31)
	MOV	$1, min_caml_or_net
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, shadow_check_one_or_matrix.3475
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.17693
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f0, 0($0)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($0)
	LDS	$f2, 1($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	LDS	$f2, 2($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	SUBS	$f31, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.17694
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.17695
nt_fble_else.17694:
	LDA	$0, 1($31)
nt_fble_cont.17695:
	BNE	$0, beq_else.17696
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDS	$f1, 0($30)
	MULS	$f1, $f0, $f0
	LDL	$1, 3($30)
	LDL	$1, 7($1)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f0
	MOV	$1, min_caml_texture_color
	LDL	$1, 0($1)
	LDS	$f1, 0($0)
	LDS	$f2, 0($1)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 0($0)
	LDS	$f1, 1($0)
	LDS	$f2, 1($1)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 1($0)
	LDS	$f1, 2($0)
	LDS	$f2, 2($1)
	MULS	$f0, $f2, $f0
	ADDS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17696:
	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDS	$f1, 0($30)
	MULS	$f1, $f0, $f0
	LDL	$1, 3($30)
	LDL	$1, 7($1)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f0
	MOV	$1, min_caml_texture_color
	LDL	$1, 0($1)
	LDS	$f1, 0($0)
	LDS	$f2, 0($1)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 0($0)
	LDS	$f1, 1($0)
	LDS	$f2, 1($1)
	MULS	$f0, $f2, $f2
	ADDS	$f1, $f2, $f1
	STS	$f1, 1($0)
	LDS	$f1, 2($0)
	LDS	$f2, 2($1)
	MULS	$f0, $f2, $f0
	ADDS	$f1, $f0, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
beq_else.17693:
	RET	$28, ($29)
iter_trace_diffuse_rays.3536:
	CMPLT	$3, 0, $28
	BNE	$28, bge_else.17700
	ADDL	$0, $3, $28
	LDL	$4, 0($28)
	LDL	$4, 0($4)
	LDS	$f0, 0($4)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($4)
	LDS	$f2, 1($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($4)
	LDS	$f2, 2($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.17701
	LDA	$4, 0($31)
	BR	$28, nt_fble_cont.17702
nt_fble_else.17701:
	LDA	$4, 1($31)
nt_fble_cont.17702:
	BNE	$4, beq_else.17703
	ADDL	$0, $3, $28
	LDL	$4, 0($28)
	LDAH	$28, 17174($31)
	ITOFS	$28, $f1
    # 150.000000 : 1125515264

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$0, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$0, -2($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17704
	LDL	$1, 2($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	LDS	$f0, 0($2)
	LDL	$3, 1($30)
	LDS	$f1, 0($3)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($2)
	LDS	$f2, 1($3)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($2)
	LDS	$f2, 2($3)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17705
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDAH	$28, 17174($31)
	ITOFS	$28, $f1
    # 150.000000 : 1125515264

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$0, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$3, -2($0)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
ble_else.17705:
	LDA	$2, 1($0)
	ADDL	$1, $2, $28
	LDL	$2, 0($28)
	LDAH	$28, -15594($31)
	ITOFS	$28, $f1
    # -150.000000 : -1021968384

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$0, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$3, -2($0)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
bge_else.17704:
	RET	$28, ($29)
beq_else.17703:
	LDA	$4, 1($3)
	ADDL	$0, $4, $28
	LDL	$4, 0($28)
	LDAH	$28, -15594($31)
	ITOFS	$28, $f1
    # -150.000000 : -1021968384

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 3($30)
	LDA	$0, -2($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17707
	LDL	$1, 2($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	LDS	$f0, 0($2)
	LDL	$3, 1($30)
	LDS	$f1, 0($3)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($2)
	LDS	$f2, 1($3)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($2)
	LDS	$f2, 2($3)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17708
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDAH	$28, 17174($31)
	ITOFS	$28, $f1
    # 150.000000 : 1125515264

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$0, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$3, -2($0)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
ble_else.17708:
	LDA	$2, 1($0)
	ADDL	$1, $2, $28
	LDL	$2, 0($28)
	LDAH	$28, -15594($31)
	ITOFS	$28, $f1
    # -150.000000 : -1021968384

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STL	$0, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$3, -2($0)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
bge_else.17707:
	RET	$28, ($29)
bge_else.17700:
	RET	$28, ($29)
trace_diffuse_rays.3541:
	MOV	$3, min_caml_startp_fast
	LDL	$3, 0($3)
	LDS	$f0, 0($2)
	STS	$f0, 0($3)
	LDS	$f0, 1($2)
	STS	$f0, 1($3)
	LDS	$f0, 2($2)
	STS	$f0, 2($3)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDL	$1, 118($0)
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	LDL	$2, 1($30)
	LDS	$f1, 0($2)
	MULS	$f0, $f1, $f0
	LDS	$f1, 1($1)
	LDS	$f2, 1($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($1)
	LDS	$f2, 2($2)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.17711
	LDL	$1, 118($0)
	LDAH	$28, 17174($31)
	ITOFS	$28, $f1
    # 150.000000 : 1125515264

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDA	$0, 0($1)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$3, 116($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
ble_else.17711:
	LDL	$1, 119($0)
	LDAH	$28, -15594($31)
	ITOFS	$28, $f1
    # -150.000000 : -1021968384

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDA	$0, 0($1)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, trace_diffuse_ray.3533
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$3, 116($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
trace_diffuse_ray_80percent.3545:
	BNE	$0, beq_else.17712
	LDA	$28, -1($0)
	BNE	$28, beq_else.17713
	LDA	$28, -2($0)
	BNE	$28, beq_else.17714
	LDA	$28, -3($0)
	BNE	$28, beq_else.17715
	LDA	$28, -4($0)
	BNE	$28, beq_else.17716
	RET	$28, ($29)
beq_else.17716:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$3, min_caml_startp_fast
	LDL	$3, 0($3)
	LDS	$f0, 0($2)
	STS	$f0, 0($3)
	LDS	$f0, 1($2)
	STS	$f0, 1($3)
	LDS	$f0, 2($2)
	STS	$f0, 2($3)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17715:
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$3, 3($3)
	STL	$1, 1($30)
	STL	$2, 0($30)
	STL	$0, 3($30)
	LDA	$0, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17718
	RET	$28, ($29)
beq_else.17718:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17714:
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$3, 2($3)
	STL	$1, 1($30)
	STL	$2, 0($30)
	STL	$0, 3($30)
	LDA	$0, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.17720
	LDA	$28, -4($0)
	BNE	$28, beq_else.17721
	RET	$28, ($29)
beq_else.17721:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17720:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17723
	RET	$28, ($29)
beq_else.17723:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17713:
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$3, 1($3)
	STL	$1, 1($30)
	STL	$2, 0($30)
	STL	$0, 3($30)
	LDA	$0, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -2($0)
	BNE	$28, beq_else.17725
	LDA	$28, -3($0)
	BNE	$28, beq_else.17726
	LDA	$28, -4($0)
	BNE	$28, beq_else.17727
	RET	$28, ($29)
beq_else.17727:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17726:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17729
	RET	$28, ($29)
beq_else.17729:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17725:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 2($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.17731
	LDA	$28, -4($0)
	BNE	$28, beq_else.17732
	RET	$28, ($29)
beq_else.17732:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17731:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17734
	RET	$28, ($29)
beq_else.17734:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17712:
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	STL	$1, 1($30)
	STL	$2, 0($30)
	STL	$0, 3($30)
	LDA	$0, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -1($0)
	BNE	$28, beq_else.17736
	LDA	$28, -2($0)
	BNE	$28, beq_else.17737
	LDA	$28, -3($0)
	BNE	$28, beq_else.17738
	LDA	$28, -4($0)
	BNE	$28, beq_else.17739
	RET	$28, ($29)
beq_else.17739:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17738:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17741
	RET	$28, ($29)
beq_else.17741:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17737:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 2($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.17743
	LDA	$28, -4($0)
	BNE	$28, beq_else.17744
	RET	$28, ($29)
beq_else.17744:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17743:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17746
	RET	$28, ($29)
beq_else.17746:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17736:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 1($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -2($0)
	BNE	$28, beq_else.17748
	LDA	$28, -3($0)
	BNE	$28, beq_else.17749
	LDA	$28, -4($0)
	BNE	$28, beq_else.17750
	RET	$28, ($29)
beq_else.17750:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17749:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17752
	RET	$28, ($29)
beq_else.17752:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17748:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 2($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.17754
	LDA	$28, -4($0)
	BNE	$28, beq_else.17755
	RET	$28, ($29)
beq_else.17755:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
beq_else.17754:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	LDL	$3, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.17757
	RET	$28, ($29)
beq_else.17757:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$0, 2($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp_constants.3438
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 2($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3536
calc_diffuse_using_1point.3549:
	LDL	$2, 5($0)
	LDL	$3, 7($0)
	LDL	$4, 1($0)
	LDL	$5, 4($0)
	MOV	$6, min_caml_diffuse_ray
	LDL	$6, 0($6)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDS	$f0, 0($2)
	STS	$f0, 0($6)
	LDS	$f0, 1($2)
	STS	$f0, 1($6)
	LDS	$f0, 2($2)
	STS	$f0, 2($6)
	LDL	$0, 6($0)
	LDL	$0, 0($0)
	ADDL	$3, $1, $28
	LDL	$2, 0($28)
	ADDL	$4, $1, $28
	LDL	$3, 0($28)
	STL	$1, 0($30)
	STL	$5, 1($30)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, trace_diffuse_ray_80percent.3545
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	MOV	$2, min_caml_diffuse_ray
	LDL	$2, 0($2)
	BR	$28, vecaccumv.3242
calc_diffuse_using_5points.3552:
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$1, 5($1)
	LDA	$5, -1($0)
	ADDL	$2, $5, $28
	LDL	$5, 0($28)
	LDL	$5, 5($5)
	ADDL	$2, $0, $28
	LDL	$6, 0($28)
	LDL	$6, 5($6)
	LDA	$7, 1($0)
	ADDL	$2, $7, $28
	LDL	$7, 0($28)
	LDL	$7, 5($7)
	ADDL	$3, $0, $28
	LDL	$3, 0($28)
	LDL	$3, 5($3)
	MOV	$8, min_caml_diffuse_ray
	LDL	$8, 0($8)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	LDS	$f0, 0($1)
	STS	$f0, 0($8)
	LDS	$f0, 1($1)
	STS	$f0, 1($8)
	LDS	$f0, 2($1)
	STS	$f0, 2($8)
	MOV	$1, min_caml_diffuse_ray
	LDL	$1, 0($1)
	ADDL	$5, $4, $28
	LDL	$5, 0($28)
	LDS	$f0, 0($1)
	LDS	$f1, 0($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($1)
	LDS	$f0, 1($1)
	LDS	$f1, 1($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($1)
	LDS	$f0, 2($1)
	LDS	$f1, 2($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($1)
	MOV	$1, min_caml_diffuse_ray
	LDL	$1, 0($1)
	ADDL	$6, $4, $28
	LDL	$5, 0($28)
	LDS	$f0, 0($1)
	LDS	$f1, 0($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($1)
	LDS	$f0, 1($1)
	LDS	$f1, 1($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($1)
	LDS	$f0, 2($1)
	LDS	$f1, 2($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($1)
	MOV	$1, min_caml_diffuse_ray
	LDL	$1, 0($1)
	ADDL	$7, $4, $28
	LDL	$5, 0($28)
	LDS	$f0, 0($1)
	LDS	$f1, 0($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($1)
	LDS	$f0, 1($1)
	LDS	$f1, 1($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($1)
	LDS	$f0, 2($1)
	LDS	$f1, 2($5)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($1)
	MOV	$1, min_caml_diffuse_ray
	LDL	$1, 0($1)
	ADDL	$3, $4, $28
	LDL	$3, 0($28)
	LDS	$f0, 0($1)
	LDS	$f1, 0($3)
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($1)
	LDS	$f0, 1($1)
	LDS	$f1, 1($3)
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($1)
	LDS	$f0, 2($1)
	LDS	$f1, 2($3)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($1)
	ADDL	$2, $0, $28
	LDL	$0, 0($28)
	LDL	$0, 4($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	ADDL	$0, $4, $28
	LDL	$0, 0($28)
	MOV	$2, min_caml_diffuse_ray
	LDL	$2, 0($2)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	BR	$28, vecaccumv.3242
do_without_neighbors.3558:
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.17759
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.17760
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	BNE	$2, beq_else.17761
	LDA	$1, 1($1)
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.17762
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.17763
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	BNE	$2, beq_else.17764
	LDA	$1, 1($1)
	BR	$28, do_without_neighbors.3558
beq_else.17764:
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, calc_diffuse_using_1point.3549
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDA	$1, 1($0)
	LDL	$0, 0($30)
	BR	$28, do_without_neighbors.3558
bge_else.17763:
	RET	$28, ($29)
ble_else.17762:
	RET	$28, ($29)
beq_else.17761:
	STL	$0, 0($30)
	STL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, calc_diffuse_using_1point.3549
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDA	$1, 1($0)
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.17767
	LDL	$0, 0($30)
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.17768
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	BNE	$2, beq_else.17769
	LDA	$1, 1($1)
	BR	$28, do_without_neighbors.3558
beq_else.17769:
	STL	$1, 1($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, calc_diffuse_using_1point.3549
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 1($30)
	LDA	$1, 1($0)
	LDL	$0, 0($30)
	BR	$28, do_without_neighbors.3558
bge_else.17768:
	RET	$28, ($29)
ble_else.17767:
	RET	$28, ($29)
bge_else.17760:
	RET	$28, ($29)
ble_else.17759:
	RET	$28, ($29)
try_exploit_neighbors.3574:
	ADDL	$3, $0, $28
	LDL	$6, 0($28)
	CMPLE	$5, 4, $28
	BEQ	$28, ble_else.17774
	LDL	$7, 2($6)
	ADDL	$7, $5, $28
	LDL	$7, 0($28)
	CMPLT	$7, 0, $28
	BNE	$28, bge_else.17775
	ADDL	$3, $0, $28
	LDL	$7, 0($28)
	LDL	$7, 2($7)
	ADDL	$7, $5, $28
	LDL	$7, 0($28)
	ADDL	$2, $0, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17776
	ADDL	$4, $0, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17778
	LDA	$8, -1($0)
	ADDL	$3, $8, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17780
	LDA	$8, 1($0)
	ADDL	$3, $8, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17782
	LDA	$7, 1($31)
	BR	$28, beq_cont.17783
beq_else.17782:
	LDA	$7, 0($31)
beq_cont.17783:
	BR	$28, beq_cont.17781
beq_else.17780:
	LDA	$7, 0($31)
beq_cont.17781:
	BR	$28, beq_cont.17779
beq_else.17778:
	LDA	$7, 0($31)
beq_cont.17779:
	BR	$28, beq_cont.17777
beq_else.17776:
	LDA	$7, 0($31)
beq_cont.17777:
	BNE	$7, beq_else.17784
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	CMPLE	$5, 4, $28
	BEQ	$28, ble_else.17785
	LDL	$1, 2($0)
	ADDL	$1, $5, $28
	LDL	$1, 0($28)
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.17786
	LDL	$1, 3($0)
	ADDL	$1, $5, $28
	LDL	$1, 0($28)
	BNE	$1, beq_else.17787
	LDA	$1, 1($5)
	BR	$28, do_without_neighbors.3558
beq_else.17787:
	STL	$0, 0($30)
	STL	$5, 1($30)
	LDA	$1, 0($5)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, calc_diffuse_using_1point.3549
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDA	$1, 1($0)
	LDL	$0, 0($30)
	BR	$28, do_without_neighbors.3558
bge_else.17786:
	RET	$28, ($29)
ble_else.17785:
	RET	$28, ($29)
beq_else.17784:
	LDL	$6, 3($6)
	ADDL	$6, $5, $28
	LDL	$6, 0($28)
	BNE	$6, beq_else.17790
	LDA	$5, 1($5)
	ADDL	$3, $0, $28
	LDL	$6, 0($28)
	CMPLE	$5, 4, $28
	BEQ	$28, ble_else.17791
	LDL	$7, 2($6)
	ADDL	$7, $5, $28
	LDL	$7, 0($28)
	CMPLT	$7, 0, $28
	BNE	$28, bge_else.17792
	ADDL	$3, $0, $28
	LDL	$7, 0($28)
	LDL	$7, 2($7)
	ADDL	$7, $5, $28
	LDL	$7, 0($28)
	ADDL	$2, $0, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17793
	ADDL	$4, $0, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17794
	LDA	$8, -1($0)
	ADDL	$3, $8, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17795
	LDA	$8, 1($0)
	ADDL	$3, $8, $28
	LDL	$8, 0($28)
	LDL	$8, 2($8)
	ADDL	$8, $5, $28
	LDL	$8, 0($28)
	SUBL	$8, $7, $28
	BNE	$28, beq_else.17796
	LDL	$6, 3($6)
	ADDL	$6, $5, $28
	LDL	$6, 0($28)
	BNE	$6, beq_else.17797
	LDA	$5, 1($5)
	BR	$28, try_exploit_neighbors.3574
beq_else.17797:
	STL	$4, 2($30)
	STL	$3, 3($30)
	STL	$2, 4($30)
	STL	$1, 5($30)
	STL	$0, 6($30)
	STL	$5, 7($30)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, calc_diffuse_using_5points.3552
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$5, 1($0)
	LDL	$0, 6($30)
	LDL	$1, 5($30)
	LDL	$2, 4($30)
	LDL	$3, 3($30)
	LDL	$4, 2($30)
	BR	$28, try_exploit_neighbors.3574
beq_else.17796:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($5)
	BR	$28, do_without_neighbors.3558
beq_else.17795:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($5)
	BR	$28, do_without_neighbors.3558
beq_else.17794:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($5)
	BR	$28, do_without_neighbors.3558
beq_else.17793:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($5)
	BR	$28, do_without_neighbors.3558
bge_else.17792:
	RET	$28, ($29)
ble_else.17791:
	RET	$28, ($29)
beq_else.17790:
	STL	$1, 5($30)
	STL	$4, 2($30)
	STL	$2, 4($30)
	STL	$0, 6($30)
	STL	$3, 3($30)
	STL	$5, 1($30)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, calc_diffuse_using_5points.3552
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 1($30)
	LDA	$4, 1($0)
	LDL	$0, 6($30)
	LDL	$3, 3($30)
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	CMPLE	$4, 4, $28
	BEQ	$28, ble_else.17800
	LDL	$2, 2($1)
	ADDL	$2, $4, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.17801
	ADDL	$3, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 2($2)
	ADDL	$2, $4, $28
	LDL	$2, 0($28)
	LDL	$5, 4($30)
	ADDL	$5, $0, $28
	LDL	$6, 0($28)
	LDL	$6, 2($6)
	ADDL	$6, $4, $28
	LDL	$6, 0($28)
	SUBL	$6, $2, $28
	BNE	$28, beq_else.17802
	LDL	$6, 2($30)
	ADDL	$6, $0, $28
	LDL	$7, 0($28)
	LDL	$7, 2($7)
	ADDL	$7, $4, $28
	LDL	$7, 0($28)
	SUBL	$7, $2, $28
	BNE	$28, beq_else.17803
	LDA	$7, -1($0)
	ADDL	$3, $7, $28
	LDL	$7, 0($28)
	LDL	$7, 2($7)
	ADDL	$7, $4, $28
	LDL	$7, 0($28)
	SUBL	$7, $2, $28
	BNE	$28, beq_else.17804
	LDA	$7, 1($0)
	ADDL	$3, $7, $28
	LDL	$7, 0($28)
	LDL	$7, 2($7)
	ADDL	$7, $4, $28
	LDL	$7, 0($28)
	SUBL	$7, $2, $28
	BNE	$28, beq_else.17805
	LDL	$1, 3($1)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	BNE	$1, beq_else.17806
	LDA	$1, 1($4)
	LDL	$2, 5($30)
	LDA	$4, 0($6)
	LDA	$28, 0($5)
	LDA	$5, 0($1)
	LDA	$1, 0($2)
	LDA	$2, 0($28)
	BR	$28, try_exploit_neighbors.3574
beq_else.17806:
	STL	$4, 7($30)
	LDA	$2, 0($3)
	LDA	$1, 0($5)
	LDA	$3, 0($6)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, calc_diffuse_using_5points.3552
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$5, 1($0)
	LDL	$0, 6($30)
	LDL	$1, 5($30)
	LDL	$2, 4($30)
	LDL	$3, 3($30)
	LDL	$4, 2($30)
	BR	$28, try_exploit_neighbors.3574
beq_else.17805:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($4)
	BR	$28, do_without_neighbors.3558
beq_else.17804:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($4)
	BR	$28, do_without_neighbors.3558
beq_else.17803:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($4)
	BR	$28, do_without_neighbors.3558
beq_else.17802:
	ADDL	$3, $0, $28
	LDL	$0, 0($28)
	LDA	$1, 0($4)
	BR	$28, do_without_neighbors.3558
bge_else.17801:
	RET	$28, ($29)
ble_else.17800:
	RET	$28, ($29)
bge_else.17775:
	RET	$28, ($29)
ble_else.17774:
	RET	$28, ($29)
write_ppm_header.3581:
	LDA	$0, 80($31)
	LDAH	$28, 16($31)
mcpc.17811:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17811
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 54($31)
	LDAH	$28, 16($31)
mcpc.17812:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17812
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 10($31)
	LDAH	$28, 16($31)
mcpc.17813:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17813
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 49($31)
	LDAH	$28, 16($31)
mcpc.17814:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17814
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.17815:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17815
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 56($31)
	LDAH	$28, 16($31)
mcpc.17816:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17816
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.17817:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17817
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 49($31)
	LDAH	$28, 16($31)
mcpc.17818:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17818
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.17819:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17819
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 56($31)
	LDAH	$28, 16($31)
mcpc.17820:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17820
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.17821:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17821
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.17822:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17822
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.17823:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17823
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.17824:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17824
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 10($31)
	LDAH	$28, 16($31)
mcpc.17826:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17826
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
write_rgb.3585:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17827
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17828
	BR	$28, ble_cont.17829
ble_else.17828:
	LDA	$0, 0($31)
ble_cont.17829:
	LDAH	$28, 16($31)
mcpc.17830:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17830
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 1($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17831
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17832
	LDAH	$28, 16($31)
mcpc.17833:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17833
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17834
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17835
	LDAH	$28, 16($31)
mcpc.17837:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17837
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17835:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17839:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17839
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17834:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17841:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17841
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17832:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17842:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17842
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17843
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17844
	LDAH	$28, 16($31)
mcpc.17846:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17846
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17844:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17848:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17848
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17843:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17850:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17850
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17831:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17851:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17851
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17852
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17853
	LDAH	$28, 16($31)
mcpc.17855:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17855
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17853:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17857:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17857
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17852:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17859:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17859
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17827:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17860:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17860
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 1($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17861
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17862
	LDAH	$28, 16($31)
mcpc.17863:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17863
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17864
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17865
	LDAH	$28, 16($31)
mcpc.17867:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17867
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17865:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17869:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17869
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17864:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17871:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17871
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17862:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17872:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17872
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17873
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17874
	LDAH	$28, 16($31)
mcpc.17876:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17876
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17874:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17878:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17878
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17873:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17880:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17880
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17861:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17881:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17881
	AND	$0, 255, $25
	STL	$25, 3($28)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17882
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.17883
	LDAH	$28, 16($31)
mcpc.17885:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17885
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.17883:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17887:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17887
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.17882:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17889:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17889
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
pretrace_diffuse_rays.3587:
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.17890
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.17891
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	BNE	$2, beq_else.17892
	LDA	$1, 1($1)
	BR	$28, pretrace_diffuse_rays.3587
beq_else.17892:
	LDL	$2, 6($0)
	LDL	$2, 0($2)
	MOV	$3, min_caml_diffuse_ray
	LDL	$3, 0($3)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($3)
	STS	$f0, 1($3)
	STS	$f0, 2($3)
	LDL	$3, 7($0)
	LDL	$4, 1($0)
	MOV	$5, min_caml_dirvecs
	LDL	$5, 0($5)
	ADDL	$5, $2, $28
	LDL	$2, 0($28)
	ADDL	$3, $1, $28
	LDL	$3, 0($28)
	ADDL	$4, $1, $28
	LDL	$4, 0($28)
	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	LDA	$2, 0($4)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, trace_diffuse_rays.3541
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDL	$1, 5($0)
	LDL	$2, 0($30)
	ADDL	$1, $2, $28
	LDL	$1, 0($28)
	MOV	$3, min_caml_diffuse_ray
	LDL	$3, 0($3)
	LDS	$f0, 0($3)
	STS	$f0, 0($1)
	LDS	$f0, 1($3)
	STS	$f0, 1($1)
	LDS	$f0, 2($3)
	STS	$f0, 2($1)
	LDA	$1, 1($2)
	BR	$28, pretrace_diffuse_rays.3587
bge_else.17891:
	RET	$28, ($29)
ble_else.17890:
	RET	$28, ($29)
pretrace_pixels.3590:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.17895
	MOV	$3, min_caml_scan_pitch
	LDL	$3, 0($3)
	LDS	$f3, 0($3)
	MOV	$3, min_caml_image_center
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	SUBL	$1, $3, $3
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STS	$f2, 4($30)
	STS	$f1, 6($30)
	STS	$f0, 8($30)
	STS	$f3, 10($30)
	LDA	$0, 0($3)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDS	$f1, 10($30)
	MULS	$f1, $f0, $f0
	MOV	$0, min_caml_ptrace_dirvec
	LDL	$0, 0($0)
	MOV	$1, min_caml_screenx_dir
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	MULS	$f0, $f1, $f1
	LDS	$f2, 8($30)
	ADDS	$f1, $f2, $f1
	STS	$f1, 0($0)
	MOV	$0, min_caml_ptrace_dirvec
	LDL	$0, 0($0)
	MOV	$1, min_caml_screenx_dir
	LDL	$1, 0($1)
	LDS	$f1, 1($1)
	MULS	$f0, $f1, $f1
	LDS	$f3, 6($30)
	ADDS	$f1, $f3, $f1
	STS	$f1, 1($0)
	MOV	$0, min_caml_ptrace_dirvec
	LDL	$0, 0($0)
	MOV	$1, min_caml_screenx_dir
	LDL	$1, 0($1)
	LDS	$f1, 2($1)
	MULS	$f0, $f1, $f0
	LDS	$f1, 4($30)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($0)
	MOV	$0, min_caml_ptrace_dirvec
	LDL	$0, 0($0)
	LDA	$1, 0($31)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, vecunit_sgn.3218
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($0)
	STS	$f0, 1($0)
	STS	$f0, 2($0)
	MOV	$0, min_caml_startp
	LDL	$0, 0($0)
	MOV	$1, min_caml_viewpoint
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	STS	$f0, 0($0)
	LDS	$f0, 1($1)
	STS	$f0, 1($0)
	LDS	$f0, 2($1)
	STS	$f0, 2($0)
	LDA	$0, 0($31)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	MOV	$1, min_caml_ptrace_dirvec
	LDL	$1, 0($1)
	LDL	$2, 1($30)
	LDL	$3, 2($30)
	ADDL	$3, $2, $28
	LDL	$4, 0($28)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	LDA	$2, 0($4)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, trace_ray.3527
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 1($30)
	LDL	$1, 2($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	MOV	$3, min_caml_rgb
	LDL	$3, 0($3)
	LDS	$f0, 0($3)
	STS	$f0, 0($2)
	LDS	$f0, 1($3)
	STS	$f0, 1($2)
	LDS	$f0, 2($3)
	STS	$f0, 2($2)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 6($2)
	LDL	$3, 0($30)
	STL	$3, 0($2)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$4, 0($31)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, pretrace_diffuse_rays.3587
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 1($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	LDA	$2, 1($0)
	CMPLT	$2, 5, $28
	BNE	$28, bge_else.17897
	LDA	$2, -5($2)
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	LDL	$0, 2($30)
	BR	$28, pretrace_pixels.3590
bge_else.17897:
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	LDL	$0, 2($30)
	BR	$28, pretrace_pixels.3590
bge_else.17895:
	RET	$28, ($29)
pretrace_line.3597:
	MOV	$3, min_caml_scan_pitch
	LDL	$3, 0($3)
	LDS	$f0, 0($3)
	MOV	$3, min_caml_image_center
	LDL	$3, 0($3)
	LDL	$3, 1($3)
	SUBL	$1, $3, $1
	STL	$2, 0($30)
	STL	$0, 1($30)
	STS	$f0, 2($30)
	LDA	$0, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDS	$f1, 2($30)
	MULS	$f1, $f0, $f0
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	MULS	$f0, $f1, $f1
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDS	$f2, 0($0)
	ADDS	$f1, $f2, $f1
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	LDS	$f2, 1($0)
	MULS	$f0, $f2, $f2
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDS	$f3, 1($0)
	ADDS	$f2, $f3, $f2
	MOV	$0, min_caml_screeny_dir
	LDL	$0, 0($0)
	LDS	$f3, 2($0)
	MULS	$f0, $f3, $f0
	MOV	$0, min_caml_screenz_dir
	LDL	$0, 0($0)
	LDS	$f3, 2($0)
	ADDS	$f0, $f3, $f0
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$1, -1($0)
	LDL	$0, 1($30)
	LDL	$2, 0($30)
	ADDS	$f2, $f31, $f30
	ADDS	$f0, $f31, $f2
	ADDS	$f1, $f31, $f0
	ADDS	$f30, $f31, $f1
	BR	$28, pretrace_pixels.3590
scan_pixel.3601:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.17899
	RET	$28, ($29)
ble_else.17899:
	MOV	$5, min_caml_rgb
	LDL	$5, 0($5)
	ADDL	$3, $0, $28
	LDL	$6, 0($28)
	LDL	$6, 0($6)
	LDS	$f0, 0($6)
	STS	$f0, 0($5)
	LDS	$f0, 1($6)
	STS	$f0, 1($5)
	LDS	$f0, 2($6)
	STS	$f0, 2($5)
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	LDA	$6, 1($1)
	CMPLE	$5, $6, $28
	BEQ	$28, ble_else.17901
	LDA	$5, 0($31)
	BR	$28, ble_cont.17902
ble_else.17901:
	CMPLE	$1, 0, $28
	BEQ	$28, ble_else.17903
	LDA	$5, 0($31)
	BR	$28, ble_cont.17904
ble_else.17903:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	LDA	$6, 1($0)
	CMPLE	$5, $6, $28
	BEQ	$28, ble_else.17905
	LDA	$5, 0($31)
	BR	$28, ble_cont.17906
ble_else.17905:
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.17907
	LDA	$5, 0($31)
	BR	$28, ble_cont.17908
ble_else.17907:
	LDA	$5, 1($31)
ble_cont.17908:
ble_cont.17906:
ble_cont.17904:
ble_cont.17902:
	BNE	$5, beq_else.17909
	ADDL	$3, $0, $28
	LDL	$5, 0($28)
	LDA	$6, 0($31)
	STL	$4, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$3, 3($30)
	STL	$0, 4($30)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17910
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17912
	LDAH	$28, 16($31)
mcpc.17914:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17914
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17913
ble_else.17912:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17915:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17915
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17913:
	BR	$28, ble_cont.17911
ble_else.17910:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17916:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17916
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17911:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 1($0)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17917
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17919
	LDAH	$28, 16($31)
mcpc.17921:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17921
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17920
ble_else.17919:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17922:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17922
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17920:
	BR	$28, ble_cont.17918
ble_else.17917:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17923:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17923
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17918:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17924
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17926
	LDAH	$28, 16($31)
mcpc.17928:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17928
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17927
ble_else.17926:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17929:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17929
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17927:
	BR	$28, ble_cont.17925
ble_else.17924:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17930:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17930
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17925:
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	CMPLE	$1, $0, $28
	BEQ	$28, ble_else.17931
	RET	$28, ($29)
ble_else.17931:
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDL	$3, 3($30)
	ADDL	$3, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 1($1)
	LDL	$2, 2($30)
	LDA	$4, 1($2)
	CMPLE	$1, $4, $28
	BEQ	$28, ble_else.17933
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17933:
	CMPLE	$2, 0, $28
	BEQ	$28, ble_else.17934
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17934:
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$4, 1($0)
	CMPLE	$1, $4, $28
	BEQ	$28, ble_else.17935
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17935:
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.17936
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17936:
	LDA	$5, 0($31)
	LDL	$1, 1($30)
	LDL	$4, 0($30)
	STL	$0, 5($30)
	LDA	$28, 0($2)
	LDA	$2, 0($1)
	LDA	$1, 0($28)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, try_exploit_neighbors.3574
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
beq_else.17909:
	LDA	$5, 0($31)
	STL	$4, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$3, 3($30)
	STL	$0, 4($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, try_exploit_neighbors.3574
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17937
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17939
	LDAH	$28, 16($31)
mcpc.17941:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17941
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17940
ble_else.17939:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17942:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17942
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17940:
	BR	$28, ble_cont.17938
ble_else.17937:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17943:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17943
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17938:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 1($0)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17944
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17946
	LDAH	$28, 16($31)
mcpc.17948:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17948
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17947
ble_else.17946:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17949:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17949
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17947:
	BR	$28, ble_cont.17945
ble_else.17944:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17950:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17950
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17945:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.17951
	CMPLT	$0, 0, $28
	BNE	$28, ble_else.17953
	LDAH	$28, 16($31)
mcpc.17955:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17955
	AND	$0, 255, $25
	STL	$25, 3($28)
	BR	$28, ble_cont.17954
ble_else.17953:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.17956:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17956
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17954:
	BR	$28, ble_cont.17952
ble_else.17951:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.17957:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.17957
	AND	$0, 255, $25
	STL	$25, 3($28)
ble_cont.17952:
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	CMPLE	$1, $0, $28
	BEQ	$28, ble_else.17958
	RET	$28, ($29)
ble_else.17958:
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDL	$3, 3($30)
	ADDL	$3, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	LDS	$f0, 0($2)
	STS	$f0, 0($1)
	LDS	$f0, 1($2)
	STS	$f0, 1($1)
	LDS	$f0, 2($2)
	STS	$f0, 2($1)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 1($1)
	LDL	$2, 2($30)
	LDA	$4, 1($2)
	CMPLE	$1, $4, $28
	BEQ	$28, ble_else.17960
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17960:
	CMPLE	$2, 0, $28
	BEQ	$28, ble_else.17961
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17961:
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$4, 1($0)
	CMPLE	$1, $4, $28
	BEQ	$28, ble_else.17962
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17962:
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.17963
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDA	$4, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($4)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
ble_else.17963:
	LDA	$5, 0($31)
	LDL	$1, 1($30)
	LDL	$4, 0($30)
	STL	$0, 5($30)
	LDA	$28, 0($2)
	LDA	$2, 0($1)
	LDA	$1, 0($28)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, try_exploit_neighbors.3574
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 5($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	LDL	$4, 0($30)
	BR	$28, scan_pixel.3601
scan_line.3607:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.17964
	RET	$28, ($29)
ble_else.17964:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	LDA	$5, -1($5)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.17966
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	STL	$1, 0($30)
	STL	$3, 1($30)
	STL	$2, 2($30)
	STL	$4, 3($30)
	STL	$0, 4($30)
	CMPLE	$5, 0, $28
	BEQ	$28, ble_else.17967
	BR	$28, ble_cont.17968
ble_else.17967:
	MOV	$5, min_caml_rgb
	LDL	$5, 0($5)
	LDL	$6, 0($2)
	LDL	$6, 0($6)
	LDS	$f0, 0($6)
	STS	$f0, 0($5)
	LDS	$f0, 1($6)
	STS	$f0, 1($5)
	LDS	$f0, 2($6)
	STS	$f0, 2($5)
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	LDA	$6, 1($0)
	CMPLE	$5, $6, $28
	BEQ	$28, ble_else.17969
	LDL	$5, 0($2)
	LDA	$6, 0($31)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, ble_cont.17970
ble_else.17969:
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.17971
	LDL	$5, 0($2)
	LDA	$6, 0($31)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, ble_cont.17972
ble_else.17971:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	CMPLE	$5, 1, $28
	BEQ	$28, ble_else.17973
	LDL	$5, 0($2)
	LDA	$6, 0($31)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, ble_cont.17974
ble_else.17973:
	LDL	$5, 0($2)
	LDA	$6, 0($31)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -6($30)
	LDL	$29, 5($30)
ble_cont.17974:
ble_cont.17972:
ble_cont.17970:
ble_cont.17968:
	LDL	$0, 4($30)
	LDA	$1, 1($0)
	LDL	$0, 3($30)
	LDA	$2, 2($0)
	CMPLT	$2, 5, $28
	BNE	$28, bge_else.17975
	LDA	$2, -5($2)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17976
	RET	$28, ($29)
ble_else.17976:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17978
	LDA	$0, 0($31)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	LDL	$5, 0($30)
	STL	$2, 5($30)
	STL	$1, 6($30)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 5($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17979
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17979:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
ble_else.17978:
	LDA	$0, 1($1)
	LDL	$3, 0($30)
	STL	$2, 5($30)
	STL	$1, 6($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$0, 0($31)
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	LDL	$3, 1($30)
	LDL	$4, 0($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 5($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17980
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17980:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17975:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17981
	RET	$28, ($29)
ble_else.17981:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17983
	LDA	$0, 0($31)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	LDL	$5, 0($30)
	STL	$2, 7($30)
	STL	$1, 6($30)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 7($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17984
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17984:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
ble_else.17983:
	LDA	$0, 1($1)
	LDL	$3, 0($30)
	STL	$2, 7($30)
	STL	$1, 6($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 0($31)
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	LDL	$3, 1($30)
	LDL	$4, 0($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 7($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17985
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17985:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
ble_else.17966:
	LDA	$5, 1($0)
	STL	$4, 3($30)
	STL	$3, 1($30)
	STL	$1, 0($30)
	STL	$0, 4($30)
	STL	$2, 2($30)
	LDA	$2, 0($4)
	LDA	$1, 0($5)
	LDA	$0, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.17986
	BR	$28, ble_cont.17987
ble_else.17986:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	LDL	$2, 0($1)
	LDL	$2, 0($2)
	LDS	$f0, 0($2)
	STS	$f0, 0($0)
	LDS	$f0, 1($2)
	STS	$f0, 1($0)
	LDS	$f0, 2($2)
	STS	$f0, 2($0)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDL	$2, 4($30)
	LDA	$3, 1($2)
	CMPLE	$0, $3, $28
	BEQ	$28, ble_else.17988
	LDL	$0, 0($1)
	LDA	$3, 0($31)
	LDA	$1, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BR	$28, ble_cont.17989
ble_else.17988:
	CMPLE	$2, 0, $28
	BEQ	$28, ble_else.17990
	LDL	$0, 0($1)
	LDA	$3, 0($31)
	LDA	$1, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BR	$28, ble_cont.17991
ble_else.17990:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	CMPLE	$0, 1, $28
	BEQ	$28, ble_else.17992
	LDL	$0, 0($1)
	LDA	$3, 0($31)
	LDA	$1, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BR	$28, ble_cont.17993
ble_else.17992:
	LDL	$0, 0($1)
	LDA	$3, 0($31)
	LDA	$1, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, do_without_neighbors.3558
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, write_rgb.3585
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 1($31)
	LDL	$1, 4($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
ble_cont.17993:
ble_cont.17991:
ble_cont.17989:
ble_cont.17987:
	LDL	$0, 4($30)
	LDA	$1, 1($0)
	LDL	$0, 3($30)
	LDA	$2, 2($0)
	CMPLT	$2, 5, $28
	BNE	$28, bge_else.17994
	LDA	$2, -5($2)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17995
	RET	$28, ($29)
ble_else.17995:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.17997
	LDA	$0, 0($31)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	LDL	$5, 0($30)
	STL	$2, 5($30)
	STL	$1, 6($30)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 5($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17998
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17998:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
ble_else.17997:
	LDA	$0, 1($1)
	LDL	$3, 0($30)
	STL	$2, 5($30)
	STL	$1, 6($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$0, 0($31)
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	LDL	$3, 1($30)
	LDL	$4, 0($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 5($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.17999
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17999:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.17994:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.18000
	RET	$28, ($29)
ble_else.18000:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, $1, $28
	BEQ	$28, ble_else.18002
	LDA	$0, 0($31)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	LDL	$5, 0($30)
	STL	$2, 8($30)
	STL	$1, 6($30)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 8($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.18003
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.18003:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
ble_else.18002:
	LDA	$0, 1($1)
	LDL	$3, 0($30)
	STL	$2, 8($30)
	STL	$1, 6($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$0, 0($31)
	LDL	$1, 6($30)
	LDL	$2, 2($30)
	LDL	$3, 1($30)
	LDL	$4, 0($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$0, 6($30)
	LDA	$0, 1($0)
	LDL	$1, 8($30)
	LDA	$4, 2($1)
	CMPLT	$4, 5, $28
	BNE	$28, bge_else.18004
	LDA	$4, -5($4)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
bge_else.18004:
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	LDL	$3, 2($30)
	BR	$28, scan_line.3607
create_float5x3array.3613:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 0($0)
	LDA	$0, 5($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($30)
	STL	$0, 1($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($30)
	STL	$0, 2($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($30)
	STL	$0, 3($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($30)
	STL	$0, 4($1)
	LDA	$0, 0($1)
	RET	$28, ($29)
init_line_elements.3617:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.18005
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 3($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 4($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$0, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 7($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$0, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 8($30)
	STL	$0, 6($1)
	LDL	$0, 7($30)
	STL	$0, 5($1)
	LDL	$0, 6($30)
	STL	$0, 4($1)
	LDL	$0, 5($30)
	STL	$0, 3($1)
	LDL	$0, 4($30)
	STL	$0, 2($1)
	LDL	$0, 3($30)
	STL	$0, 1($1)
	LDL	$0, 2($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18006
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 9($30)
	LDA	$0, 0($1)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	STL	$0, 10($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 11($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 12($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	STL	$0, 13($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	STL	$0, 14($30)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 15($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	STL	$0, 16($30)
	STL	$29, 17($30)
	LDA	$30, 18($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -18($30)
	LDL	$29, 17($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 16($30)
	STL	$0, 6($1)
	LDL	$0, 15($30)
	STL	$0, 5($1)
	LDL	$0, 14($30)
	STL	$0, 4($1)
	LDL	$0, 13($30)
	STL	$0, 3($1)
	LDL	$0, 12($30)
	STL	$0, 2($1)
	LDL	$0, 11($30)
	STL	$0, 1($1)
	LDL	$0, 10($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 9($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDA	$0, 0($2)
	BR	$28, init_line_elements.3617
bge_else.18006:
	LDA	$0, 0($2)
	RET	$28, ($29)
bge_else.18005:
	RET	$28, ($29)
calc_dirvec.3627:
	CMPLT	$0, 5, $28
	BNE	$28, bge_else.18007
	MULS	$f0, $f0, $f2
	MULS	$f1, $f1, $f3
	ADDS	$f2, $f3, $f2
	LDAH	$28, 16256($31)
	ITOFS	$28, $f3
    # 1.000000 : 1065353216

	ADDS	$f2, $f3, $f2
	SQRTS	$f2, $f2
	INVS	$f2, $f30
	MULS	$f0, $f30, $f0
	INVS	$f2, $f30
	MULS	$f1, $f30, $f1
	LDAH	$28, 16256($31)
	ITOFS	$28, $f3
    # 1.000000 : 1065353216

	INVS	$f2, $f30
	MULS	$f3, $f30, $f2
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	ADDL	$0, $2, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	STS	$f0, 0($1)
	STS	$f1, 1($1)
	STS	$f2, 2($1)
	LDA	$1, 40($2)
	ADDL	$0, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	SUBS	$f31, $f1, $f3
	STS	$f0, 0($1)
	STS	$f2, 1($1)
	STS	$f3, 2($1)
	LDA	$1, 80($2)
	ADDL	$0, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	SUBS	$f31, $f0, $f3
	SUBS	$f31, $f1, $f4
	STS	$f2, 0($1)
	STS	$f3, 1($1)
	STS	$f4, 2($1)
	LDA	$1, 1($2)
	ADDL	$0, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	SUBS	$f31, $f0, $f3
	SUBS	$f31, $f1, $f4
	SUBS	$f31, $f2, $f5
	STS	$f3, 0($1)
	STS	$f4, 1($1)
	STS	$f5, 2($1)
	LDA	$1, 41($2)
	ADDL	$0, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	SUBS	$f31, $f0, $f3
	SUBS	$f31, $f2, $f4
	STS	$f3, 0($1)
	STS	$f4, 1($1)
	STS	$f1, 2($1)
	LDA	$1, 81($2)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 0($0)
	SUBS	$f31, $f2, $f2
	STS	$f2, 0($0)
	STS	$f0, 1($0)
	STS	$f1, 2($0)
	RET	$28, ($29)
bge_else.18007:
	MULS	$f1, $f1, $f0
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f1
    # 0.100000 : 1036831949

	ADDS	$f0, $f1, $f0
	SQRTS	$f0, $f0
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f1, $f30, $f1
	STL	$2, 0($30)
	STL	$1, 1($30)
	STS	$f3, 2($30)
	STL	$0, 4($30)
	STS	$f0, 6($30)
	STS	$f2, 8($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_atan
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDS	$f1, 8($30)
	MULS	$f0, $f1, $f0
	STS	$f0, 10($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_sin
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	LDS	$f2, 10($30)
	ADDS	$f2, $f1, $f1
	STS	$f0, 12($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_sin
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 12($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 6($30)
	MULS	$f0, $f1, $f0
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	MULS	$f0, $f0, $f1
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f2
    # 0.100000 : 1036831949

	ADDS	$f1, $f2, $f1
	SQRTS	$f1, $f1
	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	INVS	$f1, $f30
	MULS	$f2, $f30, $f2
	STS	$f0, 14($30)
	STL	$0, 16($30)
	STS	$f1, 18($30)
	ADDS	$f2, $f31, $f0
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, min_caml_atan
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	LDS	$f1, 2($30)
	MULS	$f0, $f1, $f0
	STS	$f0, 20($30)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, min_caml_sin
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	LDS	$f2, 20($30)
	ADDS	$f2, $f1, $f1
	STS	$f0, 22($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 24($30)
	LDA	$30, 25($30)
	BSR	$29, min_caml_sin
	LDA	$30, -25($30)
	LDL	$29, 24($30)
	LDS	$f1, 22($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 18($30)
	MULS	$f0, $f1, $f1
	LDS	$f0, 14($30)
	LDS	$f2, 8($30)
	LDS	$f3, 2($30)
	LDL	$0, 16($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, calc_dirvec.3627
calc_dirvecs.3635:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18011
	STL	$0, 0($30)
	STS	$f0, 2($30)
	STL	$2, 4($30)
	STL	$1, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f1
    # 0.200000 : 1045220557

	MULS	$f0, $f1, $f0
	LDA	$28, 26214($31)
	LDAH	$28, 16230($28)
	ITOFS	$28, $f1
    # 0.900000 : 1063675494

	SUBS	$f0, $f1, $f2
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	LDS	$f3, 2($30)
	LDL	$1, 5($30)
	LDL	$2, 4($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, calc_dirvec.3627
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 0($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f1
    # 0.200000 : 1045220557

	MULS	$f0, $f1, $f0
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f1
    # 0.100000 : 1036831949

	ADDS	$f0, $f1, $f2
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	LDL	$1, 4($30)
	LDA	$2, 2($1)
	LDS	$f3, 2($30)
	LDL	$3, 5($30)
	LDA	$1, 0($3)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, calc_dirvec.3627
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDL	$1, 5($30)
	LDA	$1, 1($1)
	CMPLT	$1, 5, $28
	BNE	$28, bge_else.18013
	LDA	$1, -5($1)
	LDS	$f0, 2($30)
	LDL	$2, 4($30)
	BR	$28, calc_dirvecs.3635
bge_else.18013:
	LDS	$f0, 2($30)
	LDL	$2, 4($30)
	BR	$28, calc_dirvecs.3635
bge_else.18011:
	RET	$28, ($29)
calc_dirvec_rows.3640:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18015
	STL	$0, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f1
    # 0.200000 : 1045220557

	MULS	$f0, $f1, $f0
	LDA	$28, 26214($31)
	LDAH	$28, 16230($28)
	ITOFS	$28, $f1
    # 0.900000 : 1063675494

	SUBS	$f0, $f1, $f0
	LDA	$0, 4($31)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, calc_dirvecs.3635
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDL	$1, 2($30)
	LDA	$1, 2($1)
	CMPLT	$1, 5, $28
	BNE	$28, bge_else.18016
	LDA	$1, -5($1)
	LDL	$2, 1($30)
	LDA	$2, 4($2)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18017
	STL	$0, 3($30)
	STL	$2, 4($30)
	STL	$1, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f1
    # 0.200000 : 1045220557

	MULS	$f0, $f1, $f0
	LDA	$28, 26214($31)
	LDAH	$28, 16230($28)
	ITOFS	$28, $f1
    # 0.900000 : 1063675494

	SUBS	$f0, $f1, $f0
	LDA	$0, 4($31)
	LDL	$1, 5($30)
	LDL	$2, 4($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, calc_dirvecs.3635
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 3($30)
	LDA	$0, -1($0)
	LDL	$1, 5($30)
	LDA	$1, 2($1)
	CMPLT	$1, 5, $28
	BNE	$28, bge_else.18018
	LDA	$1, -5($1)
	LDL	$2, 4($30)
	LDA	$2, 4($2)
	BR	$28, calc_dirvec_rows.3640
bge_else.18018:
	LDL	$2, 4($30)
	LDA	$2, 4($2)
	BR	$28, calc_dirvec_rows.3640
bge_else.18017:
	RET	$28, ($29)
bge_else.18016:
	LDL	$2, 1($30)
	LDA	$2, 4($2)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18020
	STL	$0, 3($30)
	STL	$2, 4($30)
	STL	$1, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15949($28)
	ITOFS	$28, $f1
    # 0.200000 : 1045220557

	MULS	$f0, $f1, $f0
	LDA	$28, 26214($31)
	LDAH	$28, 16230($28)
	ITOFS	$28, $f1
    # 0.900000 : 1063675494

	SUBS	$f0, $f1, $f0
	LDA	$0, 4($31)
	LDL	$1, 6($30)
	LDL	$2, 4($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, calc_dirvecs.3635
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 3($30)
	LDA	$0, -1($0)
	LDL	$1, 6($30)
	LDA	$1, 2($1)
	CMPLT	$1, 5, $28
	BNE	$28, bge_else.18021
	LDA	$1, -5($1)
	LDL	$2, 4($30)
	LDA	$2, 4($2)
	BR	$28, calc_dirvec_rows.3640
bge_else.18021:
	LDL	$2, 4($30)
	LDA	$2, 4($2)
	BR	$28, calc_dirvec_rows.3640
bge_else.18020:
	RET	$28, ($29)
bge_else.18015:
	RET	$28, ($29)
create_dirvec_elements.3646:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.18024
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$1, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 2($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18025
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 3($30)
	LDA	$0, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 4($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 3($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18026
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 5($30)
	LDA	$0, 0($1)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 6($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 5($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$0, -1($1)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18027
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 7($30)
	LDA	$0, 0($1)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 8($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 7($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDA	$0, 0($2)
	BR	$28, create_dirvec_elements.3646
bge_else.18027:
	RET	$28, ($29)
bge_else.18026:
	RET	$28, ($29)
bge_else.18025:
	RET	$28, ($29)
bge_else.18024:
	RET	$28, ($29)
create_dirvecs.3649:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18032
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDA	$2, 120($31)
	LDA	$3, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$2, 2($30)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 3($30)
	STL	$0, 0($1)
	LDL	$0, 2($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 5($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 4($30)
	STL	$0, 118($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 6($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 4($30)
	STL	$0, 117($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 7($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 7($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 4($30)
	STL	$0, 116($1)
	LDA	$0, 115($31)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, create_dirvec_elements.3646
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18033
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDA	$2, 120($31)
	LDA	$3, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 8($30)
	STL	$1, 9($30)
	STL	$2, 10($30)
	LDA	$0, 0($3)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 11($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 11($30)
	STL	$0, 0($1)
	LDL	$0, 10($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$1, 8($30)
	LDL	$2, 9($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 12($30)
	LDA	$0, 0($2)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 13($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 13($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 12($30)
	STL	$0, 118($1)
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 14($30)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 14($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDL	$1, 12($30)
	STL	$0, 117($1)
	LDA	$0, 116($31)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, create_dirvec_elements.3646
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDL	$0, 8($30)
	LDA	$0, -1($0)
	BR	$28, create_dirvecs.3649
bge_else.18033:
	RET	$28, ($29)
bge_else.18032:
	RET	$28, ($29)
init_dirvec_constants.3651:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.18036
	ADDL	$0, $1, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 0($30)
	STL	$1, 1($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18037
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	CMPLT	$3, 0, $28
	BNE	$28, bge_else.18038
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($2)
	LDL	$6, 0($2)
	LDL	$7, 1($4)
	LDA	$28, -1($7)
	BNE	$28, beq_else.18039
	STL	$0, 2($30)
	STL	$2, 3($30)
	STL	$3, 4($30)
	STL	$5, 5($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 3($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 2($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18040
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 6($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18041
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, init_dirvec_constants.3651
bge_else.18041:
	RET	$28, ($29)
bge_else.18040:
	RET	$28, ($29)
beq_else.18039:
	LDA	$28, -2($7)
	BNE	$28, beq_else.18044
	STL	$0, 2($30)
	STL	$2, 3($30)
	STL	$3, 4($30)
	STL	$5, 5($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 3($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 2($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18045
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 6($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18046
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, init_dirvec_constants.3651
bge_else.18046:
	RET	$28, ($29)
bge_else.18045:
	RET	$28, ($29)
beq_else.18044:
	STL	$0, 2($30)
	STL	$2, 3($30)
	STL	$3, 4($30)
	STL	$5, 5($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 3($30)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 2($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18049
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 6($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18050
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, init_dirvec_constants.3651
bge_else.18050:
	RET	$28, ($29)
bge_else.18049:
	RET	$28, ($29)
bge_else.18038:
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18053
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 6($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 6($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18054
	LDL	$1, 0($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, init_dirvec_constants.3651
bge_else.18054:
	RET	$28, ($29)
bge_else.18053:
	RET	$28, ($29)
bge_else.18037:
	RET	$28, ($29)
bge_else.18036:
	RET	$28, ($29)
init_vecset_constants.3654:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18059
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 119($1)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 0($30)
	STL	$1, 1($30)
	CMPLT	$3, 0, $28
	BNE	$28, ble_else.18060
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($2)
	LDL	$6, 0($2)
	LDL	$7, 1($4)
	LDA	$28, -1($7)
	BNE	$28, beq_else.18062
	STL	$2, 2($30)
	STL	$3, 3($30)
	STL	$5, 4($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, beq_cont.18063
beq_else.18062:
	LDA	$28, -2($7)
	BNE	$28, beq_else.18064
	STL	$2, 2($30)
	STL	$3, 3($30)
	STL	$5, 4($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, beq_cont.18065
beq_else.18064:
	STL	$2, 2($30)
	STL	$3, 3($30)
	STL	$5, 4($30)
	LDA	$1, 0($4)
	LDA	$0, 0($6)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$1, 3($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -6($30)
	LDL	$29, 5($30)
beq_cont.18065:
beq_cont.18063:
	BR	$28, ble_cont.18061
ble_else.18060:
ble_cont.18061:
	LDL	$0, 1($30)
	LDL	$1, 118($0)
	MOV	$2, min_caml_n_objects
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDA	$2, -1($2)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 1($30)
	LDL	$1, 117($0)
	LDA	$0, 0($1)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$1, 116($31)
	LDL	$0, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18066
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 119($1)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$0, 5($30)
	STL	$1, 6($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDL	$1, 118($0)
	LDA	$0, 0($1)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 117($31)
	LDL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 5($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18067
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 119($1)
	STL	$0, 7($30)
	STL	$1, 8($30)
	LDA	$0, 0($2)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDA	$1, 118($31)
	LDL	$0, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	LDL	$0, 7($30)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18068
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDA	$2, 119($31)
	STL	$0, 9($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	LDA	$0, -1($0)
	BR	$28, init_vecset_constants.3654
bge_else.18068:
	RET	$28, ($29)
bge_else.18067:
	RET	$28, ($29)
bge_else.18066:
	RET	$28, ($29)
bge_else.18059:
	RET	$28, ($29)
setup_rect_reflection.3665:
	SLL	$0, 2, $0
	MOV	$2, min_caml_n_reflections
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$1, 7($1)
	LDS	$f1, 0($1)
	SUBS	$f0, $f1, $f0
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	SUBS	$f31, $f1, $f1
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f2, 1($1)
	SUBS	$f31, $f2, $f2
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f3, 2($1)
	SUBS	$f31, $f3, $f3
	LDA	$1, 1($0)
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDS	$f4, 0($3)
	LDA	$3, 3($31)
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	STS	$f1, 0($30)
	STL	$0, 2($30)
	STL	$2, 3($30)
	STL	$1, 4($30)
	STS	$f0, 6($30)
	STS	$f3, 8($30)
	STS	$f2, 10($30)
	STS	$f4, 12($30)
	LDA	$0, 0($3)
	ADDS	$f5, $f31, $f0
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 14($30)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$2, 14($30)
	STL	$2, 0($1)
	LDS	$f0, 12($30)
	STS	$f0, 0($2)
	LDS	$f0, 10($30)
	STS	$f0, 1($2)
	LDS	$f1, 8($30)
	STS	$f1, 2($2)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$1, 15($30)
	CMPLT	$3, 0, $28
	BNE	$28, ble_else.18074
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($4)
	LDA	$28, -1($5)
	BNE	$28, beq_else.18076
	STL	$3, 16($30)
	STL	$0, 17($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDL	$1, 16($30)
	LDL	$2, 17($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 15($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	BR	$28, beq_cont.18077
beq_else.18076:
	LDA	$28, -2($5)
	BNE	$28, beq_else.18078
	STL	$3, 16($30)
	STL	$0, 17($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDL	$1, 16($30)
	LDL	$2, 17($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 15($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	BR	$28, beq_cont.18079
beq_else.18078:
	STL	$3, 16($30)
	STL	$0, 17($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDL	$1, 16($30)
	LDL	$2, 17($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 15($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -19($30)
	LDL	$29, 18($30)
beq_cont.18079:
beq_cont.18077:
	BR	$28, ble_cont.18075
ble_else.18074:
ble_cont.18075:
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($1)
	LDL	$2, 15($30)
	STL	$2, 1($1)
	LDL	$2, 4($30)
	STL	$2, 0($1)
	LDL	$2, 3($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	LDA	$0, 1($2)
	LDL	$1, 2($30)
	LDA	$3, 2($1)
	MOV	$4, min_caml_light
	LDL	$4, 0($4)
	LDS	$f1, 1($4)
	LDA	$4, 3($31)
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	STL	$0, 18($30)
	STL	$3, 19($30)
	STS	$f1, 20($30)
	LDA	$0, 0($4)
	ADDS	$f2, $f31, $f0
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 22($30)
	STL	$29, 23($30)
	LDA	$30, 24($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -24($30)
	LDL	$29, 23($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$2, 22($30)
	STL	$2, 0($1)
	LDS	$f0, 0($30)
	STS	$f0, 0($2)
	LDS	$f1, 20($30)
	STS	$f1, 1($2)
	LDS	$f1, 8($30)
	STS	$f1, 2($2)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	STL	$1, 23($30)
	CMPLT	$3, 0, $28
	BNE	$28, ble_else.18080
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($4)
	LDA	$28, -1($5)
	BNE	$28, beq_else.18082
	STL	$3, 24($30)
	STL	$0, 25($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	LDL	$1, 24($30)
	LDL	$2, 25($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 23($30)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	BR	$28, beq_cont.18083
beq_else.18082:
	LDA	$28, -2($5)
	BNE	$28, beq_else.18084
	STL	$3, 24($30)
	STL	$0, 25($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	LDL	$1, 24($30)
	LDL	$2, 25($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 23($30)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	BR	$28, beq_cont.18085
beq_else.18084:
	STL	$3, 24($30)
	STL	$0, 25($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	LDL	$1, 24($30)
	LDL	$2, 25($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 23($30)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -27($30)
	LDL	$29, 26($30)
beq_cont.18085:
beq_cont.18083:
	BR	$28, ble_cont.18081
ble_else.18080:
ble_cont.18081:
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($1)
	LDL	$2, 23($30)
	STL	$2, 1($1)
	LDL	$2, 19($30)
	STL	$2, 0($1)
	LDL	$2, 18($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	LDL	$0, 3($30)
	LDA	$1, 2($0)
	LDL	$2, 2($30)
	LDA	$2, 3($2)
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDS	$f1, 2($3)
	LDA	$3, 3($31)
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	STL	$1, 26($30)
	STL	$2, 27($30)
	STS	$f1, 28($30)
	LDA	$0, 0($3)
	ADDS	$f2, $f31, $f0
	STL	$29, 30($30)
	LDA	$30, 31($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -31($30)
	LDL	$29, 30($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 30($30)
	STL	$29, 31($30)
	LDA	$30, 32($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -32($30)
	LDL	$29, 31($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$2, 30($30)
	STL	$2, 0($1)
	LDS	$f0, 0($30)
	STS	$f0, 0($2)
	LDS	$f0, 10($30)
	STS	$f0, 1($2)
	LDS	$f0, 28($30)
	STS	$f0, 2($2)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	CMPLT	$3, 0, $28
	BNE	$28, bge_else.18086
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($4)
	LDA	$28, -1($5)
	BNE	$28, beq_else.18087
	STL	$1, 31($30)
	STL	$3, 32($30)
	STL	$0, 33($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDL	$1, 32($30)
	LDL	$2, 33($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 31($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($1)
	LDL	$2, 31($30)
	STL	$2, 1($1)
	LDL	$2, 27($30)
	STL	$2, 0($1)
	LDL	$2, 26($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	LDA	$1, 3($1)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.18087:
	LDA	$28, -2($5)
	BNE	$28, beq_else.18089
	STL	$1, 31($30)
	STL	$3, 32($30)
	STL	$0, 33($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDL	$1, 32($30)
	LDL	$2, 33($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 31($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($1)
	LDL	$2, 31($30)
	STL	$2, 1($1)
	LDL	$2, 27($30)
	STL	$2, 0($1)
	LDL	$2, 26($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	LDA	$1, 3($1)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.18089:
	STL	$1, 31($30)
	STL	$3, 32($30)
	STL	$0, 33($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDL	$1, 32($30)
	LDL	$2, 33($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 31($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($1)
	LDL	$2, 31($30)
	STL	$2, 1($1)
	LDL	$2, 27($30)
	STL	$2, 0($1)
	LDL	$2, 26($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	LDA	$1, 3($1)
	STL	$1, 0($0)
	RET	$28, ($29)
bge_else.18086:
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$2, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 6($30)
	STS	$f0, 2($2)
	STL	$1, 1($2)
	LDL	$1, 27($30)
	STL	$1, 0($2)
	LDA	$1, 0($2)
	LDL	$2, 26($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	LDA	$1, 3($1)
	STL	$1, 0($0)
	RET	$28, ($29)
setup_surface_reflection.3668:
	SLL	$0, 2, $0
	LDA	$0, 1($0)
	MOV	$2, min_caml_n_reflections
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$3, 7($1)
	LDS	$f1, 0($3)
	SUBS	$f0, $f1, $f0
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDL	$4, 4($1)
	LDS	$f1, 0($3)
	LDS	$f2, 0($4)
	MULS	$f1, $f2, $f1
	LDS	$f2, 1($3)
	LDS	$f3, 1($4)
	MULS	$f2, $f3, $f2
	ADDS	$f1, $f2, $f1
	LDS	$f2, 2($3)
	LDS	$f3, 2($4)
	MULS	$f2, $f3, $f2
	ADDS	$f1, $f2, $f1
	LDAH	$28, 16384($31)
	ITOFS	$28, $f2
    # 2.000000 : 1073741824

	LDL	$3, 4($1)
	LDS	$f3, 0($3)
	MULS	$f2, $f3, $f2
	MULS	$f2, $f1, $f2
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDS	$f3, 0($3)
	SUBS	$f2, $f3, $f2
	LDAH	$28, 16384($31)
	ITOFS	$28, $f3
    # 2.000000 : 1073741824

	LDL	$3, 4($1)
	LDS	$f4, 1($3)
	MULS	$f3, $f4, $f3
	MULS	$f3, $f1, $f3
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDS	$f4, 1($3)
	SUBS	$f3, $f4, $f3
	LDAH	$28, 16384($31)
	ITOFS	$28, $f4
    # 2.000000 : 1073741824

	LDL	$1, 4($1)
	LDS	$f5, 2($1)
	MULS	$f4, $f5, $f4
	MULS	$f4, $f1, $f1
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f4, 2($1)
	SUBS	$f1, $f4, $f1
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	STL	$2, 0($30)
	STL	$0, 1($30)
	STS	$f0, 2($30)
	STS	$f1, 4($30)
	STS	$f3, 6($30)
	STS	$f2, 8($30)
	LDA	$0, 0($1)
	ADDS	$f4, $f31, $f0
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$1, 10($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$2, 10($30)
	STL	$2, 0($1)
	LDS	$f0, 8($30)
	STS	$f0, 0($2)
	LDS	$f0, 6($30)
	STS	$f0, 1($2)
	LDS	$f0, 4($30)
	STS	$f0, 2($2)
	MOV	$3, min_caml_n_objects
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	LDA	$3, -1($3)
	CMPLT	$3, 0, $28
	BNE	$28, bge_else.18093
	MOV	$4, min_caml_objects
	LDL	$4, 0($4)
	ADDL	$4, $3, $28
	LDL	$4, 0($28)
	LDL	$5, 1($4)
	LDA	$28, -1($5)
	BNE	$28, beq_else.18094
	STL	$1, 11($30)
	STL	$3, 12($30)
	STL	$0, 13($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, setup_rect_table.3424
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$1, 12($30)
	LDL	$2, 13($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 11($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 2($30)
	STS	$f0, 2($1)
	LDL	$2, 11($30)
	STL	$2, 1($1)
	LDL	$2, 1($30)
	STL	$2, 0($1)
	LDL	$2, 0($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDA	$1, 1($2)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.18094:
	LDA	$28, -2($5)
	BNE	$28, beq_else.18096
	STL	$1, 11($30)
	STL	$3, 12($30)
	STL	$0, 13($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, setup_surface_table.3427
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$1, 12($30)
	LDL	$2, 13($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 11($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 2($30)
	STS	$f0, 2($1)
	LDL	$2, 11($30)
	STL	$2, 1($1)
	LDL	$2, 1($30)
	STL	$2, 0($1)
	LDL	$2, 0($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDA	$1, 1($2)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.18096:
	STL	$1, 11($30)
	STL	$3, 12($30)
	STL	$0, 13($30)
	LDA	$1, 0($4)
	LDA	$0, 0($2)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, setup_second_table.3430
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$1, 12($30)
	LDL	$2, 13($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDL	$0, 11($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 2($30)
	STS	$f0, 2($1)
	LDL	$2, 11($30)
	STL	$2, 1($1)
	LDL	$2, 1($30)
	STL	$2, 0($1)
	LDL	$2, 0($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDA	$1, 1($2)
	STL	$1, 0($0)
	RET	$28, ($29)
bge_else.18093:
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$2, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 2($30)
	STS	$f0, 2($2)
	STL	$1, 1($2)
	LDL	$1, 1($30)
	STL	$1, 0($2)
	LDA	$1, 0($2)
	LDL	$2, 0($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDA	$1, 1($2)
	STL	$1, 0($0)
	RET	$28, ($29)
rt.3673:
	MOV	$2, min_caml_image_size
	LDL	$2, 0($2)
	STL	$0, 0($2)
	MOV	$2, min_caml_image_size
	LDL	$2, 0($2)
	STL	$1, 1($2)
	MOV	$2, min_caml_image_center
	LDL	$2, 0($2)
	SRL	$0, 1, $3
	STL	$3, 0($2)
	MOV	$2, min_caml_image_center
	LDL	$2, 0($2)
	SRL	$1, 1, $1
	STL	$1, 1($2)
	MOV	$1, min_caml_scan_pitch
	LDL	$1, 0($1)
	LDAH	$28, 17152($31)
	ITOFS	$28, $f0
    # 128.000000 : 1124073472

	STL	$1, 0($30)
	STS	$f0, 2($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_float_of_int
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDS	$f1, 2($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDL	$0, 0($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 4($30)
	LDA	$0, 0($1)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$0, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 6($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 7($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	STL	$0, 8($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	STL	$0, 9($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 10($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	STL	$0, 11($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 11($30)
	STL	$0, 6($1)
	LDL	$0, 10($30)
	STL	$0, 5($1)
	LDL	$0, 9($30)
	STL	$0, 4($1)
	LDL	$0, 8($30)
	STL	$0, 3($1)
	LDL	$0, 7($30)
	STL	$0, 2($1)
	LDL	$0, 6($30)
	STL	$0, 1($1)
	LDL	$0, 5($30)
	STL	$0, 0($1)
	LDL	$0, 4($30)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -2($1)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, init_line_elements.3617
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 12($30)
	STL	$1, 13($30)
	LDA	$0, 0($2)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	STL	$0, 14($30)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 15($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 16($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 17($30)
	LDA	$30, 18($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -18($30)
	LDL	$29, 17($30)
	STL	$0, 17($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	STL	$0, 18($30)
	STL	$29, 19($30)
	LDA	$30, 20($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -20($30)
	LDL	$29, 19($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 19($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	STL	$0, 20($30)
	STL	$29, 21($30)
	LDA	$30, 22($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -22($30)
	LDL	$29, 21($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 20($30)
	STL	$0, 6($1)
	LDL	$0, 19($30)
	STL	$0, 5($1)
	LDL	$0, 18($30)
	STL	$0, 4($1)
	LDL	$0, 17($30)
	STL	$0, 3($1)
	LDL	$0, 16($30)
	STL	$0, 2($1)
	LDL	$0, 15($30)
	STL	$0, 1($1)
	LDL	$0, 14($30)
	STL	$0, 0($1)
	LDL	$0, 13($30)
	STL	$29, 21($30)
	LDA	$30, 22($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -22($30)
	LDL	$29, 21($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -2($1)
	STL	$29, 21($30)
	LDA	$30, 22($30)
	BSR	$29, init_line_elements.3617
	LDA	$30, -22($30)
	LDL	$29, 21($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$2, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 21($30)
	STL	$1, 22($30)
	LDA	$0, 0($2)
	STL	$29, 23($30)
	LDA	$30, 24($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -24($30)
	LDL	$29, 23($30)
	STL	$0, 23($30)
	STL	$29, 24($30)
	LDA	$30, 25($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -25($30)
	LDL	$29, 24($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 24($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 25($30)
	LDA	$30, 26($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -26($30)
	LDL	$29, 25($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 25($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 26($30)
	LDA	$30, 27($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -27($30)
	LDL	$29, 26($30)
	STL	$0, 26($30)
	STL	$29, 27($30)
	LDA	$30, 28($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -28($30)
	LDL	$29, 27($30)
	STL	$0, 27($30)
	STL	$29, 28($30)
	LDA	$30, 29($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -29($30)
	LDL	$29, 28($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 28($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 29($30)
	LDA	$30, 30($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -30($30)
	LDL	$29, 29($30)
	STL	$0, 29($30)
	STL	$29, 30($30)
	LDA	$30, 31($30)
	BSR	$29, create_float5x3array.3613
	LDA	$30, -31($30)
	LDL	$29, 30($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 29($30)
	STL	$0, 6($1)
	LDL	$0, 28($30)
	STL	$0, 5($1)
	LDL	$0, 27($30)
	STL	$0, 4($1)
	LDL	$0, 26($30)
	STL	$0, 3($1)
	LDL	$0, 25($30)
	STL	$0, 2($1)
	LDL	$0, 24($30)
	STL	$0, 1($1)
	LDL	$0, 23($30)
	STL	$0, 0($1)
	LDL	$0, 22($30)
	STL	$29, 30($30)
	LDA	$30, 31($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -31($30)
	LDL	$29, 30($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -2($1)
	STL	$29, 30($30)
	LDA	$30, 31($30)
	BSR	$29, init_line_elements.3617
	LDA	$30, -31($30)
	LDL	$29, 30($30)
	STL	$0, 30($30)
	STL	$29, 31($30)
	LDA	$30, 32($30)
	BSR	$29, read_screen_settings.3319
	LDA	$30, -32($30)
	LDL	$29, 31($30)
	STL	$29, 31($30)
	LDA	$30, 32($30)
	BSR	$29, read_light.3321
	LDA	$30, -32($30)
	LDL	$29, 31($30)
	LDA	$0, 0($31)
	STL	$0, 31($30)
	STL	$29, 32($30)
	LDA	$30, 33($30)
	BSR	$29, read_nth_object.3326
	LDA	$30, -33($30)
	LDL	$29, 32($30)
	BNE	$0, beq_else.18101
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 31($30)
	STL	$1, 0($0)
	BR	$28, beq_cont.18102
beq_else.18101:
	LDA	$0, 1($31)
	STL	$29, 32($30)
	LDA	$30, 33($30)
	BSR	$29, read_object.3328
	LDA	$30, -33($30)
	LDL	$29, 32($30)
beq_cont.18102:
	LDA	$0, 0($31)
	STL	$29, 32($30)
	LDA	$30, 33($30)
	BSR	$29, read_and_network.3336
	LDA	$30, -33($30)
	LDL	$29, 32($30)
	MOV	$0, min_caml_or_net
	LDL	$0, 0($0)
	LDA	$1, 0($31)
	STL	$0, 32($30)
	LDA	$0, 0($1)
	STL	$29, 33($30)
	LDA	$30, 34($30)
	BSR	$29, read_or_network.3334
	LDA	$30, -34($30)
	LDL	$29, 33($30)
	LDL	$1, 32($30)
	STL	$0, 0($1)
	STL	$29, 33($30)
	LDA	$30, 34($30)
	BSR	$29, write_ppm_header.3581
	LDA	$30, -34($30)
	LDL	$29, 33($30)
	LDA	$0, 4($31)
	STL	$29, 33($30)
	LDA	$30, 34($30)
	BSR	$29, create_dirvecs.3649
	LDA	$30, -34($30)
	LDL	$29, 33($30)
	LDA	$0, 9($31)
	LDA	$1, 0($31)
	LDA	$2, 0($31)
	STL	$29, 33($30)
	LDA	$30, 34($30)
	BSR	$29, calc_dirvec_rows.3640
	LDA	$30, -34($30)
	LDL	$29, 33($30)
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	LDL	$1, 119($0)
	STL	$0, 33($30)
	LDA	$0, 0($1)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_dirvec_constants.3436
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDA	$1, 118($31)
	LDL	$0, 33($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 3($0)
	LDA	$1, 119($31)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, init_dirvec_constants.3651
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDA	$0, 2($31)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, init_vecset_constants.3654
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_light_dirvec
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	STS	$f0, 0($0)
	LDS	$f0, 1($1)
	STS	$f0, 1($0)
	LDS	$f0, 2($1)
	STS	$f0, 2($0)
	MOV	$0, min_caml_light_dirvec
	LDL	$0, 0($0)
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, iter_setup_dirvec_constants.3433
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$0, -1($0)
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.18103
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 2($1)
	LDA	$28, -2($2)
	BNE	$28, beq_else.18104
	LDL	$2, 7($1)
	LDS	$f0, 0($2)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.18106
	BR	$28, nt_fble_cont.18107
nt_fble_else.18106:
	LDL	$2, 1($1)
	LDA	$28, -1($2)
	BNE	$28, beq_else.18108
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_rect_reflection.3665
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	BR	$28, beq_cont.18109
beq_else.18108:
	LDA	$28, -2($2)
	BNE	$28, beq_else.18110
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, setup_surface_reflection.3668
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	BR	$28, beq_cont.18111
beq_else.18110:
beq_cont.18111:
beq_cont.18109:
nt_fble_cont.18107:
	BR	$28, beq_cont.18105
beq_else.18104:
beq_cont.18105:
	LDA	$1, 0($31)
	LDA	$2, 0($31)
	LDL	$0, 21($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDA	$1, 0($31)
	LDA	$2, 2($31)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.18112
	RET	$28, ($29)
ble_else.18112:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.18114
	LDA	$0, 0($31)
	LDL	$2, 12($30)
	LDL	$3, 21($30)
	LDL	$4, 30($30)
	STL	$29, 34($30)
	LDA	$30, 35($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -35($30)
	LDL	$29, 34($30)
	LDA	$0, 1($31)
	LDA	$4, 4($31)
	LDL	$1, 21($30)
	LDL	$2, 30($30)
	LDL	$3, 12($30)
	BR	$28, scan_line.3607
ble_else.18114:
	LDA	$0, 1($31)
	LDL	$3, 30($30)
	STL	$1, 34($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$0, 0($31)
	LDL	$1, 34($30)
	LDL	$2, 12($30)
	LDL	$3, 21($30)
	LDL	$4, 30($30)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$0, 1($31)
	LDA	$4, 4($31)
	LDL	$1, 21($30)
	LDL	$2, 30($30)
	LDL	$3, 12($30)
	BR	$28, scan_line.3607
bge_else.18103:
	LDA	$1, 0($31)
	LDA	$2, 0($31)
	LDL	$0, 21($30)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$1, 0($31)
	LDA	$2, 2($31)
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.18115
	RET	$28, ($29)
ble_else.18115:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 1($0)
	LDA	$0, -1($0)
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.18117
	LDA	$0, 0($31)
	LDL	$2, 12($30)
	LDL	$3, 21($30)
	LDL	$4, 30($30)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$0, 1($31)
	LDA	$4, 4($31)
	LDL	$1, 21($30)
	LDL	$2, 30($30)
	LDL	$3, 12($30)
	BR	$28, scan_line.3607
ble_else.18117:
	LDA	$0, 1($31)
	LDL	$3, 30($30)
	STL	$1, 34($30)
	LDA	$1, 0($0)
	LDA	$0, 0($3)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, pretrace_line.3597
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$0, 0($31)
	LDL	$1, 34($30)
	LDL	$2, 12($30)
	LDL	$3, 21($30)
	LDL	$4, 30($30)
	STL	$29, 35($30)
	LDA	$30, 36($30)
	BSR	$29, scan_pixel.3601
	LDA	$30, -36($30)
	LDL	$29, 35($30)
	LDA	$0, 1($31)
	LDA	$4, 4($31)
	LDL	$1, 21($30)
	LDL	$2, 30($30)
	LDL	$3, 12($30)
	BR	$28, scan_line.3607
n_objects.init:
	LDA	$0, 1($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_n_objects
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_n_objects:
	LDA	$31, 0($31)
objects.init:
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 60($31)
	LDA	$2, 0($31)
	LDA	$3, 0($31)
	LDA	$4, 0($31)
	LDA	$5, 0($31)
	LDA	$6, 0($31)
	LDA	$7, 0($27)
	LDA	$27, 11($27)
	STL	$0, 10($7)
	STL	$0, 9($7)
	STL	$0, 8($7)
	STL	$0, 7($7)
	STL	$6, 6($7)
	STL	$0, 5($7)
	STL	$0, 4($7)
	STL	$5, 3($7)
	STL	$4, 2($7)
	STL	$3, 1($7)
	STL	$2, 0($7)
	LDA	$0, 0($7)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_objects
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_objects:
	LDA	$31, 0($31)
screen.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_screen
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_screen:
	LDA	$31, 0($31)
viewpoint.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_viewpoint
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_viewpoint:
	LDA	$31, 0($31)
light.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_light
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_light:
	LDA	$31, 0($31)
beam.init:
	LDA	$0, 1($31)
	LDAH	$28, 17279($31)
	ITOFS	$28, $f0
    # 255.000000 : 1132396544

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_beam
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_beam:
	LDA	$31, 0($31)
and_net.init:
	LDA	$0, 50($31)
	LDA	$1, 1($31)
	LDA	$2, -1($31)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$28, min_caml_and_net
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_and_net:
	LDA	$31, 0($31)
or_net.init:
	LDA	$0, 1($31)
	LDA	$1, 1($31)
	MOV	$2, min_caml_and_net
	LDL	$2, 0($2)
	LDA	$3, 0($31)
	ADDL	$2, $3, $28
	LDL	$2, 0($28)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$28, min_caml_or_net
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_or_net:
	LDA	$31, 0($31)
solver_dist.init:
	LDA	$0, 1($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_solver_dist
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_solver_dist:
	LDA	$31, 0($31)
intsec_rectside.init:
	LDA	$0, 1($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_intsec_rectside
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_intsec_rectside:
	LDA	$31, 0($31)
tmin.init:
	LDA	$0, 1($31)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f0
    # 1000000000.000000 : 1315859240

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_tmin
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_tmin:
	LDA	$31, 0($31)
intersection_point.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_intersection_point
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_intersection_point:
	LDA	$31, 0($31)
intersected_object_id.init:
	LDA	$0, 1($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_intersected_object_id
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_intersected_object_id:
	LDA	$31, 0($31)
nvector.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_nvector
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_nvector:
	LDA	$31, 0($31)
texture_color.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_texture_color
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_texture_color:
	LDA	$31, 0($31)
diffuse_ray.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_diffuse_ray
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_diffuse_ray:
	LDA	$31, 0($31)
rgb.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_rgb
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_rgb:
	LDA	$31, 0($31)
image_size.init:
	LDA	$0, 2($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_image_size
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_image_size:
	LDA	$31, 0($31)
image_center.init:
	LDA	$0, 2($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_image_center
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_image_center:
	LDA	$31, 0($31)
scan_pitch.init:
	LDA	$0, 1($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_scan_pitch
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_scan_pitch:
	LDA	$31, 0($31)
startp.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_startp
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_startp:
	LDA	$31, 0($31)
startp_fast.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_startp_fast
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_startp_fast:
	LDA	$31, 0($31)
screenx_dir.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_screenx_dir
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_screenx_dir:
	LDA	$31, 0($31)
screeny_dir.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_screeny_dir
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_screeny_dir:
	LDA	$31, 0($31)
screenz_dir.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_screenz_dir
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_screenz_dir:
	LDA	$31, 0($31)
ptrace_dirvec.init:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_ptrace_dirvec
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_ptrace_dirvec:
	LDA	$31, 0($31)
dirvecs.init:
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 0($0)
	LDA	$0, 0($31)
	STL	$1, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($31)
	LDA	$2, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($2)
	LDL	$0, 0($30)
	STL	$0, 0($2)
	LDA	$0, 0($2)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDA	$0, 5($31)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$28, min_caml_dirvecs
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_dirvecs:
	LDA	$31, 0($31)
light_dirvec.init:
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 60($31)
	LDL	$2, 0($30)
	STL	$0, 1($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 1($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	MOV	$28, min_caml_light_dirvec
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_light_dirvec:
	LDA	$31, 0($31)
reflections.init:
	LDA	$0, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 0($0)
	LDA	$0, 0($31)
	STL	$1, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($27)
	LDA	$27, 2($27)
	STL	$0, 1($1)
	LDL	$0, 0($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	LDA	$1, 180($31)
	LDA	$2, 0($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	LDA	$3, 0($27)
	LDA	$27, 3($27)
	STS	$f0, 2($3)
	STL	$0, 1($3)
	STL	$2, 0($3)
	LDA	$0, 0($3)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$28, min_caml_reflections
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_reflections:
	LDA	$31, 0($31)
n_reflections.init:
	LDA	$0, 1($31)
	LDA	$1, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$28, min_caml_n_reflections
	STL	$0, 0($28)
	RET	$28, ($29)
min_caml_n_reflections:
	LDA	$31, 0($31)
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
min_caml_bits_of_float:
	FTOIS $f0, $0
	RET $28, ($29)	
min_caml_float_of_bits:
	ITOFS $0, $f0
	RET $28, ($29)

min_caml_main_end:
	LDA	$0, 0($0)
