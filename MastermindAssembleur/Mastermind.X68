*-----------------------------------------------------------
* Title      : Mastermind
* Written by : Damien DECORTE & Pauline DEHORS
* Date       :
* Description: Jeu du MasterMind
*-----------------------------------------------------------
    ORG         $400
START:                  ; first instruction of program
*****Dessin

    MOVE.L      #$049C030C,D1           ; Résolution de 1180x780
    JSR         RESOLUTION              ; Appel système RESOLUTION qui change la résolution
    
**écran d'accueil du jeu
MENU:
    MOVE.L      #$00000000,D1           ; Changement de la couleur du contour de rectangle rempli pour du noir
    JSR         SET_PEN_COLOR
    MOVE.L      #$00A0A59C,D1           ; Changement de la couleur de remplissage pour du gris
    JSR         SET_FILL_COLOR
    MOVE.W      #5,D1                   ; Positionnement
    MOVE.W      #5,D2
    MOVE.W      #1175,D3
    MOVE.W      #775,D4
    JSR         DRAW_FILL_RECT    
    
    MOVE.L      #TEXTE_ACCUEIL,A1       ; écriture du texte d'accueil grâce à DRAW_STRING
    MOVE.L      #$00000000,D1           ; On change la couleur du texte
    MOVE.L      #$06400001,D2           ; On change la police d'écriture et la taille, ainsi que le texte en gras
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #360,D1
    MOVE.W      #80,D2
    JSR         DRAW_STRING
    
    MOVE.L      #$00000000,D1           ; Carré du bouton PLAY
    JSR         SET_PEN_COLOR
    MOVE.L      #$006C6C6C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #450,D1
    MOVE.W      #350,D2
    MOVE.W      #735,D3
    MOVE.W      #450,D4
    JSR         DRAW_FILL_RECT   
    
    MOVE.L      #TEXTE_PLAY,A1          ; Texte du bouton PLAY
    MOVE.L      #$00000000,D1
    MOVE.L      #$061B0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #460,D1
    MOVE.W      #380,D2
    JSR         DRAW_STRING
    
    MOVE.L      #$00000000,D1           ; Carré du bouton REGLES
    JSR         SET_PEN_COLOR
    MOVE.L      #$006C6C6C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #500,D1
    MOVE.W      #500,D2
    MOVE.W      #685,D3
    MOVE.W      #600,D4
    JSR         DRAW_FILL_RECT  
    
    MOVE.L      #TEXTE_REGLE,A1         ; Texte du bouton REGLES
    MOVE.L      #$00000000,D1
    MOVE.L      #$061B0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #535,D1
    MOVE.W      #530,D2
    JSR         DRAW_STRING
    
    MOVE.L      #$00A0A59C,D1           ; On remet la couleur gris pour le fond pour afficher le texte AUTHOR
    JSR         SET_FILL_COLOR
    MOVE.L      #TEXTE_AUTHOR,A1        ; Texte des développeurs
    MOVE.L      #$00000000,D1
    MOVE.L      #$06130000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #360,D1
    MOVE.W      #740,D2
    JSR         DRAW_STRING
    
; Les 8 prochains bloc d'instructions servent à dessiner les petits rectangles de couleur
; dans le menu principal
    MOVE.L      #$000607E7,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$000607E7,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #250,D1
    MOVE.W      #25,D2
    MOVE.W      #300,D3
    MOVE.W      #75,D4
    JSR         DRAW_FILL_RECT 
    
    MOVE.L      #$00DD32EE,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00DD32EE,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #75,D1
    MOVE.W      #200,D2
    MOVE.W      #125,D3
    MOVE.W      #250,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00183C90,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00183C90,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #240,D1
    MOVE.W      #500,D2
    MOVE.W      #290,D3
    MOVE.W      #550,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$006DDD43,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$006DDD43,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #50,D1
    MOVE.W      #650,D2
    MOVE.W      #100,D3
    MOVE.W      #700,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00EC5A07,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00EC5A07,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #900,D1
    MOVE.W      #90,D2
    MOVE.W      #950,D3
    MOVE.W      #140,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00154CFB,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00154CFB,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #1080,D1
    MOVE.W      #250,D2
    MOVE.W      #1130,D3
    MOVE.W      #300,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00FF3881,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00FF3881,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #880,D1
    MOVE.W      #350,D2
    MOVE.W      #830,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$0047F2FF,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$0047F2FF,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #930,D1
    MOVE.W      #650,D2
    MOVE.W      #980,D3
    MOVE.W      #700,D4
    JSR         DRAW_FILL_RECT
    
; Clic sur le bouton START
CLIC_START_GAME:    
    MOVE.L      #0,D1                   ; Déplacement de 0 dans D1 afin de récupérer les informations du clic
    JSR         GET_MOUSE               ; On utilise GET_MOUSE (Stock dans D0.B, les informations du clic, dans D1.L et la position de la souris (16 bits Y, 16 bits X))
    CMP.B       #1,D0                   ; On test si le clic gauche est pressé
    BNE         CLIC_START_GAME         ; Si non, on test de nouveau
RELACHE_CLIC_START_GAME:
    MOVE.L      #0,D1                   ; On remet 0 à D1, pour tester si le clic est relâché
    JSR         GET_MOUSE               ; On lit le clic souris
    CMP.B       #0,D0                   ; Si le clic gauche n'est plus pressé, on fait la suite, sinon on relance la boucle
    BNE         RELACHE_CLIC_START_GAME
FIN_BOUCLE_CLIC_START_GAME:             ; Si le clic est gauche est pressé
    MOVE.W      D1,D3                   ; On déplace les coordonnées X dans D3
    SWAP        D1                      ; On inverse les deux octets de poids faible avec ceux de poids fort pour sauvegarder les coordonnées Y
    MOVE.W      D1,D4                   ; On déplace les coordonées Y dans D4
      
; Test si la zone cliqué est la zone du bouton PLAY
TEST_START_GAME:                        ; On test le clic dans le carré PLAY
    CMP.W       #450,D3                 ; x > 450
    BPL         SUITE_START_GAME_XM     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si non, on retente un clic souris 
SUITE_START_GAME_XM:                    
    CMP.W       #735,D3                 ; x < 735
    BMI         SUITE_START_GAME_YP     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si x > 735, on retente un clic souris
SUITE_START_GAME_YP:
    CMP.W       #350,D4                 ; y > 350
    BPL         SUITE_START_GAME_YM     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si non, on retente un clic souris
SUITE_START_GAME_YM:                    
    CMP.W       #450,D4                 ; y > 450
    BPL         TEST_REGLE_GAME         ; Si oui, on test le carré adjacent en dessous au carré PLAY: Ici le carré REGLES
    BRA         DEBUT_PARTIE            ; Si non, on lance la partie
    
; Test si la zone cliqué est la zone du bouton REGLES
TEST_REGLE_GAME:
    CMP.W       #500,D3                 ; x > 500
    BPL         SUITE_REGLE_GAME_XM     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si non, on retente un clic souris
SUITE_REGLE_GAME_XM:                    
    CMP.W       #685,D3                 ; x < 685
    BMI         SUITE_REGLE_GAME_YP     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si x > 685, on retente un clic souris
SUITE_REGLE_GAME_YP:
    CMP.W       #500,D4                 ; y > 500
    BPL         SUITE_REGLE_GAME_YM     ; Si oui, on continue
    BRA         CLIC_START_GAME         ; Si non, on retente un clic souris
SUITE_REGLE_GAME_YM:                    
    CMP.W       #600,D4                 ; y > 600
    BPL         CLIC_START_GAME         ; Si oui, on retente un clic souris
    BRA         REGLES                  ; Sinon, on affiche l'écran des règles
    
