SUBROUTINE A5(N,X,A,B,F,GRAD,AGS,Y,G,Q,PAR,FNLP)
! �������� ������
    !******************************************************************
    !*     �TA �PO�E��PA M�H�M���P�ET ��HK��� F(X) N �EPEMEHH�X       *
    !* X(1),...,X(N) METO�OM �A����A.   BHA�A�E BEKTOP X CO�EP��T     *
    !* CTAPTOB�� TO�K�,B PE����TATE PA�OT� �PO�PAMM� B X ���ET HA-    *
    !* XO��T�C� HA��EHHA� TO�KA M�H�M�MA ,C O���KO�                   *
    !*           /ERROR/<SQRT(MACHEPS)*/X/+T, ��E                     *
    !* MACHEPS-�TO MA��HHA� TO�HOCT�_HA�MEH��EE ��C�O, TAKOE �T  O    *
    !* 1+MACHEPS>1,T-TO�HOCT�,/./_2-HOPMA.                            *
    !* �O��PO�PAMMA MA��HHO HE�AB�C�MA,�A �CK���EH�EM �HA�EH��        *
    !* MACHEPS.  �PE��O�A�AETC�,�TO MACHEPS**(-4) HE B���BAET �EPE-   *
    !* �O�HEH�� (EC�� �TO �PO�CXO��T,MACHEPS �O��HO ��T� �BE���EHO)   *
    !* � �TO B C���AE �C�E�HOBEH�� �OP��KA C ��ABA��E� �A��TO�,PE-    *
    !* ����TAT �P�PABH�BAETC� K H���.                                 *
    !* EC�� OC� ��OXO MAC�TA��POBAH�,C�E��ET �O�O��T� SCBD=10,        *
    !* B �POT�BHOM C���AE 1.                                          *
    !* EC�� ��BECTHO,�TO �A�A�A ��OXO O��C�OB�EHA,�O�O��T� ILLC       *
    !* B �POT�BHOM C���AE .FALSE.                                     *
    !* KTM+1_�TO ��C�O �TEPA��� �E� �����EH��,�OC�E KOTOPO�O          *
    !* A��OP�TM KOH�AET CBO� PA�OT�.KTM=4_O�EH� OCTOPO�H�� KP�TEP��   *
    !* OCTAHOBA,O���HO KTM=1 B�O�HE �OCTATO�HO.                       *
    !******************************************************************
! �������� ����������
    COMMON /C/    NF
    COMMON /A51/  T
    COMMON /A52/  Z
    COMMON /A53/  V
    COMMON /A54/  Q0
    COMMON /A55/  Q1
    COMMON /A56/  E1
    COMMON /A57/  XI
    COMMON /GLOB/ QF1,QD1,QD0,QA,QB,QC,FX,NL
    COMMON /BREN/ H,E,M2,M4,LDT,DMIN,MACHEP,SMALL
    REAL(8)::F,Y,S,SL,DN,DMIN,FX,F1,LDS,LDT,SF,DF,M2,M4,SMALL,VSMALL,LARGE,VLARGE,SCBD,LDFAC,T2,H,MACHEP,C,E,QF1,QD0,QD1,QA,QB,QC
    INTEGER::D,SHAGP,PODRP,IL,KK,KTM,K2,KL,KT,NF,NL,IT,Q
    LOGICAL::ILLC
    REAL(8),DIMENSION(40)::PAR
    REAL(8),DIMENSION(N)::X,A,B,G
    REAL(8),DIMENSION(4)::V ! ����� � ������ �����, �� ��� ������� (N,N)
    REAL(8),DIMENSION(2)::T,Z,Q0,Q1,E1,XI
    EXTERNAL F,FNLP
! 
    E=PAR(1+Q)
    D=PAR(2+Q)
    KK=PAR(3+Q)
    C=PAR(4+Q)
    SCBD=PAR(5+Q)
    IL=PAR(6+Q)
    SHAGP=PAR(7+Q)
    PODRP=PAR(8+Q)
    KTM=PAR(9+Q)
    H=C
    MACHEP=(16.D0)**(-13)
    SMALL=MACHEP**2
    VSMALL=SMALL**2
    LARGE=1.D0/SMALL
    VLARGE=1.D0/VSMALL
    M2=DSQRT(MACHEP)
    M4=DSQRT(M2)
    ILLC=(IL==1)
    LDFAC=0.01
    IF(ILLC) LDFAC=0.1
    IT=0
    KT=0
    NL=0
    NF=0
    S=F(X,FNLP)
    FX=S
    QF1=FX
    T2=SMALL+DABS(E)
    E=T2
    DMIN=SMALL
    IF(H<(100*E))H=100*E
    LDT=H
    DO I=1,N
        DO J=1,N
            V((J-1)*N+I)=0.D0
            IF(I==J)V((J-1)*N+I)=1.D0
        END DO
    END DO
    QD0=0
    G(1)=0
    DO I=1,N
        Q1(I)=X(I)
    END DO
