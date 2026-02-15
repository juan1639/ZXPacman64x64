;================================================================
;---		     S U B  -  S O N I D O S                  ---
;---                                                          ---
;---                                                          ---                                              
;----------------------------------------------------------------
sonido:
	push	de		; Salvaguardar DE,HL
	push	hl

	dec	a
	jr	z,sonido_pala

	dec	a
	jr	z,sonido_rebote

	dec	a
	jr	z,sonido_vidamenos

	dec	a
	jr	z,sonido_pulsamenus

	dec	a
	jr	z,sonido_pajaro

	dec	a
	jr	z,sonido_beep

	dec	a
	jr	z,sonido_laser

jr	$

sonido_pala:
	ld	hl,s_2		; Carga en HL la nota
	ld	de,s2_dura/$05	; Carga en DE la duracion
	jr	emitir_sonido	; Salta a emitir el sonido

sonido_rebote:
	ld	hl,s_3		; Carga en Hl la nota	
	ld	de,s3_dura/$05	; Carga en DE la duracion
	jr	emitir_sonido	; Salta a emitir el sonido

sonido_vidamenos:
	ld	hl,s_1	; Carga en HL la nota
	ld	de,s1_dura/$10	; Carga en DE la duracion
	jr	emitir_sonido	; Salta emitir sonido

sonido_pulsamenus:
	ld	hl,s_4		; Carga en HL la nota
	ld	de,s4_dura	; Carga en DE la duracion
	jr	emitir_sonido	; Salta a emitir sonido

sonido_pajaro:
	ld	hl,s_5
	ld	de,s5_dura
	jr	emitir_sonido

sonido_beep:
	ld	hl,s_6
	ld	de,s6_dura
	jr	emitir_sonido

sonido_laser:
	ld	hl,s_7
	ld	de,s7_dura
	jr	emitir_sonido

jr	$

;----------------------------------------------------
emitir_sonido:
	push	af		; Salvaguardar AF,BC,IX...
	push	bc
	push	ix
	call	beeper		; SUB rutina sistema SONIDOS
	pop	ix
	pop	bc
	pop	af

	pop	hl
	pop	de		; Recupera AF,BC,IX,HL,DE
	ret
