! TECT�POBAH�E METO�OB �� �AKETA �M ����� ������� (A5)
PROGRAM VA5
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A FUNCTION ��� B���C�EH�� �HA�EH�� KP�TEP��
    ! GRAD - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTA ( HE �C�O����ETC� )
    ! AGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X (HE �C�O����ETC� )
    ! Y - �HA�EH�E KP�TEP��
    ! G1 - BEKTOP �HA�EH�� �PO��BO�H�X ��HK��� F
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 0)
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! FNLP - ��KC�POBAHHOE �M� �O��PO�PAMM�
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A51/ T
    COMMON /A52/ Z
    COMMON /A53/ V
    COMMON /A54/ Q0
    COMMON /A55/ Q1
    COMMON /A56/ E1
    COMMON /A57/ XI
    REAL(8)::Y,F,FNLP
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1  PABHA  N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� BCEX MACC�BOB  = N
    REAL(8),DIMENSION(2)::T,Z,Q0,Q1,E1,XI
    ! PA�MEPHOCT� MACC�BA V = N*N
    REAL(8),DIMENSION(2,2)::V
    EXTERNAL F,FNLP,GRAD,AGS
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    N=2
    ! HA�A��HA� TO�KA
    X(1)=-1.0
    X(2)=-1.0
! �A�AH�E �APAMETPOB METO�A
    Q=0
    PAR(Q+1)=0.00001 ! TO�HOCT� PE�EH�� �A�A�� �O ��MEHEH�� BEKTOPA X
    PAR(Q+2)=20    ! MAKC�MA��HOE ��C�O �A�OB, KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0     ! B�XO�HO� �APAMETP
    PAR(Q+4)=0.5   ! HA�A��H�� �A� C��CKA
    PAR(Q+5)=1.    ! KO������EHT MAC�TA��POBAH��
    PAR(Q+6)=1     ! BEPC�� METO�A ( 1 ��� 2 )
    PAR(Q+7)=1     ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+8)=3     ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 3 )
    PAR(Q+9)=2     ! ��C�O �TEPA��� �E� �����EH��, �OC�E KOTOPO�O METO� �AKAH��BAET PA�OT�
! ����� ������
    CALL A5(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VA5