! �E�AT� �CXO�H�X �AHH�X
    IF(PODRP/=0)THEN
        WRITE(*,"(/A/)")    '     M�H�M��A��� METO�OM �A����A: A5'
        WRITE(*,"(A,D11.4)")'     TO�HOCT� PE�EH�� �A�A��                E=   ',E
        WRITE(*,"(A,D11.4)")'     HA�A��H�� �A� C��CKA                   C=   ',C
        WRITE(*,"(A,D11.4)")'     KO������EHT MAC�TA��POBAH��            SCBD=',SCBD
        WRITE(*,"(A,I3)")   '     �P�MEHEH�E C���A�HO�O �O�CKA           IL=  ',IL
        WRITE(*,"(A)")      '     ��C�O �TEPA��� �E� �����EH��,'
        WRITE(*,"(A,I3)")   '     �OC�E KOT. A��OP�TM KOH�AET PA�OT�     KTM= ',KTM
        WRITE(*,"(A,I3)")   '     ����� ��������                         D=   ',D
    END IF
    CALL PRTUCM(IT,NF,N,X,FX,0,1,PODRP)
! HA�A�O OCHOBHO�O ��K�A
    IT=1
    IY=1
    KK=1
    IF(IT/=D)THEN
        DO
            SF=G(1)
            S=0
            G(1)=0
            ! M�H�M��A��� B�O�� �EPBO�O HA�PAB�EH��
            CALL MINIM(1,2,G(1),S,FX,.FALSE.,N,X,V,Q0,Q1,XI,F,FNLP)
            IF(S<=0)THEN
                DO I=1,N
                    V(I)=-V(I)
                END DO
            END IF
            IF(SF<=(0.9*G(1)).OR.(0.9*SF)>=G(1))THEN
                DO I=2,N
                    G(I)=0
                END DO
            END IF
            DO K=2,N
                DO I=1,N
                    T(I)=X(I)
                END DO
                SF=FX
                ILLC=ILLC.OR.(KT>0)
                DO
                    KL=K
                    DF=0
                    IF(ILLC)THEN
                        ! C���A�H�� �A� ��� �CTPAHEH�� �PO��EM� OBPA�A
                        DO I=1,N
                            Z(I)=(0.1*LDT+T2*10**KT)*(URAND(IY)-0.5D0)
                            S=Z(I)
                            ! �PE��O�A�AETC�,�TO RANDOM BO�BPA�AET C���A�HOE ��C�O,
                            ! PABHOMEPHO PAC�PE�E�EHHOH HA [0,1) � �TO HEO�XO��MA�
                            ! �H���A���A��� �EHEPATOPA C���A�H�X ��CE� ���A �POBE�EHA
                            DO J=1,N
                                X(J)=X(J)+S*V((I-1)*N+J)
                            END DO
                        END DO
                        FX=F(X,FNLP)
                    END IF
                    DO K2=K,N
                        SL=FX
                        S=0
                        ! M�H�M��A��� B�O�� HECO�P��EHH�X HA�PAB�EH��
                        CALL MINIM(K2,2,G(K2),S,FX,.FALSE.,N,X,V,Q0,Q1,XI,F,FNLP)
                        IF(ILLC)THEN
                            S=G(K2)*(S+Z(K2))**2
                        ELSE
                            S=SL-FX
                        END IF
                        IF(DF<S)THEN
                            DF=S
                            KL=K2
                        END IF
                    END DO
                    IF(.NOT.(.NOT.ILLC.AND.(DF<DABS(100*MACHEP*FX))))THEN
                        EXIT
                    ELSE
                        ! HET �C�EXA �P� ILLC=.FALSE.,TO��A �O��TAEMC�E�E PA� C ILLC=.TR
                        ILLC=.TRUE.
                    END IF
                END DO
                K0=K-1
                DO K2=1,K0
                    ! M�H�M��A��� B�O�� CO�P��EHH�X HA�PAB�EH��
                    S=0
                    CALL MINIM(K2,2,G(K2),S,FX,.FALSE.,N,X,V,Q0,Q1,XI,F,FNLP)
                END DO
                F1=FX
                FX=SF
                LDS=0
                DO I=1,N
                    SL=X(I)
                    X(I)=T(I)
                    T(I)=SL-T(I)
                    SL=T(I)
                    LDS=LDS+SL*SL
                END DO
                LDS=DSQRT(LDS)
                IF(LDS>SMALL)THEN
                    ! OT�PAC�BAEM HA�PAB�EH�E KL � M�H�M���P�EM B�O�� HOBO�O CO�P��EHHO�O HA�PAB�EH��
                    K0=KL-1
                    IF(K0>=K)THEN
                        DO I1=K,K0
                            I=K0+K-I1
                            DO J=1,N
                                V(I*N+J)=V((I-1)*N+J)
                            END DO
                           G(I+1)=G(I)
                        END DO
                    END IF
                    G(K)=0
                    DO I=1,N
                        V((K-1)*N+I)=T(I)/LDS
                    END DO
                    CALL MINIM(K,4,G(K),LDS,F1,.TRUE.,N,X,V,Q0,Q1,XI,F,FNLP)
                    IF(LDS<=0)THEN
                        LDS=-LDS
                        DO I=1,N
                           V((K-1)*N+I)=-V((K-1)*N+I)
                        END DO
                    END IF
                END IF
                LDT=LDFAC*LDT
                IF(LDT<LDS) LDT=LDS
                T2=0
                DO I=1,N
                    T2=T2+X(I)**2
                END DO
                T2=M2*DSQRT(T2)+E
                ! AHA���: �PEB��AET �� ���HA �A�A �O�OB�H� TO�HOCT�
                KT=KT+1
                IF(LDT>(0.5*T2)) KT=0
                IF(KT>KTM.OR.IT==D)THEN
                    Y=FX
                    IF(PODRP/=0)WRITE(*,"(/5X,'O�T�MA��HA� TO�KA')")
                    CALL PRTUCM(IT,NF,N,X,FX,0,1,3)
                    PAR(3+Q)=KK
                    RETURN
                END IF
            END DO
            ! KBA�PAT��HA� �KCTPA�O�����, B C���AE �ACTPEBAH�� �O�CKA B �CKP�B�EHHOM OBPA�E
            CALL QUAD(N,X,Q0,Q1,V,XI,F,FNLP)
            DN=0
            DO I=1,N
                G(I)=1/DSQRT(G(I))
                IF(DN<G(I)) DN=G(I)
            END DO
            DO J=1,N
                S=G(J)/DN
                DO I=1,N
                    V((J-1)*N+I)=S*V((J-1)*N+I)
                END DO
            END DO
            IF(SCBD>1.0001)THEN
            ! MAC�TA��POBAH�E OCE� C �E��� ��MEHEH�� ��C�A O��C�OB�EHHOCT�
                S=VLARGE
                DO I=1,N
                    SL=0
                    DO J=1,N
                        SL=SL+V((J-1)*N+I)**2
                    END DO
                    Z(I)=DSQRT(SL)
                    IF(Z(I)<M4) Z(I)=M4
                    IF(S>Z(I)) S=Z(I)
                END DO
                DO I=1,N
                    SL=S/Z(I)
                    Z(I)=1/SL
                    IF(Z(I)>SCBD)THEN
                        SL=1/SCBD
                        Z(I)=SCBD
                    END IF
                END DO
            END IF
            ! TPAHC�OH�POBAH�E V ��� MINFIT
            DO I=2,N
                K0=I-1
                DO J=1,K0
                    S=V((J-1)*N+I)
                    V((J-1)*N+I)=V((I-1)*N+J)
                    V((I-1)*N+J)=S
                END DO
            END DO
            ! HAXO��EH�� C�H����PHO�O PA��O�EH�� V. �TO �AET CO�CTBEHH�E
            ! �HA�EH�� � ��ABH�E OC� A��POKC�M�P���E� KBA�PAT��HO� �OPM�
            ! �E� BO�BE�EH�� B KBA�PAT ��C�A O��C�OB�EHHOCT�.
            CALL MINFIT(N,MACHEP,VSMALL,V,G,E1)
            IF(SCBD>1.0001)THEN
                DO I=1,N
                    S=Z(I)
                    DO J=1,N
                        V((J-1)*N+I)=S*V((J-1)*N+I)
                    END DO
                END DO
                DO I=1,N
                    S=0
                    DO J=1,N
                        S=S+V((I-1)*N+J)**2
                    END DO
                    S=DSQRT(S)
                    G(I)=S*G(I)
                    S=1/S
                    DO J=1,N
                        V((I-1)*N+J)=S*V((I-1)*N+J)
                    END DO
                END DO
            END IF
            DO I=1,N
                IF(DN*G(I)>LARGE)THEN
                    G(I)=VSMALL
                ELSE
                    IF(DN*G(I)<SMALL)THEN
                        G(I)=VLARGE
                    ELSE
                        G(I)=(DN*G(I))**(-2)
                    END IF
                END IF
            END DO
            ! COPT�POBKA HOB�X CO�CTBEHH�X �HA�EH�� � CO�CTBEHH�X BEKTOPOB
            CALL SORT(N,G,V)
            DMIN=G(N)
            IF(DMIN<SMALL) DMIN=SMALL
            ILLC=(M2*G(1))>DMIN
            CALL PRTUCM(IT,NF,N,X,FX,0,SHAGP,PODRP)
            IT=IT+1
            KK=IT
        END DO
    END IF
