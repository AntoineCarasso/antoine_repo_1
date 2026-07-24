*> [^-]IF\b|\b(?:WHEN|PERFORM[ \t][^\n]+?[ \t]UNTIL|GO[ \t]*TO[ \t][^\n]+?[ \t]DEPENDING[ \t]+ON)\b|\b(?:ON[ \t]+SIZE[ \t]+ERROR|ON[ \t]+(?:EXCEPTION|OVERFLOW)|INVALID[ \t]+KEY|AT[ \t]+END(?:-OF-PAGE)?)\b

IDENTIFICATION DIVISION.
PROGRAM-ID. 'MY_PROG_CYC=65_1_FRAGMENT'. *> 65 = 1 + 64

DATA DIVISION.
   WORKING-STORAGE SECTION.
   01 WS-NUM1 PIC 9(9).

PROCEDURE DIVISION.
   A000-FIRST-PARA.
   MOVE 25 TO WS-NUM1 WS-NUM3.

**************** IF ****************
IF WS-NUM1 > WS-NUM2 THEN *> CYC += 1
  DISPLAY

  IF WS-NUM3 = WS-NUM4 THEN *> CYC += 1
     DISPLAY
  ELSE
     DISPLAY
  END-IF.
ELSE
  DISPLAY
END-IF.

   IF WS-NUM1 < WS-NUM2 THEN *> CYC += 1
      DISPLAY
   END-IF.

   IF WS-NUM1 IS POSITIVE THEN *> CYC += 1
      DISPLAY
   IF WS-NUM1 IS NEGATIVE THEN *> CYC += 1
      DISPLAY
   IF WS-NUM1 IS ZERO THEN *> CYC += 1
      DISPLAY

   IF WS-NUM1 IS GREATER THAN OR EQUAL TO WS-NUM2 THEN *> CYC += 1
      DISPLAY
   END-IF.

   IF WS-NUM1 IS ALPHABETIC THEN *> CYC += 1
      DISPLAY
   IF WS-NUM1 IS NUMERIC THEN *> CYC += 1
      DISPLAY

   MOVE 65 TO WS-NUM.
   IF PASS *> CYC += 1
      DISPLAY
   IF FAIL *> CYC += 1
      DISPLAY

   IF NOT WS-NUM1 IS LESS THAN WS-NUM2 THEN *> CYC += 1
      DISPLAY
   ELSE
      DISPLAY
   END-IF.

   IF WS-NUM1 IS LESS THAN WS-NUM2 AND WS-NUM1=WS-NUM3 THEN *> CYC += 1
      DISPLAY
   ELSE
      DISPLAY
   END-IF.


**************** EVALUATE ****************
   EVALUATE TRUE
      WHEN WS-A > 2 *> CYC += 1
         DISPLAY
      WHEN WS-A < 0 *> CYC += 1
         DISPLAY
      WHEN OTHER *> CYC += 1
         DISPLAY
   END-EVALUATE.

STOP RUN.

**************** PERFORM ****************
PROCEDURE DIVISION.
    PERFORM *> no conditional branching here, so CYC doesn't change
       DISPLAY 'HELLO WORLD'
    END-PERFORM.

    A-PARA.
    PERFORM DISPLAY 'IN A-PARA' *> no conditional branching here, so CYC doesn't change
    END-PERFORM.
    PERFORM C-PARA THRU E-PARA. *> no conditional branching here, so CYC doesn't change
    B-PARA.
    DISPLAY 'IN B-PARA'.
    STOP RUN.
    C-PARA.
    DISPLAY 'IN C-PARA'.
    D-PARA.
    DISPLAY 'IN D-PARA'.
    E-PARA.
    DISPLAY 'IN E-PARA'.

    PERFORM A-PARA UNTIL COUNT=5                  *> CYC += 1
    PERFORM A-PARA WITH TEST BEFORE UNTIL COUNT=5 *> CYC += 1
    PERFORM A-PARA WITH TEST AFTER UNTIL COUNT=5  *> CYC += 1

    *> if "3" would have been a variable, then CYC should be += 1
    PERFORM B-PARA 3 TIMES. *> no conditional branching here, so CYC doesn't change

    PERFORM B-PARA VARYING WS-A FROM 1 BY 1 UNTIL WS-A=5 *> CYC += 1
    STOP RUN.

