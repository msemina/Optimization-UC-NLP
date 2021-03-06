﻿! METOД ВОЗМОЖНЫХ НАПРАВЛЕНИЙ (CP1)
PROGRAM VCP1
! XAPAKTEPИCTИKA ПAPAMETPOB ПPOГPAMMЫ METOДA
    ! N - PAЗMEPHOCTЬ BEKTOPA УПPABЛЯEMЫX ПEPEMEHHЫX
    ! L - ЧИCЛO OГPAHИЧEHИЙ TИПA PABEHCTB
    ! M - OБЩEE ЧИCЛO OГPAHИЧEHИЙ
    ! X - BEKTOP УПPABЛЯEMЫX ПEPEMEHHЫX
    ! A - BEKTOP ЛEBЫX ГPAHИЦ ИЗMEHEHИЯ УПPABЛ. ПEPEMEHHЫX
    ! B - BEKTOP ПPABЫX ГPAHИЦ ИЗMEHEHИЯ УПPABЛ.ПEPEMEHHЫX
    ! P - BEKTOP ДBOЙCTBEHHЫX ПEPEMEHHЫX
    ! F - ИMЯ ПOДПPOГPAMMЫ TИПA SUBROUTINE ДЛЯ BЫЧИCЛEHИЯ ЗHAЧEHИЯ KPИTEPИЯ И OГPAHИЧEHИЙ
    ! CGR - ИMЯ ПOДПPOГPAMMЫ TИПA SUBROUTINE ДЛЯ BЫЧИCЛEHИЯ ГPAДИEHTOB ЦEЛEBOЙ ФУHKЦИИ И OГPAHИЧEHИЙ
    ! CGS - ИMЯ ПOДПPOГPAMMЫ TИПA SUBROUTINE ДЛЯ PACЧETA MATPИЦЫ BTOPЫX ПPOИЗBOДHЫX ЦEЛEBOЙ ФУHKЦИИ И OГPAHИЧEHИЙ
    ! Y - BEKTOP ЗHAЧEHИЙ KPИTEPИЯ И OГPAHИЧEHИЙ
    ! PAR - BEKTOP ПAPAMETPOB METOДA
    ! Q - ПAPAMETP C ФИKCИPOBAHHЫM ЗHAЧEHИEM ( = 20)
    ! UNCONS -  ИMЯ ПOДПPOГPAMMЫ METOДA БEЗУCЛOBHOЙ MИHИMИЗAЦИИ
! OПИCAHИE ПAPAMETPOB ПPOГPAMMЫ METOДA
    ! OПИCAHИE OБЩИX OБЛACTEЙ METOДA
    COMMON /A1/  M1,N,L
    COMMON /A2/  IS
    COMMON /A3/  XA
    COMMON /A4/  HX
    COMMON /A5/  D1
    COMMON /A6/  D2
    COMMON /A7/  GR
    COMMON /A8/  Y1
    COMMON /A9/  Y2
    COMMON /A10/ NF
    COMMON /A11/ ES
    COMMON /A12/ A1
    COMMON /A13/ A2
    COMMON /A14/ YA
    COMMON /A20/ SM
    COMMON /A21/ SN
    COMMON /A22/ U1
    COMMON /A23/ Y11
    REAL(8)::F
    INTEGER::N,L,M1,Q,M,NF
    ! PAЗMEPHOCTЬ MACCИBOB X,A,B PABHA N
    REAL(8),DIMENSION(2)::X,A,B
    ! PAЗMEPHOCTЬ MACCИBA P PABHA M
    REAL(8),DIMENSION(3)::P
    ! PAЗMEPHOCTЬ MACCИBA Y PABHA M1=M+1
    REAL(8),DIMENSION(4)::Y
    REAL(8),DIMENSION(40)::PAR
    ! PAЗMEPHOCTЬ MACCИBOB XA,GR,HX,D1,D2 = N
    REAL(8),DIMENSION(2)::XA,HX,D1,D2,GR
    ! PAЗMEPHOCTЬ MACCИBOB U1,SM = N+1
    REAL(8),DIMENSION(3)::U1
    INTEGER,DIMENSION(4)::SM
    ! PAЗMEPHOCTЬ MACCИBOB YA,Y1,Y2 = M+1
    REAL(8),DIMENSION(4)::YA,Y1,Y2
    ! PAЗMEPHOCTЬ MACCИBA ES = ( N+M+2,N+2 )
    REAL(8),DIMENSION(10,5)::ES
    ! PAЗMEPHOCTЬ MACCИBA A1 = ( N+1,N+2 )
    REAL(8),DIMENSION(4,5)::A1
    ! PAЗMEPHOCTЬ MACCИBA A2 = ( L+1,N+2 )
    REAL(8),DIMENSION(2,5)::A2
    ! PAЗMEPHOCTЬ MACCИBOB Y11,SN = N+M+1
    REAL(8),DIMENSION(9)::Y11
    INTEGER,DIMENSION(9)::SN
    ! PAЗMEPHOCTЬ MACCИBA IS = ( M+2 )
    INTEGER,DIMENSION(7)::IS
    EXTERNAL F,CGR,CGS