! KOHE� OCHOBHO�O ��K�A
    Y=FX
    IF(PODRP/=0)WRITE(*,"(/5X,'O�T�MA��HA� TO�KA')")
    CALL PRTUCM(IT,NF,N,X,FX,0,1,3)
    PAR(3+Q)=KK
    RETURN
CONTAINS
!--------------------------------------------------------------------------------------------------------------------
FUNCTION URAND(IY) ! DONE
! �������� ������������
    ! URAND - �TO �AT��K PABHOMEPHO PAC�PE�E�EHH�X C���A�H�X ��CE�
    ! �EPE� �EPB�M O�PA�EH�EM K URAND �E�O� �EPEMEHHO� IY C�E��ET
    ! �P�CBO�T� �PO��BO��HOE �E�O��C�EHHOE HA�A��HOE �HA�EH�E. B���-
    ! BA��A� �PO�PAMMA HE �O��HA MEH�T� IY. �HA�EH�� ��HK��� URAND �B-
    ! ���TC� ��C�AM� �� �HTEPBA�A(0,1).
! �������� ����������
    INTEGER::IA,IC,ITWO,M2,M,MIC,IY 
    REAL(8)::S,HALFM,URAND
    DATA M2/0/,ITWO/2/
! 
    IF(M2==0)THEN
        ! EC�� �TO �EPB�� BXO�, TO B���C��T� ���H� �E�O��C�EHHO�O MA��HHO�O ��O
        M=1
        DO
            M2=M
            M=ITWO*M2
            IF(M<=M2)EXIT
        END DO
        HALFM=M2
        ! B���C��T� MHO��TE�� � �P�PA�EH�E ��HE�HO�O KOH�P�EHTHO�O METO�A
        IA=8*IDINT(HALFM*DATAN(1.D0)/8.D0)+5
        IC=2*IDINT(HALFM*(0.5D0-DSQRT(3.D0)/6.D0))+1
        MIC=(M2-IC)+M2
        ! S - MAC�TA��P����� MHO��TE�� ��� �PEO�PA�OBAH�� B ��C�O C ��ABA��E� TO�KO�
        S=0.5/HALFM
        ! B���C��T� C�E����EE C���A�HOE ��C�O
    END IF
    IY=IY*IA
    ! C�E������ O�EPATOP ��� MA��H, KOTOP�E HE �O��CKA�T �EPE�O�HEH�� �E��X ��CE� �P� C�O�EH��
    IF(IY>MIC)IY=(IY-M2)-M2
    IY=IY+IC
    ! C�E������ O�EPATOP ��� MA��H, � KOTOP�X ���HA C�OBA ��� C�O�EH�� �O���E, �EM ��� �MHO�EH��
    IF(IY/2>M2)IY=(IY-M2)-M2
    ! C�E������ O�EPATOP ��� MA��H, � KOTOP�X �EPE�O�HEH�E �E�O�O ��C�A B���ET HA �HAKOB�� PA�P��
    IF(IY<0)IY=(IY+M2)+M2
    URAND=FLOAT(IY)*S
    RETURN