**************** GO TO ****************
PROCEDURE DIVISION.
    A-PARA.
    GO TO B-PARA. *> no conditional branching here, so CYC doesn't change

    B-PARA.
    GO TO C-PARA D-PARA DEPENDING ON WS-A. *> CYC += 1

    C-PARA.
    DISPLAY 'IN C-PARA '.
    D-PARA.
    DISPLAY 'IN D-PARA '.
    STOP RUN.

**************** Arithmetic ****************
PROCEDURE DIVISION.
    ADD ... ON SIZE ERROR                *> CYC += 1
    ADD ... NOT ON SIZE ERROR            *> CYC += 1
    COMPUTE ... ON SIZE ERROR            *> CYC += 1
    COMPUTE ... NOT ON SIZE ERROR        *> CYC += 1
    DIVIDE ... ON SIZE ERROR             *> CYC += 1
    DIVIDE ... NOT ON SIZE ERROR         *> CYC += 1
    MULTIPLY ... ON SIZE ERROR           *> CYC += 1
    MULTIPLY ... NOT ON SIZE ERROR       *> CYC += 1
    SUBTRACT ... ON SIZE ERROR           *> CYC += 1
    SUBTRACT ... NOT ON SIZE ERROR       *> CYC += 1

**************** Data movement ****************
PROCEDURE DIVISION.
    JSON GENERATE ... ON EXCEPTION       *> CYC += 1
    JSON GENERATE ... NOT ON EXCEPTION   *> CYC += 1
    JSON PARSE ... ON EXCEPTION          *> CYC += 1
    JSON PARSE ... NOT ON EXCEPTION      *> CYC += 1
    STRING ... ON OVERFLOW               *> CYC += 1
    STRING ... NOT ON OVERFLOW           *> CYC += 1
    UNSTRING ... ON OVERFLOW             *> CYC += 1
    UNSTRING ... NOT ON OVERFLOW         *> CYC += 1
    XML GENERATE ... ON EXCEPTION        *> CYC += 1
    XML GENERATE ... NOT ON EXCEPTION    *> CYC += 1
    XML PARSE ... ON EXCEPTION           *> CYC += 1
    XML PARSE ... NOT ON EXCEPTION       *> CYC += 1

**************** Input-output ****************
PROCEDURE DIVISION.
    DELETE ... INVALID KEY        *> CYC += 1
    DELETE ... NOT INVALID KEY    *> CYC += 1
    READ ... AT END               *> CYC += 1
    READ ... NOT AT END           *> CYC += 1
    READ ... INVALID KEY          *> CYC += 1
    READ ... NOT INVALID KEY      *> CYC += 1
    REWRITE ... INVALID KEY       *> CYC += 1
    REWRITE ... NOT INVALID KEY   *> CYC += 1
    START ... INVALID KEY         *> CYC += 1
    START ... NOT INVALID KEY     *> CYC += 1
    WRITE ... AT END-OF-PAGE      *> CYC += 1
    WRITE ... NOT AT END-OF-PAGE  *> CYC += 1
    WRITE ... INVALID KEY         *> CYC += 1
    WRITE ... NOT INVALID KEY     *> CYC += 1

**************** Ordering ****************
PROCEDURE DIVISION.
    RETURN ... AT END             *> CYC += 1
    RETURN ... NOT AT END         *> CYC += 1

**************** Program or method linkage ****************
PROCEDURE DIVISION.
    CALL ... ON OVERFLOW          *> CYC += 1
    CALL ... ON EXCEPTION         *> CYC += 1
    CALL ... NOT ON EXCEPTION     *> CYC += 1
    INVOKE ... ON EXCEPTION       *> CYC += 1
    INVOKE ... NOT ON EXCEPTION   *> CYC += 1
