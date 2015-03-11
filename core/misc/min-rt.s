	LDA	$30, 12288($31)
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
	BSR	$29, rt.3588
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 0($31)
    # main program end

	BR	$28, min_caml_main_end
min_caml_fless:
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10382
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10382:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fispos:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.10383
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10383:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fisneg:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10384
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10384:
	LDA	$0, 1($31)
	RET	$28, ($29)
min_caml_fiszero:
	FBNE	$f0, beq_else.10385
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10385:
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
	FBEQ	$f30, ble_else.10386
	RET	$28, ($29)
ble_else.10386:
	SUBS	$f31, $f0, $f0
	RET	$28, ($29)
min_caml_abs_float:
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10387
	RET	$28, ($29)
ble_else.10387:
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
	FBEQ	$f30, ble_else.10388
	LDA	$28, 5069($31)
	LDAH	$28, 16084($28)
	ITOFS	$28, $f1
    # 0.414214 : 1054086093

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10389
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10390
	LDA	$28, -32134($31)
	LDAH	$28, 16411($28)
	ITOFS	$28, $f1
    # 2.414214 : 1075479162

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10391
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
ble_else.10391:
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
ble_else.10390:
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
ble_else.10389:
	BR	$28, atan_sub.134
ble_else.10388:
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
	BNE	$28, bge_else.10392
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	RET	$28, ($29)
bge_else.10392:
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
	FBEQ	$f30, ble_else.10395
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
ble_else.10395:
	LDS	$f1, 0($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10396
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
ble_else.10396:
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f2
    # 1.570796 : 1070141403

	CMPSLE	$f2, $f0, $f30
	FBEQ	$f30, ble_else.10397
	SUBS	$f1, $f0, $f0
	LDA	$0, 1($31)
	ADDS	$f0, $f31, $f1
	BR	$28, sin_sub.270
ble_else.10397:
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
xor.3104:
	BNE	$0, beq_else.10398
	LDA	$0, 0($1)
	RET	$28, ($29)
beq_else.10398:
	BNE	$1, beq_else.10399
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10399:
	LDA	$0, 0($31)
	RET	$28, ($29)
sgn.3107:
	FBNE	$f0, nt_fbeq_else.10400
	LDA	$0, 1($31)
	BR	$28, nt_fbeq_cont.10401
nt_fbeq_else.10400:
	LDA	$0, 0($31)
nt_fbeq_cont.10401:
	BNE	$0, beq_else.10402
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, ble_else.10403
	LDAH	$28, -16512($31)
	ITOFS	$28, $f0
    # -1.000000 : -1082130432

	RET	$28, ($29)
ble_else.10403:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	RET	$28, ($29)
beq_else.10402:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	RET	$28, ($29)
add_mod5.3112:
	ADDL	$0, $1, $0
	CMPLT	$0, 5, $28
	BNE	$28, bge_else.10404
	LDA	$0, -5($0)
	RET	$28, ($29)
bge_else.10404:
	RET	$28, ($29)
vecset.3115:
	STS	$f0, 0($0)
	STS	$f1, 1($0)
	STS	$f2, 2($0)
	RET	$28, ($29)
vecfill.3120:
	STS	$f0, 0($0)
	STS	$f0, 1($0)
	STS	$f0, 2($0)
	RET	$28, ($29)
veccpy.3125:
	LDS	$f0, 0($1)
	STS	$f0, 0($0)
	LDS	$f0, 1($1)
	STS	$f0, 1($0)
	LDS	$f0, 2($1)
	STS	$f0, 2($0)
	RET	$28, ($29)
vecunit_sgn.3133:
	LDS	$f0, 0($0)
	MULS	$f0, $f0, $f0
	LDS	$f1, 1($0)
	MULS	$f1, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	MULS	$f1, $f1, $f1
	ADDS	$f0, $f1, $f0
	SQRTS	$f0, $f0
	FBNE	$f0, nt_fbeq_else.10408
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.10409
nt_fbeq_else.10408:
	LDA	$2, 0($31)
nt_fbeq_cont.10409:
	BNE	$2, beq_else.10410
	BNE	$1, beq_else.10412
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	BR	$28, beq_cont.10413
beq_else.10412:
	LDAH	$28, -16512($31)
	ITOFS	$28, $f1
    # -1.000000 : -1082130432

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
beq_cont.10413:
	BR	$28, beq_cont.10411
beq_else.10410:
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

beq_cont.10411:
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
veciprod.3136:
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
	RET	$28, ($29)
veciprod2.3139:
	LDS	$f3, 0($0)
	MULS	$f3, $f0, $f0
	LDS	$f3, 1($0)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 2($0)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	RET	$28, ($29)
vecaccum.3144:
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
vecadd.3148:
	LDS	$f0, 0($0)
	LDS	$f1, 0($1)
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDS	$f0, 1($0)
	LDS	$f1, 1($1)
	ADDS	$f0, $f1, $f0
	STS	$f0, 1($0)
	LDS	$f0, 2($0)
	LDS	$f1, 2($1)
	ADDS	$f0, $f1, $f0
	STS	$f0, 2($0)
	RET	$28, ($29)
vecscale.3154:
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
vecaccumv.3157:
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
read_screen_settings.3234:
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
read_light.3236:
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
rotate_quadratic_matrix.3238:
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
read_nth_object.3241:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.10423
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10423:
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
	FBEQ	$f30, nt_fble_else.10424
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10425
nt_fble_else.10424:
	LDA	$0, 1($31)
nt_fble_cont.10425:
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
	BNE	$1, beq_else.10426
	BR	$28, beq_cont.10427
beq_else.10426:
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
beq_cont.10427:
	LDL	$1, 2($30)
	LDA	$28, -2($1)
	BNE	$28, beq_else.10428
	LDA	$2, 1($31)
	BR	$28, beq_cont.10429
beq_else.10428:
	LDL	$2, 7($30)
beq_cont.10429:
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
	BNE	$28, beq_else.10430
	LDS	$f0, 0($2)
	FBNE	$f0, nt_fbeq_else.10432
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.10433
nt_fbeq_else.10432:
	LDA	$1, 0($31)
nt_fbeq_cont.10433:
	BNE	$1, beq_else.10434
	STS	$f0, 12($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, sgn.3107
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 12($30)
	MULS	$f1, $f1, $f1
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	BR	$28, beq_cont.10435
beq_else.10434:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

beq_cont.10435:
	LDL	$0, 5($30)
	STS	$f0, 0($0)
	LDS	$f0, 1($0)
	FBNE	$f0, nt_fbeq_else.10436
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.10437
nt_fbeq_else.10436:
	LDA	$1, 0($31)
nt_fbeq_cont.10437:
	BNE	$1, beq_else.10438
	STS	$f0, 14($30)
	STL	$29, 16($30)
	LDA	$30, 17($30)
	BSR	$29, sgn.3107
	LDA	$30, -17($30)
	LDL	$29, 16($30)
	LDS	$f1, 14($30)
	MULS	$f1, $f1, $f1
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	BR	$28, beq_cont.10439
beq_else.10438:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

beq_cont.10439:
	LDL	$0, 5($30)
	STS	$f0, 1($0)
	LDS	$f0, 2($0)
	FBNE	$f0, nt_fbeq_else.10440
	LDA	$1, 1($31)
	BR	$28, nt_fbeq_cont.10441
nt_fbeq_else.10440:
	LDA	$1, 0($31)
nt_fbeq_cont.10441:
	BNE	$1, beq_else.10442
	STS	$f0, 16($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, sgn.3107
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDS	$f1, 16($30)
	MULS	$f1, $f1, $f1
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDL	$0, 5($30)
	STS	$f0, 2($0)
	BR	$28, beq_cont.10443
beq_else.10442:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 2($0)
beq_cont.10443:
	BR	$28, beq_cont.10431
beq_else.10430:
	LDA	$28, -2($4)
	BNE	$28, beq_else.10444
	LDL	$1, 7($30)
	BNE	$1, beq_else.10446
	LDA	$1, 1($31)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, vecunit_sgn.3133
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	BR	$28, beq_cont.10447
beq_else.10446:
	LDA	$1, 0($31)
	LDA	$0, 0($2)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, vecunit_sgn.3133
	LDA	$30, -19($30)
	LDL	$29, 18($30)
beq_cont.10447:
	BR	$28, beq_cont.10445
beq_else.10444:
beq_cont.10445:
beq_cont.10431:
	LDL	$0, 4($30)
	BNE	$0, beq_else.10448
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10448:
	LDL	$0, 5($30)
	LDL	$1, 10($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, rotate_quadratic_matrix.3238
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDA	$0, 1($31)
	RET	$28, ($29)
read_object.3243:
	CMPLT	$0, 60, $28
	BNE	$28, bge_else.10449
	RET	$28, ($29)
bge_else.10449:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, read_nth_object.3241
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	BNE	$0, beq_else.10451
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$1, 0($30)
	STL	$1, 0($0)
	RET	$28, ($29)
beq_else.10451:
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	BR	$28, read_object.3243
read_net_item.3247:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_read_int
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$28, 1($0)
	BNE	$28, beq_else.10453
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	LDA	$1, -1($31)
	BR	$28, min_caml_create_array
beq_else.10453:
	LDL	$1, 0($30)
	LDA	$2, 1($1)
	STL	$0, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, read_net_item.3247
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
read_or_network.3249:
	LDA	$1, 0($31)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, read_net_item.3247
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDL	$0, 0($1)
	LDA	$28, 1($0)
	BNE	$28, beq_else.10454
	LDL	$0, 0($30)
	LDA	$0, 1($0)
	BR	$28, min_caml_create_array
beq_else.10454:
	LDL	$0, 0($30)
	LDA	$2, 1($0)
	STL	$1, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, read_or_network.3249
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$0, $1, $28
	STL	$2, 0($28)
	RET	$28, ($29)
read_and_network.3251:
	LDA	$1, 0($31)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, read_net_item.3247
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($0)
	LDA	$28, 1($1)
	BNE	$28, beq_else.10455
	RET	$28, ($29)
beq_else.10455:
	MOV	$1, min_caml_and_net
	LDL	$1, 0($1)
	LDL	$2, 0($30)
	ADDL	$1, $2, $28
	STL	$0, 0($28)
	LDA	$0, 1($2)
	BR	$28, read_and_network.3251
read_parameter.3253:
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, read_screen_settings.3234
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, read_light.3236
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, read_object.3243
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, read_and_network.3251
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$0, min_caml_or_net
	LDL	$0, 0($0)
	LDA	$1, 0($31)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, read_or_network.3249
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$1, 0($30)
	STL	$0, 0($1)
	RET	$28, ($29)
solver_rect_surface.3255:
	ADDL	$1, $2, $28
	LDS	$f3, 0($28)
	FBNE	$f3, nt_fbeq_else.10458
	LDA	$5, 1($31)
	BR	$28, nt_fbeq_cont.10459
nt_fbeq_else.10458:
	LDA	$5, 0($31)
nt_fbeq_cont.10459:
	BNE	$5, beq_else.10460
	LDL	$5, 4($0)
	LDL	$0, 6($0)
	ADDL	$1, $2, $28
	LDS	$f3, 0($28)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.10461
	LDA	$6, 0($31)
	BR	$28, nt_fble_cont.10462
nt_fble_else.10461:
	LDA	$6, 1($31)
nt_fble_cont.10462:
	STS	$f2, 0($30)
	STL	$4, 2($30)
	STS	$f1, 4($30)
	STL	$3, 6($30)
	STL	$1, 7($30)
	STS	$f0, 8($30)
	STL	$2, 10($30)
	STL	$5, 11($30)
	LDA	$1, 0($6)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, xor.3104
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$1, 10($30)
	LDL	$2, 11($30)
	ADDL	$2, $1, $28
	LDS	$f0, 0($28)
	BNE	$0, beq_else.10464
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.10465
beq_else.10464:
beq_cont.10465:
	LDS	$f1, 8($30)
	SUBS	$f0, $f1, $f0
	LDL	$0, 7($30)
	ADDL	$0, $1, $28
	LDS	$f1, 0($28)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDL	$1, 6($30)
	ADDL	$0, $1, $28
	LDS	$f1, 0($28)
	MULS	$f0, $f1, $f1
	LDS	$f2, 4($30)
	ADDS	$f1, $f2, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.10466
	BR	$28, nt_fble_cont.10467
nt_fble_else.10466:
	SUBS	$f31, $f1, $f1
nt_fble_cont.10467:
	ADDL	$2, $1, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.10468
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10469
nt_fble_else.10468:
	LDA	$1, 1($31)
nt_fble_cont.10469:
	BNE	$1, beq_else.10470
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10470:
	LDL	$1, 2($30)
	ADDL	$0, $1, $28
	LDS	$f1, 0($28)
	MULS	$f0, $f1, $f1
	LDS	$f2, 0($30)
	ADDS	$f1, $f2, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.10471
	BR	$28, nt_fble_cont.10472
nt_fble_else.10471:
	SUBS	$f31, $f1, $f1
nt_fble_cont.10472:
	ADDL	$2, $1, $28
	LDS	$f2, 0($28)
	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.10473
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10474
nt_fble_else.10473:
	LDA	$0, 1($31)
nt_fble_cont.10474:
	BNE	$0, beq_else.10475
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10475:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10460:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_rect.3264:
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
	BSR	$29, solver_rect_surface.3255
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.10476
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
	BSR	$29, solver_rect_surface.3255
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.10477
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
	BSR	$29, solver_rect_surface.3255
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.10478
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10478:
	LDA	$0, 3($31)
	RET	$28, ($29)
beq_else.10477:
	LDA	$0, 2($31)
	RET	$28, ($29)
beq_else.10476:
	LDA	$0, 1($31)
	RET	$28, ($29)
solver_surface.3270:
	LDL	$0, 4($0)
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$0, 6($30)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, veciprod.3136
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10479
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10480
nt_fble_else.10479:
	LDA	$0, 1($31)
nt_fble_cont.10480:
	BNE	$0, beq_else.10481
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10481:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f1, 4($30)
	LDS	$f2, 2($30)
	LDS	$f3, 0($30)
	LDL	$1, 6($30)
	STL	$0, 7($30)
	STS	$f0, 8($30)
	LDA	$0, 0($1)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, veciprod2.3139
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	SUBS	$f31, $f0, $f0
	LDS	$f1, 8($30)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDL	$0, 7($30)
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
quadratic.3276:
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
	BNE	$1, beq_else.10482
	ADDS	$f3, $f31, $f0
	RET	$28, ($29)
beq_else.10482:
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
bilinear.3281:
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
	BNE	$1, beq_else.10483
	ADDS	$f6, $f31, $f0
	RET	$28, ($29)
beq_else.10483:
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
solver_second.3289:
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
	BSR	$29, quadratic.3276
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	FBNE	$f0, nt_fbeq_else.10484
	LDA	$0, 1($31)
	BR	$28, nt_fbeq_cont.10485
nt_fbeq_else.10484:
	LDA	$0, 0($31)
nt_fbeq_cont.10485:
	BNE	$0, beq_else.10486
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
	BSR	$29, bilinear.3281
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
	BSR	$29, quadratic.3276
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 6($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.10487
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	BR	$28, beq_cont.10488
beq_else.10487:
beq_cont.10488:
	LDS	$f1, 10($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 8($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, nt_fble_else.10489
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10490
nt_fble_else.10489:
	LDA	$1, 1($31)
nt_fble_cont.10490:
	BNE	$1, beq_else.10491
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10491:
	SQRTS	$f0, $f0
	LDL	$0, 6($0)
	BNE	$0, beq_else.10492
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.10493
beq_else.10492:
beq_cont.10493:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SUBS	$f0, $f1, $f0
	INVS	$f3, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10486:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver.3295:
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
	BNE	$28, beq_else.10494
	BR	$28, solver_rect.3264
beq_else.10494:
	LDA	$28, -2($2)
	BNE	$28, beq_else.10495
	BR	$28, solver_surface.3270
beq_else.10495:
	BR	$28, solver_second.3289
solver_rect_fast.3299:
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
	FBEQ	$f30, nt_fble_else.10496
	BR	$28, nt_fble_cont.10497
nt_fble_else.10496:
	SUBS	$f31, $f4, $f4
nt_fble_cont.10497:
	LDL	$3, 4($0)
	LDS	$f5, 1($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10498
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10499
nt_fble_else.10498:
	LDA	$3, 1($31)
nt_fble_cont.10499:
	BNE	$3, beq_else.10500
	LDA	$3, 0($31)
	BR	$28, beq_cont.10501
beq_else.10500:
	LDS	$f4, 2($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f2, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10502
	BR	$28, nt_fble_cont.10503
nt_fble_else.10502:
	SUBS	$f31, $f4, $f4
nt_fble_cont.10503:
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10504
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10505
nt_fble_else.10504:
	LDA	$3, 1($31)
nt_fble_cont.10505:
	BNE	$3, beq_else.10506
	LDA	$3, 0($31)
	BR	$28, beq_cont.10507
beq_else.10506:
	LDS	$f4, 1($2)
	FBNE	$f4, nt_fbeq_else.10508
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.10509
nt_fbeq_else.10508:
	LDA	$3, 1($31)
nt_fbeq_cont.10509:
beq_cont.10507:
beq_cont.10501:
	BNE	$3, beq_else.10510
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
	FBEQ	$f30, nt_fble_else.10511
	BR	$28, nt_fble_cont.10512
nt_fble_else.10511:
	SUBS	$f31, $f4, $f4
nt_fble_cont.10512:
	LDL	$3, 4($0)
	LDS	$f5, 0($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10513
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10514
nt_fble_else.10513:
	LDA	$3, 1($31)
nt_fble_cont.10514:
	BNE	$3, beq_else.10515
	LDA	$3, 0($31)
	BR	$28, beq_cont.10516
beq_else.10515:
	LDS	$f4, 2($1)
	MULS	$f3, $f4, $f4
	ADDS	$f4, $f2, $f4
	MULS	$f31, $f31, $f5
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10517
	BR	$28, nt_fble_cont.10518
nt_fble_else.10517:
	SUBS	$f31, $f4, $f4
nt_fble_cont.10518:
	LDL	$3, 4($0)
	LDS	$f5, 2($3)
	CMPSLE	$f5, $f4, $f30
	FBEQ	$f30, nt_fble_else.10519
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10520
nt_fble_else.10519:
	LDA	$3, 1($31)
nt_fble_cont.10520:
	BNE	$3, beq_else.10521
	LDA	$3, 0($31)
	BR	$28, beq_cont.10522
beq_else.10521:
	LDS	$f4, 3($2)
	FBNE	$f4, nt_fbeq_else.10523
	LDA	$3, 0($31)
	BR	$28, nt_fbeq_cont.10524
nt_fbeq_else.10523:
	LDA	$3, 1($31)
nt_fbeq_cont.10524:
beq_cont.10522:
beq_cont.10516:
	BNE	$3, beq_else.10525
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
	FBEQ	$f30, nt_fble_else.10526
	BR	$28, nt_fble_cont.10527
nt_fble_else.10526:
	SUBS	$f31, $f0, $f0
nt_fble_cont.10527:
	LDL	$3, 4($0)
	LDS	$f3, 0($3)
	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.10528
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10529
nt_fble_else.10528:
	LDA	$3, 1($31)
nt_fble_cont.10529:
	BNE	$3, beq_else.10530
	LDA	$0, 0($31)
	BR	$28, beq_cont.10531
beq_else.10530:
	LDS	$f0, 1($1)
	MULS	$f2, $f0, $f0
	ADDS	$f0, $f1, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10532
	BR	$28, nt_fble_cont.10533
nt_fble_else.10532:
	SUBS	$f31, $f0, $f0
nt_fble_cont.10533:
	LDL	$0, 4($0)
	LDS	$f1, 1($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10534
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10535
nt_fble_else.10534:
	LDA	$0, 1($31)
nt_fble_cont.10535:
	BNE	$0, beq_else.10536
	LDA	$0, 0($31)
	BR	$28, beq_cont.10537
beq_else.10536:
	LDS	$f0, 5($2)
	FBNE	$f0, nt_fbeq_else.10538
	LDA	$0, 0($31)
	BR	$28, nt_fbeq_cont.10539
nt_fbeq_else.10538:
	LDA	$0, 1($31)
nt_fbeq_cont.10539:
beq_cont.10537:
beq_cont.10531:
	BNE	$0, beq_else.10540
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10540:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f2, 0($0)
	LDA	$0, 3($31)
	RET	$28, ($29)
beq_else.10525:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f3, 0($0)
	LDA	$0, 2($31)
	RET	$28, ($29)
beq_else.10510:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	STS	$f3, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
solver_surface_fast.3306:
	LDS	$f3, 0($1)
	MULS	$f31, $f31, $f4
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.10541
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10542
nt_fble_else.10541:
	LDA	$0, 1($31)
nt_fble_cont.10542:
	BNE	$0, beq_else.10543
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10543:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f3, 1($1)
	MULS	$f3, $f0, $f0
	LDS	$f3, 2($1)
	MULS	$f3, $f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 3($1)
	MULS	$f1, $f2, $f1
	ADDS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
solver_second_fast.3312:
	LDS	$f3, 0($1)
	FBNE	$f3, nt_fbeq_else.10544
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.10545
nt_fbeq_else.10544:
	LDA	$2, 0($31)
nt_fbeq_cont.10545:
	BNE	$2, beq_else.10546
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
	BSR	$29, quadratic.3276
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 6($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.10548
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	BR	$28, beq_cont.10549
beq_else.10548:
beq_cont.10549:
	LDS	$f1, 4($30)
	MULS	$f1, $f1, $f2
	LDS	$f3, 2($30)
	MULS	$f3, $f0, $f0
	SUBS	$f2, $f0, $f0
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, nt_fble_else.10550
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10551
nt_fble_else.10550:
	LDA	$1, 1($31)
nt_fble_cont.10551:
	BNE	$1, beq_else.10552
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10552:
	LDL	$0, 6($0)
	BNE	$0, beq_else.10553
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	SUBS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	BR	$28, beq_cont.10554
beq_else.10553:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f0, $f0
	ADDS	$f1, $f0, $f0
	LDL	$1, 0($30)
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
beq_cont.10554:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10546:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_fast.3318:
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
	BNE	$28, beq_else.10555
	LDL	$1, 0($1)
	LDA	$0, 0($3)
	BR	$28, solver_rect_fast.3299
beq_else.10555:
	LDA	$28, -2($0)
	BNE	$28, beq_else.10556
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	BR	$28, solver_surface_fast.3306
beq_else.10556:
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	BR	$28, solver_second_fast.3312
solver_surface_fast2.3322:
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10557
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10558
nt_fble_else.10557:
	LDA	$0, 1($31)
nt_fble_cont.10558:
	BNE	$0, beq_else.10559
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10559:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($1)
	LDS	$f1, 3($2)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	LDA	$0, 1($31)
	RET	$28, ($29)
solver_second_fast2.3329:
	LDS	$f3, 0($1)
	FBNE	$f3, nt_fbeq_else.10560
	LDA	$3, 1($31)
	BR	$28, nt_fbeq_cont.10561
nt_fbeq_else.10560:
	LDA	$3, 0($31)
nt_fbeq_cont.10561:
	BNE	$3, beq_else.10562
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
	FBEQ	$f30, nt_fble_else.10563
	LDA	$2, 0($31)
	BR	$28, nt_fble_cont.10564
nt_fble_else.10563:
	LDA	$2, 1($31)
nt_fble_cont.10564:
	BNE	$2, beq_else.10565
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10565:
	LDL	$0, 6($0)
	BNE	$0, beq_else.10566
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f1, $f1
	SUBS	$f0, $f1, $f0
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
	BR	$28, beq_cont.10567
beq_else.10566:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	SQRTS	$f1, $f1
	ADDS	$f0, $f1, $f0
	LDS	$f1, 4($1)
	MULS	$f0, $f1, $f0
	STS	$f0, 0($0)
beq_cont.10567:
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10562:
	LDA	$0, 0($31)
	RET	$28, ($29)
solver_fast2.3336:
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
	BNE	$28, beq_else.10568
	LDL	$1, 0($1)
	LDA	$28, 0($2)
	LDA	$2, 0($0)
	LDA	$0, 0($28)
	BR	$28, solver_rect_fast.3299
beq_else.10568:
	LDA	$28, -2($4)
	BNE	$28, beq_else.10569
	LDA	$1, 0($0)
	LDA	$0, 0($2)
	LDA	$2, 0($3)
	BR	$28, solver_surface_fast2.3322
beq_else.10569:
	LDA	$1, 0($0)
	LDA	$0, 0($2)
	LDA	$2, 0($3)
	BR	$28, solver_second_fast2.3329
setup_rect_table.3339:
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
	FBNE	$f0, nt_fbeq_else.10570
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.10571
nt_fbeq_else.10570:
	LDA	$2, 0($31)
nt_fbeq_cont.10571:
	BNE	$2, beq_else.10572
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10574
	LDA	$4, 0($31)
	BR	$28, nt_fble_cont.10575
nt_fble_else.10574:
	LDA	$4, 1($31)
nt_fble_cont.10575:
	STL	$0, 2($30)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, xor.3104
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 4($1)
	LDS	$f0, 0($2)
	BNE	$0, beq_else.10576
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.10577
beq_else.10576:
beq_cont.10577:
	LDL	$0, 2($30)
	STS	$f0, 0($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$2, 1($30)
	LDS	$f1, 0($2)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 1($0)
	BR	$28, beq_cont.10573
beq_else.10572:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($0)
beq_cont.10573:
	LDL	$1, 1($30)
	LDS	$f0, 1($1)
	FBNE	$f0, nt_fbeq_else.10578
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.10579
nt_fbeq_else.10578:
	LDA	$2, 0($31)
nt_fbeq_cont.10579:
	BNE	$2, beq_else.10580
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 1($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10582
	LDA	$4, 0($31)
	BR	$28, nt_fble_cont.10583
nt_fble_else.10582:
	LDA	$4, 1($31)
nt_fble_cont.10583:
	STL	$0, 2($30)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, xor.3104
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 4($1)
	LDS	$f0, 1($2)
	BNE	$0, beq_else.10584
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.10585
beq_else.10584:
beq_cont.10585:
	LDL	$0, 2($30)
	STS	$f0, 2($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$2, 1($30)
	LDS	$f1, 1($2)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 3($0)
	BR	$28, beq_cont.10581
beq_else.10580:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 3($0)
beq_cont.10581:
	LDL	$1, 1($30)
	LDS	$f0, 2($1)
	FBNE	$f0, nt_fbeq_else.10586
	LDA	$2, 1($31)
	BR	$28, nt_fbeq_cont.10587
nt_fbeq_else.10586:
	LDA	$2, 0($31)
nt_fbeq_cont.10587:
	BNE	$2, beq_else.10588
	LDL	$2, 0($30)
	LDL	$3, 6($2)
	LDS	$f0, 2($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10590
	LDA	$4, 0($31)
	BR	$28, nt_fble_cont.10591
nt_fble_else.10590:
	LDA	$4, 1($31)
nt_fble_cont.10591:
	STL	$0, 2($30)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, xor.3104
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$1, 4($1)
	LDS	$f0, 2($1)
	BNE	$0, beq_else.10592
	SUBS	$f31, $f0, $f0
	BR	$28, beq_cont.10593
beq_else.10592:
beq_cont.10593:
	LDL	$0, 2($30)
	STS	$f0, 4($0)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f0
    # 1.000000 : 1065353216

	LDL	$1, 1($30)
	LDS	$f1, 2($1)
	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	STS	$f0, 5($0)
	BR	$28, beq_cont.10589
beq_else.10588:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 5($0)
beq_cont.10589:
	RET	$28, ($29)
setup_surface_table.3342:
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
	FBEQ	$f30, nt_fble_else.10594
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10595
nt_fble_else.10594:
	LDA	$1, 1($31)
nt_fble_cont.10595:
	BNE	$1, beq_else.10596
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 0($0)
	BR	$28, beq_cont.10597
beq_else.10596:
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
beq_cont.10597:
	RET	$28, ($29)
setup_second_table.3345:
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
	BSR	$29, quadratic.3276
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
	BNE	$3, beq_else.10598
	STS	$f1, 1($2)
	STS	$f2, 2($2)
	STS	$f3, 3($2)
	BR	$28, beq_cont.10599
beq_else.10598:
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
beq_cont.10599:
	FBNE	$f0, nt_fbeq_else.10600
	LDA	$0, 1($31)
	BR	$28, nt_fbeq_cont.10601
nt_fbeq_else.10600:
	LDA	$0, 0($31)
nt_fbeq_cont.10601:
	BNE	$0, beq_else.10602
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	STS	$f0, 4($2)
	BR	$28, beq_cont.10603
beq_else.10602:
beq_cont.10603:
	LDA	$0, 0($2)
	RET	$28, ($29)
iter_setup_dirvec_constants.3348:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10604
	MOV	$2, min_caml_objects
	LDL	$2, 0($2)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDL	$3, 1($0)
	LDL	$4, 0($0)
	LDL	$5, 1($2)
	STL	$0, 0($30)
	LDA	$28, -1($5)
	BNE	$28, beq_else.10605
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_rect_table.3339
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	BR	$28, beq_cont.10606
beq_else.10605:
	LDA	$28, -2($5)
	BNE	$28, beq_else.10607
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_surface_table.3342
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	BR	$28, beq_cont.10608
beq_else.10607:
	STL	$1, 1($30)
	STL	$3, 2($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, setup_second_table.3345
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
beq_cont.10608:
beq_cont.10606:
	LDA	$1, -1($1)
	LDL	$0, 0($30)
	BR	$28, iter_setup_dirvec_constants.3348
bge_else.10604:
	RET	$28, ($29)
setup_dirvec_constants.3351:
	MOV	$1, min_caml_n_objects
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -1($1)
	BR	$28, iter_setup_dirvec_constants.3348
setup_startp_constants.3353:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10610
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
	STL	$0, 0($30)
	STL	$1, 1($30)
	LDA	$28, -2($4)
	BNE	$28, beq_else.10611
	LDL	$2, 4($2)
	LDS	$f0, 0($3)
	LDS	$f1, 1($3)
	LDS	$f2, 2($3)
	STL	$3, 2($30)
	LDA	$0, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, veciprod2.3139
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	STS	$f0, 3($0)
	BR	$28, beq_cont.10612
beq_else.10611:
	CMPLE	$4, 2, $28
	BEQ	$28, ble_else.10613
	BR	$28, ble_cont.10614
ble_else.10613:
	LDS	$f0, 0($3)
	LDS	$f1, 1($3)
	LDS	$f2, 2($3)
	STL	$3, 2($30)
	STL	$4, 3($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, quadratic.3276
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDL	$0, 3($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.10615
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	LDL	$0, 2($30)
	STS	$f0, 3($0)
	BR	$28, beq_cont.10616
beq_else.10615:
	LDL	$0, 2($30)
	STS	$f0, 3($0)
beq_cont.10616:
ble_cont.10614:
beq_cont.10612:
	LDL	$0, 1($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, setup_startp_constants.3353
bge_else.10610:
	RET	$28, ($29)
setup_startp.3356:
	MOV	$1, min_caml_startp_fast
	LDL	$1, 0($1)
	STL	$0, 0($30)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, veccpy.3125
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, setup_startp_constants.3353
is_rect_outside.3358:
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.10618
	BR	$28, nt_fble_cont.10619
nt_fble_else.10618:
	SUBS	$f31, $f0, $f0
nt_fble_cont.10619:
	LDL	$1, 4($0)
	LDS	$f3, 0($1)
	CMPSLE	$f3, $f0, $f30
	FBEQ	$f30, nt_fble_else.10620
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10621
nt_fble_else.10620:
	LDA	$1, 1($31)
nt_fble_cont.10621:
	BNE	$1, beq_else.10622
	LDA	$1, 0($31)
	BR	$28, beq_cont.10623
beq_else.10622:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10624
	ADDS	$f1, $f31, $f0
	BR	$28, nt_fble_cont.10625
nt_fble_else.10624:
	SUBS	$f31, $f1, $f0
nt_fble_cont.10625:
	LDL	$1, 4($0)
	LDS	$f1, 1($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10626
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10627
nt_fble_else.10626:
	LDA	$1, 1($31)
nt_fble_cont.10627:
	BNE	$1, beq_else.10628
	LDA	$1, 0($31)
	BR	$28, beq_cont.10629
beq_else.10628:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f2, $f30
	FBEQ	$f30, nt_fble_else.10630
	ADDS	$f2, $f31, $f0
	BR	$28, nt_fble_cont.10631
nt_fble_else.10630:
	SUBS	$f31, $f2, $f0
nt_fble_cont.10631:
	LDL	$1, 4($0)
	LDS	$f1, 2($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10632
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10633
nt_fble_else.10632:
	LDA	$1, 1($31)
nt_fble_cont.10633:
beq_cont.10629:
beq_cont.10623:
	BNE	$1, beq_else.10634
	LDL	$0, 6($0)
	BNE	$0, beq_else.10635
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10635:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10634:
	LDL	$0, 6($0)
	RET	$28, ($29)
is_plane_outside.3363:
	LDL	$1, 4($0)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, veciprod2.3139
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$0, 0($30)
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10636
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10637
nt_fble_else.10636:
	LDA	$1, 1($31)
nt_fble_cont.10637:
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, xor.3104
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	BNE	$0, beq_else.10638
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10638:
	LDA	$0, 0($31)
	RET	$28, ($29)
is_second_outside.3368:
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, quadratic.3276
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$0, 0($30)
	LDL	$1, 1($0)
	LDA	$28, -3($1)
	BNE	$28, beq_else.10639
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	SUBS	$f0, $f1, $f0
	BR	$28, beq_cont.10640
beq_else.10639:
beq_cont.10640:
	LDL	$0, 6($0)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10641
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10642
nt_fble_else.10641:
	LDA	$1, 1($31)
nt_fble_cont.10642:
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, xor.3104
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	BNE	$0, beq_else.10643
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10643:
	LDA	$0, 0($31)
	RET	$28, ($29)
is_outside.3373:
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
	BNE	$28, beq_else.10644
	BR	$28, is_rect_outside.3358
beq_else.10644:
	LDA	$28, -2($1)
	BNE	$28, beq_else.10645
	BR	$28, is_plane_outside.3363
beq_else.10645:
	BR	$28, is_second_outside.3368
check_all_inside.3378:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.10646
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10646:
	MOV	$3, min_caml_objects
	LDL	$3, 0($3)
	ADDL	$3, $2, $28
	LDL	$2, 0($28)
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	LDA	$0, 0($2)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, is_outside.3373
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	BNE	$0, beq_else.10647
	LDL	$0, 7($30)
	LDA	$0, 1($0)
	LDS	$f0, 4($30)
	LDS	$f1, 2($30)
	LDS	$f2, 0($30)
	LDL	$1, 6($30)
	BR	$28, check_all_inside.3378
beq_else.10647:
	LDA	$0, 0($31)
	RET	$28, ($29)
shadow_check_and_group.3384:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.10648
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10648:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	MOV	$3, min_caml_light_dirvec
	LDL	$3, 0($3)
	MOV	$4, min_caml_intersection_point
	LDL	$4, 0($4)
	STL	$1, 0($30)
	STL	$0, 1($30)
	STL	$2, 2($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	LDA	$2, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solver_fast.3318
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	BNE	$0, beq_else.10649
	LDA	$0, 0($31)
	BR	$28, beq_cont.10650
beq_else.10649:
	LDA	$28, -13107($31)
	LDAH	$28, -16819($28)
	ITOFS	$28, $f1
    # -0.200000 : -1102263091

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10651
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10652
nt_fble_else.10651:
	LDA	$0, 1($31)
nt_fble_cont.10652:
beq_cont.10650:
	BNE	$0, beq_else.10653
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.10654
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10654:
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_and_group.3384
beq_else.10653:
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
	LDA	$0, 0($31)
	LDL	$1, 0($30)
	ADDS	$f2, $f31, $f30
	ADDS	$f0, $f31, $f2
	ADDS	$f1, $f31, $f0
	ADDS	$f30, $f31, $f1
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, check_all_inside.3378
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.10655
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_and_group.3384
beq_else.10655:
	LDA	$0, 1($31)
	RET	$28, ($29)
shadow_check_one_or_group.3387:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$28, 1($2)
	BNE	$28, beq_else.10656
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10656:
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
	BSR	$29, shadow_check_and_group.3384
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	BNE	$0, beq_else.10657
	LDL	$0, 1($30)
	LDA	$0, 1($0)
	LDL	$1, 0($30)
	BR	$28, shadow_check_one_or_group.3387
beq_else.10657:
	LDA	$0, 1($31)
	RET	$28, ($29)
shadow_check_one_or_matrix.3390:
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$3, 0($2)
	LDA	$28, 1($3)
	BNE	$28, beq_else.10658
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10658:
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$28, -99($3)
	BNE	$28, beq_else.10659
	LDA	$0, 1($31)
	BR	$28, beq_cont.10660
beq_else.10659:
	MOV	$4, min_caml_light_dirvec
	LDL	$4, 0($4)
	MOV	$5, min_caml_intersection_point
	LDL	$5, 0($5)
	LDA	$2, 0($5)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solver_fast.3318
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.10661
	LDA	$0, 0($31)
	BR	$28, beq_cont.10662
beq_else.10661:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10663
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10664
nt_fble_else.10663:
	LDA	$0, 1($31)
nt_fble_cont.10664:
	BNE	$0, beq_else.10665
	LDA	$0, 0($31)
	BR	$28, beq_cont.10666
beq_else.10665:
	LDA	$0, 1($31)
	LDL	$1, 0($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_one_or_group.3387
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.10667
	LDA	$0, 0($31)
	BR	$28, beq_cont.10668
beq_else.10667:
	LDA	$0, 1($31)
beq_cont.10668:
beq_cont.10666:
beq_cont.10662:
beq_cont.10660:
	BNE	$0, beq_else.10669
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	BR	$28, shadow_check_one_or_matrix.3390
beq_else.10669:
	LDA	$0, 1($31)
	LDL	$1, 0($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, shadow_check_one_or_group.3387
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.10670
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	BR	$28, shadow_check_one_or_matrix.3390
beq_else.10670:
	LDA	$0, 1($31)
	RET	$28, ($29)
solve_each_element.3393:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.10671
	RET	$28, ($29)
beq_else.10671:
	MOV	$4, min_caml_startp
	LDL	$4, 0($4)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	STL	$3, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($3)
	LDA	$2, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solver.3295
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.10673
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.10674
	RET	$28, ($29)
beq_else.10674:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_each_element.3393
beq_else.10673:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10676
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10677
nt_fble_else.10676:
	LDA	$1, 1($31)
nt_fble_cont.10677:
	BNE	$1, beq_else.10678
	BR	$28, beq_cont.10679
beq_else.10678:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10680
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10681
nt_fble_else.10680:
	LDA	$1, 1($31)
nt_fble_cont.10681:
	BNE	$1, beq_else.10682
	BR	$28, beq_cont.10683
beq_else.10682:
	LDA	$28, -10486($31)
	LDAH	$28, 15396($28)
	ITOFS	$28, $f1
    # 0.010000 : 1008981770

	ADDS	$f0, $f1, $f0
	LDL	$1, 0($30)
	LDS	$f1, 0($1)
	MULS	$f1, $f0, $f1
	MOV	$2, min_caml_startp
	LDL	$2, 0($2)
	LDS	$f2, 0($2)
	ADDS	$f1, $f2, $f1
	LDS	$f2, 1($1)
	MULS	$f2, $f0, $f2
	MOV	$2, min_caml_startp
	LDL	$2, 0($2)
	LDS	$f3, 1($2)
	ADDS	$f2, $f3, $f2
	LDS	$f3, 2($1)
	MULS	$f3, $f0, $f3
	MOV	$2, min_caml_startp
	LDL	$2, 0($2)
	LDS	$f4, 2($2)
	ADDS	$f3, $f4, $f3
	LDA	$2, 0($31)
	LDL	$3, 1($30)
	STL	$0, 4($30)
	STS	$f3, 6($30)
	STS	$f2, 8($30)
	STS	$f1, 10($30)
	STS	$f0, 12($30)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, check_all_inside.3378
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	BNE	$0, beq_else.10685
	BR	$28, beq_cont.10686
beq_else.10685:
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 12($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f0, 10($30)
	LDS	$f1, 8($30)
	LDS	$f2, 6($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, vecset.3115
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	STL	$1, 0($0)
	MOV	$0, min_caml_intsec_rectside
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	STL	$1, 0($0)
beq_cont.10686:
beq_cont.10683:
beq_cont.10679:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_each_element.3393
solve_one_or_network.3397:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.10687
	RET	$28, ($29)
beq_else.10687:
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
	BSR	$29, solve_each_element.3393
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_one_or_network.3397
trace_or_matrix.3401:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDL	$4, 0($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.10689
	RET	$28, ($29)
beq_else.10689:
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$28, -99($4)
	BNE	$28, beq_else.10691
	LDA	$4, 1($31)
	LDA	$1, 0($3)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solve_one_or_network.3397
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BR	$28, beq_cont.10692
beq_else.10691:
	MOV	$5, min_caml_startp
	LDL	$5, 0($5)
	STL	$3, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	LDA	$2, 0($5)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solver.3295
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.10693
	BR	$28, beq_cont.10694
beq_else.10693:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10695
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10696
nt_fble_else.10695:
	LDA	$0, 1($31)
nt_fble_cont.10696:
	BNE	$0, beq_else.10697
	BR	$28, beq_cont.10698
beq_else.10697:
	LDA	$0, 1($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network.3397
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.10698:
beq_cont.10694:
beq_cont.10692:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix.3401
judge_intersection.3405:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f0
    # 1000000000.000000 : 1315859240

	STS	$f0, 0($1)
	LDA	$1, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDA	$28, 0($2)
	LDA	$2, 0($0)
	LDA	$0, 0($1)
	LDA	$1, 0($28)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, trace_or_matrix.3401
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10699
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10700
nt_fble_else.10699:
	LDA	$0, 1($31)
nt_fble_cont.10700:
	BNE	$0, beq_else.10701
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10701:
	LDA	$28, -17376($31)
	LDAH	$28, 19647($28)
	ITOFS	$28, $f1
    # 100000000.000000 : 1287568416

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10702
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10702:
	LDA	$0, 1($31)
	RET	$28, ($29)
solve_each_element_fast.3407:
	LDL	$3, 0($2)
	ADDL	$1, $0, $28
	LDL	$4, 0($28)
	LDA	$28, 1($4)
	BNE	$28, beq_else.10703
	RET	$28, ($29)
beq_else.10703:
	STL	$3, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$0, 3($30)
	STL	$4, 4($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, solver_fast2.3336
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BNE	$0, beq_else.10705
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$0, 6($0)
	BNE	$0, beq_else.10706
	RET	$28, ($29)
beq_else.10706:
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	BR	$28, solve_each_element_fast.3407
beq_else.10705:
	MOV	$1, min_caml_solver_dist
	LDL	$1, 0($1)
	LDS	$f0, 0($1)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10708
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10709
nt_fble_else.10708:
	LDA	$1, 1($31)
nt_fble_cont.10709:
	BNE	$1, beq_else.10710
	BR	$28, beq_cont.10711
beq_else.10710:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDS	$f1, 0($1)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10712
	LDA	$1, 0($31)
	BR	$28, nt_fble_cont.10713
nt_fble_else.10712:
	LDA	$1, 1($31)
nt_fble_cont.10713:
	BNE	$1, beq_else.10714
	BR	$28, beq_cont.10715
beq_else.10714:
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
	LDA	$1, 0($31)
	LDL	$2, 2($30)
	STL	$0, 5($30)
	STS	$f3, 6($30)
	STS	$f2, 8($30)
	STS	$f1, 10($30)
	STS	$f0, 12($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	ADDS	$f3, $f31, $f2
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, check_all_inside.3378
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	BNE	$0, beq_else.10716
	BR	$28, beq_cont.10717
beq_else.10716:
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 12($30)
	STS	$f0, 0($0)
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	LDS	$f0, 10($30)
	LDS	$f1, 8($30)
	LDS	$f2, 6($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, vecset.3115
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_intersected_object_id
	LDL	$0, 0($0)
	LDL	$1, 4($30)
	STL	$1, 0($0)
	MOV	$0, min_caml_intsec_rectside
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	STL	$1, 0($0)
beq_cont.10717:
beq_cont.10715:
beq_cont.10711:
	LDL	$0, 3($30)
	LDA	$0, 1($0)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	BR	$28, solve_each_element_fast.3407
solve_one_or_network_fast.3411:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDA	$28, 1($3)
	BNE	$28, beq_else.10718
	RET	$28, ($29)
beq_else.10718:
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
	BSR	$29, solve_each_element_fast.3407
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, solve_one_or_network_fast.3411
trace_or_matrix_fast.3415:
	ADDL	$1, $0, $28
	LDL	$3, 0($28)
	LDL	$4, 0($3)
	LDA	$28, 1($4)
	BNE	$28, beq_else.10720
	RET	$28, ($29)
beq_else.10720:
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$0, 2($30)
	LDA	$28, -99($4)
	BNE	$28, beq_else.10722
	LDA	$4, 1($31)
	LDA	$1, 0($3)
	LDA	$0, 0($4)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, solve_one_or_network_fast.3411
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BR	$28, beq_cont.10723
beq_else.10722:
	STL	$3, 3($30)
	LDA	$1, 0($2)
	LDA	$0, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solver_fast2.3336
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.10724
	BR	$28, beq_cont.10725
beq_else.10724:
	MOV	$0, min_caml_solver_dist
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f1, 0($0)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10726
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10727
nt_fble_else.10726:
	LDA	$0, 1($31)
nt_fble_cont.10727:
	BNE	$0, beq_else.10728
	BR	$28, beq_cont.10729
beq_else.10728:
	LDA	$0, 1($31)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, solve_one_or_network_fast.3411
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.10729:
beq_cont.10725:
beq_cont.10723:
	LDL	$0, 2($30)
	LDA	$0, 1($0)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, trace_or_matrix_fast.3415
judge_intersection_fast.3419:
	MOV	$1, min_caml_tmin
	LDL	$1, 0($1)
	LDA	$28, 27432($31)
	LDAH	$28, 20078($28)
	ITOFS	$28, $f0
    # 1000000000.000000 : 1315859240

	STS	$f0, 0($1)
	LDA	$1, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDA	$28, 0($2)
	LDA	$2, 0($0)
	LDA	$0, 0($1)
	LDA	$1, 0($28)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, trace_or_matrix_fast.3415
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$0, min_caml_tmin
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	LDA	$28, -13107($31)
	LDAH	$28, -16947($28)
	ITOFS	$28, $f1
    # -0.100000 : -1110651699

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10730
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10731
nt_fble_else.10730:
	LDA	$0, 1($31)
nt_fble_cont.10731:
	BNE	$0, beq_else.10732
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10732:
	LDA	$28, -17376($31)
	LDAH	$28, 19647($28)
	ITOFS	$28, $f1
    # 100000000.000000 : 1287568416

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, ble_else.10733
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10733:
	LDA	$0, 1($31)
	RET	$28, ($29)
get_nvector_rect.3421:
	MOV	$1, min_caml_intsec_rectside
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	MOV	$2, min_caml_nvector
	LDL	$2, 0($2)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$0, 0($30)
	STL	$1, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, vecfill.3120
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	LDL	$1, 1($30)
	LDA	$2, -1($1)
	LDA	$1, -1($1)
	LDL	$3, 0($30)
	ADDL	$3, $1, $28
	LDS	$f0, 0($28)
	STL	$2, 2($30)
	STL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, sgn.3107
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	SUBS	$f31, $f0, $f0
	LDL	$0, 2($30)
	LDL	$1, 3($30)
	ADDL	$1, $0, $28
	STS	$f0, 0($28)
	RET	$28, ($29)
get_nvector_plane.3423:
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
	LDL	$0, 4($0)
	LDS	$f0, 2($0)
	SUBS	$f31, $f0, $f0
	STS	$f0, 2($1)
	RET	$28, ($29)
get_nvector_second.3425:
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
	BNE	$1, beq_else.10736
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f3, 0($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f4, 1($1)
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	STS	$f5, 2($1)
	BR	$28, beq_cont.10737
beq_else.10736:
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
beq_cont.10737:
	MOV	$1, min_caml_nvector
	LDL	$1, 0($1)
	LDL	$0, 6($0)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	BR	$28, vecunit_sgn.3133
get_nvector.3427:
	LDL	$2, 1($0)
	LDA	$28, -1($2)
	BNE	$28, beq_else.10738
	LDA	$0, 0($1)
	BR	$28, get_nvector_rect.3421
beq_else.10738:
	LDA	$28, -2($2)
	BNE	$28, beq_else.10739
	BR	$28, get_nvector_plane.3423
beq_else.10739:
	BR	$28, get_nvector_second.3425
utexture.3430:
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
	BNE	$28, beq_else.10740
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
	FBEQ	$f30, nt_fble_else.10741
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10742
nt_fble_else.10741:
	LDA	$0, 1($31)
nt_fble_cont.10742:
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
	FBEQ	$f30, nt_fble_else.10744
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10745
nt_fble_else.10744:
	LDA	$0, 1($31)
nt_fble_cont.10745:
	MOV	$1, min_caml_texture_color
	LDL	$1, 0($1)
	LDL	$2, 4($30)
	BNE	$2, beq_else.10746
	BNE	$0, beq_else.10747
	LDAH	$28, 17279($31)
	ITOFS	$28, $f0
    # 255.000000 : 1132396544

	STS	$f0, 1($1)
	RET	$28, ($29)
beq_else.10747:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($1)
	RET	$28, ($29)
beq_else.10746:
	BNE	$0, beq_else.10750
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STS	$f0, 1($1)
	RET	$28, ($29)
beq_else.10750:
	LDAH	$28, 17279($31)
	ITOFS	$28, $f0
    # 255.000000 : 1132396544

	STS	$f0, 1($1)
	RET	$28, ($29)
beq_else.10740:
	LDA	$28, -2($2)
	BNE	$28, beq_else.10753
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
beq_else.10753:
	LDA	$28, -3($2)
	BNE	$28, beq_else.10755
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
beq_else.10755:
	LDA	$28, -4($2)
	BNE	$28, beq_else.10757
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
	FBEQ	$f30, nt_fble_else.10758
	ADDS	$f0, $f31, $f3
	BR	$28, nt_fble_cont.10759
nt_fble_else.10758:
	SUBS	$f31, $f0, $f3
nt_fble_cont.10759:
	LDA	$28, -18665($31)
	LDAH	$28, 14546($28)
	ITOFS	$28, $f4
    # 0.000100 : 953267991

	CMPSLE	$f4, $f3, $f30
	FBEQ	$f30, nt_fble_else.10760
	LDA	$2, 0($31)
	BR	$28, nt_fble_cont.10761
nt_fble_else.10760:
	LDA	$2, 1($31)
nt_fble_cont.10761:
	STS	$f2, 10($30)
	STL	$0, 0($30)
	STL	$1, 1($30)
	BNE	$2, beq_else.10762
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10764
	BR	$28, nt_fble_cont.10765
nt_fble_else.10764:
	SUBS	$f31, $f0, $f0
nt_fble_cont.10765:
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
	BR	$28, beq_cont.10763
beq_else.10762:
	LDAH	$28, 16752($31)
	ITOFS	$28, $f0
    # 15.000000 : 1097859072

beq_cont.10763:
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
	FBEQ	$f30, nt_fble_else.10766
	ADDS	$f3, $f31, $f2
	BR	$28, nt_fble_cont.10767
nt_fble_else.10766:
	SUBS	$f31, $f3, $f2
nt_fble_cont.10767:
	LDA	$28, -18665($31)
	LDAH	$28, 14546($28)
	ITOFS	$28, $f4
    # 0.000100 : 953267991

	CMPSLE	$f4, $f2, $f30
	FBEQ	$f30, nt_fble_else.10768
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10769
nt_fble_else.10768:
	LDA	$0, 1($31)
nt_fble_cont.10769:
	STS	$f0, 14($30)
	BNE	$0, beq_else.10770
	INVS	$f3, $f30
	MULS	$f1, $f30, $f1
	MULS	$f31, $f31, $f2
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f2, $f1, $f30
	FBEQ	$f30, nt_fble_else.10772
	BR	$28, nt_fble_cont.10773
nt_fble_else.10772:
	SUBS	$f31, $f1, $f1
nt_fble_cont.10773:
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
	BR	$28, beq_cont.10771
beq_else.10770:
	LDAH	$28, 16752($31)
	ITOFS	$28, $f0
    # 15.000000 : 1097859072

beq_cont.10771:
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
	FBEQ	$f30, nt_fble_else.10774
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10775
nt_fble_else.10774:
	LDA	$0, 1($31)
nt_fble_cont.10775:
	BNE	$0, beq_else.10776
	BR	$28, beq_cont.10777
beq_else.10776:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

beq_cont.10777:
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
beq_else.10757:
	RET	$28, ($29)
add_light.3433:
	MULS	$f31, $f31, $f3
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f3, $f30
	FBEQ	$f30, nt_fble_else.10780
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10781
nt_fble_else.10780:
	LDA	$0, 1($31)
nt_fble_cont.10781:
	STS	$f2, 0($30)
	STS	$f1, 2($30)
	BNE	$0, beq_else.10782
	BR	$28, beq_cont.10783
beq_else.10782:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MOV	$1, min_caml_texture_color
	LDL	$1, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, vecaccum.3144
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.10783:
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	LDS	$f1, 2($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10784
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10785
nt_fble_else.10784:
	LDA	$0, 1($31)
nt_fble_cont.10785:
	BNE	$0, beq_else.10786
	RET	$28, ($29)
beq_else.10786:
	MULS	$f1, $f1, $f0
	MULS	$f0, $f0, $f0
	LDS	$f1, 0($30)
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
trace_reflections.3437:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10789
	MOV	$2, min_caml_reflections
	LDL	$2, 0($2)
	ADDL	$2, $0, $28
	LDL	$2, 0($28)
	LDL	$3, 1($2)
	STL	$0, 0($30)
	STS	$f1, 2($30)
	STL	$1, 4($30)
	STS	$f0, 6($30)
	STL	$3, 8($30)
	STL	$2, 9($30)
	LDA	$0, 0($3)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, judge_intersection_fast.3419
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.10792
	BR	$28, beq_cont.10793
beq_else.10792:
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
	BNE	$28, beq_else.10794
	LDA	$0, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	LDA	$1, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, shadow_check_one_or_matrix.3390
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	BNE	$0, beq_else.10796
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	LDL	$1, 8($30)
	LDL	$2, 0($1)
	LDA	$1, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, veciprod.3136
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	LDS	$f1, 2($0)
	LDS	$f2, 6($30)
	MULS	$f1, $f2, $f3
	MULS	$f3, $f0, $f0
	LDL	$0, 8($30)
	LDL	$1, 0($0)
	LDL	$0, 4($30)
	STS	$f0, 10($30)
	STS	$f1, 12($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, veciprod.3136
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDS	$f1, 12($30)
	MULS	$f1, $f0, $f1
	LDS	$f0, 10($30)
	LDS	$f2, 2($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, add_light.3433
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	BR	$28, beq_cont.10797
beq_else.10796:
beq_cont.10797:
	BR	$28, beq_cont.10795
beq_else.10794:
beq_cont.10795:
beq_cont.10793:
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDS	$f0, 6($30)
	LDS	$f1, 2($30)
	LDL	$1, 4($30)
	BR	$28, trace_reflections.3437
bge_else.10789:
	RET	$28, ($29)
trace_ray.3442:
	CMPLE	$0, 4, $28
	BEQ	$28, ble_else.10799
	LDL	$3, 2($2)
	STS	$f1, 0($30)
	STL	$2, 2($30)
	STS	$f0, 4($30)
	STL	$1, 6($30)
	STL	$0, 7($30)
	STL	$3, 8($30)
	LDA	$0, 0($1)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, judge_intersection.3405
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	BNE	$0, beq_else.10801
	LDA	$0, -1($31)
	LDL	$1, 7($30)
	LDL	$2, 8($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	BNE	$1, beq_else.10802
	RET	$28, ($29)
beq_else.10802:
	MOV	$0, min_caml_light
	LDL	$1, 0($0)
	LDL	$0, 6($30)
	STL	$29, 9($30)
	LDA	$30, 10($30)
	BSR	$29, veciprod.3136
	LDA	$30, -10($30)
	LDL	$29, 9($30)
	SUBS	$f31, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10804
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10805
nt_fble_else.10804:
	LDA	$0, 1($31)
nt_fble_cont.10805:
	BNE	$0, beq_else.10806
	RET	$28, ($29)
beq_else.10806:
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
beq_else.10801:
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
	LDL	$3, 6($30)
	STL	$2, 9($30)
	STS	$f0, 10($30)
	STL	$0, 12($30)
	STL	$1, 13($30)
	LDA	$0, 0($1)
	LDA	$1, 0($3)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, get_nvector.3427
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_startp
	LDL	$0, 0($0)
	MOV	$1, min_caml_intersection_point
	LDL	$1, 0($1)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, veccpy.3125
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	MOV	$0, min_caml_intersection_point
	LDL	$1, 0($0)
	LDL	$0, 13($30)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, utexture.3430
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
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 14($30)
	LDA	$30, 15($30)
	BSR	$29, veccpy.3125
	LDA	$30, -15($30)
	LDL	$29, 14($30)
	LDL	$0, 2($30)
	LDL	$1, 3($0)
	LDL	$2, 13($30)
	LDL	$3, 7($2)
	LDS	$f0, 0($3)
	LDAH	$28, 16128($31)
	ITOFS	$28, $f1
    # 0.500000 : 1056964608

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10809
	LDA	$3, 0($31)
	BR	$28, nt_fble_cont.10810
nt_fble_else.10809:
	LDA	$3, 1($31)
nt_fble_cont.10810:
	BNE	$3, beq_else.10811
	LDA	$3, 1($31)
	LDL	$4, 7($30)
	ADDL	$1, $4, $28
	STL	$3, 0($28)
	LDL	$1, 4($0)
	ADDL	$1, $4, $28
	LDL	$3, 0($28)
	MOV	$5, min_caml_texture_color
	LDL	$5, 0($5)
	STL	$1, 14($30)
	LDA	$1, 0($5)
	LDA	$0, 0($3)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, veccpy.3125
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDL	$0, 7($30)
	LDL	$1, 14($30)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDAH	$28, 15232($31)
	ITOFS	$28, $f0
    # 0.003906 : 998244352

	LDS	$f1, 10($30)
	MULS	$f0, $f1, $f0
	LDA	$0, 0($1)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, vecscale.3154
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDL	$0, 2($30)
	LDL	$1, 7($0)
	LDL	$2, 7($30)
	ADDL	$1, $2, $28
	LDL	$1, 0($28)
	MOV	$3, min_caml_nvector
	LDL	$3, 0($3)
	LDA	$0, 0($1)
	LDA	$1, 0($3)
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, veccpy.3125
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	BR	$28, beq_cont.10812
beq_else.10811:
	LDA	$3, 0($31)
	LDL	$4, 7($30)
	ADDL	$1, $4, $28
	STL	$3, 0($28)
beq_cont.10812:
	LDAH	$28, -16384($31)
	ITOFS	$28, $f0
    # -2.000000 : -1073741824

	MOV	$0, min_caml_nvector
	LDL	$1, 0($0)
	LDL	$0, 6($30)
	STS	$f0, 16($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, veciprod.3136
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDS	$f1, 16($30)
	MULS	$f1, $f0, $f0
	MOV	$0, min_caml_nvector
	LDL	$1, 0($0)
	LDL	$0, 6($30)
	STL	$29, 18($30)
	LDA	$30, 19($30)
	BSR	$29, vecaccum.3144
	LDA	$30, -19($30)
	LDL	$29, 18($30)
	LDL	$0, 13($30)
	LDL	$1, 7($0)
	LDS	$f0, 1($1)
	LDS	$f1, 4($30)
	MULS	$f1, $f0, $f0
	LDA	$1, 0($31)
	MOV	$2, min_caml_or_net
	LDL	$2, 0($2)
	LDL	$2, 0($2)
	STS	$f0, 18($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, shadow_check_one_or_matrix.3390
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	BNE	$0, beq_else.10814
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	STL	$29, 20($30)
	LDA	$30, 21($30)
	BSR	$29, veciprod.3136
	LDA	$30, -21($30)
	LDL	$29, 20($30)
	SUBS	$f31, $f0, $f0
	LDS	$f1, 10($30)
	MULS	$f0, $f1, $f0
	MOV	$0, min_caml_light
	LDL	$1, 0($0)
	LDL	$0, 6($30)
	STS	$f0, 20($30)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, veciprod.3136
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	SUBS	$f31, $f0, $f1
	LDS	$f0, 20($30)
	LDS	$f2, 18($30)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, add_light.3433
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	BR	$28, beq_cont.10815
beq_else.10814:
beq_cont.10815:
	MOV	$0, min_caml_intersection_point
	LDL	$0, 0($0)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$0, -1($0)
	LDS	$f0, 10($30)
	LDS	$f1, 18($30)
	LDL	$1, 6($30)
	STL	$29, 22($30)
	LDA	$30, 23($30)
	BSR	$29, trace_reflections.3437
	LDA	$30, -23($30)
	LDL	$29, 22($30)
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f0
    # 0.100000 : 1036831949

	LDS	$f1, 4($30)
	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10816
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10817
nt_fble_else.10816:
	LDA	$0, 1($31)
nt_fble_cont.10817:
	BNE	$0, beq_else.10818
	RET	$28, ($29)
beq_else.10818:
	LDL	$0, 7($30)
	CMPLT	$0, 4, $28
	BNE	$28, ble_else.10820
	BR	$28, ble_cont.10821
ble_else.10820:
	LDA	$1, 1($0)
	LDA	$2, -1($31)
	LDL	$3, 8($30)
	ADDL	$3, $1, $28
	STL	$2, 0($28)
ble_cont.10821:
	LDL	$1, 9($30)
	LDA	$28, -2($1)
	BNE	$28, beq_else.10822
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
	BR	$28, trace_ray.3442
beq_else.10822:
	RET	$28, ($29)
ble_else.10799:
	RET	$28, ($29)
trace_diffuse_ray.3448:
	STS	$f0, 0($30)
	STL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, judge_intersection_fast.3419
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	BNE	$0, beq_else.10825
	RET	$28, ($29)
beq_else.10825:
	MOV	$0, min_caml_objects
	LDL	$0, 0($0)
	MOV	$1, min_caml_intersected_object_id
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDL	$1, 2($30)
	LDL	$1, 0($1)
	STL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, get_nvector.3427
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	MOV	$0, min_caml_intersection_point
	LDL	$1, 0($0)
	LDL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, utexture.3430
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$0, 0($31)
	MOV	$1, min_caml_or_net
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, shadow_check_one_or_matrix.3390
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BNE	$0, beq_else.10827
	MOV	$0, min_caml_nvector
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, veciprod.3136
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	SUBS	$f31, $f0, $f0
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f0, $f1, $f30
	FBEQ	$f30, nt_fble_else.10828
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10829
nt_fble_else.10828:
	LDA	$0, 1($31)
nt_fble_cont.10829:
	BNE	$0, beq_else.10830
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	BR	$28, beq_cont.10831
beq_else.10830:
beq_cont.10831:
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
	BR	$28, vecaccum.3144
beq_else.10827:
	RET	$28, ($29)
iter_trace_diffuse_rays.3451:
	CMPLT	$3, 0, $28
	BNE	$28, bge_else.10833
	ADDL	$0, $3, $28
	LDL	$4, 0($28)
	LDL	$4, 0($4)
	STL	$2, 0($30)
	STL	$1, 1($30)
	STL	$3, 2($30)
	STL	$0, 3($30)
	LDA	$0, 0($4)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, veciprod.3136
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	MULS	$f31, $f31, $f1
    # 0.0 = 0.0 * 0.0

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10834
	LDA	$0, 0($31)
	BR	$28, nt_fble_cont.10835
nt_fble_else.10834:
	LDA	$0, 1($31)
nt_fble_cont.10835:
	BNE	$0, beq_else.10836
	LDL	$0, 2($30)
	LDL	$1, 3($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDAH	$28, 17174($31)
	ITOFS	$28, $f1
    # 150.000000 : 1125515264

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_ray.3448
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	BR	$28, beq_cont.10837
beq_else.10836:
	LDL	$0, 2($30)
	LDA	$1, 1($0)
	LDL	$2, 3($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDAH	$28, -15594($31)
	ITOFS	$28, $f1
    # -150.000000 : -1021968384

	INVS	$f1, $f30
	MULS	$f0, $f30, $f0
	LDA	$0, 0($1)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, trace_diffuse_ray.3448
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.10837:
	LDL	$0, 2($30)
	LDA	$3, -2($0)
	LDL	$0, 3($30)
	LDL	$1, 1($30)
	LDL	$2, 0($30)
	BR	$28, iter_trace_diffuse_rays.3451
bge_else.10833:
	RET	$28, ($29)
trace_diffuse_ray_80percent.3460:
	STL	$1, 0($30)
	STL	$2, 1($30)
	STL	$0, 2($30)
	BNE	$0, beq_else.10839
	BR	$28, beq_cont.10840
beq_else.10839:
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$3, 0($3)
	STL	$3, 3($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$3, 118($31)
	LDL	$0, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, iter_trace_diffuse_rays.3451
	LDA	$30, -5($30)
	LDL	$29, 4($30)
beq_cont.10840:
	LDL	$0, 2($30)
	LDA	$28, -1($0)
	BNE	$28, beq_else.10841
	BR	$28, beq_cont.10842
beq_else.10841:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 1($1)
	LDL	$2, 1($30)
	STL	$1, 4($30)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$3, 118($31)
	LDL	$0, 4($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, iter_trace_diffuse_rays.3451
	LDA	$30, -6($30)
	LDL	$29, 5($30)
beq_cont.10842:
	LDL	$0, 2($30)
	LDA	$28, -2($0)
	BNE	$28, beq_else.10843
	BR	$28, beq_cont.10844
beq_else.10843:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 2($1)
	LDL	$2, 1($30)
	STL	$1, 5($30)
	LDA	$0, 0($2)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$3, 118($31)
	LDL	$0, 5($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, iter_trace_diffuse_rays.3451
	LDA	$30, -7($30)
	LDL	$29, 6($30)
beq_cont.10844:
	LDL	$0, 2($30)
	LDA	$28, -3($0)
	BNE	$28, beq_else.10845
	BR	$28, beq_cont.10846
beq_else.10845:
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDL	$1, 3($1)
	LDL	$2, 1($30)
	STL	$1, 6($30)
	LDA	$0, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$3, 118($31)
	LDL	$0, 6($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, iter_trace_diffuse_rays.3451
	LDA	$30, -8($30)
	LDL	$29, 7($30)
beq_cont.10846:
	LDL	$0, 2($30)
	LDA	$28, -4($0)
	BNE	$28, beq_else.10847
	RET	$28, ($29)
beq_else.10847:
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	LDL	$0, 4($0)
	LDL	$1, 1($30)
	STL	$0, 7($30)
	LDA	$0, 0($1)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDA	$3, 118($31)
	LDL	$0, 7($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	BR	$28, iter_trace_diffuse_rays.3451
calc_diffuse_using_1point.3464:
	LDL	$2, 5($0)
	LDL	$3, 7($0)
	LDL	$4, 1($0)
	LDL	$5, 4($0)
	MOV	$6, min_caml_diffuse_ray
	LDL	$6, 0($6)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	STL	$5, 0($30)
	STL	$4, 1($30)
	STL	$1, 2($30)
	STL	$3, 3($30)
	STL	$0, 4($30)
	LDA	$1, 0($2)
	LDA	$0, 0($6)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, veccpy.3125
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDL	$0, 6($0)
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	LDL	$2, 3($30)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDL	$3, 1($30)
	ADDL	$3, $1, $28
	LDL	$3, 0($28)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, trace_diffuse_ray_80percent.3460
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDL	$1, 2($30)
	LDL	$2, 0($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	MOV	$2, min_caml_diffuse_ray
	LDL	$2, 0($2)
	BR	$28, vecaccumv.3157
calc_diffuse_using_5points.3467:
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
	STL	$0, 0($30)
	STL	$2, 1($30)
	STL	$3, 2($30)
	STL	$7, 3($30)
	STL	$6, 4($30)
	STL	$4, 5($30)
	STL	$5, 6($30)
	LDA	$0, 0($8)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, veccpy.3125
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDA	$1, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, vecadd.3148
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	LDL	$2, 4($30)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDA	$1, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, vecadd.3148
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	LDL	$2, 3($30)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDA	$1, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, vecadd.3148
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_diffuse_ray
	LDL	$0, 0($0)
	LDL	$1, 5($30)
	LDL	$2, 2($30)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	LDA	$1, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, vecadd.3148
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 0($30)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$0, 0($28)
	LDL	$0, 4($0)
	MOV	$1, min_caml_rgb
	LDL	$1, 0($1)
	LDL	$2, 5($30)
	ADDL	$0, $2, $28
	LDL	$0, 0($28)
	MOV	$2, min_caml_diffuse_ray
	LDL	$2, 0($2)
	LDA	$28, 0($1)
	LDA	$1, 0($0)
	LDA	$0, 0($28)
	BR	$28, vecaccumv.3157
do_without_neighbors.3473:
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.10849
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.10850
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	BNE	$2, beq_else.10851
	LDA	$1, 1($1)
	BR	$28, do_without_neighbors.3473
beq_else.10851:
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, calc_diffuse_using_1point.3464
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDA	$1, 1($0)
	LDL	$0, 0($30)
	BR	$28, do_without_neighbors.3473
bge_else.10850:
	RET	$28, ($29)
ble_else.10849:
	RET	$28, ($29)
neighbors_exist.3476:
	MOV	$2, min_caml_image_size
	LDL	$2, 0($2)
	LDL	$2, 1($2)
	LDA	$3, 1($1)
	CMPLE	$2, $3, $28
	BEQ	$28, ble_else.10854
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10854:
	CMPLE	$1, 0, $28
	BEQ	$28, ble_else.10855
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10855:
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$2, 1($0)
	CMPLE	$1, $2, $28
	BEQ	$28, ble_else.10856
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10856:
	CMPLE	$0, 0, $28
	BEQ	$28, ble_else.10857
	LDA	$0, 0($31)
	RET	$28, ($29)
ble_else.10857:
	LDA	$0, 1($31)
	RET	$28, ($29)
neighbors_are_available.3483:
	ADDL	$2, $0, $28
	LDL	$5, 0($28)
	LDL	$5, 2($5)
	ADDL	$5, $4, $28
	LDL	$5, 0($28)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$1, 2($1)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	SUBL	$1, $5, $28
	BNE	$28, beq_else.10858
	ADDL	$3, $0, $28
	LDL	$1, 0($28)
	LDL	$1, 2($1)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	SUBL	$1, $5, $28
	BNE	$28, beq_else.10859
	LDA	$1, -1($0)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 2($1)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	SUBL	$1, $5, $28
	BNE	$28, beq_else.10860
	LDA	$0, 1($0)
	ADDL	$2, $0, $28
	LDL	$0, 0($28)
	LDL	$0, 2($0)
	ADDL	$0, $4, $28
	LDL	$0, 0($28)
	SUBL	$0, $5, $28
	BNE	$28, beq_else.10861
	LDA	$0, 1($31)
	RET	$28, ($29)
beq_else.10861:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10860:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10859:
	LDA	$0, 0($31)
	RET	$28, ($29)
beq_else.10858:
	LDA	$0, 0($31)
	RET	$28, ($29)
try_exploit_neighbors.3489:
	ADDL	$3, $0, $28
	LDL	$6, 0($28)
	CMPLE	$5, 4, $28
	BEQ	$28, ble_else.10862
	LDL	$7, 2($6)
	ADDL	$7, $5, $28
	LDL	$7, 0($28)
	CMPLT	$7, 0, $28
	BNE	$28, bge_else.10863
	STL	$4, 0($30)
	STL	$2, 1($30)
	STL	$1, 2($30)
	STL	$6, 3($30)
	STL	$5, 4($30)
	STL	$0, 5($30)
	STL	$3, 6($30)
	LDA	$1, 0($2)
	LDA	$2, 0($3)
	LDA	$3, 0($4)
	LDA	$4, 0($5)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, neighbors_are_available.3483
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	BNE	$0, beq_else.10864
	LDL	$0, 5($30)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$0, 0($28)
	LDL	$1, 4($30)
	BR	$28, do_without_neighbors.3473
beq_else.10864:
	LDL	$0, 3($30)
	LDL	$0, 3($0)
	LDL	$4, 4($30)
	ADDL	$0, $4, $28
	LDL	$0, 0($28)
	BNE	$0, beq_else.10865
	LDA	$5, 1($4)
	LDL	$0, 5($30)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 6($30)
	LDL	$4, 0($30)
	BR	$28, try_exploit_neighbors.3489
beq_else.10865:
	LDL	$0, 5($30)
	LDL	$1, 1($30)
	LDL	$2, 6($30)
	LDL	$3, 0($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, calc_diffuse_using_5points.3467
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDL	$0, 4($30)
	LDA	$5, 1($0)
	LDL	$0, 5($30)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 6($30)
	LDL	$4, 0($30)
	BR	$28, try_exploit_neighbors.3489
bge_else.10863:
	RET	$28, ($29)
ble_else.10862:
	RET	$28, ($29)
p128.4132:
	LDA	$0, 49($31)
	LDAH	$28, 16($31)
mcpc.10868:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10868
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.10869:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10869
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 56($31)
	LDAH	$28, 16($31)
mcpc.10871:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10871
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
write_ppm_header.3496:
	LDA	$0, 80($31)
	LDAH	$28, 16($31)
mcpc.10872:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10872
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 54($31)
	LDAH	$28, 16($31)
mcpc.10873:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10873
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 10($31)
	LDAH	$28, 16($31)
mcpc.10874:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10874
	AND	$0, 255, $25
	STL	$25, 3($28)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, p128.4132
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.10875:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10875
	AND	$0, 255, $25
	STL	$25, 3($28)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, p128.4132
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 32($31)
	LDAH	$28, 16($31)
mcpc.10876:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10876
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 50($31)
	LDAH	$28, 16($31)
mcpc.10877:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10877
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.10878:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10878
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 53($31)
	LDAH	$28, 16($31)
mcpc.10879:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10879
	AND	$0, 255, $25
	STL	$25, 3($28)
	LDA	$0, 10($31)
	LDAH	$28, 16($31)
mcpc.10881:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10881
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
write_rgb_element.3498:
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_int_of_float
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	CMPLE	$0, 255, $28
	BEQ	$28, ble_else.10882
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10883
	LDAH	$28, 16($31)
mcpc.10885:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10885
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
bge_else.10883:
	LDA	$0, 0($31)
	LDAH	$28, 16($31)
mcpc.10887:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10887
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
ble_else.10882:
	LDA	$0, 255($31)
	LDAH	$28, 16($31)
mcpc.10889:
	LDL	$25, 2($28)
	AND	$25, 1, $25
	BEQ	$25, mcpc.10889
	AND	$0, 255, $25
	STL	$25, 3($28)
	RET	$28, ($29)
write_rgb.3500:
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 0($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, write_rgb_element.3498
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 1($0)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, write_rgb_element.3498
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	LDS	$f0, 2($0)
	BR	$28, write_rgb_element.3498
pretrace_diffuse_rays.3502:
	CMPLE	$1, 4, $28
	BEQ	$28, ble_else.10890
	LDL	$2, 2($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	CMPLT	$2, 0, $28
	BNE	$28, bge_else.10891
	LDL	$2, 3($0)
	ADDL	$2, $1, $28
	LDL	$2, 0($28)
	STL	$0, 0($30)
	STL	$1, 1($30)
	BNE	$2, beq_else.10892
	BR	$28, beq_cont.10893
beq_else.10892:
	LDL	$2, 6($0)
	LDL	$2, 0($2)
	MOV	$3, min_caml_diffuse_ray
	LDL	$3, 0($3)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$2, 2($30)
	LDA	$0, 0($3)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, vecfill.3120
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 0($30)
	LDL	$1, 7($0)
	LDL	$2, 1($0)
	MOV	$3, min_caml_dirvecs
	LDL	$3, 0($3)
	LDL	$4, 2($30)
	ADDL	$3, $4, $28
	LDL	$3, 0($28)
	LDL	$4, 1($30)
	ADDL	$1, $4, $28
	LDL	$1, 0($28)
	ADDL	$2, $4, $28
	LDL	$2, 0($28)
	STL	$2, 3($30)
	STL	$1, 4($30)
	STL	$3, 5($30)
	LDA	$0, 0($2)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, setup_startp.3356
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$3, 118($31)
	LDL	$0, 5($30)
	LDL	$1, 4($30)
	LDL	$2, 3($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, iter_trace_diffuse_rays.3451
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 0($30)
	LDL	$1, 5($0)
	LDL	$2, 1($30)
	ADDL	$1, $2, $28
	LDL	$1, 0($28)
	MOV	$3, min_caml_diffuse_ray
	LDL	$3, 0($3)
	LDA	$0, 0($1)
	LDA	$1, 0($3)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, veccpy.3125
	LDA	$30, -7($30)
	LDL	$29, 6($30)
beq_cont.10893:
	LDL	$0, 1($30)
	LDA	$1, 1($0)
	LDL	$0, 0($30)
	BR	$28, pretrace_diffuse_rays.3502
bge_else.10891:
	RET	$28, ($29)
ble_else.10890:
	RET	$28, ($29)
pretrace_pixels.3505:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10896
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
	BSR	$29, vecunit_sgn.3133
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	MOV	$0, min_caml_rgb
	LDL	$0, 0($0)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, vecfill.3120
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	MOV	$0, min_caml_startp
	LDL	$0, 0($0)
	MOV	$1, min_caml_viewpoint
	LDL	$1, 0($1)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, veccpy.3125
	LDA	$30, -13($30)
	LDL	$29, 12($30)
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
	BSR	$29, trace_ray.3442
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 1($30)
	LDL	$1, 2($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDL	$2, 0($2)
	MOV	$3, min_caml_rgb
	LDL	$3, 0($3)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 12($30)
	LDA	$30, 13($30)
	BSR	$29, veccpy.3125
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 1($30)
	LDL	$1, 2($30)
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
	BSR	$29, pretrace_diffuse_rays.3502
	LDA	$30, -13($30)
	LDL	$29, 12($30)
	LDL	$0, 1($30)
	LDA	$0, -1($0)
	LDA	$1, 1($31)
	LDL	$2, 0($30)
	STL	$0, 12($30)
	LDA	$0, 0($2)
	STL	$29, 13($30)
	LDA	$30, 14($30)
	BSR	$29, add_mod5.3112
	LDA	$30, -14($30)
	LDL	$29, 13($30)
	LDA	$2, 0($0)
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	LDL	$0, 2($30)
	LDL	$1, 12($30)
	BR	$28, pretrace_pixels.3505
bge_else.10896:
	RET	$28, ($29)
pretrace_line.3512:
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
	BR	$28, pretrace_pixels.3505
scan_pixel.3516:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 0($5)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.10899
	RET	$28, ($29)
ble_else.10899:
	MOV	$5, min_caml_rgb
	LDL	$5, 0($5)
	ADDL	$3, $0, $28
	LDL	$6, 0($28)
	LDL	$6, 0($6)
	STL	$2, 0($30)
	STL	$3, 1($30)
	STL	$4, 2($30)
	STL	$1, 3($30)
	STL	$0, 4($30)
	LDA	$1, 0($6)
	LDA	$0, 0($5)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, veccpy.3125
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDL	$1, 3($30)
	LDL	$2, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, neighbors_exist.3476
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BNE	$0, beq_else.10901
	LDL	$0, 4($30)
	LDL	$1, 1($30)
	ADDL	$1, $0, $28
	LDL	$2, 0($28)
	LDA	$3, 0($31)
	LDA	$1, 0($3)
	LDA	$0, 0($2)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, do_without_neighbors.3473
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	BR	$28, beq_cont.10902
beq_else.10901:
	LDA	$5, 0($31)
	LDL	$0, 4($30)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	LDL	$3, 1($30)
	LDL	$4, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, try_exploit_neighbors.3489
	LDA	$30, -6($30)
	LDL	$29, 5($30)
beq_cont.10902:
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, write_rgb.3500
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDL	$1, 3($30)
	LDL	$2, 0($30)
	LDL	$3, 1($30)
	LDL	$4, 2($30)
	BR	$28, scan_pixel.3516
scan_line.3522:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.10903
	RET	$28, ($29)
ble_else.10903:
	MOV	$5, min_caml_image_size
	LDL	$5, 0($5)
	LDL	$5, 1($5)
	LDA	$5, -1($5)
	STL	$4, 0($30)
	STL	$3, 1($30)
	STL	$2, 2($30)
	STL	$1, 3($30)
	STL	$0, 4($30)
	CMPLE	$5, $0, $28
	BEQ	$28, ble_else.10905
	BR	$28, ble_cont.10906
ble_else.10905:
	LDA	$5, 1($0)
	LDA	$2, 0($4)
	LDA	$1, 0($5)
	LDA	$0, 0($3)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, pretrace_line.3512
	LDA	$30, -6($30)
	LDL	$29, 5($30)
ble_cont.10906:
	LDA	$0, 0($31)
	LDL	$1, 4($30)
	LDL	$2, 3($30)
	LDL	$3, 2($30)
	LDL	$4, 1($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, scan_pixel.3516
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDL	$0, 4($30)
	LDA	$0, 1($0)
	LDA	$1, 2($31)
	LDL	$2, 0($30)
	STL	$0, 5($30)
	LDA	$0, 0($2)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, add_mod5.3112
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$4, 0($0)
	LDL	$0, 5($30)
	LDL	$1, 2($30)
	LDL	$2, 1($30)
	LDL	$3, 3($30)
	BR	$28, scan_line.3522
create_float5x3array.3528:
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
create_pixel.3530:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, create_float5x3array.3528
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 1($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDA	$1, 5($31)
	LDA	$2, 0($31)
	STL	$0, 2($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	STL	$0, 3($30)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, create_float5x3array.3528
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	STL	$0, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, create_float5x3array.3528
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDA	$1, 1($31)
	LDA	$2, 0($31)
	STL	$0, 5($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, create_float5x3array.3528
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($27)
	LDA	$27, 8($27)
	STL	$0, 7($1)
	LDL	$0, 6($30)
	STL	$0, 6($1)
	LDL	$0, 5($30)
	STL	$0, 5($1)
	LDL	$0, 4($30)
	STL	$0, 4($1)
	LDL	$0, 3($30)
	STL	$0, 3($1)
	LDL	$0, 2($30)
	STL	$0, 2($1)
	LDL	$0, 1($30)
	STL	$0, 1($1)
	LDL	$0, 0($30)
	STL	$0, 0($1)
	LDA	$0, 0($1)
	RET	$28, ($29)
init_line_elements.3532:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10907
	STL	$1, 0($30)
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, create_pixel.3530
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDA	$0, 0($2)
	BR	$28, init_line_elements.3532
bge_else.10907:
	RET	$28, ($29)
create_pixelline.3535:
	MOV	$0, min_caml_image_size
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	STL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, create_pixel.3530
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDA	$1, 0($0)
	LDL	$0, 0($30)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	MOV	$1, min_caml_image_size
	LDL	$1, 0($1)
	LDL	$1, 0($1)
	LDA	$1, -2($1)
	BR	$28, init_line_elements.3532
adjust_position.3539:
	MULS	$f0, $f0, $f0
	LDA	$28, -13107($31)
	LDAH	$28, 15821($28)
	ITOFS	$28, $f2
    # 0.100000 : 1036831949

	ADDS	$f0, $f2, $f0
	SQRTS	$f0, $f0
	LDAH	$28, 16256($31)
	ITOFS	$28, $f2
    # 1.000000 : 1065353216

	INVS	$f0, $f30
	MULS	$f2, $f30, $f2
	STS	$f0, 0($30)
	STS	$f1, 2($30)
	ADDS	$f2, $f31, $f0
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, min_caml_atan
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDS	$f1, 2($30)
	MULS	$f0, $f1, $f0
	STS	$f0, 4($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, min_caml_sin
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDA	$28, 4059($31)
	LDAH	$28, 16329($28)
	ITOFS	$28, $f1
    # 1.570796 : 1070141403

	LDS	$f2, 4($30)
	ADDS	$f2, $f1, $f1
	STS	$f0, 6($30)
	ADDS	$f1, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, min_caml_sin
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDS	$f1, 6($30)
	INVS	$f0, $f30
	MULS	$f1, $f30, $f0
	LDS	$f1, 0($30)
	MULS	$f0, $f1, $f0
	RET	$28, ($29)
calc_dirvec.3542:
	CMPLT	$0, 5, $28
	BNE	$28, bge_else.10908
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
	STS	$f2, 0($30)
	STS	$f0, 2($30)
	STS	$f1, 4($30)
	STL	$0, 6($30)
	STL	$2, 7($30)
	LDA	$0, 0($1)
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, vecset.3115
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, 40($0)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	LDS	$f0, 4($30)
	SUBS	$f31, $f0, $f2
	LDS	$f1, 2($30)
	LDS	$f3, 0($30)
	LDA	$0, 0($1)
	ADDS	$f1, $f31, $f0
	ADDS	$f3, $f31, $f1
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, vecset.3115
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, 80($0)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	LDS	$f0, 2($30)
	SUBS	$f31, $f0, $f1
	LDS	$f2, 4($30)
	SUBS	$f31, $f2, $f3
	LDS	$f4, 0($30)
	LDA	$0, 0($1)
	ADDS	$f3, $f31, $f2
	ADDS	$f4, $f31, $f0
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, vecset.3115
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, 1($0)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	LDS	$f0, 2($30)
	SUBS	$f31, $f0, $f1
	LDS	$f2, 4($30)
	SUBS	$f31, $f2, $f3
	LDS	$f4, 0($30)
	SUBS	$f31, $f4, $f5
	LDA	$0, 0($1)
	ADDS	$f5, $f31, $f2
	ADDS	$f1, $f31, $f0
	ADDS	$f3, $f31, $f1
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, vecset.3115
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$1, 41($0)
	LDL	$2, 6($30)
	ADDL	$2, $1, $28
	LDL	$1, 0($28)
	LDL	$1, 0($1)
	LDS	$f0, 2($30)
	SUBS	$f31, $f0, $f1
	LDS	$f2, 0($30)
	SUBS	$f31, $f2, $f3
	LDS	$f4, 4($30)
	LDA	$0, 0($1)
	ADDS	$f4, $f31, $f2
	ADDS	$f1, $f31, $f0
	ADDS	$f3, $f31, $f1
	STL	$29, 8($30)
	LDA	$30, 9($30)
	BSR	$29, vecset.3115
	LDA	$30, -9($30)
	LDL	$29, 8($30)
	LDL	$0, 7($30)
	LDA	$0, 81($0)
	LDL	$1, 6($30)
	ADDL	$1, $0, $28
	LDL	$0, 0($28)
	LDL	$0, 0($0)
	LDS	$f0, 0($30)
	SUBS	$f31, $f0, $f0
	LDS	$f1, 2($30)
	LDS	$f2, 4($30)
	BR	$28, vecset.3115
bge_else.10908:
	STS	$f2, 8($30)
	STL	$2, 7($30)
	STL	$1, 10($30)
	STS	$f3, 12($30)
	STL	$0, 14($30)
	ADDS	$f1, $f31, $f0
	ADDS	$f2, $f31, $f1
	STL	$29, 15($30)
	LDA	$30, 16($30)
	BSR	$29, adjust_position.3539
	LDA	$30, -16($30)
	LDL	$29, 15($30)
	LDL	$0, 14($30)
	LDA	$0, 1($0)
	LDS	$f1, 12($30)
	STS	$f0, 16($30)
	STL	$0, 18($30)
	STL	$29, 19($30)
	LDA	$30, 20($30)
	BSR	$29, adjust_position.3539
	LDA	$30, -20($30)
	LDL	$29, 19($30)
	ADDS	$f0, $f31, $f1
	LDS	$f0, 16($30)
	LDS	$f2, 8($30)
	LDS	$f3, 12($30)
	LDL	$0, 18($30)
	LDL	$1, 10($30)
	LDL	$2, 7($30)
	BR	$28, calc_dirvec.3542
calc_dirvecs.3550:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10911
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
	BSR	$29, calc_dirvec.3542
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
	BSR	$29, calc_dirvec.3542
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDA	$1, 1($31)
	LDL	$2, 5($30)
	STL	$0, 6($30)
	LDA	$0, 0($2)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, add_mod5.3112
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($0)
	LDS	$f0, 2($30)
	LDL	$0, 6($30)
	LDL	$2, 4($30)
	BR	$28, calc_dirvecs.3550
bge_else.10911:
	RET	$28, ($29)
calc_dirvec_rows.3555:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10914
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
	BSR	$29, calc_dirvecs.3550
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	LDA	$1, 2($31)
	LDL	$2, 2($30)
	STL	$0, 3($30)
	LDA	$0, 0($2)
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, add_mod5.3112
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	LDA	$1, 0($0)
	LDL	$0, 1($30)
	LDA	$2, 4($0)
	LDL	$0, 3($30)
	BR	$28, calc_dirvec_rows.3555
bge_else.10914:
	RET	$28, ($29)
create_dirvec.3559:
	LDA	$0, 3($31)
	MULS	$f31, $f31, $f0
    # 0.0 = 0.0 * 0.0

	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, min_caml_create_float_array
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$1, 0($0)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
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
	RET	$28, ($29)
create_dirvec_elements.3561:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10916
	STL	$1, 0($30)
	STL	$0, 1($30)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, create_dirvec.3559
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	LDA	$1, -1($1)
	LDA	$0, 0($2)
	BR	$28, create_dirvec_elements.3561
bge_else.10916:
	RET	$28, ($29)
create_dirvecs.3564:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10918
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	LDA	$2, 120($31)
	STL	$0, 0($30)
	STL	$1, 1($30)
	STL	$2, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, create_dirvec.3559
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDA	$1, 0($0)
	LDL	$0, 2($30)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, min_caml_create_array
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$1, 0($30)
	LDL	$2, 1($30)
	ADDL	$2, $1, $28
	STL	$0, 0($28)
	MOV	$0, min_caml_dirvecs
	LDL	$0, 0($0)
	ADDL	$0, $1, $28
	LDL	$0, 0($28)
	LDA	$2, 118($31)
	LDA	$1, 0($2)
	STL	$29, 3($30)
	LDA	$30, 4($30)
	BSR	$29, create_dirvec_elements.3561
	LDA	$30, -4($30)
	LDL	$29, 3($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	BR	$28, create_dirvecs.3564
bge_else.10918:
	RET	$28, ($29)
init_dirvec_constants.3566:
	CMPLT	$1, 0, $28
	BNE	$28, bge_else.10920
	ADDL	$0, $1, $28
	LDL	$2, 0($28)
	STL	$0, 0($30)
	STL	$1, 1($30)
	LDA	$0, 0($2)
	STL	$29, 2($30)
	LDA	$30, 3($30)
	BSR	$29, setup_dirvec_constants.3351
	LDA	$30, -3($30)
	LDL	$29, 2($30)
	LDL	$0, 1($30)
	LDA	$1, -1($0)
	LDL	$0, 0($30)
	BR	$28, init_dirvec_constants.3566
bge_else.10920:
	RET	$28, ($29)
init_vecset_constants.3569:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10922
	MOV	$1, min_caml_dirvecs
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDA	$2, 119($31)
	STL	$0, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 1($30)
	LDA	$30, 2($30)
	BSR	$29, init_dirvec_constants.3566
	LDA	$30, -2($30)
	LDL	$29, 1($30)
	LDL	$0, 0($30)
	LDA	$0, -1($0)
	BR	$28, init_vecset_constants.3569
bge_else.10922:
	RET	$28, ($29)
init_dirvecs.3571:
	LDA	$0, 4($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, create_dirvecs.3564
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 9($31)
	LDA	$1, 0($31)
	LDA	$2, 0($31)
	STL	$29, 0($30)
	LDA	$30, 1($30)
	BSR	$29, calc_dirvec_rows.3555
	LDA	$30, -1($30)
	LDL	$29, 0($30)
	LDA	$0, 4($31)
	BR	$28, init_vecset_constants.3569
add_reflection.3573:
	STL	$0, 0($30)
	STL	$1, 1($30)
	STS	$f0, 2($30)
	STS	$f3, 4($30)
	STS	$f2, 6($30)
	STS	$f1, 8($30)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, create_dirvec.3559
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$1, 0($0)
	LDS	$f0, 8($30)
	LDS	$f1, 6($30)
	LDS	$f2, 4($30)
	STL	$0, 10($30)
	LDA	$0, 0($1)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, vecset.3115
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	LDL	$0, 10($30)
	STL	$29, 11($30)
	LDA	$30, 12($30)
	BSR	$29, setup_dirvec_constants.3351
	LDA	$30, -12($30)
	LDL	$29, 11($30)
	MOV	$0, min_caml_reflections
	LDL	$0, 0($0)
	LDA	$1, 0($27)
	LDA	$27, 3($27)
	LDS	$f0, 2($30)
	STS	$f0, 2($1)
	LDL	$2, 10($30)
	STL	$2, 1($1)
	LDL	$2, 1($30)
	STL	$2, 0($1)
	LDL	$2, 0($30)
	ADDL	$0, $2, $28
	STL	$1, 0($28)
	RET	$28, ($29)
setup_rect_reflection.3580:
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
	STS	$f2, 0($30)
	STS	$f3, 2($30)
	STS	$f1, 4($30)
	STS	$f0, 6($30)
	STL	$0, 8($30)
	STL	$2, 9($30)
	LDA	$0, 0($2)
	ADDS	$f4, $f31, $f1
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, add_reflection.3573
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	LDA	$1, 1($0)
	LDL	$2, 8($30)
	LDA	$3, 2($2)
	MOV	$4, min_caml_light
	LDL	$4, 0($4)
	LDS	$f2, 1($4)
	LDS	$f0, 6($30)
	LDS	$f1, 4($30)
	LDS	$f3, 2($30)
	LDA	$0, 0($1)
	LDA	$1, 0($3)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, add_reflection.3573
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	LDL	$0, 9($30)
	LDA	$1, 2($0)
	LDL	$2, 8($30)
	LDA	$2, 3($2)
	MOV	$3, min_caml_light
	LDL	$3, 0($3)
	LDS	$f3, 2($3)
	LDS	$f0, 6($30)
	LDS	$f1, 4($30)
	LDS	$f2, 0($30)
	LDA	$0, 0($1)
	LDA	$1, 0($2)
	STL	$29, 10($30)
	LDA	$30, 11($30)
	BSR	$29, add_reflection.3573
	LDA	$30, -11($30)
	LDL	$29, 10($30)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 9($30)
	LDA	$1, 3($1)
	STL	$1, 0($0)
	RET	$28, ($29)
setup_surface_reflection.3583:
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
	STS	$f0, 0($30)
	STL	$0, 2($30)
	STL	$2, 3($30)
	STL	$1, 4($30)
	LDA	$1, 0($4)
	LDA	$0, 0($3)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, veciprod.3136
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	LDAH	$28, 16384($31)
	ITOFS	$28, $f1
    # 2.000000 : 1073741824

	LDL	$0, 4($30)
	LDL	$1, 4($0)
	LDS	$f2, 0($1)
	MULS	$f1, $f2, $f1
	MULS	$f1, $f0, $f1
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f2, 0($1)
	SUBS	$f1, $f2, $f1
	LDAH	$28, 16384($31)
	ITOFS	$28, $f2
    # 2.000000 : 1073741824

	LDL	$1, 4($0)
	LDS	$f3, 1($1)
	MULS	$f2, $f3, $f2
	MULS	$f2, $f0, $f2
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	LDS	$f3, 1($1)
	SUBS	$f2, $f3, $f2
	LDAH	$28, 16384($31)
	ITOFS	$28, $f3
    # 2.000000 : 1073741824

	LDL	$0, 4($0)
	LDS	$f4, 2($0)
	MULS	$f3, $f4, $f3
	MULS	$f3, $f0, $f0
	MOV	$0, min_caml_light
	LDL	$0, 0($0)
	LDS	$f3, 2($0)
	SUBS	$f0, $f3, $f3
	LDS	$f0, 0($30)
	LDL	$0, 3($30)
	LDL	$1, 2($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, add_reflection.3573
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	MOV	$0, min_caml_n_reflections
	LDL	$0, 0($0)
	LDL	$1, 3($30)
	LDA	$1, 1($1)
	STL	$1, 0($0)
	RET	$28, ($29)
setup_reflections.3586:
	CMPLT	$0, 0, $28
	BNE	$28, bge_else.10927
	MOV	$1, min_caml_objects
	LDL	$1, 0($1)
	ADDL	$1, $0, $28
	LDL	$1, 0($28)
	LDL	$2, 2($1)
	LDA	$28, -2($2)
	BNE	$28, beq_else.10928
	LDL	$2, 7($1)
	LDS	$f0, 0($2)
	LDAH	$28, 16256($31)
	ITOFS	$28, $f1
    # 1.000000 : 1065353216

	CMPSLE	$f1, $f0, $f30
	FBEQ	$f30, nt_fble_else.10929
	LDA	$2, 0($31)
	BR	$28, nt_fble_cont.10930
nt_fble_else.10929:
	LDA	$2, 1($31)
nt_fble_cont.10930:
	BNE	$2, beq_else.10931
	RET	$28, ($29)
beq_else.10931:
	LDL	$2, 1($1)
	LDA	$28, -1($2)
	BNE	$28, beq_else.10933
	BR	$28, setup_rect_reflection.3580
beq_else.10933:
	LDA	$28, -2($2)
	BNE	$28, beq_else.10934
	BR	$28, setup_surface_reflection.3583
beq_else.10934:
	RET	$28, ($29)
beq_else.10928:
	RET	$28, ($29)
bge_else.10927:
	RET	$28, ($29)
rt.3588:
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
	STL	$29, 4($30)
	LDA	$30, 5($30)
	BSR	$29, create_pixelline.3535
	LDA	$30, -5($30)
	LDL	$29, 4($30)
	STL	$0, 4($30)
	STL	$29, 5($30)
	LDA	$30, 6($30)
	BSR	$29, create_pixelline.3535
	LDA	$30, -6($30)
	LDL	$29, 5($30)
	STL	$0, 5($30)
	STL	$29, 6($30)
	LDA	$30, 7($30)
	BSR	$29, create_pixelline.3535
	LDA	$30, -7($30)
	LDL	$29, 6($30)
	STL	$0, 6($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, read_parameter.3253
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, write_ppm_header.3496
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, init_dirvecs.3571
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_light_dirvec
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	MOV	$1, min_caml_light
	LDL	$1, 0($1)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, veccpy.3125
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_light_dirvec
	LDL	$0, 0($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_dirvec_constants.3351
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	MOV	$0, min_caml_n_objects
	LDL	$0, 0($0)
	LDL	$0, 0($0)
	LDA	$0, -1($0)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, setup_reflections.3586
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$1, 0($31)
	LDA	$2, 0($31)
	LDL	$0, 5($30)
	STL	$29, 7($30)
	LDA	$30, 8($30)
	BSR	$29, pretrace_line.3512
	LDA	$30, -8($30)
	LDL	$29, 7($30)
	LDA	$0, 0($31)
	LDA	$4, 2($31)
	LDL	$1, 4($30)
	LDL	$2, 5($30)
	LDL	$3, 6($30)
	BR	$28, scan_line.3522
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
        BR $31, min_caml_main_end