END FUNCTION URAND
!--------------------------------------------------------------------------------------------------------------------
SUBROUTINE SORT(N,G,V) ! DONE
! �������� ����������
    INTEGER::N
    REAL(8)::S
    REAL(8),DIMENSION(N)::G
    REAL(8),DIMENSION(N,N)::V
! COPT�POBKA ��EMEHTOB BEKTOPA G � COOTBETCTB����X CTO���OB MATP��� V B ���BA��EM �OP��KE
    K1=N-1
    DO I=1,K1
        K=I
        S=G(I)
        K0=I+1
        IF(N>=K0)THEN
            DO J=K0,N
                IF(G(J)>S)THEN
                    K=J
                    S=G(J)
                END IF
            END DO
        END IF
        IF(K>I)THEN
            G(K)=G(I)
            G(I)=S
            DO J=1,N
                S=V(J,I)
                V(J,I)=V(J,K)
                V(J,K)=S
            END DO
        END IF
    END DO
    RETURN
END SUBROUTINE SORT
!--------------------------------------------------------------------------------------------------------------------
SUBROUTINE QUAD(N,X,Q0,Q1,V,XI,F,FNLP)
! �������� ����������
    COMMON /GLOB/ QF1,QD1,QD0,QA,QB,QC,FX,NL
    INTEGER::N
    REAL(8)::FX,QF1,QD0,QD1,QA,QB,QC,L,S,F
    REAL(8),DIMENSION(N)::X,Q0,Q1,XI
    REAL(8),DIMENSION(N,N)::V
    EXTERNAL F,FNLP