**écran de règles du jeu
REGLES:
    MOVE.L      #$00000000,D1           ; On dessine le fond avec un rectangle rempli gris et d'un contour noir
    JSR         SET_PEN_COLOR
    MOVE.L      #$00A0A59C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #5,D1
    MOVE.W      #5,D2
    MOVE.W      #1175,D3
    MOVE.W      #775,D4
    JSR         DRAW_FILL_RECT    
    
    MOVE.L      #REGLES_TITRE,A1         ; On affiche les titres de l'écran règles
    MOVE.L      #$00000000,D1
    MOVE.L      #$063C0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #315,D1
    MOVE.W      #30,D2
    JSR         DRAW_STRING
    
; les 9 prochains blocs servent à écrire les 9 lignes des règles
    MOVE.L      #REGLES_L1,A1            
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #225,D2
    JSR         DRAW_STRING
    
    MOVE.L      #REGLES_L2,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #250,D2
    JSR         DRAW_STRING
    
    MOVE.L      #REGLES_L3,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #275,D2
    JSR         DRAW_STRING
    
    MOVE.L      #REGLES_L4,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #300,D2
    JSR         DRAW_STRING
 
    MOVE.L      #REGLES_L5,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #325,D2
    JSR         DRAW_STRING
 
    MOVE.L      #REGLES_L6,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #350,D2
    JSR         DRAW_STRING
 
    MOVE.L      #REGLES_L7,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #375,D2
    JSR         DRAW_STRING
    
    MOVE.L      #REGLES_L8,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #400,D2
    JSR         DRAW_STRING
    
    MOVE.L      #REGLES_L9,A1
    MOVE.L      #$00000000,D1
    MOVE.L      #$06100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #230,D1
    MOVE.W      #425,D2
    JSR         DRAW_STRING
    
; Les 8 prochains blocs servent à dessiner les petits rectangles de couleurs autour du texte
    MOVE.L      #$00DD32EE,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00DD32EE,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #175,D1
    MOVE.W      #75,D2
    MOVE.W      #225,D3
    MOVE.W      #125,D4
    JSR         DRAW_FILL_RECT 
    
    MOVE.L      #$000607E7,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$000607E7,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #80,D1
    MOVE.W      #525,D2
    MOVE.W      #130,D3
    MOVE.W      #575,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00183C90,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00183C90,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #90,D1
    MOVE.W      #325,D2
    MOVE.W      #140,D3
    MOVE.W      #375,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$006DDD43,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$006DDD43,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #250,D1
    MOVE.W      #625,D2
    MOVE.W      #300,D3
    MOVE.W      #675,D4
    JSR         DRAW_FILL_RECT

    MOVE.L      #$0047F2FF,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$0047F2FF,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #790,D1
    MOVE.W      #525,D2
    MOVE.W      #840,D3
    MOVE.W      #575,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.L      #$00FF3881,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00FF3881,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #965,D1
    MOVE.W      #600,D2
    MOVE.W      #1015,D3
    MOVE.W      #650,D4
    JSR         DRAW_FILL_RECT   
 
    MOVE.L      #$00154CFB,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00154CFB,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #1075,D1
    MOVE.W      #350,D2
    MOVE.W      #1125,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT  

    MOVE.L      #$00EC5A07,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00EC5A07,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #980,D1
    MOVE.W      #100,D2
    MOVE.W      #1030,D3
    MOVE.W      #150,D4
    JSR         DRAW_FILL_RECT 
    
; On dessine le rectangle pour le bouton du menu principal
    MOVE.L      #$00000000,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$006C6C6C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #500,D1
    MOVE.W      #500,D2
    MOVE.W      #685,D3
    MOVE.W      #600,D4
    JSR         DRAW_FILL_RECT 
    
; On dessine le texte MENU sur le bouton
    MOVE.L      #REGLES_MENU_BUTTON,A1     
    MOVE.L      #$00000000,D1
    MOVE.L      #$061E0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #545,D1
    MOVE.W      #530,D2
    JSR         DRAW_STRING
    
; Gestion du clic sur le bouton retour au menu
CLIC_RETURN_MENU:    
    MOVE.L      #0,D1                       ; Déplacement de 0 dans D1 afin de récupérer
    JSR         GET_MOUSE                   ; On utilise GET_MOUSE
    CMP.B       #1,D0                       ; On test si le clic gauche est pressé
    BNE         CLIC_RETURN_MENU            ; Si non, on test de nouveau
RELACHE_CLIC_RETURN_MENU:
    MOVE.L      #0,D1                       ; On remet D1 à 0 pour retester un clic
    JSR         GET_MOUSE                   ; On lit le clic grâce à GET_MOUSE
    CMP.B       #0,D0                       ; Si le clic est relâché, on passe à la suite, sinon on retente un clic
    BNE         RELACHE_CLIC_RETURN_MENU
FIN_BOUCLE_CLIC_RETURN_MENU:                ; Si le clic est gauche est relâché
    MOVE.W      D1,D3                       ; On déplace les coordonnées X dans D3
    SWAP        D1                          ; On inverse les deux octets de poids faible avec ceux de poids fort pour sauvegarder les coordonnées Y
    MOVE.W      D1,D4                       ; On déplace les coordonées Y dans D4    
  
TEST_REGLE_MENU:
    CMP.W       #500,D3                 ; x > 500
    BPL         SUITE_REGLE_MENU_XM     ; Si oui, on continue
    BRA         CLIC_RETURN_MENU        ; Si non, on retente un clic souris
SUITE_REGLE_MENU_XM:                    
    CMP.W       #685,D3                 ; x < 685
    BMI         SUITE_REGLE_MENU_YP     ; Si oui, on continue
    BRA         CLIC_RETURN_MENU        ; Si x > 685, on retente un clic souris
SUITE_REGLE_MENU_YP:
    CMP.W       #500,D4                 ; y > 500
    BPL         SUITE_REGLE_MENU_YM     ; Si oui, on continue
    BRA         CLIC_RETURN_MENU        ; Si non, on retente un clic souris
SUITE_REGLE_MENU_YM:                    
    CMP.W       #600,D4                 ; y > 600
    BPL         CLIC_RETURN_MENU        ; Si oui, on retente un clic souris
    BRA         MENU                    ; Si non, on est sur le bouton, donc retour au menu

DEBUT_PARTIE:
**Reset des variables de positionnement
    MOVE.L      #PLACE_POS_X1,A0
    MOVE.W      #43,(A0)
    MOVE.L      #PLACE_POS_X2,A0
    MOVE.W      #93,(A0)
    MOVE.L      #PLACE_POS_Y1,A0
    MOVE.W      #37,(A0)
    MOVE.L      #PLACE_POS_Y2,A0
    MOVE.W      #87,(A0)

    MOVE.L      #PLACE_POS_SOLUCE_Y1,A0
    MOVE.W      #37,(A0)
    MOVE.L      #PLACE_POS_SOLUCE_Y2,A0
    MOVE.W      #87,(A0)

    MOVE.L      #PLACE_POS_X1_BIEN_PLACE,A0
    MOVE.W      #40,(A0)
    MOVE.L      #PLACE_POS_X2_BIEN_PLACE,A0
    MOVE.W      #60,(A0)
    MOVE.L      #PLACE_POS_Y1_BIEN_PLACE,A0
    MOVE.W      #472,(A0)
    MOVE.L      #PLACE_POS_Y2_BIEN_PLACE,A0
    MOVE.W      #492,(A0)

    MOVE.L      #PLACE_POS_X1_CHIFFRE,A0
    MOVE.W      #70,(A0)
    MOVE.L      #PLACE_POS_Y1_CHIFFRE,A0
    MOVE.W      #472,(A0)

