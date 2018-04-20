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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r6, #67108864
	ldr	r5, .L4
	strh	r4, [r6, #16]	@ movhi
	mov	r3, #880
	mov	r2, #100663296
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r1, .L4+8
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L4+12
	mov	lr, pc
	bx	r5
	mov	r2, #6912
	ldr	r3, .L4+16
	strh	r2, [r6]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L4+20
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	ldr	r0, .L4+32
	mov	r3, #1
	mov	lr, pc
	bx	r6
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	mov	r3, #480
	mov	r2, #117440512
	ldr	r1, .L4+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #8
	ldr	r3, .L4+48
	ldr	r0, .L4+52
	ldr	r1, .L4+56
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	str	r2, [r3, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startTiles
	.word	startMap
	.word	100700160
	.word	stopSoundA
	.word	playSoundA
	.word	11025
	.word	245964
	.word	title
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	.LANCHOR0
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	ldr	r3, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r3, #48]
	ldr	r3, .L8+8
	push	{r4, lr}
	ldr	r1, .L8+12
	strh	ip, [r0]	@ movhi
	str	r2, [r3]
	str	r2, [r3, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #4608
	ldr	r2, .L8+20
	ldr	r0, .L8+24
	ldr	r4, .L8+28
	strh	r3, [r1, #8]	@ movhi
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #880
	strh	r0, [r1, #14]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L8+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L8+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #480
	ldr	r2, .L8+48
	ldr	r1, .L8+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+56
	ldr	r1, .L8+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #48
	ldr	r2, .L8+64
	ldr	r1, .L8+68
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L8+72
	ldr	r1, .L8+76
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L8+80
	ldr	r1, .L8+84
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L8+88
	ldr	r1, .L8+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	.LANCHOR0
	.word	setupSounds
	.word	setupInterrupts
	.word	5124
	.word	5642
	.word	DMANow
	.word	startTiles
	.word	100700160
	.word	startMap
	.word	foregroundPal
	.word	100679680
	.word	foregroundTiles
	.word	100704256
	.word	foregroundMap
	.word	100696064
	.word	backgroundTiles
	.word	100708352
	.word	backgroundMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7
	push	{r4, lr}
	ldr	r3, .L12
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L12+4
	mov	r2, #100663296
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	4464
	.word	DMANow
	.word	instructionsTiles
	.word	100700160
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToInstructions
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #0
	mov	r2, #6656
	push	{r4, lr}
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+4
	ldr	r2, .L25+8
	ldr	r1, .L25+12
	ldr	r0, .L25+16
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+28
	mov	r3, #480
	mov	r2, #117440512
	ldr	r1, .L25+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	stopSoundA
	.word	playSoundA
	.word	11025
	.word	784564
	.word	gameSong
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	bl	goToGame
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #8
	mov	r5, #67108864
	ldr	r3, .L38
	strh	r4, [r5, #16]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L38+4
	ldr	r1, .L38+8
	ldr	r0, .L38+12
	mov	r3, #1
	ldr	r2, .L38+16
	mov	lr, pc
	bx	r6
	mov	r2, #6912
	ldr	r3, .L38+20
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L38+24
	mov	r3, #1440
	mov	r2, #100663296
	ldr	r1, .L38+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L38+32
	ldr	r1, .L38+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L38+40
	ldr	r2, .L38+44
	str	r4, [r3]
	str	r4, [r3, #4]
	mov	lr, pc
	bx	r2
	mov	r2, #3
	ldr	r3, .L38+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	stopSoundA
	.word	playSoundA
	.word	247287
	.word	end
	.word	11025
	.word	hideSprites
	.word	DMANow
	.word	pauseTiles
	.word	100700160
	.word	pauseMap
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #4
	beq	.L40
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
.L40:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToStart
.L50:
	pop	{r4, lr}
	b	goToGame
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L59
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	drawFinalScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFinalScore, %function
drawFinalScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldr	ip, .L63+4
	ldr	r2, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L63+8
	ldr	r4, .L63+12
	ldr	lr, .L63+16
	smull	r0, r1, r2, ip
	smull	r8, r9, r2, r4
	smull	r6, r7, r2, lr
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r1, r3, r1, asr #2
	rsb	r9, r3, r9, asr #5
	rsb	r7, r3, r7, asr #6
	rsb	r3, r3, r5, asr #12
	smull	r4, r5, r1, ip
	sub	sp, sp, #36
	stm	sp, {r4-r5}
	smull	r5, r6, r9, ip
	str	r5, [sp, #8]
	str	r6, [sp, #12]
	smull	r4, r5, r7, ip
	str	r4, [sp, #16]
	str	r5, [sp, #20]
	smull	r5, r6, r3, ip
	ldr	ip, .L63+20
	str	r5, [sp, #24]
	str	r6, [sp, #28]
	add	r5, r1, r1, lsl #2
	sub	r2, r2, r5, lsl #1
	ldr	r0, [sp, #4]
	add	r5, ip, #644
	add	r2, r2, #960
	strh	r2, [r5]	@ movhi
	asr	r2, r1, #31
	mov	fp, #80
	rsb	r2, r2, r0, asr #2
	mov	r0, #124	@ movhi
	add	r2, r2, r2, lsl #2
	sub	r1, r1, r2, lsl #1
	add	r1, r1, #960
	add	r2, ip, #652
	strh	r1, [r2]	@ movhi
	ldr	r1, [sp, #12]
	asr	r2, r9, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	sub	r9, r9, r2, lsl #1
	ldr	r1, [sp, #20]
	add	r2, ip, #660
	add	r9, r9, #960
	strh	r9, [r2]	@ movhi
	asr	r2, r7, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	ldr	r1, [sp, #28]
	sub	r7, r7, r2, lsl #1
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r1, ip, #648
	strh	fp, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	mov	r1, #116	@ movhi
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2, lsl #1
	add	r7, r7, #960
	add	r2, ip, #668
	strh	r7, [r2]	@ movhi
	add	r3, r3, #960
	add	r2, ip, #676
	strh	r3, [r2]	@ movhi
	add	r2, ip, #656
	mov	r10, #132
	mov	lr, #100
	strh	fp, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	mov	r2, #108	@ movhi
	add	r5, ip, #640
	add	r3, ip, #664
	add	ip, ip, #672
	strh	r10, [r5, #2]	@ movhi
	strh	fp, [r5]	@ movhi
	strh	fp, [r3]	@ movhi
	strh	fp, [ip]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	lr, [ip, #2]	@ movhi
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	score
	.word	1717986919
	.word	1759218605
	.word	1374389535
	.word	274877907
	.word	shadowOAM
	.size	drawFinalScore, .-drawFinalScore
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #8
	mov	r2, #6912
	strh	r4, [r3, #16]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, .L67
	mov	lr, pc
	bx	r3
	ldr	r5, .L67+4
	ldr	r2, .L67+8
	ldr	r1, .L67+12
	ldr	r0, .L67+16
	mov	r3, #1
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L67+24
	mov	r3, #1072
	mov	r2, #100663296
	ldr	r1, .L67+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L67+32
	ldr	r1, .L67+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+40
	ldr	r2, .L67+44
	str	r4, [r3]
	str	r4, [r3, #4]
	mov	lr, pc
	bx	r2
	mov	r2, #4
	ldr	r3, .L67+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	b	drawFinalScore
.L68:
	.align	2
.L67:
	.word	stopSoundA
	.word	playSoundA
	.word	11025
	.word	247287
	.word	end
	.word	hideSprites
	.word	DMANow
	.word	gameoverTiles
	.word	100700160
	.word	gameoverMap
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L78
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r3, .L78+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L70:
	ldr	r3, .L78+20
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L77
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	goToLose
.L76:
	mov	r2, #8
	ldr	r3, .L78+24
	str	r2, [r3]
	str	r2, [r3, #4]
	bl	goToPause
	b	.L70
.L79:
	.align	2
.L78:
	.word	drawGame
	.word	waitForVBlank
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	.LANCHOR0
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	ldr	r5, .L94+4
	ldr	r10, .L94+8
	ldr	r9, .L94+12
	ldr	fp, .L94+16
	ldr	r7, .L94+20
	ldr	r4, .L94+24
	ldr	r8, .L94+28
	ldr	r6, .L94+32
.L88:
	ldrh	r1, [r5]
	strh	r1, [r10]	@ movhi
	ldr	r2, [r9]
	ldrh	r3, [r8, #48]
	strh	r3, [r5]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L83:
	.word	.L82
	.word	.L84
	.word	.L85
	.word	.L86
	.word	.L87
.L87:
	tst	r1, #8
	bne	.L93
.L81:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r6
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #67108864
	ldrh	r1, [r4]
	ldrh	r2, [r4, #4]
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	b	.L88
.L86:
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	b	.L81
.L85:
	ldr	r3, .L94+40
	mov	lr, pc
	bx	r3
	b	.L81
.L82:
	mov	lr, pc
	bx	fp
	b	.L81
.L84:
	ldr	r3, .L94+44
	mov	lr, pc
	bx	r3
	b	.L81
.L93:
	tst	r3, #8
	bne	.L81
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	b	.L81
.L95:
	.align	2
.L94:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	DMANow
	.word	.LANCHOR0
	.word	67109120
	.word	shadowOAM
	.word	pause
	.word	game
	.word	instructions
	.word	goToStart
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	8
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	8
	.ident	"GCC: (devkitARM release 47) 7.1.0"