! �O�CK M�H�M�MA B�O�� KP�BO�,O�PE�E��EMO� Q0,Q1,X.
    S=FX
    FX=QF1
    QF1=S
    QD1=0
    DO I=1,N
        S=X(I)
        L=Q1(I)
        X(I)=L
        Q1(I)=S
        QD1=QD1+(S-L)**2
    END DO
    QD1=DSQRT(QD1)
    L=QD1
    S=0
    IF((QD0>0).AND.(QD1>0).AND.(NL>=3*N*N))THEN
        CALL MINIM(0,2,S,L,QF1,.TRUE.,N,X,V,Q0,Q1,XI,F,FNLP)
        QA=L*(L-QD1)/(QD0*(QD0+QD1))
        QB=(L+QD0)*(QD1-L)/(QD0*QD1)
        QC=L*(L+QD0)/(QD1*(QD0+QD1))
    ELSE
        FX=QF1
        QB=0
        QA=0
        QC=1
    END IF
    QD0=QD1
    DO I=1,N
        S=Q0(I)
        Q0(I)=X(I)
        X(I)=QA*S+QB*X(I)+QC*Q1(I)
    END DO
    RETURN
END SUBROUTINE QUAD
!--------------------------------------------------------------------------------------------------------------------
FUNCTION FLIN(L,J,N,X,V,Q0,Q1,XI,F,FNLP)
! �������� ����������
    COMMON /GLOB/ QF1,QD1,QD0,QA,QB,QC,FX,NL
    REAL(8)::L,QA,QB,QC,QD0,QD1,QF1,FX,F,FLIN
    REAL(8),DIMENSION(N)::X,XI,Q0,Q1
    REAL(8),DIMENSION(N,N)::V
    EXTERNAL FNLP
! �O��PO�PAMMA-��HK��� O�HO� �EPEMEHHO� L, KOTOPA� M�H�M���P�ETC� �O��PO�PAMME MINIM
    IF(J<=0)THEN
        ! �O�CK B�O�� �APA�O���ECKO� �POCTPAHCTBEHHO� KP�BO�
        QA=L*(L-QD1)/(QD0*(QD0+QD1))
        QB=(L+QD0)*(QD1-L)/(QD0*QD1)
        QC=L*(L+QD0)/(QD1*(QD0+QD1))
        DO I=1,N
            XI(I)=QA*Q0(I)+QB*X(I)+QC*Q1(I)
        END DO
    ELSE
        ! ��HE�H�� �O�CK
        DO I=1,N
            XI(I)=X(I)+L*V(I,J)
        END DO
    END IF
    FLIN=F(XI,FNLP)
    RETURN