**Dessin du background
    MOVE.L      #$00000000,D1
    JSR         SET_PEN_COLOR
    MOVE.L      #$00A0A59C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #5,D1
    MOVE.W      #5,D2
    MOVE.W      #1175,D3
    MOVE.W      #775,D4
    JSR         DRAW_FILL_RECT
  
**Dessin du bouton de vérification  
    MOVE.L      #$006C6C6C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #680,D1                
    MOVE.W      #590,D2                 
    MOVE.W      #870,D3                 
    MOVE.W      #680,D4
    JSR         DRAW_FILL_RECT
    
**Dessin des zones d'affichage du nombre de pions bien placés et bon mais mal placés
    MOVE.W      #35,D1
    MOVE.W      #430,D2
    MOVE.W      #100,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #135,D1
    MOVE.W      #430,D2
    MOVE.W      #200,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #235,D1
    MOVE.W      #430,D2
    MOVE.W      #300,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #335,D1
    MOVE.W      #430,D2
    MOVE.W      #400,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #435,D1
    MOVE.W      #430,D2
    MOVE.W      #500,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
        
    MOVE.W      #535,D1
    MOVE.W      #430,D2
    MOVE.W      #600,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
        
    MOVE.W      #635,D1
    MOVE.W      #430,D2
    MOVE.W      #700,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
        
    MOVE.W      #735,D1
    MOVE.W      #430,D2
    MOVE.W      #800,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT

    MOVE.W      #835,D1
    MOVE.W      #430,D2
    MOVE.W      #900,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #935,D1
    MOVE.W      #430,D2
    MOVE.W      #1000,D3
    MOVE.W      #495,D4
    JSR         DRAW_FILL_RECT

**Dessin du texte dans le bouton Verification
    MOVE.L      #TEST,A1
    MOVE.L      #$00FFFFFF,D1
    MOVE.L      #$03300000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #700,D1
    MOVE.W      #600,D2
    JSR         DRAW_STRING
    
**Dessin des rectangles de couleurs choisies
    MOVE.W      #35,D1
    MOVE.W      #25,D2
    MOVE.W      #100,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #135,D1
    MOVE.W      #25,D2
    MOVE.W      #200,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #235,D1
    MOVE.W      #25,D2
    MOVE.W      #300,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #335,D1
    MOVE.W      #25,D2
    MOVE.W      #400,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #435,D1
    MOVE.W      #25,D2
    MOVE.W      #500,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #535,D1
    MOVE.W      #25,D2
    MOVE.W      #600,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #635,D1
    MOVE.W      #25,D2
    MOVE.W      #700,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #735,D1
    MOVE.W      #25,D2
    MOVE.W      #800,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #835,D1
    MOVE.W      #25,D2
    MOVE.W      #900,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #935,D1
    MOVE.W      #25,D2
    MOVE.W      #1000,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT   

** Dessin des rectangles des couleurs machines qui s'affichent à la fin de la partie (rectangle vertical à droite)
    MOVE.W      #1085,D1
    MOVE.W      #25,D2
    MOVE.W      #1150,D3
    MOVE.W      #400,D4
    JSR         DRAW_FILL_RECT 
 
**Dessins des petits carrés dans les rectangles de couleurs choisies par l'utilisateur
    MOVE.W      #43,D1
    MOVE.W      #37,D2
    MOVE.W      #93,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT

    MOVE.W      #143,D1
    MOVE.W      #37,D2
    MOVE.W      #193,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #243,D1
    MOVE.W      #37,D2
    MOVE.W      #293,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #343,D1
    MOVE.W      #37,D2
    MOVE.W      #393,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #443,D1
    MOVE.W      #37,D2
    MOVE.W      #493,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #543,D1
    MOVE.W      #37,D2
    MOVE.W      #593,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #643,D1
    MOVE.W      #37,D2
    MOVE.W      #693,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #743,D1
    MOVE.W      #37,D2
    MOVE.W      #793,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #843,D1
    MOVE.W      #37,D2
    MOVE.W      #893,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #943,D1
    MOVE.W      #37,D2
    MOVE.W      #993,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
    MOVE.W      #1093,D1
    MOVE.W      #37,D2
    MOVE.W      #1143,D3
    MOVE.W      #87,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT 
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    ADD.W       #75,D2
    ADD.W       #75,D4
    JSR         DRAW_FILL_RECT
    
**Dessin des "?" dans les cases de la machine
    MOVE.L      #POINT_INTERR,A1
    MOVE.L      #$FFFFFF,D1
    MOVE.L      #$03200000,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #1105,D1
    MOVE.W      #40,D2
    JSR         DRAW_STRING
    ADD.W       #75,D2
    JSR         DRAW_STRING
    ADD.W       #75,D2
    JSR         DRAW_STRING
    ADD.W       #75,D2
    JSR         DRAW_STRING
    ADD.W       #75,D2
    JSR         DRAW_STRING
    
**Dessin du rectangle des couleurs cliquables
    MOVE.W      #250,D1
    MOVE.W      #560,D2
    MOVE.W      #650,D3
    MOVE.W      #740,D4
    JSR         DRAW_FILL_RECT

**Dessin des carrés de couleurs cliquables
    MOVE.L      #$00EC5A07,D1          
    JSR         SET_PEN_COLOR          
    MOVE.L      #$00EC5A07,D1           
    JSR         SET_FILL_COLOR         
    MOVE.W      #275,D1                 
    MOVE.W      #585,D2                 
    MOVE.W      #325,D3                
    MOVE.W      #635,D4             
    JSR         DRAW_FILL_RECT          
    
    MOVE.L      #$0047F2FF,D1          
    JSR         SET_PEN_COLOR          
    MOVE.L      #$0047F2FF,D1           
    JSR         SET_FILL_COLOR          
    MOVE.W      #375,D1                 
    MOVE.W      #585,D2                 
    MOVE.W      #425,D3                 
    MOVE.W      #635,D4                 
    JSR         DRAW_FILL_RECT          
    
    MOVE.L      #$006DDD43,D1           
    JSR         SET_PEN_COLOR           
    MOVE.L      #$006DDD43,D1          
    JSR         SET_FILL_COLOR          
    MOVE.W      #475,D1                
    MOVE.W      #585,D2                 
    MOVE.W      #525,D3                 
    MOVE.W      #635,D4                
    JSR         DRAW_FILL_RECT          

    MOVE.L      #$000607E7,D1          
    JSR         SET_PEN_COLOR    
    MOVE.L      #$000607E7,D1           
    JSR         SET_FILL_COLOR          
    MOVE.W      #575,D1                 
    MOVE.W      #585,D2                 
    MOVE.W      #625,D3                 
    MOVE.W      #635,D4                
    JSR         DRAW_FILL_RECT          

    MOVE.L      #$00FF3881,D1           
    JSR         SET_PEN_COLOR           
    MOVE.L      #$00FF3881,D1        
    JSR         SET_FILL_COLOR         
    MOVE.W      #275,D1                 
    MOVE.W      #670,D2                 
    MOVE.W      #325,D3                 
    MOVE.W      #720,D4                 
    JSR         DRAW_FILL_RECT          

    MOVE.L      #$00154CFB,D1           
    JSR         SET_PEN_COLOR           
    MOVE.L      #$00154CFB,D1           
    JSR         SET_FILL_COLOR         
    MOVE.W      #375,D1              
    MOVE.W      #670,D2            
    MOVE.W      #425,D3                
    MOVE.W      #720,D4                 
    JSR         DRAW_FILL_RECT          

    MOVE.L      #$00DD32EE,D1          
    JSR         SET_PEN_COLOR          
    MOVE.L      #$00DD32EE,D1        
    JSR         SET_FILL_COLOR     
    MOVE.W      #475,D1             
    MOVE.W      #670,D2            
    MOVE.W      #525,D3            
    MOVE.W      #720,D4            
    JSR         DRAW_FILL_RECT        

    MOVE.L      #$00183C90,D1          
    JSR         SET_PEN_COLOR     
    MOVE.L      #$00183C90,D1        
    JSR         SET_FILL_COLOR      
    MOVE.W      #575,D1                
    MOVE.W      #670,D2                
    MOVE.W      #625,D3              
    MOVE.W      #720,D4               
    JSR         DRAW_FILL_RECT         


    MOVE.B      #0,D2                   ; Compteur de chiffres choisis par la machine
    MOVE.L      #COLOR_MACHINE,A0       ; récupère l'adresse de COLOR_MACHINE dans A0
   
