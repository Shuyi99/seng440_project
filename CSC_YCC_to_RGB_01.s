	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
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
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #640
	cset	w8, ge
	tbnz	w8, #0, LBB0_8
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	str	wzr, [sp, #8]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	subs	w8, w8, #480
	cset	w8, ge
	tbnz	w8, #0, LBB0_6
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldur	w0, [x29, #-4]
	ldr	w1, [sp, #8]
	bl	_CSC_YCC_to_RGB_brute_force_int
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #2
	str	w8, [sp, #8]
	b	LBB0_3
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #2
	stur	w8, [x29, #-4]
	b	LBB0_1
LBB0_8:
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
	b	LBB1_1
LBB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	ldur	w8, [x29, #-4]
	subs	w8, w8, #320
	cset	w8, ge
	tbnz	w8, #0, LBB1_28
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	stur	wzr, [x29, #-8]
	b	LBB1_3
LBB1_3:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #240
	cset	w8, ge
	tbnz	w8, #0, LBB1_26
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_3 Depth=2
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
	tbnz	w8, #0, LBB1_6
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b	LBB1_7
LBB1_6:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-13]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, ne
	tbnz	w8, #0, LBB1_9
	b	LBB1_8
LBB1_8:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #24]                   ; 4-byte Folded Spill
	b	LBB1_10
LBB1_9:                                 ;   in Loop: Header=BB1_3 Depth=2
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldursw	x9, [x29, #-8]
	ldrb	w8, [x8, x9]
	str	w8, [sp, #24]                   ; 4-byte Folded Spill
	b	LBB1_10
LBB1_10:                                ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #24]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-14]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, eq
	tbnz	w8, #0, LBB1_12
	b	LBB1_11
LBB1_11:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB1_13
	b	LBB1_12
LBB1_12:                                ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB1_14
LBB1_13:                                ;   in Loop: Header=BB1_3 Depth=2
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB1_14
LBB1_14:                                ;   in Loop: Header=BB1_3 Depth=2
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
	tbnz	w8, #0, LBB1_16
	b	LBB1_15
LBB1_15:                                ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	b	LBB1_17
LBB1_16:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	x8, [x29, #-32]                 ; 8-byte Folded Reload
	ldursw	x9, [x29, #-4]
	mov	x10, #240
	mul	x9, x9, x10
	add	x8, x8, x9
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	b	LBB1_17
LBB1_17:                                ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-13]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, ne
	tbnz	w8, #0, LBB1_19
	b	LBB1_18
LBB1_18:                                ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB1_20
LBB1_19:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	x10, [x29, #-32]                ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldursw	x9, [x29, #-8]
	ldrb	w8, [x8, x9]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB1_20
LBB1_20:                                ;   in Loop: Header=BB1_3 Depth=2
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	sturb	w8, [x29, #-14]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #319
	cset	w8, eq
	tbnz	w8, #0, LBB1_22
	b	LBB1_21
LBB1_21:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	w8, [x29, #-8]
	subs	w8, w8, #239
	cset	w8, ne
	tbnz	w8, #0, LBB1_23
	b	LBB1_22
LBB1_22:                                ;   in Loop: Header=BB1_3 Depth=2
	ldurb	w8, [x29, #-12]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB1_24
LBB1_23:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	x10, [x29, #-32]                ; 8-byte Folded Reload
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB1_24
LBB1_24:                                ;   in Loop: Header=BB1_3 Depth=2
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
	b	LBB1_25
LBB1_25:                                ;   in Loop: Header=BB1_3 Depth=2
	ldur	w8, [x29, #-8]
	add	w8, w8, #1
	stur	w8, [x29, #-8]
	b	LBB1_3
LBB1_26:                                ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_27
LBB1_27:                                ;   in Loop: Header=BB1_1 Depth=1
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	stur	w8, [x29, #-4]
	b	LBB1_1
LBB1_28:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function CSC_YCC_to_RGB_brute_force_int
_CSC_YCC_to_RGB_brute_force_int:        ; @CSC_YCC_to_RGB_brute_force_int
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #160
	.cfi_def_cfa_offset 160
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	w0, [sp, #36]
	str	w1, [sp, #32]
	str	wzr, [sp, #28]
	b	LBB2_1
LBB2_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_3 Depth 2
	ldr	w8, [sp, #28]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_8
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	str	wzr, [sp, #24]
	b	LBB2_3
LBB2_3:                                 ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #24]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_6
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #28]
	add	w8, w8, w9
	adrp	x10, _Y@GOTPAGE
	ldr	x10, [x10, _Y@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #24]
	add	w9, w9, w10
	ldrb	w8, [x8, w9, sxtw]
	subs	w8, w8, #16
	ldrsw	x10, [sp, #28]
	sub	x9, x29, #24
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #24]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #28]
	add	w8, w8, w9
	adrp	x10, _Cb_temp@GOTPAGE
	ldr	x10, [x10, _Cb_temp@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #24]
	add	w9, w9, w10
	ldrb	w8, [x8, w9, sxtw]
	subs	w8, w8, #128
	ldrsw	x10, [sp, #28]
	sub	x9, x29, #40
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #24]
	str	w8, [x9, x10, lsl #2]
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #28]
	add	w8, w8, w9
	adrp	x10, _Cr_temp@GOTPAGE
	ldr	x10, [x10, _Cr_temp@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #24]
	add	w9, w9, w10
	ldrb	w8, [x8, w9, sxtw]
	subs	w8, w8, #128
	ldrsw	x10, [sp, #28]
	sub	x9, x29, #56
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #24]
	str	w8, [x9, x10, lsl #2]
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=2
	ldr	w8, [sp, #24]
	add	w8, w8, #1
	str	w8, [sp, #24]
	b	LBB2_3
LBB2_6:                                 ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_7
LBB2_7:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #28]
	add	w8, w8, #1
	str	w8, [sp, #28]
	b	LBB2_1
LBB2_8:
	str	wzr, [sp, #20]
	b	LBB2_9
LBB2_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_11 Depth 2
	ldr	w8, [sp, #20]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_16
	b	LBB2_10
LBB2_10:                                ;   in Loop: Header=BB2_9 Depth=1
	str	wzr, [sp, #16]
	b	LBB2_11
LBB2_11:                                ;   Parent Loop BB2_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #16]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_14
	b	LBB2_12
LBB2_12:                                ;   in Loop: Header=BB2_11 Depth=2
	ldrsw	x9, [sp, #20]
	sub	x8, x29, #24
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp, #16]
	ldr	w9, [x8, x9, lsl #2]
	mov	w8, #297
	mul	w8, w8, w9
	ldrsw	x10, [sp, #20]
	sub	x9, x29, #56
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #16]
	ldr	w10, [x9, x10, lsl #2]
	mov	w9, #408
	mul	w9, w9, w10
	add	w8, w8, w9
	add	w8, w8, #128
	asr	w9, w8, #8
	ldrsw	x11, [sp, #20]
	add	x8, sp, #72
	mov	x10, x8
	add	x10, x10, x11, lsl #3
	ldrsw	x11, [sp, #16]
	str	w9, [x10, x11, lsl #2]
	ldrsw	x9, [sp, #20]
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp, #16]
	ldr	w0, [x8, x9, lsl #2]
	bl	_saturation_int
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #20]
	add	w8, w8, w9
	adrp	x10, _R@GOTPAGE
	ldr	x10, [x10, _R@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #16]
	add	w9, w9, w10
	strb	w0, [x8, w9, sxtw]
	b	LBB2_13
LBB2_13:                                ;   in Loop: Header=BB2_11 Depth=2
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB2_11
LBB2_14:                                ;   in Loop: Header=BB2_9 Depth=1
	b	LBB2_15
LBB2_15:                                ;   in Loop: Header=BB2_9 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB2_9
LBB2_16:
	str	wzr, [sp, #12]
	b	LBB2_17
LBB2_17:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_19 Depth 2
	ldr	w8, [sp, #12]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_24
	b	LBB2_18
LBB2_18:                                ;   in Loop: Header=BB2_17 Depth=1
	str	wzr, [sp, #8]
	b	LBB2_19
LBB2_19:                                ;   Parent Loop BB2_17 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_22
	b	LBB2_20
LBB2_20:                                ;   in Loop: Header=BB2_19 Depth=2
	ldrsw	x9, [sp, #12]
	sub	x8, x29, #24
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp, #8]
	ldr	w9, [x8, x9, lsl #2]
	mov	w8, #297
	mul	w8, w8, w9
	ldrsw	x10, [sp, #12]
	sub	x9, x29, #56
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #8]
	ldr	w10, [x9, x10, lsl #2]
	mov	w9, #208
	mul	w9, w9, w10
	subs	w8, w8, w9
	ldrsw	x10, [sp, #12]
	sub	x9, x29, #40
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp, #8]
	ldr	w10, [x9, x10, lsl #2]
	mov	w9, #100
	mul	w9, w9, w10
	subs	w8, w8, w9
	add	w8, w8, #128
	asr	w9, w8, #8
	ldrsw	x11, [sp, #12]
	add	x8, sp, #56
	mov	x10, x8
	add	x10, x10, x11, lsl #3
	ldrsw	x11, [sp, #8]
	str	w9, [x10, x11, lsl #2]
	ldrsw	x9, [sp, #12]
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp, #8]
	ldr	w0, [x8, x9, lsl #2]
	bl	_saturation_int
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #12]
	add	w8, w8, w9
	adrp	x10, _G@GOTPAGE
	ldr	x10, [x10, _G@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp, #8]
	add	w9, w9, w10
	strb	w0, [x8, w9, sxtw]
	b	LBB2_21
LBB2_21:                                ;   in Loop: Header=BB2_19 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB2_19
LBB2_22:                                ;   in Loop: Header=BB2_17 Depth=1
	b	LBB2_23
LBB2_23:                                ;   in Loop: Header=BB2_17 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB2_17
LBB2_24:
	str	wzr, [sp, #4]
	b	LBB2_25
LBB2_25:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_27 Depth 2
	ldr	w8, [sp, #4]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_32
	b	LBB2_26
LBB2_26:                                ;   in Loop: Header=BB2_25 Depth=1
	str	wzr, [sp]
	b	LBB2_27
LBB2_27:                                ;   Parent Loop BB2_25 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB2_30
	b	LBB2_28
LBB2_28:                                ;   in Loop: Header=BB2_27 Depth=2
	ldrsw	x9, [sp, #4]
	sub	x8, x29, #24
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp]
	ldr	w9, [x8, x9, lsl #2]
	mov	w8, #297
	mul	w8, w8, w9
	ldrsw	x10, [sp, #4]
	sub	x9, x29, #40
	add	x9, x9, x10, lsl #3
	ldrsw	x10, [sp]
	ldr	w10, [x9, x10, lsl #2]
	mov	w9, #516
	mul	w9, w9, w10
	add	w8, w8, w9
	add	w8, w8, #128
	asr	w9, w8, #8
	ldrsw	x11, [sp, #4]
	add	x8, sp, #40
	mov	x10, x8
	add	x10, x10, x11, lsl #3
	ldrsw	x11, [sp]
	str	w9, [x10, x11, lsl #2]
	ldrsw	x9, [sp, #4]
	add	x8, x8, x9, lsl #3
	ldrsw	x9, [sp]
	ldr	w0, [x8, x9, lsl #2]
	bl	_saturation_int
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #4]
	add	w8, w8, w9
	adrp	x10, _B@GOTPAGE
	ldr	x10, [x10, _B@GOTPAGEOFF]
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldr	w9, [sp, #32]
	ldr	w10, [sp]
	add	w9, w9, w10
	strb	w0, [x8, w9, sxtw]
	b	LBB2_29
LBB2_29:                                ;   in Loop: Header=BB2_27 Depth=2
	ldr	w8, [sp]
	add	w8, w8, #1
	str	w8, [sp]
	b	LBB2_27
LBB2_30:                                ;   in Loop: Header=BB2_25 Depth=1
	b	LBB2_31
LBB2_31:                                ;   in Loop: Header=BB2_25 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB2_25
LBB2_32:
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB2_34
	b	LBB2_33
LBB2_33:
	bl	___stack_chk_fail
LBB2_34:
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #160
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
	.p2align	2                               ; -- Begin function saturation_int
_saturation_int:                        ; @saturation_int
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #8]
	ldr	w8, [sp, #8]
	subs	w8, w8, #255
	cset	w8, le
	tbnz	w8, #0, LBB4_2
	b	LBB4_1
LBB4_1:
	mov	w8, #255
	strb	w8, [sp, #15]
	b	LBB4_5
LBB4_2:
	ldr	w8, [sp, #8]
	subs	w8, w8, #0
	cset	w8, ge
	tbnz	w8, #0, LBB4_4
	b	LBB4_3
LBB4_3:
	strb	wzr, [sp, #15]
	b	LBB4_5
LBB4_4:
	ldr	w8, [sp, #8]
	strb	w8, [sp, #15]
	b	LBB4_5
LBB4_5:
	ldrb	w0, [sp, #15]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