END FUNCTION FLIN
!--------------------------------------------------------------------------------------------------------------------
SUBROUTINE MINIM(J,NITS,D2,X1,F1,FK,N,X,V,Q0,Q1,XI,F,FNLP)
! �������� ������������
    ! �O��PO�PAMMA M�H�M���P�ET F �� X B HA�PAB�EH�� V(*,J) ��� J>=1
    ! KO��A C�E�AH KBA�PAT��H�� �O�CK B ��OCKOCT�,O�PE�E��EMO� Q0,Q1
    ! X1_O�EHKA PACCTO�H�� �O M�H�M�MA_BO�BPA�AETC� KAK HA��EHHOE
    ! PACCTO�H�E �O M�H�M�MA.  EC�� FK=.TRUE.,TO F1=FLIN(X1).  W
    ! �POT�BHOM C���AE X1 � F1 ��HOP�P��TC� �O TEX �OP,�OKA KOHE�HOE
    ! NITS KOHTPO��P�ET ��C�O �O��TOK,C�E�AHH�X ��� �MEH��EH�� �HTEP
    ! B�BOE. �O�O�H�E ���EKT�:  �C�O�����TC� � MEH��TC� X,FX,NF,NL.
    ! EC�� J>1, �C�O�����TC� �EPEMEHH�E Q...  .
    ! �C�O�����TC� H,N,T,M2,M4,LDT,DMIN,MACHEPS.
! �������� ����������
    COMMON /GLOB/ QF1,QD1,QD0,QA,QB,QC,FX,NL
    COMMON /BREN/ H,E,M2,M4,LDT,DMIN,MACHEP,SMALL
    REAL(8)::QF1,QD1,QD0,QA,QB,QC,F,D2,X1,F1,X2,XM,F0,F2,FM,D1,T2,S,SF1,SX1,FX,H,E,M2,M4,LDT,DMIN,MACHEP,SMALL
    INTEGER::J,NITS,K
    LOGICAL::FK,DZ
    REAL(8),DIMENSION(N)::X,XI,Q0,Q1
    REAL(8),DIMENSION(N,N)::V
    EXTERNAL F,FNLP
    ! ��������� ����������
    INTEGER::SP_VAR
! 
    SF1=F1
    SX1=X1
    K=0
    XM=0
    FM=FX
    F0=FX
    DZ=(D2<MACHEP)
! O�PE�E�EH�E ���H� �A�A
    S=0
    DO I=1,N
        S=S+X(I)**2
    END DO
    S=DSQRT(S)
    T2=D2
    IF(DZ) T2=DMIN
    T2=M4*DSQRT(DABS(FX)+T2*S*LDT)/DSQRT(T2)+M2*LDT
    S=M4*S+E
    IF(DZ.AND.(T2>S)) T2=S
    IF(T2<SMALL) T2=SMALL
    IF(T2>0.01*H) T2=0.01*H
    IF(FK.AND.(F1<=FM))THEN
        XM=X1
        FM=F1
    END IF
    IF(.NOT.FK.OR.(DABS(X1)<T2))THEN
        IF(X1<0.)THEN
            X1=-T2
        ELSE
            X1=T2
        END IF
        F1=FLIN(X1,J,N,X,V,Q0,Q1,XI,F,FNLP)
    END IF
    IF(F1<=FM)THEN
        XM=X1
        FM=F1
    END IF
    DO
        IF(DZ)THEN
            ! B���C�EH�E FLIN B �P��O� TO�KE � O�EHKA 2-O� �PO��BO�HO�
            X2=2*X1
            IF(F0<F1) X2=-X1
            F2=FLIN(X2,J,N,X,V,Q0,Q1,XI,F,FNLP)
            IF(F2<=FM)THEN
                XM=X2
                FM=F2
            END IF
            D2=((F1-F0)/X1-(F2-F0)/X2)/(X1-X2)
        END IF
        ! O�EHKA 1-O� �PO��BO�HO� B 0
        D1=(F1-F0)/X1-X1*D2
        DZ=.TRUE.
        ! �PE�CKA�AH�E M�H�M�MA
        IF(D2<=SMALL)THEN
            X2=-H
            IF(D1<0)X2=H
        ELSE
            X2=-0.5D0*D1/D2
        END IF
        IF(DABS(X2)>H)THEN
            IF(X2<=0.D0)THEN
                X2=-H
            ELSE
                X2=H
            END IF
        END IF
        DO
            ! O�EHKA F B �PE��O�A�AEMOM M�H�M�ME
            F2=FLIN(X2,J,N,X,V,Q0,Q1,XI,F,FNLP)
            IF(K<NITS.AND.F2>F0)THEN
                ! HET �C�EXA, �O��TAEMC� CHOBA
                K=K+1
                IF(F0<F1.AND.X1*X2>0)THEN
                    SP_VAR=6
                    EXIT
                END IF
                X2=0.5D0*X2
            ELSE
                SP_VAR=13
                EXIT
            END IF
        END DO
        IF(SP_VAR==13)EXIT
    END DO
    ! �BE���EH�E C�ET��KA O�HOMEPH�X �O�CKOB
    NL=NL+1
    IF(F2<=FM)THEN
        FM=F2
    ELSE
        X2=XM
    END IF
    ! �O���EH�E HOBO� O�EHK� BTOPO� �PO��BO�HO�
    IF(DABS(X2*(X2-X1))>SMALL)THEN
        D2=((F1-F0)/(X1*(X1-X2))-(FM-F0)/(X2*(X1-X2)))
    ELSE
        IF(K>0) D2=0
    END IF
    IF(D2<=SMALL) D2=SMALL
    X1=X2
    FX=FM
    IF(SF1<FX)THEN
        FX=SF1
        X1=SX1
    END IF
    IF(J>0)THEN
        DO I=1,N
            X(I)=X(I)+X1*V(I,J)
        END DO
    END IF
    RETURN