* Génération des couleurs par la machine
* On commence par générer une première fois à l'aide du temps machine, puis on utilise l'algorithme.
    MOVE.B      #8,D0                   ; Récupère le temps système (horloge) dans D1
    TRAP        #15
    AND.L       #$5FFFF,D1              ; Prévention de la division par 8
    DIVU        #8,D1                   ; Division par 8
    MOVE.L      D1,D4                   ; Récupère la division et le reste dans D4
    SWAP        D4                      ; Inversion des 2 octets de poids faible avec les deux octets de poids fort
    MOVE.B      D4,D3                   ; Déplacement du résultat du reste de la division dans D3
    MOVE.B      D3,(A0)+                ; Stock de la couleur dans le premier tirage
POUR_CHOIX_COULEUR:
    CMP.B       #4,D2                   ; Compare si on a fini de sélectionner les 5 couleurs
    BEQ         FIN_POUR_CHOIX          ; Si égal, on a fini
    JSR         Randomize               ; Sinon on va dans Randomize
    MOVE.B      D3,(A0)+                ; Randomize renvoie la valeur suivante dans D3, donc on l'ajoute dans COLOR_MACHINE
    ADD.B       #1,D2                   ; On incrémente le compteur      
    BRA         POUR_CHOIX_COULEUR      ; On revient au début de la boucle
FIN_POUR_CHOIX: 
    
    MOVE.B      #0,D6                   ; D6 Contient le nombre de couleurs choisies par l'utilisateur
    MOVE.B      #0,D5                   ; D6 Contient le nombre de tentatives réalisées au total
; Clic des carrés en bas
BOUCLE_POUR_VERIF:
    CMP.B       #10,D5                  ; Au bout de 10 coups, l'utilisateur a perdu
    BEQ         LOOSE
    MOVE.L      #COLOR_USER,A1          ; Si le joueur n'a pas fait 10 coups, on stock l'adresse du début du tableau de COLOR_USER dans A1
BOUCLE_CHOIX_COULEUR_USER:
    CMP.B       #5,D6                   ; Si le joueur a choisi 5 couleurs, on va à FIN_CHOIX
    BEQ         FIN_CHOIX
    MOVE.L      #0,D3                   ; coordonnée X du clic souris à 0
    MOVE.L      #0,D4                   ; coordonnée Y du clic souris à 0
CLIC_SOURIS:    
    MOVE.L      #0,D1                   ; Déplacement de 0 dans D1 afin de récupérer
    JSR         GET_MOUSE               ; On utilise GET_MOUSE (Stock dans D0.B, les informations du clic, dans D1.L et la position de la souris (16 bits Y, 16 bits X))
    CMP.B       #1,D0                   ; On test si le clic gauche est pressé
    BNE         CLIC_SOURIS             ; Si non, on test de nouveau
RELACHE_CLIC:
    MOVE.L      #0,D1                   ; On remet D1 à 0 pour retester un clic souris
    JSR         GET_MOUSE               ; On récupère les informations du clic et la position
    CMP.B       #0,D0                   ; Si le clic gauche est relâché, on regarde où le clic est
    BNE         RELACHE_CLIC            ; Si non, on retest le relâchement du clic
FIN_BOUCLE_CLIC:                        ; Si le clic est gauche est relâché
    MOVE.W      D1,D3                   ; On déplace les coordonnées X dans D3
    SWAP        D1                      ; On inverse les deux octets de poids faible avec ceux de poids fort pour sauvegarder les coordonnées Y
    MOVE.W      D1,D4                   ; On déplace les coordonées Y dans D4
    
    
TEST_CARRE_BLEU:                        ; On test le clic dans le carré bleu
    CMP.W       #275,D3                 ; x > 275
    BPL         SUITE_CARRE_BLEU_XM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_BLEU_XM:                    
    CMP.W       #325,D3                 ; x < 325
    BMI         SUITE_CARRE_BLEU_YP     ; Si oui, on continue
    BRA         TEST_CARRE_JAUNE        ; Si x > 325, on test le carré adjacent au bleu (ici, le jaune)
SUITE_CARRE_BLEU_YP:
    CMP.W       #585,D4                 ; y > 585
    BPL         SUITE_CARRE_BLEU_YM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_BLEU_YM:                    
    CMP.W       #635,D4                 ; y > 635
    BPL         TEST_CARRE_VIOLET       ; Si oui, on test le carré adjacent en dessous au bleu (ici, le violet)
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #0,(A1)+                
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$00EC5A07,D1           ; On met dans D1 la couleur bleue
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_JAUNE:                       ; On test le clic dans le carré jaune
    CMP.W       #375,D3                 ; x > 375
    BPL         SUITE_CARRE_JAUNE_XM    ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_JAUNE_XM:
    CMP.W       #425,D3                 ; x < 425
    BMI         SUITE_CARRE_JAUNE_YP    ; Si oui, on continue
    BRA         TEST_CARRE_VERT         ; Si x > 425, on test le carré adjacent au jaune (ici, le vert)
SUITE_CARRE_JAUNE_YP:   
    CMP.W       #585,D4                 ; y > 585
    BPL         SUITE_CARRE_JAUNE_YM    ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_JAUNE_YM:       
    CMP.W       #635,D4                 ; y > 635
    BPL         TEST_CARRE_ORANGE       ; Si oui, on test le carré adjacent en dessous au jaune (ici, le orange)
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #1,(A1)+                
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$0047F2FF,D1           ; On met dans D1 la couleur jaune
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_VERT:                        ; On test le clic dans le carré vert
    CMP.W       #475,D3                 ; x > 475
    BPL         SUITE_CARRE_VERT_XM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_VERT_XM:
    CMP.W       #525,D3                 ; y < 525
    BMI         SUITE_CARRE_VERT_YP     ; Si oui, on continue
    BRA         TEST_CARRE_ROUGE        ; Si x > 525, on test le carré adjacent au vert (ici, le rouge)
SUITE_CARRE_VERT_YP:    
    CMP.W       #585,D4                 ; y > 585
    BPL         SUITE_CARRE_VERT_YM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_VERT_YM:        
    CMP.W       #635,D4                 ; y > 635
    BPL         TEST_CARRE_ROSE         ; Si oui, on test le carré adjacent en dessous au jaune (ici, le orange)
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #2,(A1)+                
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$006DDD43,D1           ; On met dans D1 la couleur verte
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_ROUGE:                       ; On test le clic dans le carré rouge
    CMP.W       #575,D3                 ; x > 575
    BPL         SUITE_CARRE_ROUGE_XM    ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_ROUGE_XM:
    CMP.W       #625,D3                 ; x < 625
    BMI         SUITE_CARRE_ROUGE_YP    ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris (car pas de carré à droite du rouge)
SUITE_CARRE_ROUGE_YP:       
    CMP.W       #585,D4                 ; y > 585
    BPL         SUITE_CARRE_ROUGE_YM    ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic souris
SUITE_CARRE_ROUGE_YM:
    CMP.W       #635,D4                 ; y > 635
    BPL         TEST_CARRE_MARRON       ; Si oui, on test le carré adjacent en dessous au rouge  (ici, le marron)
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #3,(A1)+              
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$000607E7,D1           ; On met dans D1 la couleur rouge
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER   
    
