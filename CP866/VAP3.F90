! TECT�POBAH�E METO�OB �� �AKETA �M METO� ����������� ���������� (AP3)
PROGRAM VAP3
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A FUNCTION ��� B���C�EH�� �HA�EH�� KP�TEP��
    ! GRAD - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTA
    ! AGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X (HE �C�O����ETC�)
    ! Y - �HA�EH�E KP�TEP��
    ! G1 - BEKTOP �HA�EH�� �PO��BO�H�X ��HK��� F
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 0)
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! FNLP - ��KC�POBAHHOE �M� �O��PO�PAMM�
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /AP31/ P1
    COMMON /AP32/ P2
    COMMON /AP33/ G2
    COMMON /AP34/ XV
    COMMON /AP35/ W
    COMMON /AP36/ WN
    REAL(8)::F,FNLP,Y
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1 PABHA N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� BCEX MACC�BOB = N
    REAL(8),DIMENSION(2)::P1,P2,G2,XV
    INTEGER,DIMENSION(2)::W,WN
    EXTERNAL F,FNLP,GRAD,AGS
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    N=2
    ! HA�A��HA� TO�KA
    X(1)=-1.0
    X(2)=-1.0
    ! �EB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    A(1)=-10.
    A(2)=-10.
    ! �PAB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE
    B(1)=10.
    B(2)=10.
! �A�AH�E �APAMETPOB METO�A
    Q=0
    PAR(Q+1)=0.001      ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=10         ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0          ! B�XO�HO� �APAMETP
    PAR(Q+4)=0.0001     ! HA�A��H�� �A� C��CKA
    PAR(Q+5)=0.1        ! HA�A��HA� TO�HOCT� PE�EH�� O�HOMEPHO� �A�A�� B��OPA O�T�MA��HO�O �A�A
    PAR(Q+6)=0.00000001 ! M�H�MA��H�� �A� C��CKA
    PAR(Q+7)=10         ! ��C�O �TEPA���,�EPE� KOTOPOE METO� "BOCCTAHAB��BAETC�"
    PAR(Q+8)=1          ! HOMEP BEPC�� METO�A ( = 1 ��� 2 )
    PAR(Q+9)=2          ! �OP��OK ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(Q+10)=0.00001   ! �A� ����EPEH��POBAH��
    PAR(Q+11)=1         ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+12)=3         ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA���: OT 0 �O 3
! ����� ������
    CALL AP3(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VAP3