END SUBROUTINE MINIM
!--------------------------------------------------------------------------------------------------------------------
SUBROUTINE MINFIT(N,EPS,TOL,AB,Q,E)
! �������� ����������
    REAL(8)::EPS,TOL,C,F,G,H,S,X,Y,Z
    REAL(8),DIMENSION(N)::Q,E
    REAL(8),DIMENSION(N,N)::AB
    ! ��������� ����������
    INTEGER::SP_VAR
! �P�BE�EH�E �CXO�HO� MATP��� K �B�X��A�OHA��HO� �OPME C �OMO��� �PEO�PA�OBAH�� XA�CXO��EPA
    X=0
    G=0
    DO I=1,N
        E(I)=G
        S=0
        L=I+1
        DO J=I,N
            S=S+AB(J,I)**2
        END DO
        IF(S<TOL)THEN
            G=0
        ELSE
            F=AB(I,I)
            G=DSQRT(S)
            IF(F>=0)G=-DSQRT(S)
            H=F*G-S
            AB(I,I)=F-G
            IF(N>=L)THEN
                DO J=L,N
                    F=0
                    DO K=I,N
                        F=F+AB(K,I)*AB(K,J)
                    END DO
                    F=F/H
                    DO K=I,N
                        AB(K,J)=AB(K,J)+F*AB(K,I)
                    END DO
                END DO
            END IF
        END IF
        Q(I)=G
        S=0
        IF(I<=N)THEN
            IF(N>=L)THEN
                DO J=L,N
                    S=S+AB(I,J)**2
                END DO
            END IF
        END IF
        IF(S>=TOL)THEN
            F=AB(I,I+1)
            G=DSQRT(S)
            IF(F>=0)G=-DSQRT(S)
            H=F*G-S
            AB(I,I+1)=F-G
            IF(N>=L)THEN
                DO J=L,N
                    E(J)=AB(I,J)/H
                END DO
                DO J=L,N
                    S=0
                    DO K=L,N
                        S=S+AB(J,K)*AB(I,K)
                    END DO
                    DO K=L,N
                        AB(J,K)=AB(J,K)+S*E(K)
                    END DO
                END DO
            END IF
        ELSE
            G=0
        END IF
        Y=DABS(Q(I))+DABS(E(I))
        IF(Y>X)X=Y
    END DO
! �OPM�POBAH�E PE����T�P���E� �B�X��A�OHA��HO� MATP��� �PAB�X �PEO�PA�OBAH��
    DO I1=1,N
        I=N-I1+1
        SP_VAR=0
        IF(G/=0)THEN
            H=AB(I,I+1)*G
            IF(N<L)THEN
                SP_VAR=261
            ELSE
                DO J=L,N
                    AB(J,I)=AB(I,J)/H
                END DO
                DO J=L,N
                    S=0
                    DO K=L,N
                        S=S+AB(I,K)*AB(K,J)
                    END DO
                    DO K=L,N
                        AB(K,J)=AB(K,J)+S*AB(K,I)
                    END DO
                END DO
            END IF
        END IF
        IF(SP_VAR==0)THEN
            IF(N>=L)THEN
                DO J=L,N
                    AB(I,J)=0
                    AB(J,I)=0
                END DO
            END IF
        END IF
        AB(I,I)=1
        G=E(I)
        L=I
    END DO
    EPS=EPS*X