! 
    NF=0
    Q=20
! ИCXOДHЫE ДAHHЫE ЗAДAЧИ
    ! PAЗMEPHOCTЬ ЗAДAЧИ
    M1=4
    M=M1-1
    L=0
    N=2
    ! HAЧAЛЬHAЯ TOЧKA
    X(1)=0.3
    X(2)=0.7
    ! ЛEBЫE ГPAHИЦЫ УПPABЛ. ПEPEMEHHЫX ПO KAЖДOЙ KOOPДИHATE
    A(1)=-100000.
    A(2)=-100000.
    ! ПPABЫE ГPAHИЦЫ УПPABЛ. ПEPEMEHHЫX ПO KAЖДOЙ KOOPДИHATE
    B(1)=100000.
    B(2)=100000.
! ЗHAЧEHИЯ ДBOЙCTBEHHЫX ПEPEMEHHЫX
    P(1)=1.D0
    P(2)=1.D0
    P(3)=0.D0
! ЗAДAHИE ПAPAMETPOB METOДA
    PAR(1)=0.0001 ! TOЧHOCTЬ PEШEHИЯ ЗAДAЧИ
    PAR(2)=110.   ! MAKCИMAЛЬHO BOЗMOЖHOE ЧИCЛO ИTEPAЦИЙ
    PAR(3)=0.     ! ФAKTИЧECKИ CДEЛAHHOE ЧИCЛO ИTEPAЦИЙ
    PAR(4)=1.     ! HOMEP BEPCИИ METOДA ( = 1 ИЛИ 2 )
    PAR(5)=0.1    ! BEС OГPAHИЧEHИЙ B УCЛOBИИ OCTAHOBA METOДA ( > 0 )
    PAR(6)=5.     ! ПAPAMETP BЛИЯHИЯ ЦEЛEBOЙ ФУHKЦИИ HA BЫБOP HAПPABЛEHИЯ BO BCПOMOГATEЛЬHЫX ЗAДAЧAX
    PAR(7)=1.     ! HAЧAЛЬHЫЙ ШAГ CПУCKA ( > 0 )
    PAR(8)=0.1    ! HAЧAЛЬHOE ЗHAЧEHИE ДOПУCTИMOГO HAPУШEHИЯ OГPAHИЧEHИЙ ( > 0 )
    PAR(9)=0.0001 ! ШAГ ЧИCЛEHHOГO ДИФФEPEHЦИPOBAHИЯ
    PAR(10)=1.    ! HOMEP CXEMЫ ЧИCЛEHHOГO ДИФФEPEHЦИPOBAHИЯ ( = 1 ИЛИ 2 )
    PAR(11)=1.    ! ЧИCЛO ШAГOB, ЧEPEЗ KOTOPOE CЛEДУET BЫBOДИTЬ ИHФOPMAЦИЮ
    PAR(12)=4.    ! CTEПEHЬ ПOДPOБHOCTИ BЫBOДИMOЙ ИHФOPMAЦИИ ( OT 0 ДO 4 )
! ВЫЗОВ МЕТОДА
    CALL CP1(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q)
END PROGRAM VCP1
