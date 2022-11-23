
;Pixel Coordinates 
LDA #$ef
STA $f0
LDA #$03
STA $f1

;Pixel Color
LDA #$01
STA $00

;cooldown
LDA #$20
STA $01

;Main loop
loop:    
    JSR cooldownCheck
    LDA $00
    LDY #$00
    STA ($f0),Y 
    JMP loop

;Check if cooldown = 0 -> read input
cooldownCheck:
    DEC $01
    LDA $01
    CMP #$00
    BEQ inputHandler
    RTS


inputHandler:
    ;Keypress check
    LDY $ff
    CPY #$7A
    BEQ upKey
    CPY #$71
    BEQ leftKey
    CPY #$73
    BEQ downKey
    CPY #$64
    BEQ rightKey
    ;Cooldown Reset
    LDA #$20
    STA $01
    RTS

; 
;
; Vertical direction keypresses
;
;
upKey:
    SEC
    LDA $f0
    SBC #$20
    BCC upborderCheck
    STA $f0
    LDA #$03
    STA $00
    RTS

upborderCheck:
    STA $f0
    LDA $f1
    CMP #$02
    BNE decrementHighByte
    RTS

decrementHighByte:
    DEC $f1
    LDA $f0
    RTS

downKey:
    LDA $f0
    ADC #$20
    BCS downborderCheck
    STA $f0
    LDA #$04
    STA $00
    RTS

downborderCheck:
    STA $f0
    LDA $f1
    CMP #$05
    BNE incrementHighByte
    RTS

incrementHighByte:
    INC $f1
    LDA $f0
    RTS

;
;
; Horizontal Direction keypresses
;
;

leftKey:
    DEC $f0 
    LDA #$08
    STA $00
    RTS

rightKey:
    INC $f0
    LDA #$0e
    STA $00
    RTS

