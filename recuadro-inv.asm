;=======================================================================
;                        R E C U A D R O   I N V
; 
;-----------------------------------------------------------------------
dibuja_recuadro_inv:
    ld a,RECUADRO_INV_POS_Y
    ld h,a
    ld a,RECUADRO_INV_POS_X
    ld l,a

    ;------------- dibuja recuadro inv --------------
    ld b,$40

    call bucle_dibuja_recuadro_inv
ret

;=======================================================================
;              D I B U J A   R E C U A D R O   I N V
;
;-----------------------------------------------------------------------
bucle_dibuja_recuadro_inv:
        ld (hl),RECUADRO_INV_BYTES
        inc l
        
        ;--------- byte 2 --------
        ld  (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 3 --------
        ld (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 4 --------
        ld (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 5 --------
        ld (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 6 --------
        ld (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 7--------
        ld (hl),RECUADRO_INV_BYTES
        inc l

        ;--------- byte 8 --------
        ld (hl),RECUADRO_INV_BYTES

        dec l
        dec l
        dec l
        dec l
        dec l
        dec l
        dec l

        call cambio_scanline_linea
    djnz bucle_dibuja_recuadro_inv

    ld  h,$59
    ld  l,RECUADRO_INV_POS_X
    call    attr_recuadro_inv
ret

;=======================================================================
;              A T T R   R E C U A D R O   I N V
;-----------------------------------------------------------------------
attr_recuadro_inv:
    ld  b,$08

    bucle_attr_recuadro_inv:
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO
        inc l
        ld  (hl),NEGRO

        ld  a,l
        add a,$19
        ld  l,a
    djnz    bucle_attr_recuadro_inv
ret
