! TECT�POBAH�E METO�OB �� �AKETA �M KB��������������� ����� (A84)
PROGRAM VA84
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A FUNCTION ��� B���C�EH�� �HA�EH�� KP�TEP��
    ! GRAD - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTA
    ! AGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X (HE �C�O����ETC� )
    ! Y - �HA�EH�E KP�TEP��
    ! G1 - BEKTOP �HA�EH�� �PO��BO�H�X ��HK��� F
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 0)
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! FNLP - ��KC�POBAHHOE �M� �O��PO�PAMM�
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A841/ HES
    COMMON /A842/ P1
    COMMON /A843/ P2
    COMMON /A844/ DGR
    COMMON /A845/ XV
    REAL(8)::F,FNLP,Y
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1  PABHA  N
    REAL(8),DIMENSION(40)::PAR
    REAL(8),DIMENSION(2)::X,A,B,G1
    ! PA�MEPHOCT�  MACC�BA HES  = N*N
    REAL(8),DIMENSION(2,2)::HES
    ! PA�MEPHOCT� BCEX MACC�BOB  = N
    REAL(8),DIMENSION(2)::P1,P2,DGR ,XV
    EXTERNAL F,FNLP,GRAD,AGS
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    N=2
    ! HA�A��HA� TO�KA
    X(1)=-1.0
    X(2)=-1.0
! �A�AH�E �APAMETPOB METO�A
    Q=0
    PAR(Q+1)=0.0001   ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=20       ! MAKC�MA��HOE ��C�O �A�OB, KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0        ! B�XO�HO� �APAMETP
    PAR(Q+4)=0        ! �P��HAK HA�A��HO� O�PE�E�EHHOCT� �APAMETPOB Y � G1 ( 0,1 ��� 2 )
    PAR(Q+5)=0.001    ! HA�A��H�� �A� C��CKA
    PAR(Q+6)=0.45     ! MA�OPAHTA �O��CTE�HA
    PAR(Q+7)=4        ! HOMEP BEPC�� METO�A ( 1,2,3, ��� 4 )
    PAR(Q+8)=0        ! �P��HAK C�OCO�A B���C�EH�� HA�A��HO� MATP��� HA�PAB�EH��  ( 0 ��� 1 )
    PAR(Q+9)=2        ! �OP��OK ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(Q+10)=0.00001 ! �A� ����EPEH��POBAH��
    PAR(Q+11)=1       ! �P��HAK CXEM� B���C�EH�� �ECC�AHA, EC�� PAR(Q+8)=1;    ( 1,2 ��� 3 )
    PAR(Q+12)=1       ! ��C�O ��A�H�X �A�OB, �EPE� KOTOPOE C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+13)=3       ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 3 )
! ����� ������
         CALL A84(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VA84
