org	$8000

;--------------------------------------------------------------------------
call	declarar_constantes

;==========================================================================
;---			C O M I E N Z O   P R O G R A M A		---
;---									---
;---      		    CLS + ATRIBUTOS GENERALES                   ---
;--------------------------------------------------------------------------
comienzo_programa:
	ld	a,JUGADOR_POS_Y_INI
	ld	(jugador_y),a

	ld	a,JUGADOR_POS_X_INI
	ld	(jugador_x),a

	ld	a,FANTASMA_POS_Y_INI
	ld	(fantasma_y),a

	ld	a,FANTASMA_POS_X_INI
	ld	(fantasma_x),a

	call	sub_cls
	call 	sub_cls_attr
	call	borde

;==========================================================================
;---	                    P R E  -  B U C L E                         ---
;--------------------------------------------------------------------------
pre_bucle:
	call	sub_txt_zxpacman
	call	dibuja_jugador		;Dibuja el jugador

;==========================================================================
;---                                                                    ---
;---	               B U C L E    P R I N C I P A L                   ---
;---                                                                    ---
;==========================================================================
bucle_principal:
	call	dibuja_jugador			;Dibuja el jugador
	call	dibuja_fantasma			;Dibuja el fantasma
	call	dibuja_recuadro_inv		;Dibuja recuadro invisible

	ld	a,(settings)
	bit	0,a
	jr	nz,post_bucle
	
	halt
	halt
	halt
	;halt
	;halt

jr	bucle_principal
jr	$

;==========================================================================
;                         P O S T  -  B U C L E
;--------------------------------------------------------------------------
post_bucle:
	call	sub_txt_pulse_continuar
	call	sub_leer_teclado_pulse_continuar

	ld	a,(settings)
	res	0,a
	ld	(settings),a
jr comienzo_programa
jr	$

;==========================================================================
;=====                                                                =====
;=====                      S U B R U T I N A S                       =====
;=====                                                                =====
;==========================================================================
;
;                V A R I A B L E S
;--------------------------------------------------------------------------
jugador_y			defb	$48
jugador_x			defb    $00

rota_jugador		defb	$00

cont_it_regresivo	defb	$07

fantasma_y			defb	$48
fantasma_x			defb	$0a

rota_fantasma		defb	$00

settings			defb	$00
; Bit 0 = 0/1 Fin recorrido OFF/ON

txt_pulse_continuar	defb	_BRIGHT, $00, _FLASH, $00, _PAPER, $00, _INK, $05, _AT, $0f, $03, " Pulse Space para comenzar "
txt_zxpacman		defb	_BRIGHT, $01, _FLASH, $00, _PAPER, $01, _INK, $06, _AT, $02, $07, " ZX  P A C M A N "

;==========================================================================
include "rutaux.asm"
include "audio.asm"
include "const.asm"
include "sprites.asm"
include "jugador.asm"
include "recuadro-inv.asm"
include "fantasma.asm"

;------------------------------------------------------------------------------
end	$8000

