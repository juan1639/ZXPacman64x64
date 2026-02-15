;=======================================================================
;                           F A N T A S M A
; 
;-----------------------------------------------------------------------
dibuja_fantasma:
    ld a,(fantasma_y)
    ld h,a
    ld a,(fantasma_x)
    ld l,a

    cp  FANTASMA_LIMITE_DE
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
;              D I B U J A   F A N T A S M A   (S I N   O R)
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
    ld  a,(rota_fantasma)
    cp  $03
    call    z,attr_rota3

    cp  $02
    call    z,attr_rota2

    cp  $01
    call    z,attr_rota1

    cp  $00
    call    z,attr_rota0

    ;---------------------------
    ld  b,$08

    bucle_attr_fantasma:
        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a
        inc l
        inc de

        ld  a,(de)
        ld  (hl),a

        ld  a,l
        add a,$19
        ld  l,a

        inc de
    djnz    bucle_attr_fantasma
ret

;----------------------------------------------------
attr_rota0:
    ld  de,fantasma_attr
ret

attr_rota1:
    ld  de,fantasma_attr + 64
ret

attr_rota2:
    ld  de,fantasma_attr2
ret

attr_rota3:
    ld  de,fantasma_attr2 + 64
ret
