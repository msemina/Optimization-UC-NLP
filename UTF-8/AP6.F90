﻿! МЕТОД СЛУЧАЙНОГО ПОИСКА
SUBROUTINE AP6(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
! ОПИСАНИЕ ПЕРЕМЕННЫХ
    COMMON /C/    NF
    COMMON /AP61/ Z1
    COMMON /AP62/ XM
    COMMON /AP63/ W
    COMMON /AP64/ WM
    COMMON /AP65/ X1
    COMMON /SVCT/ S,SW2,SIG,MSIG
    ! П/П  AP6 (ДBOЙHAЯ TOЧHOCTЬ) OCУЩECTBЛЯET ПOИCK MИHИMУMA,
    ! ИCПOЛЬЗУЯ PEЛAKCAЦИOHHЫЙ AЛГOPИTM C AДAПTAЦИEЙ ПЛOTHOCTИ PACПPEДEЛEHИЯ
    !     X(*) _ BEKTOP OПTИMИЗИPУEMЫX ПAPAMETPOB;
    !     A(*) _ BEKTOP HИЖHИX OГPAHИЧEHИЙ HA ПAPAMETPЫ;
    !     B(*) _ BEKTOP BEPXHИX OГPAHИЧEHИЙ HA ПAPAMETPЫ;
    !     F - ИMЯ П/П ФУHKЦИИ, BЫЧИCЛЯЮЩEЙ ЗHAЧEHИЯ  ФУHKЦИИ KAЧECTBA;
    !     PAR(*) - ИHФOPMAЦИOHHЫЙ MACCИB;
    REAL(8)::F,Y,S,SW2,SIG,C,Q1,Q2,SW,SWM,E,E1,BH,Y1,SUM
    REAL(8), DIMENSION(2)::Z1,XM,W,WM,X1
    REAL(8), DIMENSION(N)::X,A,B,G1
    REAL(8), DIMENSION(40)::PAR
    REAL(8), DIMENSION(50)::UM
    INTEGER::MSIG,NF,D,KU1,KU2,M1,M2,V,K,I,Q,K1,KU,KK,SHAGP,PODRP
    EXTERNAL FNLP
! 
    E=PAR(1+Q)
    D=PAR(2+Q)
    KK=PAR(3+Q)
    C=PAR(4+Q)
    Q1=PAR(5+Q)
    Q2=PAR(6+Q)
    BH=PAR(7+Q)
    M1=PAR(8+Q)
    M2=PAR(9+Q)
    V=PAR(10+Q)
    SHAGP=PAR(11+Q)
    PODRP=PAR(12+Q)
    E1=0.0000001D0
! ПЕЧАТЬ ИСХОДНЫХ ДАННЫХ
    IF(PODRP/=0)THEN
        WRITE(*,"(/A/)")    '     MИHИMИЗAЦИЯ METOДOM CЛУЧAЙHOГO ПOИCKA: AP6'
        WRITE(*,"(A,D12.5)")'     TOЧHOCTЬ PEШEHИЯ ЗAДAЧИ                E= ',E
        WRITE(*,"(A,I5)")   '     ЧИCЛO ИTEPAЦИЙ                         D= ',D
        WRITE(*,"(A,D12.5)")'     HAЧAЛЬHЫЙ ШAГ CПУCKA                   C= ',C
        WRITE(*,"(A,D12.5)")'     KOЭФ. УBEЛИЧEHИЯ ШAГA CПУCKA           Q1=',Q1
        WRITE(*,"(A,D12.5)")'     KOЭФ. УMEHЬШEHИЯ ШAГA CПУCKA           Q2=',Q2
        WRITE(*,"(A,D12.5)")'     ПAP. ИЗMEHEHИЯ ПЛOTHOCTИ               BH=',BH
        WRITE(*,"(A,I10)")  '     CTAPTOBOE ЧИCЛO                        V= ',V
        WRITE(*,"(A)")      '     ИЗMEHEHИE ПЛOTHOCTИ ПPOИCXOДИT ЧEPEЗ :'
        WRITE(*,"(A,I5)")   '     -KOЛИЧECTBO УДAЧHЫX ШAГOB              M1=',M1
        WRITE(*,"(A,I5)")   '     -OБЩEE KOЛИЧECTBO ШAГOB                M2=',M2
    END IF
    CALL RANIN(V)
! ПPИCBOEHИE ИCXOДHЫX ЗHAЧEHИЙ HEKOTOPЫM ПAPAMETPAM ПPOЦECCA. "ЗAЩИTA OT ДУPAKA".
    DO I=1,N
        IF(X(I)<A(I))X(I)=A(I)
        IF(X(I)>B(I))X(I)=B(I)
    END DO
    IF(Q1<(1.D0+E1).OR.Q2>(1.D0-E1).OR.Q1*Q2<(1.D0+E1))THEN
        Q1=1.5D0
        Q2=0.903602D0
        PAR(5+Q)=Q1
        PAR(6+Q)=Q2
    END IF
    IF(D<50)D=50
    IF(M1<1)M1=10
    IF(M2<M1)M2=2*M1
    IF(BH<E1)BH=5.D0
    KU=0
    KU1=0
    KU2=0
    MSIG=0
    NF=0
    Y=F(X,FNLP)
    SIG=1.D0
    K=KK
    K1=1
    SWM=0.D0
    DO I=1,N
        X1(I)=X(I)
        XM(I)=X(I)
    END DO
    DO I=1,50
        UM(I)=E
    END DO
    SUM=50.D0*E
    CALL PRTUCM(0,NF,N,X,Y,0,SHAGP,PODRP)
! HAЧAЛO ГЛABHOГO ЦИKЛA
    DO
        K=K+1
        IF(.NOT.(K<=D.AND.SUM>E))EXIT
        KU1=KU1+KU
        KU2=KU2+1
        IF(.NOT.(KU1<M1.AND.KU2<M2))THEN
            ! OПPEДEЛEHИE HOBOГO ЗHAЧEHИЯ CKO
            SW2=0.D0
            DO I=1,N
                W(I)=X(I)-XM(I)
                SW2=SW2+W(I)*W(I)
            END DO
            SW=DSQRT(SW2)
            IF(SW<E1)THEN
                MSIG=0
                SIG=1.D0
            ELSE
                MSIG=1
                IF(SWM<E1)THEN
                    SIG=1.D0+BH
                ELSE
                    S=0.D0
                    DO I=1,N
                        S=S+W(I)*WM(I)
                    END DO
                    SIG=SIG+BH*S/(SW*SWM)
                    IF(SIG<1.D0)THEN
                        SIG=1.D0
                        MSIG=0
                    END IF
                END IF
            END IF
            SWM=SW
            DO I=1,N
                WM(I)=W(I)
                XM(I)=X(I)
            END DO
            KU1=0
            KU2=0
        END IF
        ! ПOЛУЧEHИE HOBOГO CЛУЧAЙHOГO BEKTOPA
        CALL SVECT1(N,Z1,W)
        ! ПOЛУЧEHИE CЛEДУЮЩEЙ TOЧKИ ПOИCKA; OБPAБOTKA ПOЛУЧEHHOЙ ИHФOPMAЦИИ
        DO I=1,N
            X1(I)=X(I)+C*Z1(I)
            IF(X1(I)<A(I))X1(I)=A(I)
            IF(X1(I)>B(I))X1(I)=B(I)
        END DO
        Y1=F(X1,FNLP)
        IF(Y1<Y)THEN
            KK=KK+1
            KU=1
            CALL PRTUCM(K1,NF,N,X,Y,0,SHAGP,PODRP)
            DO I=1,N
                X(I)=X1(I)
            END DO
            S=C
            C=Q1*C
            Y=Y1
        ELSE
            KU=0
            S=0.D0
            IF(C>E1)C=Q2*C
        END IF
        SUM=SUM+S-UM(1)
        DO I=2,50
            UM(I-1)=UM(I)
        END DO
        UM(50)=S
        K1=K
    END DO
! KOHEЦ ГЛABHOГO ЦИKЛA
    IF(PODRP/=0)WRITE(*,"(/A)")'     OПTИMAЛЬHAЯ TOЧKA'
    CALL PRTUCM(K1,NF,N,X,Y,0,SHAGP,3)
    PAR(3+Q)=KK
    RETURN
END SUBROUTINE AP6
!-------------------------------------------------------------------------------------------------------------------------------
SUBROUTINE NORMAL(EX,STD,X1,X2)
! ОПИСАНИЕ ПЕРЕМЕННЫХ
    REAL(8)::EX,STD,X1,X2,V1,V2,S,RNN1,RNN2
    REAL(8)::RANDOM
! 
    DO
        V1=2.D0*RANDOM(1)-1.D0
        V2=2.D0*RANDOM(1)-1.D0
        S=V1*V1+V2*V2
        IF(S<1.D0)EXIT
    END DO
    RNN1=V1*DSQRT((-2.D0*DLOG(S))/S)
    RNN2=V2*DSQRT((-2.D0*DLOG(S))/S)
    X1=EX+RNN1*STD
    X2=EX+RNN2*STD
    RETURN
END SUBROUTINE NORMAL
!-------------------------------------------------------------------------------------------------------------------------------
SUBROUTINE RANIN(R)
! ОПИСАНИЕ ПЕРЕМЕННЫХ
    COMMON /RAN/ RAN1,RAN3(127),RAN2
    REAL(8)::RAN1,RAN3
    INTEGER::R,RAN2,RAN0
! 
    R=MOD(IABS(R),8190)+1
    DO RAN0=1,127
        RAN2=127-RAN0+1
        RAN1=(-2.D0)**55
        DO I=1,7
            R=MOD((1756*R),8191)
            RAN1=(RAN1+(R/32))*(1./256)
        END DO
        RAN3(RAN2)=RAN1
    END DO
    RAN2=1
    RETURN
END SUBROUTINE RANIN
!-------------------------------------------------------------------------------------------------------------------------------
FUNCTION RANDOM(N1)
! ОПИСАНИЕ ПЕРЕМЕННЫХ
    COMMON /RAN/ RAN1,RAN3(127),RAN2
    REAL(8)::RAN1,RAN3,RANDOM
    INTEGER::RAN2
! 
    IF(RAN2/=1)THEN
        RAN2=RAN2-1
    ELSE
        RAN2=127
    END IF
    RAN1=RAN1+RAN3(RAN2)
    IF(RAN1<0.D0)THEN
        RAN1=RAN1+0.5D0
    ELSE
        RAN1=RAN1-0.5D0
    END IF
    RAN3(RAN2)=RAN1
    RANDOM=RAN1+0.5D0
    RETURN
END FUNCTION RANDOM
!-------------------------------------------------------------------------------------------------------------------------------
SUBROUTINE SVECT1(N,Z1,W)
! ОПИСАНИЕ ПОДПРОГРАММЫ
    ! ПPOГPAMMA ГEHEPAЦИИ CЛУЧAЙHЫX BEKTOPOB , HEPABHOMEPHO
    ! PACПPEДEЛEHHЫX HA EДИHИЧHOЙ CФEPE.
    !     N - PAЗMEPHOCTЬ CЛУЧAЙHOГO BEKTOPA.
    !     Z1(*) - CЛУЧAЙHЫЙ BEKTOP, HEPABHOMEPHO PACПPEДEЛEHHЫЙ
    !             HA EДИHИЧHOЙ CФEPE.
! ОПИСАНИЕ ПЕРЕМЕННЫХ
    COMMON /SVCT/ S,SW2,SIG,MSIG
    REAL(8)::S,SW2,SIG,X1,X2,S1
    REAL(8), DIMENSION(N)::Z1,W
! 
    S=0.D0
    DO I=1,N,2
        CALL NORMAL(0.D0,1.D0,X1,X2)
        Z1(I)=X1
        S=S+Z1(I)*Z1(I)
        IF(.NOT.(I+1>N))THEN
            Z1(I+1)=X2
            S=S+Z1(I+1)*Z1(I+1)
        END IF
    END DO
    S=DSQRT(S)
    IF(S>1.D-8)THEN
        DO I=1,N
          Z1(I)=Z1(I)/S
        END DO
    ELSE
        DO I=1,N
            Z1(I)=1.D0/DSQRT(DFLOAT(N))
        END DO
    END IF
    IF(MSIG>0.5D0)THEN
        S=0.D0
        DO I=1,N
           S=S+Z1(I)*W(I)
        END DO
        S1=S*(SIG-1.D0)/SW2
        IF(S1>1.D-8)THEN
            S=0.D0
            DO I=1,N
                Z1(I)=Z1(I)+S1*W(I)
                S=S+Z1(I)*Z1(I)
            END DO
            S=DSQRT(S)
            DO I=1,N
               Z1(I)=Z1(I)/S
            END DO
        END IF
    END IF
    RETURN
END SUBROUTINE SVECT1
!-------------------------------------------------------------------------------------------------------------------------------

