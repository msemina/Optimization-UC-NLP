! �C�O���OBAH�E METO�OB �� �AKETA O�T�M��A��� H�� METO� H��TOHA  ( C8 )
PROGRAM VC8
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� BEKTOPA ��PAB��EM�X �EPEMEHH�X
    ! L - ��C�O O�PAH��EH�� T��A PABEHCTB
    ! M - O��EE ��C�O O�PAH��EH��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! P - BEKTOP �BO�CTBEHH�X �EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH��
    ! �HA�EH�� KP�TEP�� � O�PAH��EH��
    ! CGR - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTOB �E�EBO� ��HK��� � O�PAH��EH��
    ! CGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X �E�EBO� ��HK��� � O�PAH��EH��
    ! Y - BEKTOP �HA�EH�� KP�TEP�� � O�PAH��EH��
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 20)
    ! UNCONS -  �M� �O��PO�PAMM� METO�A �E��C�OBHO� M�H�M��A���
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A1/   M1,N,L
    COMMON /A5/   FUNC
    COMMON /A8/   Y1
    COMMON /A9/   Y2
    COMMON /A10/  NF
    COMMON /A13/  Y11
    COMMON /C80/  ZNFPR
    COMMON /C81/  ACTIV
    COMMON /C82/  XPR
    COMMON /C83/  GR
    COMMON /C84/  HES
    COMMON /C85/  LZ
    COMMON /C86/  LZZ
    COMMON /C87/  NAPR
    COMMON /C88/  DVOY
    COMMON /C89/  DVPR
    COMMON /C801/ LRAB
    COMMON /C802/ MRAB
    ! PA�MEPHOCT� MACC�BOB X,A,B,GR,XPR  PABHA  N
    REAL(8),DIMENSION(2)::X,A,B,XPR,GR
    ! PA�MEPHOCT� MACC�BA  P   PABHA  M
    REAL(8),DIMENSION(4)::P
    ! PA�MEPHOCT�  MACC�BOB DVOY,DVPR = M
    REAL(8),DIMENSION(3)::DVOY,DVPR
    ! PA�MEPHOCT�  MACC�BOB Y1,Y2,Y11,FUNC,ZNFPR,ACTIV  = M+1
    REAL(8),DIMENSION(4)::FUNC,Y1,Y2,Y11,ZNFPR,Y
    ! PA�MEPHOCT�  MACC�BA HES = ( N,N )
    REAL(8),DIMENSION(2,2)::HES
    ! PA�MEPHOCT�  MACC�BA LZZ = ( N+M,N+M )
    REAL(8),DIMENSION(7,7)::LZZ
    ! PA�MEPHOCT�  MACC�BOB LZ,NAPR,LRAB,MRAB = ( N+M )
    REAL(8),DIMENSION(7)::LZ,NAPR,LRAB,MRAB
    REAL(8),DIMENSION(40)::PAR
    REAL(8)::F
    INTEGER,DIMENSION(4)::ACTIV
    INTEGER::N,L,M1,Q,M,NF
    EXTERNAL F,CGR,CGS,UNCONS
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
    X(1)=0.1
    X(2)=0.7
    X(3)=0.2
    ! �EB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    A(1)= -100000.
    A(2)= -100000.
    A(3)= -100000.
    ! �PAB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    B(1)=100000.
    B(2)=100000.
    B(3)=100000.
    ! �BO�CTBEHH�X �EPEMEHH�X
    P(1)=1.D0
    P(2)=1.D0
    P(3)=0.D0
    P(4)=0.D0
    P(5)=0.D0
! �A�AH�E �APAMETPOB METO�A
    PAR(1)=0.0001  ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA ��HK��� �A�PAH�A
    PAR(2)=15      ! MAKC�MA��HO BO�MO�HOE ��C�O �TEPA���
    PAR(3)=0       ! �AKT��ECK� C�E�AHHOE ��C�O �TEPA���
    PAR(4)=0.8     ! �APAMETP B��OPA �A�A �B��EH�� ( MA�OPAHTA �O��CTE�HA )
    PAR(5)=0.01    ! �APAMETP B��E�EH�� AKT�BH�X O�PAH��EH��
    PAR(6)=0.1     ! �HA�EH�E,�P�CBA�BAEMOE �BO�CTBEHH�M �EPEMEHH�M, COOTBETCTB����M O�PAH��EH��M T��A HEPABEHCTBA, HA�A��H�E �HA�EH�� KOTOP�X MEH��E 10** ( -18 )
    PAR(7)=0.1     ! M�H�MA��HOE �HA�EH�E �BO�CTBEHHO� �EPEMEHHO�, �P� KOTOPOM O�PAH��EH�E T��A HEPABEHCTBA E�E C��TAETC� AKT�BH�M
    PAR(8)=0.0001  ! �A� ��C�EHHO�O B���C�EH�� �PA��EHTA
    PAR(9)=2       ! HOMEP PA�HOCTHO� CXEM� ��C�EHHO�O B���C�EH�� �PA��EHTA ( = 1 ��� 2 )
    PAR(10)=0.0001 ! �A� ��C�EHHO�O B���C�EH�� �ECC�AHA
    PAR(11)=1      ! HOMEP PA�HOCTHO� CXEM� ��C�EHHO�O B���C�EH�� �ECC�AHA  ( = 1,2 ��� 3 )
    PAR(12)=1      ! ��C�O �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(13)=4      ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 4 )
! ����� ������
    CALL C8(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q,UNCONS)
END PROGRAM VC8
