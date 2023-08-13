	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_CSC_RGB_to_YCC                 ; -- Begin function CSC_RGB_to_YCC
	.p2align	2
_CSC_RGB_to_YCC:                        ; @CSC_RGB_to_YCC
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
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
	bl	_CSC_RGB_to_YCC_brute_force_int
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
	.p2align	2                               ; -- Begin function CSC_RGB_to_YCC_brute_force_int
_CSC_RGB_to_YCC_brute_force_int:        ; @CSC_RGB_to_YCC_brute_force_int
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x13, _R@GOTPAGE
	ldr	x13, [x13, _R@GOTPAGEOFF]
	adrp	x12, _G@GOTPAGE
	ldr	x12, [x12, _G@GOTPAGEOFF]
	adrp	x10, _B@GOTPAGE
	ldr	x10, [x10, _B@GOTPAGEOFF]
	adrp	x11, _Y@GOTPAGE
	ldr	x11, [x11, _Y@GOTPAGEOFF]
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x14, x13
	mov	w9, #480
	smaddl	x8, w8, w9, x14
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-12]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x14, x13
	mov	w9, #480
	smaddl	x8, w8, w9, x14
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-16]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	x14, x13
	mov	w9, #480
	smaddl	x8, w8, w9, x14
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-20]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x13
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-24]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x13, x12
	mov	w9, #480
	smaddl	x8, w8, w9, x13
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-28]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x13, x12
	mov	w9, #480
	smaddl	x8, w8, w9, x13
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-32]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	x13, x12
	mov	w9, #480
	smaddl	x8, w8, w9, x13
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-36]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x12
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-40]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x12, x10
	mov	w9, #480
	smaddl	x8, w8, w9, x12
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-44]
	ldur	w8, [x29, #-4]
	add	w8, w8, #0
	mov	x12, x10
	mov	w9, #480
	smaddl	x8, w8, w9, x12
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-48]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	x12, x10
	mov	w9, #480
	smaddl	x8, w8, w9, x12
	ldur	w9, [x29, #-8]
	add	w9, w9, #0
	ldrb	w8, [x8, w9, sxtw]
	stur	w8, [x29, #-52]
	ldur	w8, [x29, #-4]
	add	w8, w8, #1
	mov	w9, #480
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	add	w9, w9, #1
	ldrb	w8, [x8, w9, sxtw]
	str	w8, [sp, #56]
	ldur	w9, [x29, #-12]
	mov	w8, #66
	mul	w9, w8, w9
	add	w9, w9, #1, lsl #12             ; =4096
	ldur	w12, [x29, #-28]
	mov	w10, #129
	mul	w12, w10, w12
	add	w12, w9, w12
	ldur	w13, [x29, #-44]
	mov	w9, #25
	mul	w13, w9, w13
	add	w12, w12, w13
	str	w12, [sp, #52]
	ldr	w12, [sp, #52]
	add	w12, w12, #128
	str	w12, [sp, #52]
	ldr	w12, [sp, #52]
	asr	w12, w12, #8
	str	w12, [sp, #52]
	ldur	w12, [x29, #-16]
	mul	w12, w8, w12
	add	w12, w12, #1, lsl #12           ; =4096
	ldur	w13, [x29, #-32]
	mul	w13, w10, w13
	add	w12, w12, w13
	ldur	w13, [x29, #-48]
	mul	w13, w9, w13
	add	w12, w12, w13
	str	w12, [sp, #48]
	ldr	w12, [sp, #48]
	add	w12, w12, #128
	str	w12, [sp, #48]
	ldr	w12, [sp, #48]
	asr	w12, w12, #8
	str	w12, [sp, #48]
	ldur	w12, [x29, #-20]
	mul	w12, w8, w12
	add	w12, w12, #1, lsl #12           ; =4096
	ldur	w13, [x29, #-36]
	mul	w13, w10, w13
	add	w12, w12, w13
	ldur	w13, [x29, #-52]
	mul	w13, w9, w13
	add	w12, w12, w13
	str	w12, [sp, #44]
	ldr	w12, [sp, #44]
	add	w12, w12, #128
	str	w12, [sp, #44]
	ldr	w12, [sp, #44]
	asr	w12, w12, #8
	str	w12, [sp, #44]
	ldur	w12, [x29, #-24]
	mul	w8, w8, w12
	add	w8, w8, #1, lsl #12             ; =4096
	ldur	w12, [x29, #-40]
	mul	w10, w10, w12
	add	w8, w8, w10
	ldr	w10, [sp, #56]
	mul	w9, w9, w10
	add	w8, w8, w9
	str	w8, [sp, #40]
	ldr	w8, [sp, #40]
	add	w8, w8, #128
	str	w8, [sp, #40]
	ldr	w8, [sp, #40]
	asr	w8, w8, #8
	str	w8, [sp, #40]
	ldr	w8, [sp, #52]
	ldur	w9, [x29, #-4]
	add	w9, w9, #0
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	add	w10, w10, #0
	strb	w8, [x9, w10, sxtw]
	ldr	w8, [sp, #48]
	ldur	w9, [x29, #-4]
	add	w9, w9, #0
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	add	w10, w10, #1
	strb	w8, [x9, w10, sxtw]
	ldr	w8, [sp, #44]
	ldur	w9, [x29, #-4]
	add	w9, w9, #1
	mov	x12, x11
	mov	w10, #480
	smaddl	x9, w9, w10, x12
	ldur	w10, [x29, #-8]
	add	w10, w10, #0
	strb	w8, [x9, w10, sxtw]
	ldr	w8, [sp, #40]
	ldur	w9, [x29, #-4]
	add	w9, w9, #1
	mov	w10, #480
	smaddl	x9, w9, w10, x11
	ldur	w10, [x29, #-8]
	add	w10, w10, #1
	strb	w8, [x9, w10, sxtw]
	ldur	w8, [x29, #-12]
	mov	w11, #38
	mul	w8, w11, w8
	mov	w9, #32768
	subs	w8, w9, w8
	ldur	w12, [x29, #-28]
	mov	w10, #74
	mul	w12, w10, w12
	subs	w12, w8, w12
	ldur	w13, [x29, #-44]
	mov	w8, #112
	mul	w13, w8, w13
	add	w12, w12, w13
	str	w12, [sp, #36]
	ldr	w12, [sp, #36]
	add	w12, w12, #128
	str	w12, [sp, #36]
	ldr	w12, [sp, #36]
	asr	w12, w12, #8
	str	w12, [sp, #36]
	ldur	w12, [x29, #-16]
	mul	w12, w11, w12
	subs	w12, w9, w12
	ldur	w13, [x29, #-32]
	mul	w13, w10, w13
	subs	w12, w12, w13
	ldur	w13, [x29, #-48]
	mul	w13, w8, w13
	add	w12, w12, w13
	str	w12, [sp, #32]
	ldr	w12, [sp, #32]
	add	w12, w12, #128
	str	w12, [sp, #32]
	ldr	w12, [sp, #32]
	asr	w12, w12, #8
	str	w12, [sp, #32]
	ldur	w12, [x29, #-20]
	mul	w12, w11, w12
	subs	w12, w9, w12
	ldur	w13, [x29, #-36]
	mul	w13, w10, w13
	subs	w12, w12, w13
	ldur	w13, [x29, #-52]
	mul	w13, w8, w13
	add	w12, w12, w13
	str	w12, [sp, #28]
	ldr	w12, [sp, #28]
	add	w12, w12, #128
	str	w12, [sp, #28]
	ldr	w12, [sp, #28]
	asr	w12, w12, #8
	str	w12, [sp, #28]
	ldur	w12, [x29, #-24]
	mul	w11, w11, w12
	subs	w9, w9, w11
	ldur	w11, [x29, #-40]
	mul	w10, w10, w11
	subs	w9, w9, w10
	ldr	w10, [sp, #56]
	mul	w10, w8, w10
	add	w9, w9, w10
	str	w9, [sp, #24]
	ldr	w9, [sp, #24]
	add	w9, w9, #128
	str	w9, [sp, #24]
	ldr	w9, [sp, #24]
	asr	w9, w9, #8
	str	w9, [sp, #24]
	ldur	w9, [x29, #-12]
	mul	w9, w8, w9
	add	w9, w9, #8, lsl #12             ; =32768
	ldur	w11, [x29, #-28]
	mov	w10, #94
	mul	w11, w10, w11
	subs	w11, w9, w11
	ldur	w12, [x29, #-44]
	mov	w9, #18
	mul	w12, w9, w12
	subs	w11, w11, w12
	str	w11, [sp, #20]
	ldr	w11, [sp, #20]
	add	w11, w11, #128
	str	w11, [sp, #20]
	ldr	w11, [sp, #20]
	asr	w11, w11, #8
	str	w11, [sp, #20]
	ldur	w11, [x29, #-16]
	mul	w11, w8, w11
	add	w11, w11, #8, lsl #12           ; =32768
	ldur	w12, [x29, #-32]
	mul	w12, w10, w12
	subs	w11, w11, w12
	ldur	w12, [x29, #-48]
	mul	w12, w9, w12
	subs	w11, w11, w12
	str	w11, [sp, #16]
	ldr	w11, [sp, #16]
	add	w11, w11, #128
	str	w11, [sp, #16]
	ldr	w11, [sp, #16]
	asr	w11, w11, #8
	str	w11, [sp, #16]
	ldur	w11, [x29, #-20]
	mul	w11, w8, w11
	add	w11, w11, #8, lsl #12           ; =32768
	ldur	w12, [x29, #-36]
	mul	w12, w10, w12
	subs	w11, w11, w12
	ldur	w12, [x29, #-52]
	mul	w12, w9, w12
	subs	w11, w11, w12
	str	w11, [sp, #12]
	ldr	w11, [sp, #12]
	add	w11, w11, #128
	str	w11, [sp, #12]
	ldr	w11, [sp, #12]
	asr	w11, w11, #8
	str	w11, [sp, #12]
	ldur	w11, [x29, #-24]
	mul	w8, w8, w11
	add	w8, w8, #8, lsl #12             ; =32768
	ldur	w11, [x29, #-40]
	mul	w10, w10, w11
	subs	w8, w8, w10
	ldr	w10, [sp, #56]
	mul	w9, w9, w10
	subs	w8, w8, w9
	str	w8, [sp, #8]
	ldr	w8, [sp, #8]
	add	w8, w8, #128
	str	w8, [sp, #8]
	ldr	w8, [sp, #8]
	asr	w8, w8, #8
	str	w8, [sp, #8]
	ldr	w11, [sp, #36]
	ldr	w10, [sp, #32]
	ldr	w9, [sp, #28]
	ldr	w8, [sp, #24]
	and	w0, w11, #0xff
	and	w1, w10, #0xff
	and	w2, w9, #0xff
	and	w3, w8, #0xff
	bl	_chrominance_downsample
	ldur	w8, [x29, #-4]
	asr	w8, w8, #1
	adrp	x10, _Cb@GOTPAGE
	ldr	x10, [x10, _Cb@GOTPAGEOFF]
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	asr	w9, w9, #1
	strb	w0, [x8, w9, sxtw]
	ldr	w11, [sp, #20]
	ldr	w10, [sp, #16]
	ldr	w9, [sp, #12]
	ldr	w8, [sp, #8]
	and	w0, w11, #0xff
	and	w1, w10, #0xff
	and	w2, w9, #0xff
	and	w3, w8, #0xff
	bl	_chrominance_downsample
	ldur	w8, [x29, #-4]
	asr	w8, w8, #1
	adrp	x10, _Cr@GOTPAGE
	ldr	x10, [x10, _Cr@GOTPAGEOFF]
	mov	w9, #240
	smaddl	x8, w8, w9, x10
	ldur	w9, [x29, #-8]
	asr	w9, w9, #1
	strb	w0, [x8, w9, sxtw]
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function chrominance_downsample
_chrominance_downsample:                ; @chrominance_downsample
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	strb	w0, [sp, #15]
	strb	w1, [sp, #14]
	strb	w2, [sp, #13]
	strb	w3, [sp, #12]
	ldrb	w0, [sp, #15]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
