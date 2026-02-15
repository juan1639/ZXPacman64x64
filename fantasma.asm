;=======================================================================
;                           F A N T A S M A
; 
;-----------------------------------------------------------------------
dibuja_fantasma:
    ld a,(fantasma_y)
    ld h,a
    ld a,(fantasma_x)
    ld l,a

    cp  JUGADOR_LIMITE_DE
    ret z

    ;------------------------------------------------------
    ld de,fantasma_64x64

    ld  a,(rota_fantasma)
    ld b,a

    or  a
    jr  z,salta_a_dibujar_fantasma

    bucle_incr_fantasma:
        call    incrementar_de
        call    incrementar_de
        inc de
        inc de
    djnz bucle_incr_fantasma

    ;------------------ dibuja fantasma -------------------
    salta_a_dibujar_fantasma:
    ld b,$40

    call bucle_dibuja_fantasma

    ld  a,(rota_fantasma)
    inc a
    cp  $04
    call  z,reset_rotacion_fantasma

    ld  (rota_fantasma),a

    ;------------------ attr -----------------------
    ;ld  h,$59

    ;ld  a,(jugador_x)
    ;ld  l,a

    ;call    attr_jugador
ret

;---------------------------------------------------
reset_rotacion_fantasma:
    ld  a,(fantasma_x)
    inc a
    ld  (fantasma_x),a

    ld  a,$00
ret

;=======================================================================
;              D I B U J A   J U G A D O R   (S I N   O R)
;
;-----------------------------------------------------------------------
bucle_dibuja_fantasma:
        ld a,(de)
        ld (hl),a

        inc l
        inc de
        
        ;--------- byte 2 --------
        ld a,(de)
        ld  (hl),a

        inc l
        inc de

        ;--------- byte 3 --------
        ld a,(de)
        ld (hl),a

        inc l
        inc de

        ;--------- byte 4 --------
        ld a,(de)
        ld (hl),a

        inc l
        inc de

        ;--------- byte 5 --------
        ld a,(de)
        ld (hl),a

        inc l
        inc de

        ;--------- byte 6 --------
        ld a,(de)
        ld (hl),a

        inc l
        inc de

        ;--------- byte 7--------
        ld a,(de)
        ld (hl),a

        inc l
        inc de

        ;--------- byte 8 --------
        ld a,(de)
        ld (hl),a

        dec l
        dec l
        dec l
        dec l
        dec l
        dec l
        dec l

        call cambio_scanline_linea
        inc de
    djnz bucle_dibuja_fantasma

    ld  h,$59
    call    attr_fantasma
ret

;=======================================================================
;              A T T R   F A N T A S M A
;-----------------------------------------------------------------------
attr_fantasma:
    ld  b,$08

    bucle_attr_fantasma:
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO
        inc l
        ld  (hl),ROJO

        ld  a,l
        add a,$19
        ld  l,a
    djnz    bucle_attr_fantasma
ret
