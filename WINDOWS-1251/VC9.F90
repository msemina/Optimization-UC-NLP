! �C�O���OBAH�E METO�OB �� �AKETA O�T�M��A��� H�� METO� ����������� (C9)
PROGRAM VC9
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
    ! UNCONS -  �M� �O��PO�PAMM� METO�A �E��C�OBHO� M�H�M��A���
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A1/  M1,N,L
    COMMON /A2/  XN
    COMMON /A3/  GN
    COMMON /A4/  G
    COMMON /A5/  G2
    COMMON /A6/  BG
    COMMON /A7/  Y1
    COMMON /A8/  Y11
    COMMON /A9/  Y12
    COMMON /A10/ NF
    REAL(8)::F
    INTEGER::N,L,M1,Q,M,NF
    ! PA�MEPHOCT� MACC�BOB X,A,B PABHA N
    REAL(8),DIMENSION(3)::X,A,B
    ! PA�MEPHOCT� MACC�BA P PABHA M
    REAL(8),DIMENSION(5)::P
    ! PA�MEPHOCT� MACC�BA Y PABHA M1=M+1
    REAL(8),DIMENSION(6)::Y
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� MACC�BOB GN,XN,G,G2 = N
    REAl(8),DIMENSION(3)::XN,GN,G,G2
    ! PA�MEPHOCT� MACC�BOB Y1,Y12,Y11 = M+1
    REAl(8),DIMENSION(6)::Y1,Y11,Y12
    ! PA�MEPHOCT� MACC�BA BG = (N,N)
    REAl(8),DIMENSION(9)::BG
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
    X(1)=0.1
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
    ! TO�HOCT� PE�EH�� �A�A�� �O O��EM� �����CO��A,
    PAR(1)=0.00000000001 ! �OKA������E�O PE�EH�E
    PAR(2)=150           ! MAKC�MA��HO BO�MO�HOE ��C�O �TEPA���
    PAR(3)=0.            ! �AKT��ECK� C�E�AHHOE ��C�O �TEPA���
    PAR(4)=1.            ! PA���C HA�A��HO�O �APA, CO�EP�A�E�O PE�EH�E
    PAR(5)=1.5           ! BEC �TPA�A
    PAR(6)=0.001         ! �APAMETP �PEO�PA�OBAH�� O�PAH��EH�� T��A PABEHCTBA B HEPABEHCTBA
    PAR(7)=0.00001       ! �A� ��C�EHHO�O B���C�EH�� �PA��EHTA
    PAR(8)=1.            ! HOMEP PA�HOCTHO� CXEM� ��C�EHHO�O B���C�EH�� �PA��EHTA ( = 1 ��� 2 )
    PAR(9)=1.            ! ��C�O �A�OB, �EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(10)=4.           ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 4 )
! ����� ������
    CALL C9(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q)
END PROGRAM VC9
