;===========================================================================
;---              SUB - CAMBIO DE SCANLINE / LINEA                       ---
;---------------------------------------------------------------------------
cambio_scanline_linea:
	ld	a,h
	and	%00000111
	cp	$07			; Cambio de Linea??
	jr	z,cambio_de_fila

	inc	h			; No, entonces solo inc H
	ret

cambio_de_fila:
	ld	a,h
	xor	%00000111		; Poner H = 010T T...(000)
	ld	h,a

	ld	a,l
	add	a,$20			; Cambio de Linea
	ld	l,a
	ret

; =====================================================
; 	+512 en DE
; -----------------------------------------------------
incrementar_de:
	ld   a,e
	add  a,$ff	;255 bytes
	ld   e,a
	jr   nc,ret_inc_de

	inc  d

ret_inc_de:
	ret

;----------------------------------------------------
; 	-64 en DE
;----------------------------------------------------
decrementar_de:
	ld   a,e
	sub  $ff	;64 bytes
	ld   e,a
	jr   nc,ret_dec_de
	
	dec  d

ret_dec_de:
	ret

;==========================================================================
;		        SUB -  TEXTO ZX PACMAN
;--------------------------------------------------------------------------
sub_txt_zxpacman:
	ld	de,txt_zxpacman
	ld	bc,$1c

	call	pr_string
ret

;==========================================================================
;		        SUB -  TEXTO PULSE CONTINUAR...
;--------------------------------------------------------------------------
sub_txt_pulse_continuar:
	ld	de,txt_pulse_continuar
	ld	bc,$26

	call	pr_string
ret

;==========================================================================
;		   SUB -  LEER TECLADO (SPC Para CONTINUAR)...
;--------------------------------------------------------------------------
sub_leer_teclado_pulse_continuar:
	ld	a,$7f		
	in	a,($fe)
	bit	0,a
	jr	nz,sub_leer_teclado_pulse_continuar
ret

;==========================================================================
;		   SUB - SET BIT FIN RECORRIDO
;--------------------------------------------------------------------------
set_bit_fin_recorrido:
	ld	a,(settings)
	set 0,a
	ld 	(settings),a
ret

;==========================================================================
;---		       SUB -  ESTABLECER COLOR BORDE                    ---
;--------------------------------------------------------------------------
borde:
	ld	a,%00000111	; 00BBB111 (B = borde)
	ld	(border_c), a

	ld	a,$00		; Color del Borde (negro)
	out	($fe),a		; Puerto FE
ret

;===========================================================================
;---                    S U B - C L S  ATRIBUTOS                         ---
;---------------------------------------------------------------------------
sub_cls_attr:
; flash 0 ----- bit 7
; bright 0 ---- bit 6
; paper 1  ---- bits 5,4,3
; ink 6 ------- bits 2,1,0

	ld	a,%00000110
	ld	hl,$5800
	ld	(hl),a
	ld	de,$5801
	ld	bc,$02ff
	ldir
ret

;==========================================================================
;---		               SUB -  C L S                             ---
;--------------------------------------------------------------------------
sub_cls:
	ld	a,$00
	ld	hl,$4000
	ld	(hl),a
	ld	de,$4001
	ld	bc,$17ff
	ldir
ret

