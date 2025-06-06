.export _setupAndStartPlayer

sid_init = $A000
sid_play = $A003
; sid_data = $A000

.segment "CODE"

.proc _setupAndStartPlayer: near
        lda #$00     ; select first tune
        jsr sid_init ; init music
        ; now set the new interrupt pointer
        sei
        lda #<_interrupt ; point IRQ Vector to our custom irq routine
        ldx #>_interrupt
        sta $314 ; store in $314/$315
        stx $315

        cli ; clear interrupt disable flag
        rts
.endproc

.proc _interrupt
        lda $D011
        and #128
        beq vblank
        jmp $EA31 ; do the normal interrupt service routine
vblank:
        jsr sid_play
;         dec 53280 ; flash border to see we are live
        jmp $EA31 ; do the normal interrupt service routine
.endproc
