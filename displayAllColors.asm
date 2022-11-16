;Code pour le Easy 6502

;Initialisation des registres
LDX #$00
LDY #$00

;Fonction display
display:
    ;Passage de X dans le registre de calcul
    TXA
    
    ;Affichage des couleurs sur l'écran
    STA $0200,Y
    STA $0201,Y
    STA $0220,Y
    STA $0221,Y
    
    ;Incrémentation des valeurs
    INY
    INY
    INX
    
    ;Condition de fin (Si X != #10 (16) revenir au début de display)
    CPX #$10
    BNE display
    BRK
