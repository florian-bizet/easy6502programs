LDX #$01

loop:
    JSR inputHandler
    STX $0200
    STX $0201
    STX $0220
    STX $0221
    JMP loop

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
    LDX #$03
    RTS

leftKey:
    LDX #$08
    RTS

rightKey:
    LDX #$0e
    RTS

downKey:
    LDX #$04
    RTS
