! �C�O���OBAH�E METO�OB �� �AKETA O�T�M��A��� ������ ����� ���������������� ������� �������� (CP6)
! (��� ��OB�ETBOPEH�� O�PAH��EH�� �C�O����ETC� METO� �E��C�OBHO� M�H�M��A��� AP3)
PROGRAM VCP6
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
    ! AP3 -  �M� �O��PO�PAMM� METO�A �E��C�OBHO� M�H�M��A���
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A1/    M1,N,L
    COMMON /A8/    Y11
    COMMON /A9/    Y2
    COMMON /A10/   NF
    COMMON /A11/   G
    COMMON /CP60/  YYT
    COMMON /CP61/  LX
    COMMON /CP62/  HX
    COMMON /CP63/  GR
    COMMON /CP64/  FG
    COMMON /CP65/  U
    COMMON /CP66/  GU
    COMMON /CP67/  A1
    COMMON /CP68/  B1
    COMMON /CP69/  XX
    COMMON /AGR1/  LX1
    COMMON /AP31/  P1
    COMMON /AP32/  P2
    COMMON /AP33/  G2
    COMMON /AP34/  XV
    COMMON /AP35/  W
    COMMON /AP36/  WN
    COMMON /CPFI2/ AA
    COMMON /CPFI3/ BB
    REAL(8)::F
    INTEGER::N,M,M1,L,Q,NF
    ! PA�MEPHOCT� MACC�BOB X,A,B PABHA N
    REAL(8),DIMENSION(2)::X,A,B
    ! PA�MEPHOCT� MACC�BA P PABHA M
    REAL(8),DIMENSION(5)::P
    ! PA�MEPHOCT� MACC�BA Y PABHA M1=M+1
    REAL(8),DIMENSION(6)::Y
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� MACC�BOB G,GR,LX,HX,XX,AA,BB,LX1 = N
    REAL(8),DIMENSION(2)::G,LX,HX,GR,XX,AA,BB,LX1
    ! PA�MEPHOCT� MACC�BA FG = N*( M+1 )
    REAL(8),DIMENSION(18)::FG
    ! PA�MEPHOCT� MACC�BOB U,GU,A1,B1 = M
    REAL(8),DIMENSION(5)::U,GU,A1,B1
    ! PA�MEPHOCT� MACC�BOB Y11,YYT,Y2S = M+1
    REAL(8),DIMENSION(6)::YYT,Y11,Y2
    ! �EPEMEHH�E ��� METO�A �E��C�OBHO� O�T�M��A��� (AP3)
    ! PA�MEPHOCT� MACC�BOB P1,P2,G2,XV,W,WN = max{N,M}
    REAL(8),DIMENSION(6)::P1,P2,G2,XV
    INTEGER,DIMENSION(6)::W,WN
    EXTERNAL F,CGR,CGS,AP3
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
    ! �PAB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    B(1)=100000.
    B(2)=100000.
! �HA�EH�� �BO�CTBEHH�X �EPEMEHH�X
    P(1)=1.D0
    P(2)=1.D0
    P(3)=0.D0
    P(4)=0.D0
    P(5)=0.D0
! �A�AH�E �APAMETPOB METO�A
    PAR(1)=0.0001       ! TO�HOCT� PE�EH�� �A�A��
    PAR(2)=10.          ! MAKC�MA��HO BO�MO�HOE ��C�O �TEPA���
    PAR(3)=0.           ! �AKT��ECK� C�E�AHHOE ��C�O �TEPA���
    PAR(4)=1.           ! HOMEP BEPC�� METO�A ( = 1,2 ��� 3 )
    PAR(5)= 0.1         ! �APAMETP PE����P��A���
    PAR(6)=0.1          ! BEC O�PAH��EH�� B �C�OB�� OCTAHOBA
    PAR(7)= 0.0001      ! �A� B PA�HOCTHO� CXEME ��C�EHHO�O B���C�EH�� �PA��EHTA
    PAR(8)=1.           ! HOMEP PA�HOCTHO� CXEM� B���C�EH�� �PA��EHTA
    PAR(9)=1.           ! ��C�O �A�OB, �EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(10)=4.          ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 4 )
    ! �APAMETP� METO�A CO�P��EHH�X �PA��EHTOB (AP3)
    PAR(Q+1)=0.1        ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=100.       ! MAKC�MA��HOE ��C�O �A�OB, KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0.         ! B�XO�HO� �APAMETP
    PAR(Q+4)=0.0001     ! HA�A��H�� �A� C��CKA
    PAR(Q+5)=0.1        ! HA�A��HA� TO�HOCT� PE�EH�� O�HOMEPHO� �A�A�� B��OPA O�T�MA��HO�O �A�A
    PAR(Q+6)=0.00000001 ! M�H�MA��H�� �A� C��CKA
    PAR(Q+7)=10.        ! ��C�O �TEPA���,�EPE� KOTOPOE METO� "BOCCTAHAB��BAETC�"
    PAR(Q+8)=1.         ! HOMEP BEPC�� METO�A ( = 1 ��� 2 )
    PAR(Q+9)=1.         ! �OP��OK ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(Q+10)=0.0001    ! �A� ����EPEH��POBAH��
    PAR(Q+11)=1.        ! ��C�O ��A�H�X �A�OB, �EPE� KOTOPOE C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+12)=0.        ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA���: OT 0 �O 3
! ����� ������
    CALL CP6(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q,AP3)
END PROGRAM VCP6
