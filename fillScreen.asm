;Paramétrage de la mémoire

LDY #$02
STY $f1

LDA #$0a ;Color

paintScreen:
    ;Position du premier pixel de la ligne
    LDX #$00
    STX $f0    
    
    ;Coloriage de la ligne
    JSR paintLine
    
    ;Passage à la ligne suivante
    INY
    STY $f1
    CPY #$06
    BNE paintScreen
    BRK

paintLine:
    LDX #$f0

    ;Coloriage du pixel
    STA ($00, X)  
    
    ;Passage au pixel suivant
    LDX $f0
    INX
    STX $f0
    CPX #$FF
    BNE paintLine
    LDX #$f0
    STA ($00, X)
    RTS