! �P�BE�EH�E �B�X��A�OHA��HO� MATP��� K ��A�OHA��HO� �OPME
    DO K1=1,N
        K=N-K1+1
        IKT=0
        DO
            IKT=IKT+1
            IF(IKT>30)E(K)=0
            SP_VAR=0
            DO L1=1,K
                L2=K-L1+1
                L=L2
                IF(DABS(E(L))<=EPS)THEN
                    SP_VAR=54
                    EXIT
                END IF
                IF(DABS(Q(L-1))<=EPS)EXIT
            END DO
            ! AHH���POBAH�E ��EMEHTA E(L),EC�� L>1
            IF(SP_VAR/=54)THEN
                C=0
                S=1
                IF(K>=L)THEN
                    DO I=L,K
                        F=S*E(I)
                        E(I)=C*E(I)
                        IF(DABS(F)>EPS)THEN
                            G=Q(I)
                            IF(DABS(F)<DABS(G))THEN
                                H=DABS(G)*DSQRT(1+(F/G)**2)
                            ELSE
                                H=0
                                IF(F/=0)H=DABS(F)*DSQRT(1+(G/F)**2)
                            END IF
                            Q(I)=H
                            IF(H==0)THEN
                                H=1
                                G=H
                            END IF
                            C=G/H
                            S=-F/H
                        END IF
                    END DO
                END IF
            END IF
            !
            Z=Q(K)
            IF(L/=K)THEN
                ! �OPM�POBAH�E C�B��A ��� QR-�PEO�PA�OBAH��
                X=Q(L)
                Y=Q(K-1)
                G=E(K-1)
                H=E(K)
                F=((Y-Z)*(Y+Z)+G**2)/(2*H*Y)-H/(2*Y)
                G=DSQRT(F*F+1)
                IF(F<0)THEN
                    F=F-G
                ELSE
                    F=F+G
                END IF
                F=((X-Z)*(X+Z)+H*(Y/F-H))/X
                ! O�EPE�HO� �A� QR-�PEO�PA�OBAH��
                S=1
                C=S
                K0=L+1
                IF(K>=K0)THEN
                    DO I=K0,K
                        G=E(I)
                        Y=Q(I)
                        H=S*G
                        G=G*C
                        IF(DABS(F)<DABS(H))THEN
                            Z=DABS(H)*DSQRT(1+(F/H)**2)
                        ELSE
                            Z=0
                            IF(F/=0) Z=DABS(F)*DSQRT(1+(H/F)**2)
                        END IF
                        E(I-1)=Z
                        IF(Z==0)THEN
                            F=1
                            Z=F
                        END IF
                        C=F/Z
                        S=H/Z
                        F=X*C+G*S
                        G=-X*S+G*C
                        H=Y*S
                        Y=Y*C
                        DO J=1,N
                            X=AB(J,I-1)
                            Z=AB(J,I)
                            AB(J,I-1)=X*C+Z*S
                            AB(J,I)=-X*S+Z*C
                        END DO
                        IF(DABS(F)<DABS(H))THEN
                            Z=DABS(H)*DSQRT(1+(F/H)**2)
                        ELSE
                            Z=0
                            IF(F/=0)Z=DABS(F)*DSQRT(1+(H/F)**2)
                        END IF
                        Q(I-1)=Z
                        IF(Z==0)THEN
                            F=1
                            Z=F
                        END IF
                        C=F/Z
                        S=H/Z
                        F=C*G+S*Y
                        X=-S*G+C*Y
                    END DO
                END IF
                E(L)=0
                E(K)=F
                Q(K)=X
            ELSE
                EXIT
            END IF
        END DO
        ! �OPM�POBAH�E MACC�BA Q(K),COCTO��E�O �� HEOTP��ATE��H�X ��EMEHTOB
        IF(Z<0)THEN
            Q(K)=-Z
            DO J=1,N
                AB(J,K)=-AB(J,K)
            END DO
        END IF
    END DO
    RETURN
END SUBROUTINE MINFIT
!--------------------------------------------------------------------------------------------------------------------
END SUBROUTINE A5
