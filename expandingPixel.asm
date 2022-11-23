LDA #$02
STA $01

LDA #$ef
STA $f0
LDA #$03
STA $f1

LDA #$01
STA $00

loop:    
    DEC $01
    JSR cooldownCheck
    LDY #$00
    LDA $00
    STA ($f0),Y 
    JMP loop

cooldownCheck:
    LDX $01
    CPX #$00
    BEQ inputHandler
    RTS

inputHandler:
    LDY $ff
    CPY #$7A
    BEQ upKey
    CPY #$71
    BEQ leftKey
    CPY #$73
    BEQ downKey
    CPY #$64
    BEQ rightKey
    RTS

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