TEST_CARRE_VIOLET:                      ; On test le clic dans le carré violet    
    CMP.W       #275,D3                  ; x > 275
    BPL         SUITE_CARRE_VIOLET_XM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_VIOLET_XM:
    CMP.W       #325,D3                 ; x < 325
    BMI         SUITE_CARRE_VIOLET_YP   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_VIOLET_YP:
    CMP.W       #670,D4                 ; y > 670
    BPL         SUITE_CARRE_VIOLET_YM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_VIOLET_YM:
    CMP.W       #720,D4                 ; y > 720
    BPL         CLIC_SOURIS             ; Si oui, on retente un clic
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #4,(A1)+               
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$00FF3881,D1           ; On met dans D1 la couleur violet
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_ORANGE:                      ; On test le clic dans le carré orange
    CMP.W       #375,D3                 ; x > 375
    BPL         SUITE_CARRE_ORANGE_XM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ORANGE_XM:
    CMP.W       #425,D3                 ; x < 425
    BMI         SUITE_CARRE_ORANGE_YP   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ORANGE_YP:
    CMP.W       #670,D4                 ; y > 670
    BPL         SUITE_CARRE_ORANGE_YM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ORANGE_YM:
    CMP.W       #720,D4                 ; y > 720
    BPL         CLIC_SOURIS             ; Si oui, on retente un clic
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #5,(A1)+                 
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$00154CFB,D1           ; On met dans D1 la couleur orange
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA         BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_ROSE:                        ; On test le clic dans le carré rose
    CMP.W       #475,D3                 ; x > 475
    BPL         SUITE_CARRE_ROSE_XM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ROSE_XM:
    CMP.W       #525,D3                 ; x < 525
    BMI         SUITE_CARRE_ROSE_YP     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ROSE_YP:
    CMP.W       #670,D4                 ; y > 670
    BPL         SUITE_CARRE_ROSE_YM     ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_ROSE_YM:
    CMP.W       #720,D4                 ; y > 720
    BPL         CLIC_SOURIS             ; Si oui, on retente un clic
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #6,(A1)+                
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$00DD32EE,D1           ; On met dans D1 la couleur rose
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User
; Puis on revient dans la boucle de choix couleur
    BRA BOUCLE_CHOIX_COULEUR_USER
    
TEST_CARRE_MARRON:                      ; On test le clic dans le carré marron
    CMP.W       #575,D3                 ; x > 575
    BPL         SUITE_CARRE_MARRON_XM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_MARRON_XM:
    CMP.W       #625,D3                 ; x < 625
    BMI         SUITE_CARRE_MARRON_YP   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_MARRON_YP:
    CMP.W       #670,D4                 ; y > 670
    BPL         SUITE_CARRE_MARRON_YM   ; Si oui, on continue
    BRA         CLIC_SOURIS             ; Si non, on retente un clic
SUITE_CARRE_MARRON_YM:
    CMP.W       #720,D4                 ; y > 720
    BPL         CLIC_SOURIS             ; Si oui, on retente un clic
; Si non, on place la valeur de la couleur choisie dans le tableau
    MOVE.B      #7,(A1)+              
    ADD.B       #1,D6                   ; On ajoute 1 au compteur du nombre de couleurs choisies 
    MOVE.L      #$00183C90,D1           ; On met dans D1 la couleur marron
    JSR         Dessin_Carre_User       ; On dessine le carré dans les rectangles du haut grâce à Dessin_Carre_User   
; Puis on revient dans la boucle de choix couleur               
    BRA         BOUCLE_CHOIX_COULEUR_USER
   
; A la fin de la vérification, on récupère le nombre de pions bien placés et mal placés pour les mettre dans les variables pour les conserver, puis les afficher
FIN_VERIF:
    MOVE.L      #NOMBRE_BIEN_PLACE,A3
    MOVE.L      #NOMBRE_MAL_PLACE,A4
    MOVE.B      D1,(A3)
    MOVE.B      D2,(A4)
    JSR         Dessin_Pion_Placement
    MOVE.L      #NOMBRE_BIEN_PLACE,A3
; On compare le nombre de bien placés avec le caractère '5', et si c'est égal à '5', le joueur a gagné
    CMP.B       #53,(A3)
    BEQ         WIN
; Sinon, on revient au début de la boucle
    MOVE.B      #0,D6                   ; On remet le nombre de couleurs choisies à 0
    ADD.B       #1,D5                   ; On incrémente le compteur de tentatives
    BRA         BOUCLE_POUR_VERIF

FIN_CHOIX:
    MOVE.L      #PLACE_POS_X1,A3        ; Récupération des positions de dessin dans les lignes de choix de couleur
    MOVE.L      #PLACE_POS_Y1,A4
    MOVE.L      #PLACE_POS_X2,A5
    MOVE.L      #PLACE_POS_Y2,A6
    SUB.W       #375,(A4)               ; Retour à la ligne en Y1
    SUB.W       #375,(A6)               ; Retour à la ligne en Y2
    ADD.W       #100,(A3)               ; Passage à la ligne d'à côté en ajoutant 79 en X1
    ADD.W       #100,(A5)               ; Passage à la ligne d'à côté en ajoutant 79 en X2
    MOVE.L      #COLOR_USER,A1          ; On remet l'adresse du tableau COLOR_USER au début
    BRA         BOUTON_VERIF
    
BOUCLE_VERIF:
    MOVE.B      #0,D0                   ; On utilise D0 comme compteur de couleurs testées
    MOVE.L      #COLOR_MACHINE_STOCK,A0 ; On récupère les couleurs COLOR_MACHINE_STOCK
    MOVE.L      #COLOR_USER,A1          ; et les couleurs de l'utilisateur
    MOVE.B      #0,D1                   ; On met D1 à 0 car D1 va compter le nombre de couleurs bien placées
BOUCLE_VERIF_BIEN_PLACE:
    CMP.B       #5,D0                   ; Si on a testé toutes les couleurs bonnes et bien placées, on passe aux bon et mal placées
    BEQ         VERIF_BON_MAL_PLACE
    MOVE.B      (A0),D4                 ; On déplace dans D4 et D7 les couleurs actuelles
    MOVE.B      (A1),D7
    CMP.B       D4,D7                   ; Si les deux couleurs sont égales
    BEQ         AJOUT_BIEN_PLACE        ; On va dans AJOUT_BIEN_PLACE
    BRA         SUITE_BIEN_PLACE        ; Si non, on va dans SUITE_BIEN_PLACE
AJOUT_BIEN_PLACE:   
    ADD.B       #1,D1                   ; On incrémente le compteur de couleurs bien placées
    MOVE.B      #$FF,(A1)               ; On met $FF pour éviter de reprendre la couleur plusieurs fois
    MOVE.B      #$FF,(A0)
SUITE_BIEN_PLACE:
    ADD.B       #1,D0                   ; On incrémente le compteur de couleurs testées
    ADD.L       #1,A0                   ; On passe à la cellule du tableau suivante dans les deux tableaux
    ADD.L       #1,A1
    BRA         BOUCLE_VERIF_BIEN_PLACE
    
; Double boucle POUR
VERIF_BON_MAL_PLACE:
    MOVE.B      #0,D0                   ; Initialisation du compteur qui va parcourir les couleurs de la machine
    MOVE.B      #0,D3                   ; Initialisation du compteur qui va parcourir les couleurs de l'utilisateur
    MOVE.B      #0,D2                   ; Stocker le nombre de valeurs bonnes et mal placées
    MOVE.B      #0,D4
    MOVE.B      #0,D7
    MOVE.L      #COLOR_MACHINE_STOCK,A0 ; On stock les couleurs de la machine à chaque tour de boucle
