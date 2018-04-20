	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHook.part.0, %function
drawHook.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r2, [r3, #20]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	ldr	r1, [r3, #24]
	blt	.L17
	beq	.L5
	cmp	r1, #0
	beq	.L18
	blt	.L19
.L11:
	cmp	r2, #0
	beq	.L20
	blt	.L21
	ldr	r2, .L22+4
	add	r1, r3, #12
	ldr	r0, [r2]
	ldm	r1, {r1, r2}
	ldr	lr, .L22+8
	add	r3, r2, r0
	mov	ip, #80
	ldr	lr, [lr]
	sub	r3, r3, #8
	b	.L15
.L18:
	mov	ip, #16
	ldr	r2, .L22+4
	add	r1, r3, #12
	ldr	r0, [r2]
	ldr	lr, .L22+8
	ldm	r1, {r1, r2}
	ldr	lr, [lr]
	add	r3, r2, r0
	add	r3, r3, #2
.L15:
	ldr	r0, .L22+12
	add	r2, r1, lr
	orr	r3, r3, #8192
	sub	r2, r2, #8
	strh	r3, [r0, #10]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #12]	@ movhi
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L17:
	cmp	r1, #0
	moveq	r0, #16
	beq	.L14
	bge	.L11
	mov	ip, #80
	ldr	r2, .L22+4
	add	r1, r3, #12
	ldr	lr, .L22+8
	ldr	r0, [r2]
	ldm	r1, {r1, r2}
	ldr	lr, [lr]
	add	r3, r2, r0
	sub	r3, r3, #13
	ldr	r0, .L22+12
	add	r2, r1, lr
	orr	r3, r3, #4096
	sub	r2, r2, #11
	strh	r3, [r0, #10]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #12]	@ movhi
	b	.L1
.L21:
	mov	r0, #80
.L14:
	ldr	r2, .L22+8
	ldr	ip, .L22+4
	ldr	r1, [r2]
	add	r2, r3, #12
	ldm	r2, {r2, r3}
	ldr	ip, [ip]
	add	r2, r2, r1
	add	r3, r3, ip
	ldr	r1, .L22+12
	sub	r2, r2, #8
	sub	r3, r3, #8
	strh	r2, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L20:
	mov	r0, #48
	ldr	r2, .L22+8
	ldr	ip, .L22+4
	ldr	r1, [r2]
	add	r2, r3, #12
	ldm	r2, {r2, r3}
	ldr	ip, [ip]
	add	r2, r2, r1
	add	r3, r3, ip
	ldr	r1, .L22+12
	add	r2, r2, #1
	sub	r3, r3, #8
	strh	r2, [r1, #8]	@ movhi
	strh	r3, [r1, #10]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	cmp	r1, #0
	bge	.L7
	mov	ip, #48
	ldr	r2, .L22+4
	add	r1, r3, #12
	ldr	lr, .L22+8
	ldr	r0, [r2]
	ldm	r1, {r1, r2}
	ldr	lr, [lr]
	add	r3, r2, r0
	sub	r3, r3, #8
	ldr	r0, .L22+12
	add	r2, r1, lr
	orr	r3, r3, #4096
	add	r2, r2, #1
	strh	r3, [r0, #10]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #12]	@ movhi
	b	.L1
.L19:
	mov	ip, #80
	ldr	r2, .L22+4
	add	r1, r3, #12
	ldr	lr, .L22+8
	ldr	r0, [r2]
	ldm	r1, {r1, r2}
	ldr	lr, [lr]
	add	r3, r2, r0
	sub	r3, r3, #8
	ldr	r0, .L22+12
	add	r2, r1, lr
	orr	r3, r3, #12288
	sub	r2, r2, #8
	strh	r3, [r0, #10]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	strh	ip, [r0, #12]	@ movhi
	b	.L1
.L7:
	beq	.L1
	b	.L11
.L23:
	.align	2
.L22:
	.word	hook
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawHook.part.0, .-drawHook.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDust.part.1, %function
drawDust.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L33
	ldr	r3, [r2, #20]
	cmn	r3, #16
	beq	.L30
	cmp	r3, #16
	beq	.L31
	ldr	r3, [r2, #24]
	cmn	r3, #16
	beq	.L32
	cmp	r3, #16
	bxne	lr
	ldr	r1, .L33+4
	ldr	r3, .L33+8
	ldr	r2, [r1, #4]
	ldr	r0, [r3]
	ldr	ip, .L33+12
	ldr	r3, [r1, #24]
	add	r2, r2, r0
	ldr	r1, [r1]
	ldr	ip, [ip]
	lsl	r3, r3, #6
	sub	r2, r2, #16
	ldr	r0, .L33+16
	add	r3, r3, #28
	add	r1, r1, ip
	orr	r2, r2, #20480
.L29:
	orr	r3, r3, #1024
	sub	r1, r1, #6
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
	bx	lr
.L31:
	ldr	r1, .L33+4
	ldr	r3, .L33+8
	ldr	ip, .L33+12
	ldr	r0, [r3]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #24]
	ldr	ip, [ip]
	ldr	r1, [r1]
	add	r2, r2, r0
	lsl	r3, r3, #6
	ldr	r0, .L33+16
	sub	r2, r2, #4
	add	r3, r3, #20
	add	r1, r1, ip
	orr	r2, r2, #16384
	orr	r3, r3, #1024
	sub	r1, r1, #12
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
	bx	lr
.L30:
	ldr	r1, .L33+4
	ldr	r3, .L33+8
	ldr	ip, .L33+12
	ldr	r0, [r3]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #24]
	ldr	ip, [ip]
	ldr	r1, [r1]
	add	r2, r2, r0
	lsl	r3, r3, #6
	ldr	r0, .L33+16
	sub	r2, r2, #12
	add	r3, r3, #20
	add	r1, r1, ip
	orr	r2, r2, #24576
	orr	r3, r3, #1024
	sub	r1, r1, #8
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
	bx	lr
.L32:
	ldr	r1, .L33+4
	ldr	r3, .L33+8
	ldr	r2, [r1, #4]
	ldr	r0, [r3]
	ldr	ip, .L33+12
	ldr	r3, [r1, #24]
	add	r2, r2, r0
	ldr	r1, [r1]
	ldr	ip, [ip]
	lsl	r3, r3, #6
	sub	r2, r2, #8
	ldr	r0, .L33+16
	add	r3, r3, #28
	add	r1, r1, ip
	orr	r2, r2, #16384
	b	.L29
.L34:
	.align	2
.L33:
	.word	hook
	.word	dust
	.word	hOff
	.word	vOff
	.word	shadowOAM+792
	.size	drawDust.part.1, .-drawDust.part.1
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #140
	mov	r1, #16
	mov	ip, #120
	mov	r0, #2
	ldr	r3, .L37
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #40]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L38:
	.align	2
.L37:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L61
	ldr	r2, [r3, #28]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	bne	.L40
	ldr	r2, .L61+4
	ldr	r0, .L61+8
	ldr	ip, [r2]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #36]
	ldr	lr, [r0]
	ldr	r0, [r3]
	add	r1, r1, ip
	lsl	r2, r2, #6
	ldr	ip, .L61+12
	sub	r1, r1, #8
	add	r0, r0, lr
	add	r2, r2, #2
.L53:
	orr	r1, r1, #16384
	sub	r0, r0, #8
	orr	r2, r2, #1024
	strh	r1, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r2, [ip, #4]	@ movhi
.L41:
	ldr	r3, [r3, #48]
	cmp	r3, #0
	ldrne	r2, .L61+12
	ldrhne	r3, [r2]
	orrne	r3, r3, #512
	strhne	r3, [r2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L40:
	cmp	r2, #1
	beq	.L55
	cmp	r2, #2
	beq	.L56
	cmp	r2, #3
	beq	.L57
	cmp	r2, #4
	beq	.L58
	cmp	r2, #5
	beq	.L59
	cmp	r2, #6
	beq	.L60
	cmp	r2, #7
	bne	.L41
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	ldr	r0, [r2]
	ldr	ip, [r1]
	ldr	r2, [r3, #4]
	ldr	r1, [r3]
	add	r2, r2, r0
	add	r1, r1, ip
	ldr	r0, .L61+12
	ldr	ip, .L61+16
	sub	r2, r2, #8
.L54:
	orr	r2, r2, #16384
	sub	r1, r1, #8
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	b	.L41
.L55:
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	ldr	ip, [r2]
	ldr	r2, [r3, #4]
	ldr	lr, [r1]
	ldr	r0, [r3]
	ldr	r1, [r3, #36]
	add	r2, r2, ip
	sub	r2, r2, #8
	ldr	ip, .L61+12
	add	r0, r0, lr
	lsl	r1, r1, #6
	orr	r2, r2, #16384
	sub	r0, r0, #8
	orr	r1, r1, #1024
	strh	r2, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	b	.L41
.L57:
	ldr	r2, .L61+4
	ldr	r0, .L61+8
	ldr	ip, [r2]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #36]
	ldr	lr, [r0]
	ldr	r0, [r3]
	add	r1, r1, ip
	lsl	r2, r2, #6
	sub	r1, r1, #8
	ldr	ip, .L61+12
	add	r0, r0, lr
	add	r2, r2, #6
	b	.L53
.L56:
	ldr	r2, .L61+4
	ldr	r0, .L61+8
	ldr	ip, [r2]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #36]
	ldr	lr, [r0]
	ldr	r0, [r3]
	add	r1, r1, ip
	lsl	r2, r2, #6
	sub	r1, r1, #8
	ldr	ip, .L61+12
	add	r0, r0, lr
	add	r2, r2, #4
	b	.L53
.L60:
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	ldr	r0, [r2]
	ldr	r2, [r3, #4]
	ldr	ip, [r1]
	ldr	r1, [r3]
	add	r2, r2, r0
	add	r1, r1, ip
	sub	r2, r2, #8
	ldr	r0, .L61+12
	ldr	ip, .L61+20
	b	.L54
.L58:
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	ldr	r0, [r2]
	ldr	r2, [r3, #4]
	ldr	ip, [r1]
	ldr	r1, [r3]
	add	r2, r2, r0
	add	r1, r1, ip
	sub	r2, r2, #8
	ldr	r0, .L61+12
	ldr	ip, .L61+24
	b	.L54
.L59:
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	ldr	r0, [r2]
	ldr	r2, [r3, #4]
	ldr	ip, [r1]
	ldr	r1, [r3]
	add	r2, r2, r0
	add	r1, r1, ip
	sub	r2, r2, #8
	ldr	r0, .L61+12
	ldr	ip, .L61+28
	b	.L54
.L62:
	.align	2
.L61:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	1032
	.word	1036
	.word	1034
	.word	1038
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHook, %function
initHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #7
	ldr	r3, .L64
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	bx	lr
.L65:
	.align	2
.L64:
	.word	hook
	.size	initHook, .-initHook
	.align	2
	.global	shootHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootHook, %function
shootHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #0
	ldr	r5, .L104
	ldr	r4, .L104+4
	ldm	r5, {r0, lr}
	mov	r3, ip
	ldr	r2, .L104+8
	str	r0, [r4]
	str	r0, [r4, #12]
	ldr	r1, .L104+12
	ldr	r0, .L104+16
	ldr	r7, .L104+20
	str	lr, [r4, #4]
	str	lr, [r4, #16]
	str	r6, [r4, #36]
	str	ip, [r4, #8]
	mov	lr, pc
	bx	r7
	ldr	r3, .L104+24
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L67
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L97
.L67:
	ldr	r3, .L104+24
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L98
	ldrh	r3, [r3, #48]
	tst	r3, #128
	movne	r2, #0
	moveq	r2, #5
	moveq	r3, #16
	streq	r2, [r5, #28]
	movne	r3, r2
	strne	r2, [r4, #20]
	ldr	r2, .L104+24
	ldrh	r1, [r2, #48]
	streq	r3, [r4, #20]
	tst	r1, #32
	bne	.L72
.L100:
	mov	r1, #6
	mvn	r2, #15
	str	r1, [r5, #28]
	str	r2, [r4, #24]
.L73:
	cmp	r3, #0
	blt	.L66
.L75:
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r4, #24]
	cmp	r3, #0
	blt	.L99
	beq	.L66
	ldm	r5, {r2, r3}
	add	r2, r2, #12
	add	r3, r3, #8
	str	r2, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #4]
	str	r3, [r4, #16]
.L66:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L98:
	mov	r2, #4
	mvn	r3, #15
	str	r2, [r5, #28]
	ldr	r2, .L104+24
	ldrh	r1, [r2, #48]
	tst	r1, #32
	str	r3, [r4, #20]
	beq	.L100
.L72:
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L74
	mov	r1, #7
	mov	r2, #16
	cmp	r3, #0
	str	r1, [r5, #28]
	str	r2, [r4, #24]
	bge	.L75
.L82:
	ldr	r3, [r5, #4]
	add	r3, r3, #12
	str	r3, [r4, #4]
	str	r3, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L97:
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L67
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L67
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L101
	cmp	r3, #1
	beq	.L102
	cmp	r3, #2
	moveq	r3, #16
	streq	r6, [r4, #20]
	streq	r3, [r4, #24]
	beq	.L66
	cmp	r3, #3
	beq	.L103
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bge	.L75
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bgt	.L82
	b	.L66
.L74:
	mov	r2, #0
	str	r2, [r4, #24]
	b	.L73
.L99:
	ldm	r5, {r2, r3}
	add	r2, r2, #12
	sub	r3, r3, #6
	str	r2, [r4]
	str	r2, [r4, #12]
	str	r3, [r4, #4]
	str	r3, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L101:
	mov	r1, #4
	mvn	r2, #15
	str	r3, [r4, #24]
	str	r1, [r5, #28]
	str	r2, [r4, #20]
	b	.L66
.L102:
	mov	r2, #5
	mov	r3, #16
	str	r6, [r4, #24]
	str	r2, [r5, #28]
	str	r3, [r4, #20]
	b	.L66
.L103:
	mov	r2, #6
	mvn	r3, #15
	str	r6, [r4, #20]
	str	r2, [r5, #28]
	str	r3, [r4, #24]
	b	.L66
.L105:
	.align	2
.L104:
	.word	player
	.word	hook
	.word	11025
	.word	12645
	.word	chainSFX
	.word	playSoundB
	.word	67109120
	.size	shootHook, .-shootHook
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L164
	ldr	r3, [r4, #28]
	cmp	r3, #8
	strne	r3, [r4, #32]
	mov	r3, #8
	ldr	r2, .L164+4
	ldrh	r2, [r2, #48]
	ldr	r5, .L164+8
	tst	r2, #32
	str	r3, [r4, #28]
	ldr	r3, [r5, #8]
	bne	.L108
	cmp	r3, #0
	bne	.L108
	mvn	r2, #0
	mov	r1, #3
	str	r2, [r4, #12]
	ldr	r2, .L164+4
	ldrh	r2, [r2, #48]
	ands	r2, r2, #64
	str	r1, [r4, #28]
	bne	.L135
.L161:
	mvn	r1, #0
	ldr	r6, .L164+12
	str	r2, [r4, #28]
	ldrh	r2, [r6]
	tst	r2, #1
	str	r1, [r4, #8]
	bne	.L157
.L114:
	tst	r2, #2
	beq	.L116
	ldr	r2, .L164+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L116
	ldr	r2, .L164+20
	ldr	r0, [r2]
	cmp	r0, #0
	ble	.L116
.L139:
	ldr	r2, .L164+24
	ldr	r1, [r2, #8]
	rsbs	r1, r1, #1
	movcc	r1, #0
	mov	ip, #512
	cmp	r0, #1
	ldr	r0, .L164+28
	str	r1, [r2, #8]
	strh	ip, [r0]	@ movhi
	beq	.L116
	ldr	r1, [r2, #64]
	rsbs	r1, r1, #1
	movcc	r1, #0
	strh	ip, [r0, #8]	@ movhi
	str	r1, [r2, #64]
.L116:
	cmp	r3, #0
	bne	.L117
.L156:
	add	r2, r4, #8
	ldm	r2, {r2, r3}
.L118:
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	add	r3, r3, r0
	cmp	r3, #16
	add	r2, r2, r1
	stm	r4, {r2, r3}
	movle	r3, #16
	strle	r3, [r4, #4]
	ble	.L121
	cmp	r3, #208
	movgt	r3, #207
	strgt	r3, [r4, #4]
.L121:
	cmp	r2, #16
	movle	r3, #16
	strle	r3, [r4]
	ble	.L123
	cmp	r2, #128
	movgt	r3, #127
	strgt	r3, [r4]
.L123:
	ldr	r3, [r4, #28]
	cmp	r3, #8
	ldr	r2, [r4, #24]
	beq	.L158
	ldr	r3, .L164+32
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L125
	ldr	r1, [r4, #36]
	ldr	r0, [r4, #40]
	add	r1, r1, #1
	cmp	r1, r0
	str	r1, [r4, #36]
	strge	r3, [r4, #36]
.L125:
	ldr	r3, [r4, #44]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #44]
	movle	r3, #0
	strle	r3, [r4, #44]
	strle	r3, [r4, #48]
	ble	.L129
	ldr	r1, .L164+32
	smull	r6, r7, r3, r1
	asr	r1, r3, #31
	rsb	r1, r1, r7, asr #1
	add	r1, r1, r1, lsl #2
	cmp	r3, r1
	beq	.L129
	ldr	r3, [r4, #48]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r4, #48]
.L129:
	ldr	r5, .L164+36
	ldr	r1, .L164+40
	ldr	r3, [r5]
	ldr	r1, [r1]
	add	r2, r2, #1
	cmp	r1, r3
	str	r2, [r4, #24]
	bcc	.L130
	ldr	lr, .L164+44
	ldr	r2, [lr]
	cmp	r2, #4
	bls	.L159
.L131:
	add	r3, r3, #200
	str	r3, [r5]
.L130:
	ldr	r3, .L164+48
	ldr	r2, .L164+52
	ldr	r3, [r3]
	smull	r0, r1, r3, r2
	asr	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	cmp	r3, #4
	movgt	r2, #5
	ldrle	r2, .L164+56
	ldrgt	r3, .L164+56
	strle	r3, [r2]
	strgt	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L108:
	ldr	r2, .L164+4
	ldrh	r2, [r2, #48]
	tst	r2, #16
	beq	.L160
	cmp	r3, #0
	streq	r3, [r4, #12]
	bne	.L111
.L109:
	ldr	r2, .L164+4
	ldrh	r2, [r2, #48]
	ands	r2, r2, #64
	beq	.L161
.L135:
	ldr	r2, .L164+4
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L113
	cmp	r3, #0
	moveq	r2, #1
	streq	r2, [r4, #28]
	streq	r2, [r4, #8]
	b	.L112
.L160:
	cmp	r3, #0
	beq	.L162
.L111:
	ldr	r2, .L164+4
	ldrh	r1, [r2, #48]
	tst	r1, #64
	ldrheq	r2, [r2, #48]
	bne	.L135
.L112:
	ldr	r6, .L164+12
	ldrh	r2, [r6]
	tst	r2, #1
	beq	.L114
.L157:
	ldr	r1, .L164+16
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L114
	cmp	r3, #0
	beq	.L163
	tst	r2, #2
	beq	.L117
	tst	r1, #2
	beq	.L137
.L117:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	bne	.L156
	mov	r2, r3
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	b	.L118
.L158:
	mov	r1, #0
	ldr	r3, [r4, #32]
	str	r1, [r4, #36]
	str	r3, [r4, #28]
	b	.L125
.L113:
	cmp	r3, #0
	streq	r3, [r4, #8]
	b	.L112
.L162:
	mov	r1, #2
	mov	r2, #1
	str	r1, [r4, #28]
	str	r2, [r4, #12]
	b	.L109
.L163:
	bl	shootHook
	ldrh	r2, [r6]
	ldr	r3, [r5, #8]
	b	.L114
.L159:
	add	ip, r2, #1
	mov	r3, #0
	ldr	r2, .L164+60
	ldr	r1, .L164+64
	ldr	r0, .L164+68
	ldr	r4, .L164+72
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	b	.L131
.L137:
	ldr	r2, .L164+20
	ldr	r0, [r2]
	cmp	r0, #0
	bgt	.L139
	b	.L117
.L165:
	.align	2
.L164:
	.word	player
	.word	67109120
	.word	hook
	.word	oldButtons
	.word	buttons
	.word	numEnemies
	.word	enemies
	.word	shadowOAM+640
	.word	1717986919
	.word	getLifeGoal
	.word	score
	.word	lives
	.word	timer
	.word	274877907
	.word	moneyMult
	.word	11025
	.word	4210
	.word	heart
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_d2iz
	.align	2
	.global	updateHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHook, %function
updateHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L195
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L166
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #12]
	beq	.L192
	ldr	ip, .L195+4
	ldr	r0, [ip, #8]
	ldr	r1, [ip]
	cmp	r0, #0
	sub	r3, r3, r1
	ldr	r0, [ip, #12]
	ldr	r1, [ip, #4]
	sublt	r3, r3, #16
	sub	r2, r2, r1
	cmp	r0, #0
	sublt	r2, r2, #16
	cmp	r3, #0
	rsblt	r1, r3, #0
	blt	.L178
	beq	.L193
	mov	r1, r3
.L178:
	cmp	r2, #0
	blt	.L179
	bne	.L186
.L180:
	cmp	r1, #17
	ble	.L181
	cmp	r2, #0
	add	r0, r2, #3
	add	r1, r3, #3
	movlt	r2, r0
	cmp	r3, #0
	movlt	r3, r1
	asr	r2, r2, #2
	asr	r3, r3, #2
	str	r2, [ip, #12]
	str	r3, [ip, #8]
.L166:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L192:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #20]
	add	r2, r2, r0
	add	r3, r3, r1
	cmp	r2, #15
	str	r2, [r4, #16]
	str	r3, [r4, #12]
	ble	.L169
	cmp	r3, #15
	movgt	r1, #0
	movle	r1, #1
	ldr	r0, [r4, #28]
	rsb	r0, r0, #224
	cmp	r2, r0
	movle	r2, r1
	orrgt	r2, r1, #1
	cmp	r2, #0
	beq	.L194
.L169:
	ldr	r3, .L195+8
	mov	lr, pc
	bx	r3
	ldr	r5, [r4, #16]
	cmp	r5, #15
	movle	r3, #16
	movle	r5, r3
	strle	r3, [r4, #16]
	ldr	r3, [r4, #28]
	ldr	r0, [r4, #12]
	rsb	r3, r3, #224
	cmp	r3, r5
	movlt	r5, r3
	strlt	r3, [r4, #16]
	cmp	r0, #15
	movle	r3, #16
	movle	r0, r3
	strle	r3, [r4, #12]
	ldr	r3, [r4, #32]
	rsb	r3, r3, #144
	cmp	r3, r0
	movlt	r0, r3
	strlt	r3, [r4, #12]
	ldr	r3, [r4]
	sub	r0, r3, r0
	cmp	r0, #0
	ldr	r8, .L195+12
	rsblt	r0, r0, #0
	mov	lr, pc
	bx	r8
	mov	r6, r0
	ldr	r0, [r4, #4]
	sub	r0, r0, r5
	cmp	r0, #0
	rsblt	r0, r0, #0
	mov	r7, r1
	mov	lr, pc
	bx	r8
	ldr	r5, .L195+16
	mov	r8, r0
	mov	r9, r1
	mov	r2, r6
	mov	r3, r7
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r5
	mov	r2, r8
	mov	r6, r0
	mov	r7, r1
	mov	r3, r9
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r8, .L195+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	ldr	r3, .L195+24
	mov	lr, pc
	bx	r3
	mov	r6, #1
	mov	lr, #0
	mov	r3, #16
	mov	r2, #5
	ldr	ip, .L195+28
	ldr	r7, [r4, #12]
	str	r7, [ip]
	ldr	r7, [r4, #16]
	str	r2, [ip, #28]
	str	r3, [ip, #12]
	str	r3, [ip, #16]
	mov	r2, #0
	str	r6, [ip, #8]
	str	r7, [ip, #4]
	ldr	r3, .L195+32
	str	lr, [ip, #20]
	str	lr, [ip, #24]
	mov	lr, pc
	bx	r5
	ldr	r3, .L195+36
	mov	lr, pc
	bx	r3
	ldr	r1, .L195+40
	smull	r2, r3, r0, r1
	asr	r0, r0, #31
	rsb	r0, r0, r3, asr #4
	ldr	r3, .L195+44
	add	r0, r0, r6
	str	r6, [r4, #36]
	str	r0, [r3]
.L170:
	ldr	r2, .L195+48
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L193:
	cmp	r2, #0
	blt	.L179
	bne	.L186
.L181:
	mov	r2, #0
	mov	r0, #512
	mov	r3, r2
	str	r2, [r4, #8]
	ldr	r1, .L195+52
.L183:
	add	r2, r3, #800
	add	r3, r3, #8
	cmp	r3, #160
	strh	r0, [r1, r2]	@ movhi
	bne	.L183
	mov	r3, #0
	ldr	r2, .L195+48
	str	r3, [r4, #36]
	str	r3, [ip, #8]
	str	r3, [ip, #12]
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L186:
	mov	r1, r2
	b	.L180
.L179:
	rsb	r1, r2, #0
	b	.L180
.L194:
	ldr	r2, [r4, #32]
	rsb	r2, r2, #144
	cmp	r3, r2
	bgt	.L169
	b	.L170
.L196:
	.align	2
.L195:
	.word	hook
	.word	player
	.word	stopSoundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_dadd
	.word	sqrt
	.word	dust
	.word	1071644672
	.word	__aeabi_d2iz
	.word	1374389535
	.word	cameraShakeFrame
	.word	chainLength
	.word	shadowOAM
	.size	updateHook, .-updateHook
	.align	2
	.global	drawHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHook, %function
drawHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L199
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	drawHook.part.0
.L198:
	mov	r2, #512
	ldr	r3, .L199+4
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L200:
	.align	2
.L199:
	.word	hook
	.word	shadowOAM
	.size	drawHook, .-drawHook
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L209
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	r1, #20
	mov	r2, #0
	mov	r5, #10
	mov	r4, #16
	mov	lr, #6
	mov	ip, #992
	ldr	r3, .L209+4
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #3
.L203:
	str	r1, [r3]
	str	r4, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r2, [r3, #36]
	stmib	r3, {r1, r2, r5}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L203
	pop	{r4, r5, lr}
	bx	lr
.L210:
	.align	2
.L209:
	.word	numCoins
	.word	coins
	.size	initCoins, .-initCoins
	.align	2
	.global	spawnCoin
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCoin, %function
spawnCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L229
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L229+4
	ldr	r4, [r5, #8]
	cmp	r4, #0
	movne	r3, r5
	movne	r4, #0
	bne	.L215
	b	.L213
.L219:
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L213
.L215:
	add	r4, r4, #1
	cmp	r4, r1
	add	r3, r3, #40
	bne	.L219
.L211:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L213:
	ldr	r7, .L229+8
	mov	lr, pc
	bx	r7
	ldr	r3, .L229+12
	smull	r8, r9, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	add	r4, r4, r4, lsl #2
	lsl	r4, r4, #3
	add	r0, r0, #16
	str	r0, [r5, r4]
	mov	lr, pc
	bx	r7
	add	r4, r5, r4
	mov	r6, #1
	mov	r5, #0
	ldr	r3, .L229+16
	smull	r8, r9, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #16
	stmib	r4, {r3, r6}
	str	r5, [r4, #24]
	str	r5, [r4, #20]
	mov	lr, pc
	bx	r7
	ldr	r3, .L229+20
	smull	r8, r9, r0, r3
	ldr	r2, .L229+24
	asr	r3, r0, #31
	rsb	r3, r3, r9, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r2, [r2]
	sub	r0, r0, r3, lsl #2
	add	r0, r0, r2
	cmp	r0, #9
	strle	r5, [r4, #32]
	strle	r5, [r4, #36]
	ble	.L211
	cmp	r0, #14
	strle	r6, [r4, #32]
	strle	r6, [r4, #36]
	ble	.L211
	cmp	r0, #17
	movle	r3, #2
	movgt	r3, #3
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L230:
	.align	2
.L229:
	.word	numCoins
	.word	coins
	.word	rand
	.word	156180629
	.word	1374389535
	.word	1717986919
	.word	moneyMult
	.size	spawnCoin, .-spawnCoin
	.align	2
	.global	spawnCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCoins, %function
spawnCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	r5, r0, #0
	ble	.L231
	mov	r4, #0
.L233:
	add	r4, r4, #1
	bl	spawnCoin
	cmp	r5, r4
	bne	.L233
.L231:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	spawnCoins, .-spawnCoins
	.align	2
	.global	updateCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoins, %function
updateCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L263
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L236
	mov	r5, #0
	ldr	r4, .L263+4
	ldr	r6, .L263+8
	ldr	r8, .L263+12
	ldr	r9, .L263+16
	ldr	fp, .L263+20
	b	.L251
.L239:
	ldr	r3, [r7]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L236
.L251:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L239
	ldr	lr, [r6, #16]
	str	lr, [sp, #12]
	ldr	lr, [r6, #20]
	str	lr, [sp, #8]
	ldr	lr, [r6, #4]
	ldr	ip, [r4, #20]
	str	lr, [sp, #4]
	ldr	lr, [r6]
	add	ip, ip, #1
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	str	lr, [sp]
	str	ip, [r4, #20]
	mov	lr, pc
	bx	r8
	subs	r10, r0, #0
	beq	.L240
	ldr	r10, [r4, #36]
	cmp	r10, #0
	beq	.L260
	cmp	r10, #1
	beq	.L258
	cmp	r10, #2
	beq	.L259
	cmp	r10, #3
	beq	.L261
.L247:
	mov	r3, #0
	str	r3, [r4, #8]
	bl	spawnCoin
.L245:
	ldr	r2, [r4, #20]
	smull	r0, r1, r2, r9
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L239
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #28]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r4, #24]
	strge	r3, [r4, #24]
	b	.L239
.L236:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L240:
	add	ip, r6, #8
	ldm	ip, {ip, lr}
	add	r0, ip, ip, lsr #31
	ldr	ip, [r6, #4]
	add	r1, lr, lr, lsr #31
	sub	lr, ip, r1, asr #1
	ldr	ip, [r6]
	sub	ip, ip, r0, asr #1
	str	lr, [sp, #4]
	str	ip, [sp]
	ldr	lr, [r6, #16]
	ldr	ip, [r6, #20]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L245
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L262
	cmp	r3, #1
	beq	.L258
	cmp	r3, #2
	beq	.L259
	cmp	r3, #3
	bne	.L247
	mov	lr, pc
	bx	fp
	mov	r3, r10
	b	.L257
.L258:
	mov	lr, pc
	bx	fp
	mov	r3, #0
	ldr	r2, .L263+24
	ldr	r1, .L263+28
	ldr	r0, .L263+32
	ldr	ip, .L263+36
	mov	lr, pc
	bx	ip
	ldr	r2, .L263+40
	ldr	r3, [r2]
	add	r3, r3, #5
	str	r3, [r2]
	b	.L247
.L260:
	ldr	r2, .L263+40
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	fp
	mov	r3, r10
	ldr	r2, .L263+24
	ldr	r1, .L263+28
	ldr	r0, .L263+32
	ldr	ip, .L263+36
	mov	lr, pc
	bx	ip
	b	.L247
.L261:
	mov	lr, pc
	bx	fp
	mov	r3, #0
.L257:
	ldr	r2, .L263+24
	ldr	r1, .L263+44
	ldr	r0, .L263+48
	ldr	ip, .L263+36
	mov	lr, pc
	bx	ip
	ldr	r2, .L263+40
	ldr	r3, [r2]
	add	r3, r3, #50
	str	r3, [r2]
	b	.L247
.L259:
	mov	lr, pc
	bx	fp
	mov	r3, #0
	ldr	r2, .L263+24
	ldr	r1, .L263+44
	ldr	r0, .L263+48
	ldr	ip, .L263+36
	mov	lr, pc
	bx	ip
	ldr	r2, .L263+40
	ldr	r3, [r2]
	add	r3, r3, #20
	str	r3, [r2]
	b	.L247
.L262:
	str	r3, [sp, #20]
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #20]
	ldr	r2, .L263+24
	ldr	r1, .L263+28
	ldr	r0, .L263+32
	ldr	ip, .L263+36
	mov	lr, pc
	bx	ip
	ldr	r2, .L263+40
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L247
.L264:
	.align	2
.L263:
	.word	numCoins
	.word	coins
	.word	player
	.word	collision
	.word	1717986919
	.word	stopSoundB
	.word	11025
	.word	3316
	.word	rupee
	.word	playSoundB
	.word	score
	.word	4813
	.word	rupeeSpecial
	.size	updateCoins, .-updateCoins
	.align	2
	.global	drawCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoins, %function
drawCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L274
	push	{r4, r5, r6, lr}
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L265
	ldr	r3, .L274+4
	ldr	r2, .L274+8
	ldr	r4, [r3]
	ldr	r5, [r2]
	sub	r4, r4, #8
	sub	r5, r5, #8
	ldr	r1, .L274+12
	lsl	r5, r5, #16
	lsl	r4, r4, #16
	ldr	r3, .L274+16
	lsr	r5, r5, #16
	lsr	r4, r4, #16
	add	lr, r1, lr, lsl #3
.L268:
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L267
	ldr	r2, [r3, #24]
	ldr	r6, [r3, #36]
	lsl	r2, r2, #6
	ldr	r0, [r3, #4]
	add	r2, r2, #18
	ldr	ip, [r3]
	orr	r2, r2, r6, lsl #12
	add	r0, r4, r0
	orr	r2, r2, #1024
	orr	r0, r0, #16384
	add	ip, r5, ip
	strh	r2, [r1, #20]	@ movhi
	strh	r0, [r1, #18]	@ movhi
	strh	ip, [r1, #16]	@ movhi
.L267:
	add	r1, r1, #8
	cmp	r1, lr
	add	r3, r3, #40
	bne	.L268
.L265:
	pop	{r4, r5, r6, lr}
	bx	lr
.L275:
	.align	2
.L274:
	.word	numCoins
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	coins
	.size	drawCoins, .-drawCoins
	.align	2
	.global	cameraShake
	.syntax unified
	.arm
	.fpu softvfp
	.type	cameraShake, %function
cameraShake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L290
	ldr	r1, [r0]
	cmp	r1, #0
	bxle	lr
	ldr	r2, .L290+4
	ldr	r3, .L290+8
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	beq	.L276
	sub	r4, r1, #1
	tst	r4, #1
	ldr	r3, .L290+12
	str	r4, [r0]
	rsbne	r4, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	cmp	r0, #1
	rsbeq	r4, r4, #0
	ldr	r2, .L290+16
	ldr	r3, .L290+20
	add	r4, r4, #8
	str	r4, [r2]
	str	r4, [r3]
.L276:
	pop	{r4, r5, r6, lr}
	bx	lr
.L291:
	.align	2
.L290:
	.word	cameraShakeFrame
	.word	timer
	.word	1717986919
	.word	rand
	.word	hOff
	.word	vOff
	.size	cameraShake, .-cameraShake
	.align	2
	.global	drawChain
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChain, %function
drawChain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L324
	ldr	r2, [r3, #20]
	cmn	r2, #16
	push	{r4, r5, lr}
	beq	.L319
	cmp	r2, #0
	bne	.L297
	ldr	r3, [r3, #24]
	cmn	r3, #16
	beq	.L320
	cmp	r3, #16
	beq	.L321
.L292:
	pop	{r4, r5, lr}
	bx	lr
.L297:
	cmp	r2, #16
	bne	.L292
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L300
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+12
	ldr	r3, [r2]
	ldr	lr, [r1]
	ldr	ip, .L324+16
	ldr	r1, [r2, #4]
	add	r3, r3, lr
	ldr	r2, [ip]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r1, r1, r2
	add	r0, r3, r0, lsl #4
	add	r1, r1, #2
	add	r0, r0, #8
	add	r3, r3, #8
	orr	r1, r1, #16384
	lsl	r0, r0, #16
	lsl	r3, r3, #16
	lsl	r1, r1, #16
	ldr	r2, .L324+20
	ldr	r5, .L324+24
	ldr	r4, .L324+28
	lsr	r0, r0, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
.L301:
	add	lr, r3, #16
	orr	ip, r3, r5
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	cmp	r0, r3
	strh	r1, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	add	r2, r2, #8
	bne	.L301
	b	.L292
.L319:
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L294
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+12
	ldr	r3, [r2]
	ldr	lr, [r1]
	ldr	ip, .L324+16
	ldr	r1, [r2, #4]
	add	r3, r3, lr
	ldr	r2, [ip]
	sub	r3, r3, #24
	add	r1, r1, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r1, r1, #8
	sub	r0, r3, r0, lsl #4
	orr	r1, r1, #16384
	lsl	r0, r0, #16
	lsl	r1, r1, #16
	ldr	r2, .L324+20
	ldr	r5, .L324+24
	ldr	r4, .L324+28
	lsr	r0, r0, #16
	lsr	r1, r1, #16
.L296:
	sub	lr, r3, #16
	orr	ip, r3, r5
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	cmp	r3, r0
	strh	r1, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	add	r2, r2, #8
	bne	.L296
	pop	{r4, r5, lr}
	bx	lr
.L294:
	cmn	r3, #16
	beq	.L322
	cmp	r3, #16
	bne	.L292
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+12
	ldr	r3, [r2]
	ldr	ip, [r1]
	ldr	r1, .L324+16
	add	r3, r3, ip
	ldr	r1, [r1]
	ldr	r2, [r2, #4]
	sub	r3, r3, #24
	lsl	r3, r3, #16
	add	r2, r2, r1
	lsr	r3, r3, #16
	sub	r0, r3, r0, lsl #4
	add	r2, r2, #8
	lsl	r0, r0, #16
	lsl	r2, r2, #16
	ldr	r1, .L324+20
	ldr	r4, .L324+32
	lsr	r0, r0, #16
	lsr	r2, r2, #16
.L305:
	sub	ip, r3, #16
	strh	r3, [r1]	@ movhi
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	add	lr, r2, #16
	orr	ip, r2, #16384
	cmp	r0, r3
	lsl	r2, lr, #16
	strh	r4, [r1, #4]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	lsr	r2, r2, #16
	add	r1, r1, #8
	bne	.L305
	b	.L292
.L300:
	cmp	r3, #16
	beq	.L323
	cmn	r3, #16
	bne	.L292
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+12
	ldr	lr, .L324+16
	ldr	r3, [r2]
	ldr	ip, [r1]
	ldr	r1, [r2, #4]
	ldr	r2, [lr]
	add	r3, r3, ip
	add	lr, r1, r2
	add	r3, r3, #8
	add	r1, r1, r2
	lsl	r3, r3, #16
	sub	lr, lr, #24
	ldr	r2, .L324+20
	ldr	r4, .L324+32
	lsr	r3, r3, #16
	sub	lr, lr, r0, lsl #4
	sub	r1, r1, #24
.L308:
	bic	r0, r1, r1, asr #31
	add	ip, r3, #16
	sub	r1, r1, #16
	strh	r3, [r2]	@ movhi
	orr	r0, r0, #28672
	lsl	r3, ip, #16
	cmp	r1, lr
	strh	r4, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L308
	b	.L292
.L321:
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+16
	ldr	r3, [r2, #4]
	ldr	lr, [r1]
	ldr	ip, .L324+12
	ldr	r1, [r2]
	add	r3, r3, lr
	ldr	r2, [ip]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r1, r1, r2
	add	r0, r3, r0, lsl #4
	add	r1, r1, #1
	add	r0, r0, #8
	add	r3, r3, #8
	orr	r1, r1, #16384
	lsl	r0, r0, #16
	lsl	r3, r3, #16
	lsl	r1, r1, #16
	ldr	r2, .L324+20
	ldr	lr, .L324+36
	lsr	r0, r0, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
.L302:
	add	ip, r3, #16
	strh	r3, [r2, #2]	@ movhi
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r0, r3
	strh	r1, [r2]	@ movhi
	strh	lr, [r2, #4]	@ movhi
	add	r2, r2, #8
	bne	.L302
	b	.L292
.L320:
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r3, .L324+8
	ldr	r2, .L324+12
	ldr	r1, [r3]
	ldr	lr, [r2]
	ldr	ip, .L324+16
	ldr	r2, [r3, #4]
	add	r1, r1, lr
	ldr	r3, [ip]
	add	r1, r1, #1
	add	ip, r3, r2
	orr	r1, r1, #16384
	add	r2, r2, r3
	lsl	r1, r1, #16
	sub	ip, ip, #24
	ldr	r3, .L324+20
	ldr	lr, .L324+36
	lsr	r1, r1, #16
	sub	ip, ip, r0, lsl #4
	sub	r2, r2, #24
.L299:
	bic	r0, r2, r2, asr #31
	sub	r2, r2, #16
	cmp	r2, ip
	strh	r1, [r3]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	add	r3, r3, #8
	bne	.L299
	pop	{r4, r5, lr}
	bx	lr
.L322:
	ldr	r3, .L324+4
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r1, .L324+12
	ldr	lr, .L324+16
	ldr	r3, [r2]
	ldr	ip, [r1]
	ldr	r1, [r2, #4]
	ldr	r2, [lr]
	add	r3, r3, ip
	add	lr, r2, r1
	sub	r3, r3, #24
	add	r1, r1, r2
	lsl	r3, r3, #16
	sub	lr, lr, #24
	ldr	r2, .L324+20
	ldr	r4, .L324+32
	lsr	r3, r3, #16
	sub	lr, lr, r0, lsl #4
	sub	r1, r1, #24
.L304:
	bic	r0, r1, r1, asr #31
	sub	ip, r3, #16
	sub	r1, r1, #16
	strh	r3, [r2]	@ movhi
	orr	r0, r0, #20480
	lsl	r3, ip, #16
	cmp	lr, r1
	strh	r4, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L304
	b	.L292
.L323:
	ldr	r3, .L324+4
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L292
	ldr	r2, .L324+8
	ldr	r0, .L324+12
	ldr	r1, [r2]
	ldr	ip, [r0]
	ldr	r0, .L324+16
	add	r1, r1, ip
	lsl	r1, r1, #16
	ldr	ip, [r2, #4]
	ldr	r2, [r0]
	lsr	r1, r1, #16
	add	r0, r1, r3, lsl #4
	add	ip, ip, r2
	add	r0, r0, #8
	lsl	ip, ip, #16
	add	r3, r1, #8
	lsl	r0, r0, #16
	lsr	ip, ip, #16
	lsl	r3, r3, #16
	ldr	r2, .L324+20
	ldr	r4, .L324+32
	lsr	r0, r0, #16
	sub	ip, ip, r1
	lsr	r3, r3, #16
.L307:
	add	lr, r3, #16
	strh	r3, [r2]	@ movhi
	add	r1, r3, ip
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	orr	r1, r1, #24576
	cmp	r3, r0
	strh	r4, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	add	r2, r2, #8
	bne	.L307
	b	.L292
.L325:
	.align	2
.L324:
	.word	hook
	.word	chainLength
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM+800
	.word	-32768
	.word	1048
	.word	1081
	.word	1049
	.size	drawChain, .-drawChain
	.align	2
	.global	hideChain
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideChain, %function
hideChain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, #512
	ldr	r1, .L330
.L327:
	add	r2, r3, #800
	add	r3, r3, #8
	cmp	r3, #160
	strh	r0, [r1, r2]	@ movhi
	bne	.L327
	bx	lr
.L331:
	.align	2
.L330:
	.word	shadowOAM
	.size	hideChain, .-hideChain
	.align	2
	.global	initDust
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDust, %function
initDust:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #16
	mov	lr, #1
	mov	r2, #0
	mov	ip, #5
	ldr	r0, .L334
	ldr	r3, .L334+4
	ldr	r4, [r0, #12]
	ldr	r0, [r0, #16]
	str	r4, [r3]
	stmib	r3, {r0, lr}
	str	ip, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	pop	{r4, lr}
	bx	lr
.L335:
	.align	2
.L334:
	.word	hook
	.word	dust
	.size	initDust, .-initDust
	.align	2
	.global	updateDust
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDust, %function
updateDust:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L345
	ldr	r3, [r2, #8]
	cmp	r3, #0
	ldr	r3, [r2, #20]
	beq	.L342
	ldr	r0, [r2, #24]
	cmp	r0, #4
	movgt	r1, #0
	push	{r4, r5}
	strgt	r1, [r2, #8]
	ldr	r1, .L345+4
	smull	r4, r5, r3, r1
	asr	r1, r3, #31
	rsb	r1, r1, r5, asr #1
	add	r1, r1, r1, lsl #2
	cmp	r3, r1
	addeq	r0, r0, #1
	add	r3, r3, #1
	streq	r0, [r2, #24]
	str	r3, [r2, #20]
	pop	{r4, r5}
	bx	lr
.L342:
	add	r3, r3, #1
	str	r3, [r2, #20]
	bx	lr
.L346:
	.align	2
.L345:
	.word	dust
	.word	1717986919
	.size	updateDust, .-updateDust
	.align	2
	.global	drawDust
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDust, %function
drawDust:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L349
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bxeq	lr
	b	drawDust.part.1
.L350:
	.align	2
.L349:
	.word	dust
	.size	drawDust, .-drawDust
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L358
	push	{r4, r5, r6, lr}
	ldr	r5, [r3]
	cmp	r5, r2
	mov	r0, r2
	ldr	r3, .L358+4
	mov	r4, #1
	mov	lr, #16
	mov	ip, #1065353216
	add	r2, r2, #1
	ble	.L357
.L355:
	tst	r2, #1
	moveq	r6, r0
	movne	r6, r4
	rsb	r1, r2, r2, lsl #4
	lsl	r1, r1, #1
	cmp	r5, r2
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3, #36]	@ float
	str	ip, [r3, #40]	@ float
	str	r0, [r3, #44]
	str	r0, [r3, #48]
	str	r6, [r3, #52]
	str	r1, [r3]
	str	r1, [r3, #4]
	add	r2, r2, #1
	add	r3, r3, #56
	bgt	.L355
.L357:
	pop	{r4, r5, r6, lr}
	bx	lr
.L359:
	.align	2
.L358:
	.word	numEnemies
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #200
	mov	r3, #8
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r5, #2
	mov	r2, #5
	mov	r1, #15
	ldr	r0, .L367
	str	ip, [r0]
	ldr	ip, .L367+4
	str	r3, [ip]
	ldr	ip, .L367+8
	str	r3, [ip]
	ldr	r3, .L367+12
	str	r4, [r3]
	ldr	r3, .L367+16
	str	r4, [r3]
	ldr	r3, .L367+20
	ldr	r0, .L367+24
	str	r5, [r3]
	ldr	r3, .L367+28
	ldr	r6, .L367+32
	str	r2, [r3]
	ldr	r0, [r0]
	ldr	r3, .L367+36
	str	r1, [r6]
	mov	lr, pc
	bx	r3
	mov	r2, #120
	mov	ip, #16
	mov	r1, #7
	mov	lr, #140
	ldr	r3, .L367+40
	ldr	r0, [r6]
	str	r2, [r3, #4]
	ldr	r2, .L367+44
	cmp	r0, r4
	str	r5, [r3, #40]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #36]
	str	r4, [r3, #44]
	str	r4, [r3, #48]
	str	lr, [r3]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r4, [r2]
	str	r4, [r2, #4]
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	str	r4, [r2, #24]
	str	r4, [r2, #36]
	str	r1, [r2, #28]
	str	r1, [r2, #32]
	ble	.L361
	mov	r2, r4
	mov	r1, #20
	mov	r5, #10
	mov	r4, #6
	mov	lr, #992
	ldr	r3, .L367+48
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #3
.L362:
	str	r1, [r3]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #32]
	str	r2, [r3, #36]
	stmib	r3, {r1, r2, r5, ip}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L362
.L361:
	mov	r4, #10
.L363:
	bl	spawnCoin
	subs	r4, r4, #1
	bne	.L363
	bl	initEnemies
	ldr	r0, .L367+52
	ldr	r1, .L367+56
	ldr	r2, .L367+60
	ldr	r3, .L367+64
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L368:
	.align	2
.L367:
	.word	getLifeGoal
	.word	hOff
	.word	vOff
	.word	score
	.word	cameraShakeFrame
	.word	numEnemies
	.word	seed
	.word	lives
	.word	numCoins
	.word	srand
	.word	player
	.word	hook
	.word	coins
	.word	timer
	.word	chainLength
	.word	sVOff
	.word	sHOff
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.global	__aeabi_i2f
	.global	__aeabi_fadd
	.global	__aeabi_f2iz
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L406
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L369
	mov	r5, #0
	mov	r10, #1065353216
	ldr	r4, .L406+4
	ldr	r9, .L406+8
	ldr	r8, .L406+12
.L394:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L371
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L404
	cmp	r3, #0
	beq	.L380
	ldr	r6, .L406+16
	ldr	r1, [r4, #4]
	ldm	r6, {ip, lr}
	ldr	r0, [r4]
.L379:
	cmp	r1, #16
	movle	r1, #17
	strle	r1, [r4, #4]
	ble	.L386
	cmp	r1, #208
	movgt	r3, #207
	movgt	r1, r3
	strgt	r3, [r4, #4]
.L386:
	cmp	r0, #16
	movle	r0, #17
	strle	r0, [r4]
	ble	.L388
	cmp	r0, #128
	movgt	r3, #127
	movgt	r0, r3
	strgt	r3, [r4]
.L388:
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	str	lr, [sp, #4]
	ldr	lr, [r6, #20]
	str	ip, [sp]
	ldr	ip, [r6, #16]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L389
	ldr	r3, [r6, #44]
	cmp	r3, #0
	beq	.L405
.L389:
	ldr	r2, [r4, #48]
	smull	r0, r1, r2, r8
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L391
	ldr	r1, [r4, #44]
	add	r1, r1, #1
	cmp	r1, #1
	movle	r3, r1
	str	r3, [r4, #44]
.L391:
	add	r2, r2, #1
	str	r2, [r4, #48]
.L371:
	ldr	r3, [r7]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #56
	bgt	.L394
.L369:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L380:
	ldr	r2, .L406+20
	ldr	r3, .L406+24
	ldr	r1, [r2]
	ldr	r0, [r3]
	add	r1, r1, #2
	ldr	r3, .L406+28
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L381
	ldr	r1, [r4, #4]
	mov	r0, r1
.L382:
	sub	r0, r0, #17
	cmp	r0, #191
	ldrhi	r3, [r4, #40]
	ldr	r0, [r4]
	addhi	r3, r3, #-2147483648
	strhi	r3, [r4, #40]	@ float
	sub	r3, r0, #17
	cmp	r3, #111
	ldrhi	r3, [r4, #36]
	ldrls	r6, .L406+16
	ldrhi	r6, .L406+16
	addhi	r3, r3, #-2147483648
	strhi	r3, [r4, #36]	@ float
	ldm	r6, {ip, lr}
	b	.L379
.L404:
	ldr	r2, .L406+20
	ldr	r3, .L406+24
	ldr	r1, [r2]
	ldr	r0, [r3]
	add	r1, r1, #2
	ldr	r3, .L406+28
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L373
.L403:
	ldr	r1, [r4, #4]
	mov	r3, r1
.L374:
	ldr	r6, .L406+16
	ldr	r0, [r4]
	ldr	ip, [r6]
	sub	r2, ip, r0
	cmp	r2, #0
	ldr	lr, [r6, #4]
	ldrlt	r2, .L406+32
	sub	r3, lr, r3
	strlt	r2, [r4, #36]	@ float
	strge	r10, [r4, #36]	@ float
	cmp	r3, #0
	ldrlt	r3, .L406+32
	strge	r10, [r4, #40]	@ float
	strlt	r3, [r4, #40]	@ float
	b	.L379
.L381:
	ldr	r3, .L406+36
	ldr	r0, [r4]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r3
	ldr	fp, .L406+40
	ldr	r1, [r4, #36]	@ float
	mov	lr, pc
	bx	fp
	ldr	r6, .L406+44
	mov	lr, pc
	bx	r6
	ldr	r3, [sp, #20]
	str	r0, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #40]	@ float
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r6
	mov	r1, r0
	str	r0, [r4, #4]
	b	.L382
.L405:
	ldr	r2, .L406+48
	ldr	r1, .L406+52
	ldr	r0, .L406+56
	ldr	ip, .L406+60
	mov	lr, pc
	bx	ip
	mov	r1, #130
	ldr	r2, .L406+64
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r6, #44]
	b	.L389
.L373:
	ldr	r3, .L406+68
	mov	lr, pc
	bx	r3
	tst	r0, #1
	beq	.L403
	ldr	r3, .L406+36
	ldr	r0, [r4]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	r3
	ldr	fp, .L406+40
	ldr	r1, [r4, #36]	@ float
	mov	lr, pc
	bx	fp
	ldr	r6, .L406+44
	mov	lr, pc
	bx	r6
	ldr	r3, [sp, #20]
	str	r0, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #40]	@ float
	mov	lr, pc
	bx	fp
	mov	lr, pc
	bx	r6
	mov	r3, r0
	mov	r1, r0
	str	r0, [r4, #4]
	b	.L374
.L407:
	.align	2
.L406:
	.word	numEnemies
	.word	enemies
	.word	collision
	.word	1717986919
	.word	player
	.word	moneyMult
	.word	timer
	.word	__aeabi_idivmod
	.word	-1082130432
	.word	__aeabi_i2f
	.word	__aeabi_fadd
	.word	__aeabi_f2iz
	.word	11025
	.word	4301
	.word	thud
	.word	playSoundB
	.word	lives
	.word	rand
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateHook
	ldr	r4, .L410
	bl	updatePlayer
	bl	updateCoins
	bl	updateDust
	bl	updateEnemies
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L410+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L410+8
	ldr	r2, [r3]
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	strh	r3, [r0, #20]	@ movhi
	ldr	r3, .L410+12
	ldr	r3, [r3]
	lsl	r1, r3, #16
	lsr	r1, r1, #16
	strh	r1, [r0, #22]	@ movhi
	ldr	r0, .L410+16
	add	r2, r2, r2, lsr #31
	ldr	r1, [r0]
	ldr	lr, .L410+20
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	ldr	ip, .L410+24
	sub	r2, r2, #4
	sub	r3, r3, #4
	add	r1, r1, #1
	str	r2, [lr]
	pop	{r4, lr}
	str	r3, [ip]
	str	r1, [r0]
	b	cameraShake
.L411:
	.align	2
.L410:
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	timer
	.word	sVOff
	.word	sHOff
	.size	updateGame, .-updateGame
	.global	__aeabi_fcmplt
	.global	__aeabi_fcmpgt
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L428
	ldr	r8, [r3]
	cmp	r8, #0
	sub	sp, sp, #12
	ble	.L412
	mov	r5, #0
	mov	r9, #0
	ldr	r2, .L428+4
	ldr	r3, .L428+8
	ldr	r7, [r2]
	ldr	r6, [r3]
	sub	r7, r7, #8
	sub	r6, r6, #8
	lsl	r7, r7, #16
	lsl	r6, r6, #16
	ldr	r4, .L428+12
	ldr	fp, .L428+16
	ldr	r10, .L428+20
	lsl	r8, r8, #3
	lsr	r7, r7, #16
	lsr	r6, r6, #16
.L420:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L415
	ldr	r3, [r4, #36]	@ float
	mov	r1, r9
	mov	r0, r3
	str	r3, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r3, [sp, #4]
	beq	.L416
	ldr	r2, [r4, #44]
	ldr	ip, [r4, #4]
	ldr	r1, .L428+24
	lsl	r2, r2, #6
	ldr	r0, [r4]
	add	r1, r5, r1
	add	r2, r2, #2
	add	ip, r6, ip
	add	lr, r1, #720
	orr	r2, r2, #25600
	orr	ip, ip, #16384
	add	r1, r1, #724
	add	r0, r7, r0
	strh	ip, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r2, [r1]	@ movhi
.L416:
	mov	r0, r3
	mov	r1, r9
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L418
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #44]
	ldr	r3, .L428+24
	ldr	r0, [r4]
	add	r3, r5, r3
	add	r1, r6, r1
	lsl	r2, r2, #6
	add	ip, r3, #720
	orr	r1, r1, #16384
	add	r3, r3, #724
	add	r0, r7, r0
	orr	r2, r2, #25600
	strh	r1, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r2, [r3]	@ movhi
.L418:
	ldr	r3, [r4, #40]	@ float
	mov	r1, r9
	mov	r0, r3
	str	r3, [sp, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	r3, [sp, #4]
	beq	.L419
	ldr	r2, [r4, #44]
	ldr	ip, [r4, #4]
	ldr	r1, .L428+24
	lsl	r2, r2, #6
	ldr	r0, [r4]
	add	r1, r5, r1
	add	r2, r2, #6
	add	ip, r6, ip
	add	lr, r1, #720
	orr	r2, r2, #25600
	orr	ip, ip, #16384
	add	r1, r1, #724
	add	r0, r7, r0
	strh	ip, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r2, [r1]	@ movhi
.L419:
	mov	r0, r3
	mov	r1, r9
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L415
	ldr	r3, [r4, #44]
	ldr	r0, [r4, #4]
	ldr	r2, .L428+24
	lsl	r3, r3, #6
	ldr	r1, [r4]
	add	r2, r5, r2
	add	r3, r3, #4
	add	r0, r6, r0
	add	ip, r2, #720
	orr	r3, r3, #25600
	orr	r0, r0, #16384
	add	r2, r2, #724
	add	r1, r7, r1
	strh	r0, [ip, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r3, [r2]	@ movhi
.L415:
	add	r5, r5, #8
	cmp	r8, r5
	add	r4, r4, #56
	bne	.L420
.L412:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L429:
	.align	2
.L428:
	.word	numEnemies
	.word	vOff
	.word	hOff
	.word	enemies
	.word	__aeabi_fcmplt
	.word	__aeabi_fcmpgt
	.word	shadowOAM
	.size	drawEnemies, .-drawEnemies
	.global	__aeabi_uidivmod
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L443
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, [r3]
	cmp	r4, #9
	bhi	.L431
	mov	r2, #2
	ldr	r3, .L443+4
	add	r4, r4, #960
	strh	r4, [r3, #4]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L430:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L431:
	cmp	r4, #99
	bls	.L440
	cmp	r4, #1000
	bcc	.L441
	ldr	r3, .L443+8
	cmp	r4, r3
	mov	r0, #2
	bls	.L442
	mov	r1, #34
	mov	lr, #5
	ldr	ip, .L443+12
	umull	r2, r3, r4, ip
	lsr	r3, r3, #3
	add	r3, r3, r3, lsl r0
	ldr	r2, .L443+4
	sub	r3, r4, r3, lsl #1
	add	r3, r3, #960
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
.L435:
	ldr	ip, .L443+12
	umull	r0, r1, r4, ip
	mov	r10, #2
	ldr	r3, .L443+16
	umull	r6, r7, r4, r3
	ldr	r3, .L443+20
	mov	r5, r3
	lsr	r1, r1, #3
	umull	r8, r9, r1, ip
	lsr	r2, r7, #5
	umull	r6, r7, r2, ip
	lsr	r8, r9, #3
	add	r8, r8, r8, lsl r10
	sub	r1, r1, r8, lsl #1
	add	r1, r1, #960
	lsr	r6, r7, #3
	strh	r1, [r3, #4]	@ movhi
	lsl	r1, lr, #3
	sub	r1, r1, #14
	add	r6, r6, r6, lsl r10
	sub	r2, r2, r6, lsl #1
	strh	r10, [r5, #8]!	@ movhi
	strh	r1, [r3, #2]	@ movhi
	lsl	r1, lr, #3
	add	r2, r2, #960
	sub	r1, r1, #22
	cmp	lr, #3
	strh	r2, [r3, #12]	@ movhi
	strh	r10, [r3]	@ movhi
	strh	r1, [r5, #2]	@ movhi
	beq	.L430
	ldr	r2, .L443+24
	umull	r6, r7, r4, r2
	mov	r5, r3
	lsr	r2, r7, #6
	umull	r6, r7, r2, ip
	lsr	r1, r7, #3
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r1, lsl #1
	strh	r10, [r5, #16]!	@ movhi
	lsl	r1, lr, #3
	sub	r1, r1, #30
	add	r2, r2, #960
	cmp	lr, #5
	strh	r1, [r5, #2]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	bne	.L430
	ldr	r2, .L443+28
	umull	r6, r7, r4, r2
	mov	lr, r3
	lsr	r2, r7, #13
	umull	r4, r5, r2, ip
	lsr	r1, r5, #3
	add	r1, r1, r1, lsl #2
	strh	r10, [lr, #24]!	@ movhi
	sub	r2, r2, r1, lsl #1
	add	r2, r2, #960
	strh	r10, [lr, #2]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L440:
	mov	r3, #10
	mov	r6, #2
	ldr	r5, .L443+4
	mov	r1, r3
	ldr	r2, .L443+32
	strh	r3, [r5, #2]	@ movhi
	mov	r0, r4
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, r5
	ldr	r2, .L443+12
	umull	r8, r9, r4, r2
	strh	r6, [r3, #8]!	@ movhi
	lsr	r2, r9, #3
	add	r1, r1, #960
	add	r2, r2, #960
	strh	r1, [r5, #4]	@ movhi
	strh	r2, [r5, #12]	@ movhi
	strh	r6, [r3, #2]	@ movhi
	b	.L430
.L442:
	mov	ip, #26
	ldr	r3, .L443+4
	ldr	r2, .L443+32
	strh	r0, [r3]	@ movhi
	mov	r1, #10
	mov	r0, r4
	strh	ip, [r3, #2]	@ movhi
	add	r5, r3, #4
	mov	lr, pc
	bx	r2
	add	r1, r1, #960
	strh	r1, [r5]	@ movhi
	mov	lr, #4
	b	.L435
.L441:
	mov	r2, #10
	ldr	r3, .L443+12
	umull	r6, r7, r4, r3
	mov	r0, #2
	mov	r1, #18
	lsr	ip, r7, #3
	mul	r3, r2, ip
	ldr	r2, .L443+4
	sub	r3, r4, r3
	add	r3, r3, #960
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	mov	lr, #3
	b	.L435
.L444:
	.align	2
.L443:
	.word	score
	.word	shadowOAM+640
	.word	9999
	.word	-858993459
	.word	1374389535
	.word	shadowOAM+648
	.word	274877907
	.word	-776530087
	.word	__aeabi_uidivmod
	.size	drawScore, .-drawScore
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L450
	push	{r4, r5, r6, lr}
	mov	r0, #2
	mov	lr, r2
	mov	ip, r2
	mov	r5, r2
	mov	r4, r2
	mov	r1, #16
	mov	r3, #0
	strh	r0, [lr, #24]!	@ movhi
	strh	r0, [ip, #32]!	@ movhi
	strh	r0, [r5, #8]!	@ movhi
	strh	r0, [r4, #16]!	@ movhi
	strh	r0, [r2]	@ movhi
	ldr	r0, .L450+4
	strh	r0, [r5, #2]	@ movhi
	add	r0, r0, #8
	strh	r0, [r4, #2]	@ movhi
	add	r0, r0, #8
	strh	r0, [lr, #2]	@ movhi
	ldr	lr, .L450+8
	ldr	r0, .L450+12
	ldr	r6, .L450+16
	strh	lr, [ip, #2]	@ movhi
	ldr	ip, [r0]
	strh	r6, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	r1, [r2, #20]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	strh	r1, [r2, #36]	@ movhi
	sub	r2, r2, #320
.L447:
	cmp	ip, r3
	lslls	r1, r3, #3
	addls	r1, r1, #324
	ldrhls	r0, [r1, r2]
	add	r3, r3, #1
	orrls	r0, r0, #24576
	strhls	r0, [r1, r2]	@ movhi
	cmp	r3, #5
	bne	.L447
	pop	{r4, r5, r6, lr}
	bx	lr
.L451:
	.align	2
.L450:
	.word	shadowOAM+320
	.word	8398
	.word	8422
	.word	lives
	.word	8390
	.size	drawLives, .-drawLives
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L461
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L460
	mov	r2, #512
	ldr	r3, .L461+4
	strh	r2, [r3, #8]	@ movhi
.L454:
	bl	drawCoins
	bl	drawChain
	ldr	r3, .L461+8
	ldr	r3, [r3, #8]
	cmp	r3, #0
	blne	drawDust.part.1
.L455:
	bl	drawEnemies
	bl	drawScore
	pop	{r4, lr}
	b	drawLives
.L460:
	bl	drawHook.part.0
	b	.L454
.L462:
	.align	2
.L461:
	.word	hook
	.word	shadowOAM
	.word	dust
	.size	drawGame, .-drawGame
	.comm	sHOff,4,4
	.comm	sVOff,4,4
	.comm	enemies,112,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	numEnemies,4,4
	.comm	chainLength,4,4
	.comm	cameraShakeFrame,4,4
	.comm	timer,4,4
	.comm	hook,40,4
	.comm	coins,600,4
	.comm	numCoins,4,4
	.comm	dust,32,4
	.comm	player,52,4
	.comm	moneyMult,4,4
	.comm	getLifeGoal,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
