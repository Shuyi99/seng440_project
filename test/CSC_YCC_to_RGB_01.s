	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_bilinear_upsample_neon         ; -- Begin function bilinear_upsample_neon
	.p2align	2
_bilinear_upsample_neon:                ; @bilinear_upsample_neon
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w27, -8
	.cfi_offset w28, -16
	sub	sp, sp, #960
	.cfi_def_cfa_offset 976
                                        ; implicit-def: $q2
	str	w0, [sp, #44]
	str	w1, [sp, #40]
	str	x2, [sp, #32]
	ldr	x10, [sp, #32]
	ldr	w8, [sp, #44]
	asr	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #40]
	asr	w9, w9, #1
	add	x8, x8, w9, sxtw
	ldrb	w8, [x8]
	strb	w8, [sp, #31]
	ldr	x10, [sp, #32]
	ldr	w8, [sp, #44]
	asr	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #40]
	asr	w9, w9, #1
	add	w9, w9, #1
	add	x8, x8, w9, sxtw
	ldrb	w8, [x8]
	strb	w8, [sp, #30]
	ldr	x10, [sp, #32]
	ldr	w8, [sp, #44]
	asr	w8, w8, #1
	add	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #40]
	asr	w9, w9, #1
	add	x8, x8, w9, sxtw
	ldrb	w8, [x8]
	strb	w8, [sp, #29]
	ldr	x10, [sp, #32]
	ldr	w8, [sp, #44]
	asr	w8, w8, #1
	add	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #40]
	asr	w9, w9, #1
	add	w9, w9, #1
	add	x8, x8, w9, sxtw
	ldrb	w8, [x8]
	strb	w8, [sp, #28]
	ldrb	w8, [sp, #31]
	strh	w8, [sp, #382]
	ldr	h0, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s0
	mov.16b	v0, v2
	mov.h	v0[0], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[1], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[2], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[3], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[4], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[5], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[6], v1[0]
	ldr	h3, [sp, #382]
                                        ; implicit-def: $q1
	fmov	s1, s3
	mov.h	v0[7], v1[0]
	str	q0, [sp, #336]
	ldr	q0, [sp, #336]
	str	q0, [sp, #352]
	ldr	q0, [sp, #352]
	str	q0, [sp]
	ldr	q1, [sp]
	ldrb	w8, [sp, #30]
	strh	w8, [sp, #334]
	ldr	h0, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s0
	mov.16b	v0, v2
	mov.h	v0[0], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[1], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[2], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[3], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[4], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[5], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[6], v3[0]
	ldr	h4, [sp, #334]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[7], v3[0]
	str	q0, [sp, #288]
	ldr	q0, [sp, #288]
	str	q0, [sp, #304]
	ldr	q3, [sp, #304]
	ldr	q0, [sp]
	str	q3, [sp, #944]
	str	q0, [sp, #928]
	ldr	q0, [sp, #944]
	ldr	q3, [sp, #928]
	sub.8h	v0, v0, v3
	str	q0, [sp, #912]
	ldr	q0, [sp, #912]
	ldr	w8, [sp, #40]
	and	w8, w8, #0x1
	str	q0, [sp, #704]
	strh	w8, [sp, #702]
	ldr	q0, [sp, #704]
	ldr	h3, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s3
	mov.16b	v3, v2
	mov.h	v3[0], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[1], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[2], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[3], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[4], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[5], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[6], v4[0]
	ldr	h5, [sp, #702]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[7], v4[0]
	str	q3, [sp, #656]
	ldr	q3, [sp, #656]
	mul.8h	v0, v0, v3
	str	q0, [sp, #672]
	ldr	q0, [sp, #672]
	str	q1, [sp, #512]
	str	q0, [sp, #496]
	ldr	q0, [sp, #512]
	ldr	q1, [sp, #496]
	add.8h	v0, v0, v1
	str	q0, [sp, #480]
	ldr	q0, [sp, #480]
	str	q0, [sp]
	ldr	q1, [sp]
	ldrb	w8, [sp, #29]
	strh	w8, [sp, #286]
	ldr	h0, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s0
	mov.16b	v0, v2
	mov.h	v0[0], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[1], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[2], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[3], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[4], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[5], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[6], v3[0]
	ldr	h4, [sp, #286]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[7], v3[0]
	str	q0, [sp, #240]
	ldr	q0, [sp, #240]
	str	q0, [sp, #256]
	ldr	q3, [sp, #256]
	ldr	q0, [sp]
	str	q3, [sp, #896]
	str	q0, [sp, #880]
	ldr	q0, [sp, #896]
	ldr	q3, [sp, #880]
	sub.8h	v0, v0, v3
	str	q0, [sp, #864]
	ldr	q0, [sp, #864]
	ldr	w8, [sp, #44]
	and	w8, w8, #0x1
	str	q0, [sp, #640]
	strh	w8, [sp, #638]
	ldr	q0, [sp, #640]
	ldr	h3, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s3
	mov.16b	v3, v2
	mov.h	v3[0], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[1], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[2], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[3], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[4], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[5], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[6], v4[0]
	ldr	h5, [sp, #638]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v3[7], v4[0]
	str	q3, [sp, #592]
	ldr	q3, [sp, #592]
	mul.8h	v0, v0, v3
	str	q0, [sp, #608]
	ldr	q0, [sp, #608]
	str	q1, [sp, #464]
	str	q0, [sp, #448]
	ldr	q0, [sp, #464]
	ldr	q1, [sp, #448]
	add.8h	v0, v0, v1
	str	q0, [sp, #432]
	ldr	q0, [sp, #432]
	str	q0, [sp]
	ldr	q1, [sp]
	ldrb	w8, [sp, #28]
	strh	w8, [sp, #238]
	ldr	h0, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s0
	mov.16b	v0, v2
	mov.h	v0[0], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[1], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[2], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[3], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[4], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[5], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[6], v3[0]
	ldr	h4, [sp, #238]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v0[7], v3[0]
	str	q0, [sp, #192]
	ldr	q0, [sp, #192]
	str	q0, [sp, #208]
	ldr	q3, [sp, #208]
	ldrb	w8, [sp, #30]
	strh	w8, [sp, #190]
	ldr	h0, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s0
	mov.16b	v0, v2
	mov.h	v0[0], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[1], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[2], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[3], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[4], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[5], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[6], v4[0]
	ldr	h5, [sp, #190]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[7], v4[0]
	str	q0, [sp, #144]
	ldr	q0, [sp, #144]
	str	q0, [sp, #160]
	ldr	q0, [sp, #160]
	str	q3, [sp, #848]
	str	q0, [sp, #832]
	ldr	q0, [sp, #848]
	ldr	q3, [sp, #832]
	sub.8h	v0, v0, v3
	str	q0, [sp, #816]
	ldr	q3, [sp, #816]
	ldrb	w8, [sp, #29]
	strh	w8, [sp, #142]
	ldr	h0, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s0
	mov.16b	v0, v2
	mov.h	v0[0], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[1], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[2], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[3], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[4], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[5], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[6], v4[0]
	ldr	h5, [sp, #142]
                                        ; implicit-def: $q4
	fmov	s4, s5
	mov.h	v0[7], v4[0]
	str	q0, [sp, #96]
	ldr	q0, [sp, #96]
	str	q0, [sp, #112]
	ldr	q4, [sp, #112]
	ldrb	w8, [sp, #31]
	strh	w8, [sp, #94]
	ldr	h0, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s0
	mov.16b	v0, v2
	mov.h	v0[0], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[1], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[2], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[3], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[4], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[5], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[6], v5[0]
	ldr	h6, [sp, #94]
                                        ; implicit-def: $q5
	fmov	s5, s6
	mov.h	v0[7], v5[0]
	str	q0, [sp, #48]
	ldr	q0, [sp, #48]
	str	q0, [sp, #64]
	ldr	q0, [sp, #64]
	str	q4, [sp, #800]
	str	q0, [sp, #784]
	ldr	q0, [sp, #800]
	ldr	q4, [sp, #784]
	sub.8h	v0, v0, v4
	str	q0, [sp, #768]
	ldr	q0, [sp, #768]
	str	q3, [sp, #752]
	str	q0, [sp, #736]
	ldr	q0, [sp, #752]
	ldr	q3, [sp, #736]
	sub.8h	v0, v0, v3
	str	q0, [sp, #720]
	ldr	q0, [sp, #720]
	ldr	w8, [sp, #44]
	and	w8, w8, #0x1
	ldr	w9, [sp, #40]
	and	w9, w9, #0x1
	mul	w8, w8, w9
	str	q0, [sp, #576]
	strh	w8, [sp, #574]
	ldr	q0, [sp, #576]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[0], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[1], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[2], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[3], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[4], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[5], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[6], v3[0]
	ldr	h4, [sp, #574]
                                        ; implicit-def: $q3
	fmov	s3, s4
	mov.h	v2[7], v3[0]
	str	q2, [sp, #528]
	ldr	q2, [sp, #528]
	mul.8h	v0, v0, v2
	str	q0, [sp, #544]
	ldr	q0, [sp, #544]
	str	q1, [sp, #416]
	str	q0, [sp, #400]
	ldr	q0, [sp, #416]
	ldr	q1, [sp, #400]
	add.8h	v0, v0, v1
	str	q0, [sp, #384]
	ldr	q0, [sp, #384]
	str	q0, [sp]
	ldr	q0, [sp]
	add	sp, sp, #960
	ldp	x28, x27, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_CSC_YCC_to_RGB                 ; -- Begin function CSC_YCC_to_RGB
	.p2align	2
_CSC_YCC_to_RGB:                        ; @CSC_YCC_to_RGB
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	_chrominance_array_upsample
	stur	wzr, [x29, #-4]
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #640
	cset	w8, ge
	tbnz	w8, #0, LBB1_8
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	str	wzr, [sp, #8]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	subs	w8, w8, #480
	cset	w8, ge
	tbnz	w8, #0, LBB1_6
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldur	w0, [x29, #-4]
	ldr	w1, [sp, #8]
	bl	_CSC_YCC_to_RGB_brute_force_int
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #8
	str	w8, [sp, #8]
	b	LBB1_3
LBB1_6:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	stur	w8, [x29, #-4]
	b	LBB1_1
LBB1_8:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function chrominance_array_upsample
_chrominance_array_upsample:            ; @chrominance_array_upsample
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, _Cb@GOTPAGE
	ldr	x8, [x8, _Cb@GOTPAGEOFF]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	adrp	x8, _Cb_temp@GOTPAGE
	ldr	x8, [x8, _Cb_temp@GOTPAGEOFF]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	adrp	x8, _Cr@GOTPAGE
	ldr	x8, [x8, _Cr@GOTPAGEOFF]
	stur	x8, [x29, #-32]                 ; 8-byte Folded Spill
	adrp	x8, _Cr_temp@GOTPAGE
	ldr	x8, [x8, _Cr_temp@GOTPAGEOFF]
	stur	x8, [x29, #-24]                 ; 8-byte Folded Spill
	stur	wzr, [x29, #-4]
	b	LBB2_1
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #320
	cset	w8, ge
	tbnz	w8, #0, LBB2_28
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	stur	wzr, [x29, #-8]
	b	LBB2_3
LBB2_3:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #240
	cset	w8, ge
	tbnz	w8, #0, LBB2_26
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-8]
	add	x8, x8, x9
	ldrb	w8, [x8]
	sturb	w8, [x29, #-12]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB2_6
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b	LBB2_7
LBB2_6:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b	LBB2_7
LBB2_7:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-13]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, ne
	tbnz	w8, #0, LBB2_9
	b	LBB2_8
LBB2_8:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #24]                   ; 4-byte Folded Spill
	b	LBB2_10
LBB2_9:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldursw	x9, [x29, #-8]
	ldrb	w8, [x8, x9]
	str	w8, [sp, #24]                   ; 4-byte Folded Spill
	b	LBB2_10
LBB2_10:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #24]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-14]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, eq
	tbnz	w8, #0, LBB2_12
	b	LBB2_11
LBB2_11:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB2_13
	b	LBB2_12
LBB2_12:                                ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB2_14
LBB2_13:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB2_14
LBB2_14:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-15]
	ldurb	w0, [x29, #-12]
	ldurb	w1, [x29, #-13]
	ldurb	w2, [x29, #-14]
	ldurb	w3, [x29, #-15]
	sub	x4, x29, #9
	sub	x5, x29, #10
	sub	x6, x29, #11
	bl	_chrominance_upsample
	ldr	x12, [sp, #40]                  ; 8-byte Folded Reload
	ldur	x8, [x29, #-32]                 ; 8-byte Folded Reload
	ldurb	w9, [x29, #-12]
	ldur	w10, [x29, #-4]
	lsl	w10, w10, #1
	mov	x13, x12
	mov	w11, #480
	smaddl	x10, w10, w11, x13
	ldur	w11, [x29, #-8]
	lsl	w11, w11, #1
	add	x10, x10, w11, sxtw
	strb	w9, [x10]
	ldurb	w9, [x29, #-9]
	ldur	w10, [x29, #-4]
	lsl	w10, w10, #1
	mov	x13, x12
	mov	w11, #480
	smaddl	x10, w10, w11, x13
	ldur	w11, [x29, #-8]
	lsl	w11, w11, #1
	add	w11, w11, #1
	add	x10, x10, w11, sxtw
	strb	w9, [x10]
	ldurb	w9, [x29, #-10]
	ldur	w10, [x29, #-4]
	lsl	w10, w10, #1
	add	w10, w10, #1
	mov	x13, x12
	mov	w11, #480
	smaddl	x10, w10, w11, x13
	ldur	w11, [x29, #-8]
	lsl	w11, w11, #1
	add	x10, x10, w11, sxtw
	strb	w9, [x10]
	ldurb	w9, [x29, #-11]
	ldur	w10, [x29, #-4]
	lsl	w10, w10, #1
	add	w10, w10, #1
	mov	w11, #480
	smaddl	x10, w10, w11, x12
	ldur	w11, [x29, #-8]
	lsl	w11, w11, #1
	add	w11, w11, #1
	add	x10, x10, w11, sxtw
	strb	w9, [x10]
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-8]
	add	x8, x8, x9
	ldrb	w8, [x8]
	sturb	w8, [x29, #-12]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB2_16
	b	LBB2_15
LBB2_15:                                ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	b	LBB2_17
LBB2_16:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	x8, [x29, #-32]                 ; 8-byte Folded Reload
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	b	LBB2_17
LBB2_17:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-13]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, ne
	tbnz	w8, #0, LBB2_19
	b	LBB2_18
LBB2_18:                                ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB2_20
LBB2_19:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	x10, [x29, #-32]                ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldursw	x9, [x29, #-8]
	ldrb	w8, [x8, x9]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB2_20
LBB2_20:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-14]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, eq
	tbnz	w8, #0, LBB2_22
	b	LBB2_21
LBB2_21:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB2_23
	b	LBB2_22
LBB2_22:                                ;   in Loop: Header=BB2_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB2_24
LBB2_23:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	x10, [x29, #-32]                ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB2_24
LBB2_24:                                ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	sturb	w8, [x29, #-15]
	ldurb	w0, [x29, #-12]
	ldurb	w1, [x29, #-13]
	ldurb	w2, [x29, #-14]
	ldurb	w3, [x29, #-15]
	sub	x4, x29, #9
	sub	x5, x29, #10
	sub	x6, x29, #11
	bl	_chrominance_upsample
	ldur	x11, [x29, #-24]                ; 8-byte Folded Reload
	ldurb	w8, [x29, #-12]
	ldur	w9, [x29, #-4]
	lsl	w9, w9, #1
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	lsl	w10, w10, #1
	add	x9, x9, w10, sxtw
	strb	w8, [x9]
	ldurb	w8, [x29, #-9]
	ldur	w9, [x29, #-4]
	lsl	w9, w9, #1
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	lsl	w10, w10, #1
	add	w10, w10, #1
	add	x9, x9, w10, sxtw
	strb	w8, [x9]
	ldurb	w8, [x29, #-10]
	ldur	w9, [x29, #-4]
	lsl	w9, w9, #1
	add	w9, w9, #1
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	lsl	w10, w10, #1
	add	x9, x9, w10, sxtw
	strb	w8, [x9]
	ldurb	w8, [x29, #-11]
	ldur	w9, [x29, #-4]
	lsl	w9, w9, #1
	add	w9, w9, #1
	mov	w10, #480
	smaddl	x9, w9, w10, x11
	ldur	w10, [x29, #-8]
	lsl	w10, w10, #1
	add	w10, w10, #1
	add	x9, x9, w10, sxtw
	strb	w8, [x9]
	b	LBB2_25
LBB2_25:                                ;   in Loop: Header=BB2_3 Depth=2
	ldur	w8, [x29, #-8]
	add	w8, w8, #1
	stur	w8, [x29, #-8]
	b	LBB2_3
LBB2_26:                                ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_27
LBB2_27:                                ;   in Loop: Header=BB2_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	stur	w8, [x29, #-4]
	b	LBB2_1
LBB2_28:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function CSC_YCC_to_RGB_brute_force_int
_CSC_YCC_to_RGB_brute_force_int:        ; @CSC_YCC_to_RGB_brute_force_int
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w27, -8
	.cfi_offset w28, -16
	sub	sp, sp, #2368
	.cfi_def_cfa_offset 2384
	add	x8, sp, #144
	str	w0, [sp, #492]
	str	w1, [sp, #488]
	mov	w9, #16
	strh	w9, [sp, #974]
	add	x9, sp, #974
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #784]
	ldr	q0, [x8, #784]
	str	q0, [x8, #800]
	ldr	q0, [x8, #800]
	str	q0, [x8, #320]
	mov	w9, #128
	strh	w9, [sp, #926]
	add	x9, sp, #926
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #736]
	ldr	q0, [x8, #736]
	str	q0, [x8, #752]
	ldr	q0, [x8, #752]
	str	q0, [x8, #304]
	mov	w9, #74
	strh	w9, [sp, #878]
	add	x9, sp, #878
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #688]
	ldr	q0, [x8, #688]
	str	q0, [x8, #704]
	ldr	q0, [x8, #704]
	str	q0, [x8, #288]
	mov	w9, #102
	strh	w9, [sp, #830]
	add	x9, sp, #830
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #640]
	ldr	q0, [x8, #640]
	str	q0, [x8, #656]
	ldr	q0, [x8, #656]
	str	q0, [x8, #272]
	mov	w9, #52
	strh	w9, [sp, #782]
	add	x9, sp, #782
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #592]
	ldr	q0, [x8, #592]
	str	q0, [x8, #608]
	ldr	q0, [x8, #608]
	str	q0, [x8, #256]
	mov	w9, #25
	strh	w9, [sp, #734]
	add	x9, sp, #734
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #544]
	ldr	q0, [x8, #544]
	str	q0, [x8, #560]
	ldr	q0, [x8, #560]
	str	q0, [x8, #240]
	mov	w9, #129
	strh	w9, [sp, #686]
	add	x9, sp, #686
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #496]
	ldr	q0, [x8, #496]
	str	q0, [x8, #512]
	ldr	q0, [x8, #512]
	str	q0, [x8, #224]
	mov	w9, #32
	strh	w9, [sp, #638]
	add	x9, sp, #638
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #448]
	ldr	q0, [x8, #448]
	str	q0, [x8, #464]
	ldr	q0, [x8, #464]
	str	q0, [x8, #208]
	mov	w9, #0
	strh	w9, [sp, #590]
	add	x9, sp, #590
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #400]
	ldr	q0, [x8, #400]
	str	q0, [x8, #416]
	ldr	q0, [x8, #416]
	str	q0, [x8, #192]
	mov	w9, #255
	strh	w9, [sp, #542]
	add	x9, sp, #542
	ld1r.8h	{ v0 }, [x9]
	str	q0, [x8, #352]
	ldr	q0, [x8, #352]
	str	q0, [x8, #368]
	ldr	q0, [x8, #368]
	str	q0, [x8, #176]
	ldrsw	x10, [sp, #492]
	mov	w9, #480
                                        ; kill: def $x9 killed $w9
	mul	x11, x10, x9
	adrp	x10, _Y@GOTPAGE
	ldr	x10, [x10, _Y@GOTPAGEOFF]
	add	x10, x10, x11
	ldrsw	x11, [sp, #488]
	ldr	d0, [x10, x11]
	str	d0, [sp, #296]
	ldr	d0, [sp, #296]
	str	d0, [sp, #288]
	ldr	d0, [sp, #288]
	str	d0, [sp, #1544]
	ldr	d0, [sp, #1544]
	ushll.8h	v0, v0, #0
	str	q0, [x8, #1376]
	ldr	q0, [x8, #1376]
	str	q0, [x8, #160]
	ldrsw	x10, [sp, #492]
	mul	x11, x10, x9
	adrp	x10, _Cb_temp@GOTPAGE
	ldr	x10, [x10, _Cb_temp@GOTPAGEOFF]
	add	x10, x10, x11
	ldrsw	x11, [sp, #488]
	ldr	d0, [x10, x11]
	str	d0, [sp, #264]
	ldr	d0, [sp, #264]
	str	d0, [sp, #256]
	ldr	d0, [sp, #256]
	str	d0, [sp, #1512]
	ldr	d0, [sp, #1512]
	ushll.8h	v0, v0, #0
	str	q0, [x8, #1344]
	ldr	q0, [x8, #1344]
	str	q0, [x8, #128]
	ldrsw	x10, [sp, #492]
	mul	x11, x10, x9
	adrp	x10, _Cr_temp@GOTPAGE
	ldr	x10, [x10, _Cr_temp@GOTPAGEOFF]
	add	x10, x10, x11
	ldrsw	x11, [sp, #488]
	ldr	d0, [x10, x11]
	str	d0, [sp, #232]
	ldr	d0, [sp, #232]
	str	d0, [sp, #224]
	ldr	d0, [sp, #224]
	str	d0, [sp, #1480]
	ldr	d0, [sp, #1480]
	ushll.8h	v0, v0, #0
	str	q0, [x8, #1312]
	ldr	q0, [x8, #1312]
	str	q0, [x8, #96]
	ldr	q1, [x8, #160]
	ldr	q0, [x8, #320]
	str	q1, [x8, #1296]
	str	q0, [x8, #1280]
	ldr	q0, [x8, #1296]
	ldr	q1, [x8, #1280]
	sub.8h	v0, v0, v1
	str	q0, [x8, #1264]
	ldr	q0, [x8, #1264]
	str	q0, [x8, #160]
	ldr	q1, [x8, #128]
	ldr	q0, [x8, #304]
	str	q1, [x8, #1248]
	str	q0, [x8, #1232]
	ldr	q0, [x8, #1248]
	ldr	q1, [x8, #1232]
	sub.8h	v0, v0, v1
	str	q0, [x8, #1216]
	ldr	q0, [x8, #1216]
	str	q0, [x8, #128]
	ldr	q1, [x8, #96]
	ldr	q0, [x8, #304]
	str	q1, [x8, #1200]
	str	q0, [x8, #1184]
	ldr	q0, [x8, #1200]
	ldr	q1, [x8, #1184]
	sub.8h	v0, v0, v1
	str	q0, [x8, #1168]
	ldr	q0, [x8, #1168]
	str	q0, [x8, #96]
	ldr	q1, [x8, #160]
	ldr	q0, [x8, #288]
	str	q1, [x8, #1728]
	str	q0, [x8, #1712]
	ldr	q0, [x8, #1728]
	ldr	q1, [x8, #1712]
	mul.8h	v0, v0, v1
	str	q0, [x8, #1696]
	ldr	q1, [x8, #1696]
	ldr	q2, [x8, #96]
	ldr	q0, [x8, #272]
	str	q2, [x8, #1680]
	str	q0, [x8, #1664]
	ldr	q0, [x8, #1680]
	ldr	q2, [x8, #1664]
	mul.8h	v0, v0, v2
	str	q0, [x8, #1648]
	ldr	q0, [x8, #1648]
	str	q1, [x8, #1056]
	str	q0, [x8, #1040]
	ldr	q0, [x8, #1056]
	ldr	q1, [x8, #1040]
	add.8h	v0, v0, v1
	str	q0, [x8, #1024]
	ldr	q0, [x8, #1024]
	str	q0, [x8, #64]
	ldr	q1, [x8, #160]
	ldr	q0, [x8, #288]
	str	q1, [x8, #1632]
	str	q0, [x8, #1616]
	ldr	q0, [x8, #1632]
	ldr	q1, [x8, #1616]
	mul.8h	v0, v0, v1
	str	q0, [x8, #1600]
	ldr	q1, [x8, #1600]
	ldr	q2, [x8, #96]
	ldr	q0, [x8, #256]
	str	q2, [x8, #1584]
	str	q0, [x8, #1568]
	ldr	q0, [x8, #1584]
	ldr	q2, [x8, #1568]
	mul.8h	v0, v0, v2
	str	q0, [x8, #1552]
	ldr	q0, [x8, #1552]
	str	q1, [x8, #1152]
	str	q0, [x8, #1136]
	ldr	q0, [x8, #1152]
	ldr	q1, [x8, #1136]
	sub.8h	v0, v0, v1
	str	q0, [x8, #1120]
	ldr	q1, [x8, #1120]
	ldr	q2, [x8, #128]
	ldr	q0, [x8, #240]
	str	q2, [x8, #1536]
	str	q0, [x8, #1520]
	ldr	q0, [x8, #1536]
	ldr	q2, [x8, #1520]
	mul.8h	v0, v0, v2
	str	q0, [x8, #1504]
	ldr	q0, [x8, #1504]
	str	q1, [x8, #1104]
	str	q0, [x8, #1088]
	ldr	q0, [x8, #1104]
	ldr	q1, [x8, #1088]
	sub.8h	v0, v0, v1
	str	q0, [x8, #1072]
	ldr	q0, [x8, #1072]
	str	q0, [x8, #48]
	ldr	q1, [x8, #160]
	ldr	q0, [x8, #288]
	str	q1, [x8, #1488]
	str	q0, [x8, #1472]
	ldr	q0, [x8, #1488]
	ldr	q1, [x8, #1472]
	mul.8h	v0, v0, v1
	str	q0, [x8, #1456]
	ldr	q1, [x8, #1456]
	ldr	q2, [x8, #128]
	ldr	q0, [x8, #224]
	str	q2, [x8, #1440]
	str	q0, [x8, #1424]
	ldr	q0, [x8, #1440]
	ldr	q2, [x8, #1424]
	mul.8h	v0, v0, v2
	str	q0, [x8, #1408]
	ldr	q0, [x8, #1408]
	str	q1, [x8, #1008]
	str	q0, [x8, #992]
	ldr	q0, [x8, #1008]
	ldr	q1, [x8, #992]
	add.8h	v0, v0, v1
	str	q0, [x8, #976]
	ldr	q0, [x8, #976]
	str	q0, [x8, #32]
	ldr	q1, [x8, #64]
	ldr	q0, [x8, #208]
	str	q1, [x8, #960]
	str	q0, [x8, #944]
	ldr	q0, [x8, #960]
	ldr	q1, [x8, #944]
	add.8h	v0, v0, v1
	str	q0, [x8, #928]
	ldr	q0, [x8, #928]
	str	q0, [x8]
	ldr	q0, [x8]
	sshr.8h	v0, v0, #6
	str	q0, [x8, #16]
	ldr	q0, [x8, #16]
	str	q0, [sp, #128]
	ldr	q0, [sp, #128]
	str	q0, [x8, #64]
	ldr	q1, [x8, #48]
	ldr	q0, [x8, #208]
	str	q1, [x8, #912]
	str	q0, [x8, #896]
	ldr	q0, [x8, #912]
	ldr	q1, [x8, #896]
	add.8h	v0, v0, v1
	str	q0, [x8, #880]
	ldr	q0, [x8, #880]
	str	q0, [sp, #96]
	ldr	q0, [sp, #96]
	sshr.8h	v0, v0, #6
	str	q0, [sp, #112]
	ldr	q0, [sp, #112]
	str	q0, [sp, #80]
	ldr	q0, [sp, #80]
	str	q0, [x8, #48]
	ldr	q1, [x8, #32]
	ldr	q0, [x8, #208]
	str	q1, [x8, #864]
	str	q0, [x8, #848]
	ldr	q0, [x8, #864]
	ldr	q1, [x8, #848]
	add.8h	v0, v0, v1
	str	q0, [x8, #832]
	ldr	q0, [x8, #832]
	str	q0, [sp, #48]
	ldr	q0, [sp, #48]
	sshr.8h	v0, v0, #6
	str	q0, [sp, #64]
	ldr	q0, [sp, #64]
	str	q0, [sp, #32]
	ldr	q0, [sp, #32]
	str	q0, [x8, #32]
	ldr	q1, [x8, #192]
	ldr	q2, [x8, #64]
	ldr	q0, [x8, #176]
	str	q2, [x8, #2016]
	str	q0, [x8, #2000]
	ldr	q0, [x8, #2016]
	ldr	q2, [x8, #2000]
	smin.8h	v0, v0, v2
	str	q0, [x8, #1984]
	ldr	q0, [x8, #1984]
	str	q1, [x8, #1872]
	str	q0, [x8, #1856]
	ldr	q0, [x8, #1872]
	ldr	q1, [x8, #1856]
	smax.8h	v0, v0, v1
	str	q0, [x8, #1840]
	ldr	q0, [x8, #1840]
	str	q0, [x8, #64]
	ldr	q1, [x8, #192]
	ldr	q2, [x8, #48]
	ldr	q0, [x8, #176]
	str	q2, [x8, #1968]
	str	q0, [x8, #1952]
	ldr	q0, [x8, #1968]
	ldr	q2, [x8, #1952]
	smin.8h	v0, v0, v2
	str	q0, [x8, #1936]
	ldr	q0, [x8, #1936]
	str	q1, [x8, #1824]
	str	q0, [x8, #1808]
	ldr	q0, [x8, #1824]
	ldr	q1, [x8, #1808]
	smax.8h	v0, v0, v1
	str	q0, [x8, #1792]
	ldr	q0, [x8, #1792]
	str	q0, [x8, #48]
	ldr	q1, [x8, #192]
	ldr	q2, [x8, #32]
	ldr	q0, [x8, #176]
	str	q2, [x8, #1920]
	str	q0, [x8, #1904]
	ldr	q0, [x8, #1920]
	ldr	q2, [x8, #1904]
	smin.8h	v0, v0, v2
	str	q0, [x8, #1888]
	ldr	q0, [x8, #1888]
	str	q1, [x8, #1776]
	str	q0, [x8, #1760]
	ldr	q0, [x8, #1776]
	ldr	q1, [x8, #1760]
	smax.8h	v0, v0, v1
	str	q0, [x8, #1744]
	ldr	q0, [x8, #1744]
	str	q0, [x8, #32]
	ldr	q0, [x8, #64]
	str	q0, [x8, #2208]
	ldr	q0, [x8, #2208]
	str	q0, [x8, #2192]
	ldr	q0, [x8, #2192]
	str	q0, [x8, #2112]
	ldr	q0, [x8, #2112]
	xtn.8b	v0, v0
	str	d0, [sp, #2248]
	ldr	d0, [sp, #2248]
	str	d0, [sp, #24]
	ldrsw	x10, [sp, #492]
	mul	x11, x10, x9
	adrp	x10, _R@GOTPAGE
	ldr	x10, [x10, _R@GOTPAGEOFF]
	add	x10, x10, x11
	ldrsw	x11, [sp, #488]
	ldr	d0, [sp, #24]
	str	d0, [x10, x11]
	ldr	q0, [x8, #48]
	str	q0, [x8, #2176]
	ldr	q0, [x8, #2176]
	str	q0, [x8, #2160]
	ldr	q0, [x8, #2160]
	str	q0, [x8, #2080]
	ldr	q0, [x8, #2080]
	xtn.8b	v0, v0
	str	d0, [sp, #2216]
	ldr	d0, [sp, #2216]
	str	d0, [sp, #16]
	ldrsw	x10, [sp, #492]
	mul	x11, x10, x9
	adrp	x10, _G@GOTPAGE
	ldr	x10, [x10, _G@GOTPAGEOFF]
	add	x10, x10, x11
	ldrsw	x11, [sp, #488]
	ldr	d0, [sp, #16]
	str	d0, [x10, x11]
	ldr	q0, [x8, #32]
	str	q0, [x8, #2144]
	ldr	q0, [x8, #2144]
	str	q0, [x8, #2128]
	ldr	q0, [x8, #2128]
	str	q0, [x8, #2048]
	ldr	q0, [x8, #2048]
	xtn.8b	v0, v0
	str	d0, [sp, #2184]
	ldr	d0, [sp, #2184]
	str	d0, [sp, #8]
	ldrsw	x8, [sp, #492]
	mul	x9, x8, x9
	adrp	x8, _B@GOTPAGE
	ldr	x8, [x8, _B@GOTPAGEOFF]
	add	x8, x8, x9
	ldrsw	x9, [sp, #488]
	ldr	d0, [sp, #8]
	str	d0, [x8, x9]
	add	sp, sp, #2368
	ldp	x28, x27, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function chrominance_upsample
_chrominance_upsample:                  ; @chrominance_upsample
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	strb	w0, [sp, #31]
	strb	w1, [sp, #30]
	strb	w2, [sp, #29]
	strb	w3, [sp, #28]
	str	x4, [sp, #16]
	str	x5, [sp, #8]
	str	x6, [sp]
	ldrb	w8, [sp, #31]
	ldr	x9, [sp]
	strb	w8, [x9]
	ldr	x9, [sp, #8]
	strb	w8, [x9]
	ldr	x9, [sp, #16]
	strb	w8, [x9]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
