002500***************************************************************** 00250000
002600*DEMO                                                             00300000
003100***************************************************************** 00310000
003200 IDENTIFICATION DIVISION.                                         00320000
003200 PROGRAM-ID. my_PROG_1_A *> A 4th declaration of MY_PROG_1_A      00320000
003300   CALL my_PROG_6_b *> doesn't exist                              00330000
003400                                                                  00340000
003500* Test of calls to programs declared in "sample1a.cob"            00350000
003600 PROGRAM-ID. MY_PROG_EXT_B                                        00360000
003700   CALL my_prog_7_fwd_a                                           00370000
003800   CALL MY_PROG_8_FWD_A                                           00380000
003900   CALL MY_prog_9_FWD_a                                           00390000
004000                                                                  00400000
004100 *> Called by "MY_PROG_EXT_A" declared in "sample1a.cob"          00410000
004200 PROGRAM-ID. my_prog_7_fwd_B                                      00420000
004300   CALL my_prog_fwd_a                                             00430000
004400                                                                  00440000
004500 PROGRAM-ID. MY_PROG_8_FWD_B                                      00450000
004600   CALL MY_PROG_FWD_A                                             00460000
004700                                                                  00470000
004800 PROGRAM-ID. my_PROG_9_fwd_b                                      00480000
004900   CALL MY_prog_FWD_A                                             00490000
