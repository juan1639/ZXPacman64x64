;=======================================================================
;                           J U G A D O R
; 
;-----------------------------------------------------------------------
dibuja_jugador:
    ld a,(jugador_y)
    ld h,a
    ld a,(jugador_x)
    ld l,a

    cp  JUGADOR_LIMITE_DE
    ret z

    ;------------------------------------------------------
    ld de,pacman_64x64

    ld  a,(rota_jugador)
    ld b,a

    or  a
    jr  z,salta_a_dibujar

    bucle_incr_jugador:
        call    incrementar_de
        call    incrementar_de
        inc de
        inc de
    djnz bucle_incr_jugador

    ;------------------ dibuja jugador -------------------
    salta_a_dibujar:
    ld b,$40

    call bucle_dibuja_jugador

    ld  a,(rota_jugador)
    inc a
    cp  $04
    call  z,reset_rotacion

    ld  (rota_jugador),a

    ;-----------------------------------------------
    ld  a,(jugador_x)
    cp  JUGADOR_LIMITE_DE
    call    z,set_bit_fin_recorrido
    
    ;------------------ attr -----------------------
    ;ld  h,$59

    ;ld  a,(jugador_x)
    ;ld  l,a

    ;call    attr_jugador
ret

;---------------------------------------------------
reset_rotacion:
    ld  a,(jugador_x)
    inc a
    ld  (jugador_x),a

    ld  a,$00
ret

;=======================================================================
;              D I B U J A   J U G A D O R   (S I N   O R)
;
;-----------------------------------------------------------------------
bucle_dibuja_jugador:
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
    djnz bucle_dibuja_jugador
ret

;=======================================================================
;              A T T R   J U G A D O R
;-----------------------------------------------------------------------
attr_jugador:
    ld  (hl),AMARILLO_BRILLO
    inc l
    ld  (hl),AMARILLO_BRILLO
    inc l
    ld  (hl),AMARILLO_BRILLO

    ld  a,l
    add a,$20
    ld  l,a

    ld  (hl),AMARILLO_BRILLO
    dec l
    ld  (hl),AMARILLO_BRILLO
    dec l
    ld  (hl),AMARILLO_BRILLO

    ld  a,l
    add a,$20
    ld  l,a

    ld (hl),AMARILLO_BRILLO
    inc l
    ld (hl),AMARILLO_BRILLO
    inc l
    ld (hl),AMARILLO_BRILLO
ret

;=======================================================================
;             S O N I D O   M O T O R
;-----------------------------------------------------------------------
sonido_waka:
    ld  a,(cont_it_regresivo)
    or  a
    ret nz

    jr  sonido_motor_vel1
ret

sonido_motor_vel1:
    ld  a,$07
    call    sonido
ret

sonido_motor_vel2:
    ld  a,$03
    call    sonido
ret
