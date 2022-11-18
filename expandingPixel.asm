define colorAdr    $00
define cooldown $01

LDA #$02
STA cooldown

LDA #$ef
STA $f0
LDA #$03
STA $f1

LDA #$01
STA colorAdr

loop:    
    DEC cooldown
    JSR cooldownCheck
    LDY #$00
    LDA colorAdr
    STA ($f0),Y 
    JMP loop

cooldownCheck:
    LDX cooldown
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
    STA colorAdr
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
    STA colorAdr
    RTS

rightKey:
    INC $f0
    LDA #$0e
    STA colorAdr
    RTS

downKey:
    LDA $f0
    ADC #$1f
    BCS downborderCheck
    STA $f0
    LDA #$04
    STA colorAdr
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