BOUCLE_VERIF_BON_MAL_PLACE:
    CMP.B       #5,D0                   ; On vérifie si on a vérifier chaque couleur de l'utilisateur pour chaque couleur machine stockée
    BEQ         FIN_VERIF
    MOVE.B      #0,D3                   ; Si non, on met à 0 le nombre de couleurs de l'utilisateur testées
    MOVE.B      (A0)+,D4                ; On stock dans D4 la couleur de la machine à tester pour toutes les couleurs de l'utilisateur
    CMP.B       #$FF,D4                 ; Si la couleur est $FF (couleur déjà testée), on ne la prend pas en compte
    BEQ         SUITE_COULEUR_MACHINE
    MOVE.L      #COLOR_USER,A1          ; Si la couleur n'est pas $FF, on passe la suite
BOUCLE_COULEUR_USER:
    CMP.B       #5,D3                   ; Si on a testé toutes les couleurs utilisateurs pour la couleur donnée
    BEQ         SUITE_COULEUR_MACHINE   ; On passe à la prochaine couleur machine
PAS_EGAL_A_5:
    MOVE.B      (A1),D7                 ; Si non, on stock dans D7 la couleur de l'utilisateur à tester avec la couleur machine dans D4
    CMP.B       D7,D4                   ; Si les couleurs sont égales, c'est qu'elles sont mal placées
    BEQ         MAL_PLACE               
    ADD.B       #1,D3                   ; Si non, on incrémente le compteur de couleurs utilisateurs
    ADD.L       #1,A1                   ; On déplace le pointeur sur le tableau de COLOR_USER
    BRA         BOUCLE_COULEUR_USER     ; Puis on passe à la couleur de l'utilisateur suivante
MAL_PLACE:
    ADD.B       #1,D2                   ; On incrémente le compteur de couleurs bonnes et mal placées
    MOVE.B      #$FF,(A1)               ; On met la couleur de l'utilisateur testée à $FF, pour ne plus l'utiliser
SUITE_COULEUR_MACHINE:
    ADD.B       #1,D0                   ; On incrémente le nombre de couleur de la machine testées
    BRA         BOUCLE_VERIF_BON_MAL_PLACE  ; On va au début de la boucle 

** bouton verif
    
BOUTON_VERIF:   
    MOVE.L      #0,D1                   ; Déplacement de 0 dans D1
    JSR         GET_MOUSE               ; On utilise GET_MOUSE
    CMP.B       #1,D0                   ; On test si le clic gauche est pressé
    BNE         BOUTON_VERIF            ; Si non, on test de nouveau
FIN_BOUCLE_CLIC_VERIF:                  ; Si le clic est gauche est pressé
    MOVE.W      D1,D3                   ; On déplace les coordonnées X dans D3
    SWAP        D1                      ; On inverse les deux octets de poids faible avec ceux de poids fort pour sauvegarder les coordonnées Y
    MOVE.W      D1,D4                   ; On déplace les coordonées Y dans D4
TEST_CARRE_VERIF:                       ; On test le clic dans le carré de vérification    
    CMP.W       #680,D3                 ; x > 680
    BPL         SUITE_CARRE_VERIF_XM    ; Si oui, on continue
    BRA         BOUTON_VERIF            ; Si non, on retente un clic
SUITE_CARRE_VERIF_XM:
    CMP.W       #870,D3                 ; x < 870
    BMI         SUITE_CARRE_VERIF_YP    ; Si oui, on continue
    BRA         BOUTON_VERIF            ; Si non, on retente un clic
SUITE_CARRE_VERIF_YP:
    CMP.W       #590,D4                 ; y > 590
    BPL         SUITE_CARRE_VERIF_YM    ; Si oui, on continue
    BRA         BOUTON_VERIF            ; Si non, on retente un clic
SUITE_CARRE_VERIF_YM:
    CMP.W       #680,D4                 ; y > 680
    BPL         BOUTON_VERIF            ; Si oui, on retente un clic
    BRA         STOCK_COLOR_MACHINE     ; Si non, on est sur le carré de vérification
    
STOCK_COLOR_MACHINE:                    
    MOVE.B      #0,D0                   ; On prend D0 comme compteur pour stocker les couleurs de la machine sélectionnées au début (car modification pour la vérification)
    MOVE.L      #COLOR_MACHINE,A0       ; On stock les couleurs de la machine originelles
    MOVE.L      #COLOR_MACHINE_STOCK,A1 ; Puis on stock l'adresse du tableau de là où vont être stockées les couleurs originelles
BOUCLE_STOCK:
    CMP.B       #5,D0                   ; Si on arrive à 5 couleurs, on a terminé
    BEQ         BOUCLE_VERIF            
    MOVE.B      (A0)+,(A1)+             ; Sinon, on déplace la couleur de COLOR_MACHINE[i] dans COLOR_MACHINE_STOCK[i]
    ADD.B       #1,D0                   ; On incrémente le compteur
    BRA         BOUCLE_STOCK            ; On recommence jusqu'à avoir tout stocké
   
WIN:
    MOVE.L      #WIN_LOOSE_BOOL,A3      ; Si le joueur a gagné, on place dans la variable WIN_LOOSE_BOOL, la valeur 1
    MOVE.B      #1,(A3)
    BRA         ENDGAME                 ; On branche à la fin de partie

LOOSE:   
    MOVE.L      #WIN_LOOSE_BOOL,A3      ; Si le joueur a perdu, on place dans la variable WIN_LOOSE_BOOL, la valeur 2
    MOVE.B      #2,(A3)
    BRA         ENDGAME                 ; On branche à la fin de partie
   
ENDGAME:
    MOVE.B      #0,D5                   ; On met D5 à 0, qui sert de compteur pour Affiche_Solution
    MOVE.L      #COLOR_MACHINE,A0       ; On stock l'adresse du tableau de COLOR_MACHINE
    BRA         Affiche_Solution        ; On affiche la solution
SUITE_ENDGAME:
    MOVE.L      #0,D7                   ; On initialise le compteur D7 à 0
COMPTEUR:
    CMP.L       #200000,D7              ; On attend que D7 soit à 200000 (pour laisser l'utilisateur voir la solution)
    BEQ         SUITE_COMPTEUR
    ADD.L       #1,D7
    BRA         COMPTEUR
SUITE_COMPTEUR:
    MOVE.L      #WIN_LOOSE_BOOL,A3      ; On regarde la valeur de la variable WIN_LOOSE_BOOL
    CMP.B       #1,(A3)
    BEQ         AFFICHE_WIN             ; Si la variable est égale à 1, le joueur a gagné
    BRA         AFFICHE_LOOSE           ; Si non, le joueur a perdu

Affiche_Solution:
    CMP.B       #5,D5                   ; Si on a affiché les 5 couleurs de la machine, on passe à la suite
    BEQ         SUITE_ENDGAME
    MOVE.B      (A0)+,D6                ; Si non, on prend dans D6 la valeur de la couleur
    JSR         Selectionne_Couleur     ; On modifie la couleur selon la couleur dans le tableau
    MOVE.L      #PLACE_POS_SOLUCE_Y1,A4 ; On récupère les positions où dessiner les solutions
    MOVE.L      #PLACE_POS_SOLUCE_Y2,A6
; On positionne les valeurs en x1 x2 y1 y2 pour dessiner
    MOVE.W      #1093,D1                  
    MOVE.W      (A4),D2
    MOVE.W      #1143,D3
    MOVE.W      (A6),D4
    ADD.W       #75,(A4)
    ADD.W       #75,(A6)
    JSR         DRAW_FILL_RECT
    ADD.B       #1,D5                   ; On incrémente le compteur de couleurs affichées
    BRA         Affiche_Solution

