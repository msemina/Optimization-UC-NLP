! �C�O���OBAH�E METO�OB �� �AKETA O�T�M��A��� H�� PE������������ ����� (C7)
PROGRAM VC7
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� BEKTOPA ��PAB��EM�X �EPEMEHH�X
    ! L - ��C�O O�PAH��EH�� T��A PABEHCTB
    ! M - O��EE ��C�O O�PAH��EH��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! P - BEKTOP �BO�CTBEHH�X �EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �HA�EH�� KP�TEP�� � O�PAH��EH��
    ! CGR - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTOB �E�EBO� ��HK��� � O�PAH��EH��
    ! CGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X �E�EBO� ��HK��� � O�PAH��EH��
    ! Y - BEKTOP �HA�EH�� KP�TEP�� � O�PAH��EH��
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 20)
    ! UNCONS - �M� �O��PO�PAMM� METO�A �E��C�OBHO� M�H�M��A���
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A1/  M1,N,L
    COMMON /A2/  GF
    COMMON /A3/  GFT
    COMMON /A4/  AA
    COMMON /A5/  GR
    COMMON /A6/  X1
    COMMON /A7/  X2
    COMMON /A8/  Y11
    COMMON /A9/  Y12
    COMMON /A10/ NF
    COMMON /A11/ BB
    COMMON /A12/ Y1
    COMMON /A13/ IPVT
    COMMON /A14/ WORK
    REAL(8)::F
    INTEGER::N,L,M1,Q,M,NF
    ! PA�MEPHOCT� MACC�BOB X,A,B  PABHA  N
    REAL(8),DIMENSION(3)::X,A,B
    ! PA�MEPHOCT� MACC�BA P PABHA M
    REAL(8),DIMENSION(5)::P
    ! PA�MEPHOCT� MACC�BA Y PABHA M1=M+1
    REAL(8),DIMENSION(6)::Y
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT�  MACC�BOB GR,X1,X2,IPVT  = N
    REAL(8),DIMENSION(3)::GR,X1,X2
    INTEGER,DIMENSION(3)::IPVT
    ! PA�MEPHOCT�  MACC�BOB BB,WORK  = M
    REAL(8),DIMENSION(5)::BB,WORK
    ! PA�MEPHOCT�  MACC�BOB Y11,Y1,Y12  = M+1
    REAL(8),DIMENSION(6)::Y1,Y11,Y12
    ! PA�MEPHOCT�  MACC�BA AA  = ( M,M )
    REAL(8),DIMENSION(5,5)::AA
    ! PA�MEPHOCT�  MACC�BA GF  = ( N,M )
    REAL(8),DIMENSION(3,5)::GF
    ! PA�MEPHOCT�  MACC�BOB GFT = ( M,N )
    REAL(8),DIMENSION(5,3)::GFT
    EXTERNAL F,CGR,CGS
! 
    NF=0
    Q=20
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    M1=4
    M=M1-1
    L=0
    N=2
    ! HA�A��HA� TO�KA
    X(1)=0.3
    X(2)=0.7
    ! �EB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    A(1)=-100000.
    A(2)=-100000.
    A(3)=-100000.
    ! �PAB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    B(1)=100000.
    B(2)=100000.
    B(3)=100000.
! �HA�EH�� �BO�CTBEHH�X �EPEMEHH�X
    P(1)=1.D0
    P(2)=1.D0
    P(3)=0.D0
    P(4)=0.D0
    P(5)=0.D0
! �A�AH�E �APAMETPOB METO�A
    PAR(1)=0.0001 ! TO�HOCT� PE�EH�� �A�A��
    PAR(2)=1000   ! MAKC�MA��HO BO�MO�HOE ��C�O �TEPA���
    PAR(3)=0      ! �AKT��ECK� C�E�AHHOE ��C�O �TEPA���
    PAR(4)=1.     ! HA�A��H�� �A� C��CKA ( > 0 )
    PAR(5)=1      ! HOMEP CXEM� ��C�EHHO�O ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(6)=0.0001 ! �A� ��C�EHHO�O ����EPEH��POBAH��
    PAR(7)=1      ! ��C�O �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(8)=4      ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 4 )
! ����� ������
    CALL C7(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q)
END PROGRAM VC7
