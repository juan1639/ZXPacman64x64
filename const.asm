;==========================================================================
;			   C O N S T A N T E S
;
;--------------------------------------------------------------------------
declarar_constantes:
	JUGADOR_POS_Y_INI		equ	$48
	JUGADOR_POS_X_INI		equ	$00

	FANTASMA_POS_Y_INI		equ	$48
	FANTASMA_POS_X_INI		equ	$0a

	JUGADOR_LIMITE_IZ	equ $00
	JUGADOR_LIMITE_DE	equ $18

	RECUADRO_INV_POS_Y	equ $48
	RECUADRO_INV_POS_X	equ $18
	RECUADRO_INV_BYTES	equ $ff

;--------------------------------------------------------------------------
	ROJO				equ	%00000010
	ROJO_BRILLO			equ	%01000010
	VERDE				equ	%00000100
	VERDE_BRILLO		equ	%01000100
	AZULCLARO			equ	%00000101
	AZULCLARO_BRILLO	equ	%01000101
	AMARILLO			equ	%00000110
	AMARILLO_BRILLO		equ	%01000110
	BLANCO				equ	%00000111
	BLANCO_BRILLO		equ	%01000111
	NEGRO				equ $00
	NEGRO_BRILLO		equ %01000000

;--------------------------------------------------------------------------
LOCATE:	equ $0dd9	;Rutina sistema: (Locate), (B = ycoord, C = xcoord)

border_c	equ 	$5c48	;Variable sistema (Borde)

locate		equ 	$0dd9	;Rutina sistema: (Locate), (B = ycoord, C = xcoord)
pr_string	equ	$203c	;Rutina sistema para imprimir textos
out_num		equ	$1a1b	;Rutina sistema para imprimir numeros (0-9999)

;--------------------------------------------------------------------------
_CR         	equ 	$0d
_INK        	equ 	$10
_PAPER      	equ 	$11
_FLASH      	equ 	$12
_BRIGHT     	equ 	$13
_INVERSE    	equ 	$14
_OVER       	equ 	$15
_AT        	equ 	$16
_TAB   		equ 	$17

;-------------------------------------------------------------------------
beeper: equ $03b5	;Rutina Beeper (HL = Nota, DE = Duracion)...

;  		...( Altera Registros: AF,BC,DE,HL,IX )
;
;-------------------------------------------------------------------------
;			S O N I D O S
;-------------------------------------------------------------------------

s_1:		EQU $0f07		; Nota (Vida menos)0d07
s1_dura:	EQU $0082 / $10		; Duracion

s_2:		EQU $066e		; Nota (Pal)
s2_dura:	EQU $0105 / $10		; Duracion

s_3:		EQU $0326		; Nota (Reb)
s3_dura:	EQU $020B / $10		; Duracion

s_4:		equ $0d0f		; Nota (Pulsa-Menus)
s4_dura:	equ $0184 / $10		; Duracion

s_5:		equ $10			; Nota (Pajaro agudo)
s5_dura:	equ $f0			; Duracion ($a0)

s_6:		equ $20			; Nota (Beep)
s6_dura:	equ $ff			; Duracion

s_7:		equ $05			; Nota (Pulsa-Menus)
s7_dura:	equ $ff			; Duracion ($60)

ret

