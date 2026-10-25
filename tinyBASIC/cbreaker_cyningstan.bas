    REM http://tinybasic.cyningstan.org.uk/downloads/7/games-in-basic
    REM Variables
    REM B - Black pegs
    REM C - Copy of player's guess
    REM D - Digit from player's guess
    REM G - Guess counter
    REM M - Multiplier for checking black or white pegs
    REM N - Next multiplier for checking white pegs
    REM P - Player's latest guess
    REM R - Random number seed
    REM S - Secret number
    REM T - Temporary copy of secret number
    REM U - Unit (digit) from secret number
    REM W - White pegs

    REM Control Routine
100 GOSUB 200
101 GOSUB 210
    IF G<10 THEN IF B<>4 THEN GOTO 101
    GOSUB 220
    END

    REM Initialise the program
200 GOSUB 300
    GOSUB 310
    GOSUB 320
    RETURN

    REM Play a single turn
210 GOSUB 330
    GOSUB 340
    GOSUB 350
    RETURN

    REM End of game
220 IF B=4 THEN GOTO 221
    PRINT "You lost after ",G," guesses."
    PRINT "The secret number was ",S
    RETURN
221 PRINT "You won in ",G," guesses!"
    PRINT "The number was indeed ",S
    RETURN

    REM Initialise the random number seed
300 PRINT ""
301 PRINT "Enter a 4-digit number: "
    INPUT R
    IF R<1000 THEN GOTO 301
    IF R>9999 THEN GOTO 301
    IF R>=6547 THEN LET R=R-6547
    PRINT "Thank you."
    RETURN

    REM Choose a random number
310 PRINT "I will now choose my secret number."
    PRINT "It will have 4 digits ranging from 1-6."
    LET S=0
311 GOSUB 999
    LET S=10*S+(R-R/6*6+1)
    IF S<1000 THEN GOTO 311
    PRINT ""
    RETURN

    REM Initialise the game counters
320 LET G=0
    PRINT "You must now guess my number in 10 tries or fewer."
    PRINT "I will give you a black peg for each correct digit in the"
    PRINT "right position. I will give you a white peg for each"
    PRINT "correct digit in the wrong position."
    PRINT ""
    RETURN

    REM Ask the player for a guess
330 PRINT "Please type in guess #",G+1,":"
    INPUT P
    IF P<1000 THEN GOTO 330
    IF P>6666 THEN GOTO 330
    LET G=G+1
    RETURN

    REM Evaluate the player's guess
340 LET B=0
    LET W=0
    LET T=S
    LET C=P
    LET M=1
341 GOSUB 400
    LET M=M*10
    IF M<=1000 THEN GOTO 341
    LET M=1
342 GOSUB 410
    LET M=M*10
    IF M<=1000 THEN GOTO 342
    RETURN

    REM Display evaluation results
350 PRINT "Pegs: ",B," black, ",W," white."
    PRINT ""
    RETURN

    REM Compare digits for exact match
400 LET D=C/M
    LET D=D-D/10*10
    LET U=T/M
    LET U=U-U/10*10
    IF D<>U THEN RETURN
    LET B=B+1
    LET C=C-M*D
    LET T=T-M*U
    RETURN

    REM Compare digits for match across positions
410 LET D=C/M
    LET D=D-D/10*10
    LET N=1
412 LET U=T/N
    LET U=U-U/10*10
    IF D>0 THEN IF U>0 THEN IF D=U THEN GOTO 411
    LET N=N*10
    IF N<=1000 THEN GOTO 412
    RETURN
411 LET W=W+1
    LET C=C-M*D
    LET T=T-N*U
    RETURN

    REM Random number generator
999 LET R=5*R+35
    LET R=R-R/6547*6547
    RETURN
