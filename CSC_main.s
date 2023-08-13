	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI0_0:
	.quad	0x412e848000000000              ; double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #192
	.cfi_def_cfa_offset 192
	stp	x29, x30, [sp, #176]            ; 16-byte Folded Spill
	add	x29, sp, #176
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, _R@GOTPAGE
	ldr	x8, [x8, _R@GOTPAGEOFF]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	adrp	x8, _G@GOTPAGE
	ldr	x8, [x8, _G@GOTPAGEOFF]
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	adrp	x8, _B@GOTPAGE
	ldr	x8, [x8, _B@GOTPAGEOFF]
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	stur	wzr, [x29, #-4]
	bl	_clock
	stur	x0, [x29, #-16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-48]
	ldur	x8, [x29, #-48]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_2:
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-56]
	ldur	x8, [x29, #-56]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_4
	b	LBB0_3
LBB0_3:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_4:
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-64]
	ldur	x8, [x29, #-64]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_6:
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-72]
	ldur	x8, [x29, #-72]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_8:
	stur	wzr, [x29, #-36]
	b	LBB0_9
LBB0_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_11 Depth 2
	ldur	w8, [x29, #-36]
	subs	w8, w8, #640
	cset	w8, ge
	tbnz	w8, #0, LBB0_16
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	stur	wzr, [x29, #-40]
	b	LBB0_11
LBB0_11:                                ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-40]
	subs	w8, w8, #480
	cset	w8, ge
	tbnz	w8, #0, LBB0_14
	b	LBB0_12
LBB0_12:                                ;   in Loop: Header=BB0_11 Depth=2
	ldur	x0, [x29, #-48]
	bl	_fgetc
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mov	x10, #480
	str	x10, [sp, #32]                  ; 8-byte Folded Spill
	mul	x11, x9, x10
	mov	x9, x8
	add	x9, x9, x11
	ldursw	x11, [x29, #-40]
	strb	w0, [x9, x11]
	ldursw	x9, [x29, #-36]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldur	x1, [x29, #-56]
	bl	_fputc
	ldur	x0, [x29, #-48]
	bl	_fgetc
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mul	x11, x9, x10
	mov	x9, x8
	add	x9, x9, x11
	ldursw	x11, [x29, #-40]
	strb	w0, [x9, x11]
	ldursw	x9, [x29, #-36]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldur	x1, [x29, #-64]
	bl	_fputc
	ldur	x0, [x29, #-48]
	bl	_fgetc
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mul	x11, x9, x10
	mov	x9, x8
	add	x9, x9, x11
	ldursw	x11, [x29, #-40]
	strb	w0, [x9, x11]
	ldursw	x9, [x29, #-36]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldur	x1, [x29, #-72]
	bl	_fputc
	b	LBB0_13
LBB0_13:                                ;   in Loop: Header=BB0_11 Depth=2
	ldur	w8, [x29, #-40]
	add	w8, w8, #1
	stur	w8, [x29, #-40]
	b	LBB0_11
LBB0_14:                                ;   in Loop: Header=BB0_9 Depth=1
	b	LBB0_15
LBB0_15:                                ;   in Loop: Header=BB0_9 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	LBB0_9
LBB0_16:
	ldur	x0, [x29, #-72]
	bl	_fclose
	ldur	x0, [x29, #-64]
	bl	_fclose
	ldur	x0, [x29, #-56]
	bl	_fclose
	ldur	x0, [x29, #-48]
	bl	_fclose
	bl	_CSC_RGB_to_YCC
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-80]
	ldur	x8, [x29, #-80]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_18
	b	LBB0_17
LBB0_17:
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	mov	x9, sp
	adrp	x8, l_.str.7@PAGE
	add	x8, x8, l_.str.7@PAGEOFF
	str	x8, [x9]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_fprintf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_18:
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	str	x0, [sp, #88]
	ldr	x8, [sp, #88]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_20
	b	LBB0_19
LBB0_19:
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	mov	x9, sp
	adrp	x8, l_.str.9@PAGE
	add	x8, x8, l_.str.9@PAGEOFF
	str	x8, [x9]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_fprintf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_20:
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	str	x0, [sp, #80]
	ldr	x8, [sp, #80]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_22
	b	LBB0_21
LBB0_21:
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	mov	x9, sp
	adrp	x8, l_.str.10@PAGE
	add	x8, x8, l_.str.10@PAGEOFF
	str	x8, [x9]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	_fprintf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_22:
	stur	wzr, [x29, #-36]
	b	LBB0_23
LBB0_23:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_25 Depth 2
	ldur	w8, [x29, #-36]
	subs	w8, w8, #640
	cset	w8, ge
	tbnz	w8, #0, LBB0_30
	b	LBB0_24
LBB0_24:                                ;   in Loop: Header=BB0_23 Depth=1
	stur	wzr, [x29, #-40]
	b	LBB0_25
LBB0_25:                                ;   Parent Loop BB0_23 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-40]
	subs	w8, w8, #480
	cset	w8, ge
	tbnz	w8, #0, LBB0_28
	b	LBB0_26
LBB0_26:                                ;   in Loop: Header=BB0_25 Depth=2
	ldursw	x8, [x29, #-36]
	mov	x9, #480
	mul	x9, x8, x9
	adrp	x8, _Y@GOTPAGE
	ldr	x8, [x8, _Y@GOTPAGEOFF]
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldur	x1, [x29, #-80]
	bl	_fputc
	b	LBB0_27
LBB0_27:                                ;   in Loop: Header=BB0_25 Depth=2
	ldur	w8, [x29, #-40]
	add	w8, w8, #1
	stur	w8, [x29, #-40]
	b	LBB0_25
LBB0_28:                                ;   in Loop: Header=BB0_23 Depth=1
	b	LBB0_29
LBB0_29:                                ;   in Loop: Header=BB0_23 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	LBB0_23
LBB0_30:
	stur	wzr, [x29, #-36]
	b	LBB0_31
LBB0_31:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_33 Depth 2
	ldur	w8, [x29, #-36]
	subs	w8, w8, #320
	cset	w8, ge
	tbnz	w8, #0, LBB0_38
	b	LBB0_32
LBB0_32:                                ;   in Loop: Header=BB0_31 Depth=1
	stur	wzr, [x29, #-40]
	b	LBB0_33
LBB0_33:                                ;   Parent Loop BB0_31 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-40]
	subs	w8, w8, #240
	cset	w8, ge
	tbnz	w8, #0, LBB0_36
	b	LBB0_34
LBB0_34:                                ;   in Loop: Header=BB0_33 Depth=2
	ldursw	x8, [x29, #-36]
	mov	x9, #240
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	mul	x9, x8, x9
	adrp	x8, _Cb@GOTPAGE
	ldr	x8, [x8, _Cb@GOTPAGEOFF]
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldr	x1, [sp, #88]
	bl	_fputc
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	ldursw	x8, [x29, #-36]
	mul	x9, x8, x9
	adrp	x8, _Cr@GOTPAGE
	ldr	x8, [x8, _Cr@GOTPAGEOFF]
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldr	x1, [sp, #80]
	bl	_fputc
	b	LBB0_35
LBB0_35:                                ;   in Loop: Header=BB0_33 Depth=2
	ldur	w8, [x29, #-40]
	add	w8, w8, #1
	stur	w8, [x29, #-40]
	b	LBB0_33
LBB0_36:                                ;   in Loop: Header=BB0_31 Depth=1
	b	LBB0_37
LBB0_37:                                ;   in Loop: Header=BB0_31 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	LBB0_31
LBB0_38:
	ldr	x0, [sp, #80]
	bl	_fclose
	ldr	x0, [sp, #88]
	bl	_fclose
	ldur	x0, [x29, #-80]
	bl	_fclose
	bl	_CSC_YCC_to_RGB
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	str	x0, [sp, #72]
	ldr	x8, [sp, #72]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_40
	b	LBB0_39
LBB0_39:
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB0_49
LBB0_40:
	stur	wzr, [x29, #-36]
	b	LBB0_41
LBB0_41:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_43 Depth 2
	ldur	w8, [x29, #-36]
	subs	w8, w8, #640
	cset	w8, ge
	tbnz	w8, #0, LBB0_48
	b	LBB0_42
LBB0_42:                                ;   in Loop: Header=BB0_41 Depth=1
	stur	wzr, [x29, #-40]
	b	LBB0_43
LBB0_43:                                ;   Parent Loop BB0_41 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-40]
	subs	w8, w8, #480
	cset	w8, ge
	tbnz	w8, #0, LBB0_46
	b	LBB0_44
LBB0_44:                                ;   in Loop: Header=BB0_43 Depth=2
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mov	x10, #480
	str	x10, [sp, #16]                  ; 8-byte Folded Spill
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldr	x1, [sp, #72]
	bl	_fputc
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x10, [sp, #16]                  ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldr	x1, [sp, #72]
	bl	_fputc
	ldr	x10, [sp, #16]                  ; 8-byte Folded Reload
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	ldursw	x9, [x29, #-36]
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-40]
	ldrb	w0, [x8, x9]
	ldr	x1, [sp, #72]
	bl	_fputc
	b	LBB0_45
LBB0_45:                                ;   in Loop: Header=BB0_43 Depth=2
	ldur	w8, [x29, #-40]
	add	w8, w8, #1
	stur	w8, [x29, #-40]
	b	LBB0_43
LBB0_46:                                ;   in Loop: Header=BB0_41 Depth=1
	b	LBB0_47
LBB0_47:                                ;   in Loop: Header=BB0_41 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1
	stur	w8, [x29, #-36]
	b	LBB0_41
LBB0_48:
	ldr	x0, [sp, #72]
	bl	_fclose
	bl	_clock
	stur	x0, [x29, #-24]
	ldur	d0, [x29, #-24]
	ucvtf	d0, d0
	ldur	d1, [x29, #-16]
	ucvtf	d1, d1
	fsub	d0, d0, d1
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fdiv	d0, d0, d1
	stur	d0, [x29, #-32]
	ldur	d0, [x29, #-32]
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_printf
	b	LBB0_49
LBB0_49:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #176]            ; 16-byte Folded Reload
	add	sp, sp, #192
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"./image_input_RGB_640_480_01.data"

l_.str.1:                               ; @.str.1
	.asciz	"rb"

l_.str.2:                               ; @.str.2
	.asciz	"Cannot open file.\n"

l_.str.3:                               ; @.str.3
	.asciz	"./image_echo_R_640_480_02.data"

l_.str.4:                               ; @.str.4
	.asciz	"wb"

l_.str.5:                               ; @.str.5
	.asciz	"./image_echo_G_640_480_02.data"

l_.str.6:                               ; @.str.6
	.asciz	"./image_echo_B_640_480_02.data"

	.comm	_R,307200,0                     ; @R
	.comm	_G,307200,0                     ; @G
	.comm	_B,307200,0                     ; @B
l_.str.7:                               ; @.str.7
	.asciz	"./image_output_Y_640_480_02.data"

l_.str.8:                               ; @.str.8
	.asciz	"Could not open %s\n"

l_.str.9:                               ; @.str.9
	.asciz	"./image_output_Cb_640_480_02.data"

l_.str.10:                              ; @.str.10
	.asciz	"./image_output_Cr_640_480_02.data"

	.comm	_Y,307200,0                     ; @Y
	.comm	_Cb,76800,0                     ; @Cb
	.comm	_Cr,76800,0                     ; @Cr
l_.str.11:                              ; @.str.11
	.asciz	"./image_output_RGB_640_480_02.data"

l_.str.12:                              ; @.str.12
	.asciz	"Total running time: %f seconds\n"

	.comm	_Cb_temp,307200,0               ; @Cb_temp
	.comm	_Cr_temp,307200,0               ; @Cr_temp
.subsections_via_symbols
