! TECT�POBAH�E METO�OB �� �AKETA �M R � �������� ���� (A7)
PROGRAM VA7
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
    COMMON /A71/ G
    COMMON /A72/ G2
    COMMON /A73/ Z
    COMMON /A74/ BB
    REAL(8)::Y,F,FNLP
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1  PABHA  N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT�  MACC�BA BB = N*N
    REAL(8),DIMENSION(2,2)::BB
    ! PA�MEPHOCT�  BCEX MACC�BOB  = N
    REAL(8),DIMENSION(2)::G,G2,Z
    EXTERNAL F,FNLP,GRAD,AGS
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    N=2
    ! HA�A��HA� TO�KA
    X(1)=-1.0
    X(2)=-1.0
! �A�AH�E �APAMETPOB METO�A
    Q=0
    PAR(Q+1)=0.0001       ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=20           ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0            ! B�XO�HO� �APAMETP
    PAR(Q+4)=0.0000000001 ! TO�HOCT� PE�EH�� �A�A�� �O HOPME ��MEHEH�� X
    PAR(Q+5)=2.           ! KO������EHT PACT��EH�� �POCTPAHCTBA
    PAR(Q+6)=0.00000001   ! �A� ����EPEH��POBAH��
    PAR(Q+7)=1            ! �OP��OK ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(Q+8 )=1.          ! HA�A��H�� �A� C��CKA (PACCTO�H�E OT HA�A��HO� TO�K� �O TO�K� �KCTPEM�MA)
    PAR(Q+9)=1            ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+10)=3           ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 3 )
! ����� ������
    CALL A7 (N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VA7