AFFICHE_WIN:
    MOVE.L      #$00000000,D1           ; On affiche le background de fin de partie
    JSR         SET_PEN_COLOR
    MOVE.L      #$00A0A59C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #5,D1
    MOVE.W      #5,D2
    MOVE.W      #1175,D3
    MOVE.W      #775,D4
    JSR         DRAW_FILL_RECT 
    
    MOVE.L      #$00A0A59C,D1           ; On affiche le texte de victoire
    JSR         SET_FILL_COLOR
    MOVE.L      #TEXTE_WIN,A1
    MOVE.L      #$00FFFFFF,D1
    MOVE.L      #$062B0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #450,D1
    MOVE.W      #50,D2
    JSR         DRAW_STRING
    
    BRA         AFFICHE_RESTART
    
AFFICHE_LOOSE:
    MOVE.L      #$00000000,D1           ; On affiche le background de fin de partie
    JSR         SET_PEN_COLOR
    MOVE.L      #$00A0A59C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #5,D1
    MOVE.W      #5,D2
    MOVE.W      #1175,D3
    MOVE.W      #775,D4
    JSR         DRAW_FILL_RECT 

    MOVE.L      #$00A0A59C,D1           ; On affiche le texte de perdu
    JSR         SET_FILL_COLOR
    MOVE.L      #TEXTE_LOOSE,A1
    MOVE.L      #$00FFFFFF,D1
    MOVE.L      #$062B0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #500,D1
    MOVE.W      #50,D2
    JSR         DRAW_STRING
    
    BRA         AFFICHE_RESTART

AFFICHE_RESTART:
* affichage bouton menu
    MOVE.L      #$00000000,D1           ; On affiche le bouton pour le menu
    JSR         SET_PEN_COLOR
    MOVE.L      #$006C6C6C,D1
    JSR         SET_FILL_COLOR
    MOVE.W      #500,D1
    MOVE.W      #500,D2
    MOVE.W      #685,D3
    MOVE.W      #600,D4
    JSR         DRAW_FILL_RECT 
    
    MOVE.L      #REGLES_MENU_BUTTON,A1  ; On affiche le texte MENU sur le bouton    
    MOVE.L      #$00000000,D1
    MOVE.L      #$061E0001,D2
    MOVE.B      #21,D0
    TRAP        #15
    MOVE.W      #545,D1
    MOVE.W      #530,D2
    JSR         DRAW_STRING
    
CLIC_RETURN_FIN:    
    MOVE.L      #0,D1                   ; Déplacement de 0 dans D1 afin de récupérer
    JSR         GET_MOUSE               ; On utilise GET_MOUSE (Stock dans D0.B, les informations du clic, dans D1.L et la position de la souris (16 bits Y, 16 bits X))
    CMP.B       #1,D0                   ; On test si le clic gauche est pressé
    BNE         CLIC_RETURN_FIN         ; Si non, on test de nouveau
RELACHE_CLIC_FIN:
    MOVE.L      #0,D1                   ; On met D1 à 0 pour retenter un nouveau clic
    JSR         GET_MOUSE
    CMP.B       #0,D0                   ; Si on relâche le clic gauche, on passe à la suite
    BNE         RELACHE_CLIC_FIN        ; Si non, on revérifie le relâchement du clic
FIN_BOUCLE_CLIC_FIN:                    ; Si le clic est gauche est relâché
    MOVE.W      D1,D3                   ; On déplace les coordonnées X dans D3
    SWAP        D1                      ; On inverse les deux octets de poids faible avec ceux de poids fort pour sauvegarder les coordonnées Y
    MOVE.W      D1,D4                   ; On déplace les coordonées Y dans D4    
  
TEST_BACK_MENU_FIN:
    CMP.W       #500,D3                 ; x > 500
    BPL         SUITE_MENU_FIN_XM       ; Si oui, on continue
    BRA         CLIC_RETURN_FIN         ; Si non, on retente un clic souris
SUITE_MENU_FIN_XM:                    
    CMP.W       #685,D3                 ; x < 685
    BMI         SUITE_MENU_FIN_YP       ; Si oui, on continue
    BRA         CLIC_RETURN_FIN         ; Si x > 100, on test le carré adjacent au bleu (ici, le jaune)
SUITE_MENU_FIN_YP:
    CMP.W       #500,D4                 ; y > 500
    BPL         SUITE_MENU_FIN_YM       ; Si oui, on continue
    BRA         CLIC_RETURN_FIN         ; Si non, on retente un clic souris
SUITE_MENU_FIN_YM:                    
    CMP.W       #600,D4                 ; y > 600
    BPL         CLIC_RETURN_FIN         ; Si oui, on retente un clic
    BRA         MENU                    ; Si non, on va au menu


FIN_PRG:
    JMP         FINPRG

Randomize:
    ADD.L       #256187,D3              ; Notre fonction de générateur est I(n) = (I(n-1) + 256187) mod 8
    DIVU        #8,D3                   ; Division par 8
    SWAP        D3                      ; Inversion des 2 octets de poids faible avec les deux octets de poids fort
    AND.L       #$0000FFFF,D3           ; On garde uniquement le reste dans D3, en retirant le quotient à l'aide d'un masque.
    RTS

    
Selectionne_Couleur:
BLEU:
    CMP.B       #0,D6                   
    BEQ         COULEUR_FINALE_BLEU     ; Si la couleur est bleu, on change la couleur du crayon en BLEU
JAUNE:
    CMP.B       #1,D6
    BEQ         COULEUR_FINALE_JAUNE    ; Si la couleur est jaune, on change la couleur du crayon en JAUNE
VERT:
    CMP.B       #2,D6
    BEQ         COULEUR_FINALE_VERT     ; Si la couleur est vert, on change la couleur du crayon en VERT
ROUGE:
    CMP.B       #3,D6
    BEQ         COULEUR_FINALE_ROUGE    ; Si la couleur est rouge, on change la couleur du crayon en ROUGE
VIOLET
    CMP.B       #4,D6
    BEQ         COULEUR_FINALE_VIOLET   ; Si la couleur est violet, on change la couleur du crayon en VIOLET
ORANGE:
    CMP.B       #5,D6
    BEQ         COULEUR_FINALE_ORANGE   ; Si la couleur est orange, on change la couleur du crayon en ORANGE
ROSE:
    CMP.B       #6,D6
    BEQ         COULEUR_FINALE_ROSE     ; Si la couleur est rose, on change la couleur du crayon en ROSE
MARRON:
    CMP.B       #7,D6
    BEQ         COULEUR_FINALE_MARRON   ; Si la couleur est marron, on change la couleur du crayon en MARRON

COULEUR_FINALE_BLEU:
    MOVE.L      #$00EC5A07,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_JAUNE:
    MOVE.L      #$0047F2FF,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_VERT:
    MOVE.L      #$006DDD43,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_ROUGE:
    MOVE.L      #$000607E7,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_VIOLET:
    MOVE.L      #$00FF3881,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_ORANGE:
    MOVE.L      #$00154CFB,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_ROSE:
    MOVE.L      #$00DD32EE,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS

COULEUR_FINALE_MARRON:
    MOVE.L      #$00183C90,D1
    JSR         SET_FILL_COLOR
    JSR         SET_PEN_COLOR
    RTS
    
 
Dessin_Carre_User:
    JSR         SET_PEN_COLOR                   ; On change les couleurs avec la couleur définie au préalable dans les clic
    JSR         SET_FILL_COLOR
    MOVE.L      #PLACE_POS_X1,A3                ; On récupère les positions dans les variables
    MOVE.L      #PLACE_POS_Y1,A4
    MOVE.L      #PLACE_POS_X2,A5
    MOVE.L      #PLACE_POS_Y2,A6
    MOVE.W      (A3),D1                         ; On positionnne le rectangle
    MOVE.W      (A4),D2 
    MOVE.W      (A5),D3 
    MOVE.W      (A6),D4
    ADD.W       #75,(A4)                        ; On ajoute 75 pour passer au rectangle d'après
    ADD.W       #75,(A6)
    JSR         DRAW_FILL_RECT                  ; On dessine le rectangle
    RTS 
    
Dessin_Pion_Placement:
    MOVE.L      #PLACE_POS_X1_BIEN_PLACE,A3     ; On récupère les coordonnées de là où on dessine les rectangles
    MOVE.L      #PLACE_POS_Y1_BIEN_PLACE,A4
    MOVE.L      #PLACE_POS_X2_BIEN_PLACE,A5
    MOVE.L      #PLACE_POS_Y2_BIEN_PLACE,A6
    MOVE.L      #$00FFFFFF,D1                   ; On met le crayon en blanc
    JSR         SET_FILL_COLOR  
    MOVE.L      #$00FFFFFF,D1
    JSR         SET_PEN_COLOR
    MOVE.W      (A3),D1                         ; On rentre dans D1 D2 D3 D4 les positions en x1 y1 x2 y2 du cercle
    MOVE.W      (A4),D2
    MOVE.W      (A5),D3
    MOVE.W      (A6),D4
    JSR         DRAW_FILL_ELLIPSE               ; On dessine un cercle
    SUB.W       #40,(A4)                        ; On retire 40 en y1 y2 pour le prochain cercle
    SUB.W       #40,(A6)
    MOVE.L      #$0,D1                          ; On met la couleur du cercle en noir
    JSR         SET_FILL_COLOR
    MOVE.L      #$0,D1
    JSR         SET_PEN_COLOR
    MOVE.W      (A3),D1                         ; On rentre dans D1 D2 D3 D4 les positions en x1 y1 x2 y2 du cercle
    MOVE.W      (A4),D2
    MOVE.W      (A5),D3
    MOVE.W      (A6),D4
    JSR         DRAW_FILL_ELLIPSE               ; On dessine un cercle
    ADD.W       #40,(A4)                        ; On ajoute en y 40 pour repositionner le y sur le y du cercle blanc
    ADD.W       #40,(A6)
    ADD.W       #100,(A3)                       ; On ajoute 100 en x1 x2 pour se décaler au rectangle de la prochaine tentative
    ADD.W       #100,(A5)
    
    MOVE.L      #$00FFFFFF,D1                   ; On modifie la couleur, la police, et le style du texte
    MOVE.L      #$03100000,D2
    MOVE.B      #21,D0
    TRAP        #15
    
    MOVE.L      #$006C6C6C,D1                   ; On modifie la couleur de fond du dessin
    JSR         SET_FILL_COLOR
    
    MOVE.L      #NOMBRE_A_PLACER,A1             ; On récupère les positions x y du texte à afficher, ainsi que le texte à afficher
    MOVE.L      #PLACE_POS_X1_CHIFFRE,A3
    MOVE.L      #PLACE_POS_Y1_CHIFFRE,A4
    MOVE.L      #NOMBRE_BIEN_PLACE,A5           
    ADD.B       #48,(A5)                        ; On incrémente 48 pour afficher le caractère du chiffre
    MOVE.B      (A5),(A1)                       ; On met notre chiffre à afficher dans NOMBRE_A_PLACE
    MOVE.W      (A3),D1                         ; On met les positions en x y du texte dans D1 et D2
    MOVE.W      (A4),D2
    JSR         DRAW_STRING                     ; On affiche le chiffre
        
    SUB.W       #38,(A4)                        ; On retire 48 en Y 
    MOVE.L      #NOMBRE_MAL_PLACE,A5            ; On prend le nombre de pions mal placés, pour le dessiner
    ADD.B       #48,(A5)                        ; On ajoute 48 pour afficher le caractère 'chiffre'
    MOVE.W      (A4),D2                         ; On affecte à D2 la valeur en Y
    MOVE.B      (A5),(A1)                       ; On affecte la valeur du nombre à dessiner
    JSR         DRAW_STRING
    
    ADD.W       #38,(A4)
    ADD.W       #100,(A3)
    
    RTS
    

* Put variables and constants here

    INCLUDE 'biblio.X68'
    INCLUDE 'bibperiph.X68'
    INCLUDE 'bibgraph.X68'
    
COLOR_MACHINE:  DS.B 5                   ; Déclaration du tableau de couleur de la machine
COLOR_MACHINE_STOCK: DS.B 5              ; Déclaration du tableau pour stocker les couleurs machines (pour la vérification)
COLOR_USER:     DS.B 5                   ; Déclaration du tableau de couleur du joueur
POINT_INTERR:   DC.B '?',0

TEXTE_ACCUEIL: DC.B 'MASTERMIND',0
TEXTE_PLAY: DC.B 'Lancer le jeu',0
TEXTE_REGLE: DC.B 'Règles',0
TEXTE_AUTHOR: DC.B 'By DECORTE Damien & DEHORS Pauline',0

REGLES_TITRE: DC.B 'Règles du jeu',0
REGLES_L1: DC.B '- La machine mémorise un certain code constitué de 5 couleurs',0
REGLES_L2: DC.B 'parmi les 8 proposées. (Bleu, Jaune, Vert, Rouge, Violet',0
REGLES_L3: DC.B 'Orange, Rose, Marron).',0
REGLES_L4: DC.B '- Le joueur va entrer un code de couleur qu',39,'il pense être le bon.',0
REGLES_L5: DC.B '- A chaque tentative, la machine indique combien de couleurs',0
REGLES_L6: DC.B 'sont correctes et bien placées mais aussi combien de couleurs',0
REGLES_L7: DC.B 'sont correctes mais mal placées.',0
REGLES_L8: DC.B '- Grâce à ces indications, le joueur doit trouver le bon code avant',0
REGLES_L9: DC.B 'd',39,'avoir utilisé toutes ses tentatives.',0
REGLES_MENU_BUTTON: DC.B 'MENU',0

TEST: DC.B 'TEST',0
TEXTE_WIN: DC.B 'VICTOIRE !',0
TEXTE_LOOSE: DC.B 'PERDU !',0

NOMBRE_A_PLACER: DC.B ' ',0                 ; Texte à écrire pour le nombre de pions biens placés et bons et mal placés
NOMBRE_BIEN_PLACE: DS.B 1                   ; Déclaration d'une variable pour le nombre de pions bien placés
NOMBRE_MAL_PLACE: DS.B 1                    ; Déclaration d'une variable pour le nombre de pions bon et mal placés

PLACE_POS_X1:   DC.W 43                     ; Positions des rectangles de couleurs choisies
PLACE_POS_X2:   DC.W 93 
PLACE_POS_Y1:   DC.W 37
PLACE_POS_Y2:   DC.W 87

PLACE_POS_SOLUCE_Y1:    DC.W    37          ; Positions des rectangles de la solution
PLACE_POS_SOLUCE_Y2:    DC.W    87

PLACE_POS_X1_BIEN_PLACE:   DC.W 40          ; Positions des cercles de dessins des chiffres des placements des pions
PLACE_POS_X2_BIEN_PLACE:   DC.W 60
PLACE_POS_Y1_BIEN_PLACE:   DC.W 472
PLACE_POS_Y2_BIEN_PLACE:   DC.W 492

PLACE_POS_X1_CHIFFRE:   DC.W 70             ; Variables pour les positions des chiffres des placements des pions
PLACE_POS_Y1_CHIFFRE:   DC.W 472

WIN_LOOSE_BOOL:         DS.B 1

    END         $400        ; last line of source









































*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
