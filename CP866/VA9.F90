! TECT�POBAH�E METO�OB �� �AKETA �M METO� �����CO��OB (A9)
PROGRAM VA9
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
! O��CAH�E O���X O��ACTE� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A91/ BG
    COMMON /A92/ G
    COMMON /A93/ G2
    COMMON /A94/ GN
    COMMON /A95/ XN 
    COMMON /A96/ X1
    ! PA�MEPHOCT� MACC�BOB BCEX MACC�BOB PABHA N
    REAL(8),DIMENSION(2)::X,A,B,G1,G,G2,GN,XN,X1
    ! PA�MEPHOCT� MACC�BA BG = N*N
    REAL(8),DIMENSION(2,2)::BG
    REAL(8),DIMENSION(40)::PAR
    REAL(8)::F,FNLP,Y
    INTEGER::Q
    EXTERNAL F,FNLP,GRAD,AGS
! �CXO�H�E �AHH�E �A�A��
    ! PA�MEPHOCT� �A�A��
    N=2
    ! HA�A��HA� TO�KA
    X(1)=  1.2
    X(2)=  1.0
! �A�AH�E �APAMETPOB METO�A
    Q=0
    PAR(Q+1)=0.00001            ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=25                 ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0                  ! B�XO�HO� �APAMETP
    PAR(Q+4)=10.                ! PA���C HA�A��HO�O �APA,O�PE�E����E�O O��ACT� �O�CKA
    PAR(Q+5)=0.001              ! PE�EH�� O�HOMEPHO� �A�A�� B��OPA �A�A
    PAR(Q+6)=0.0000000000000001 ! �O��CT�M�� O��EM �����CO��A
    PAR(Q+7)=2                  ! HOMEP BEPC�� METO�A ( =1 ��� B���K��X ��HK��� ; =2, EC�� ��HK��� HEB���K�A� )
    PAR(Q+8)=1                  ! �OP��OK ����EPEH��POBAH�� ( = 1 ��� 2 )
    PAR(Q+9)=0.00001            ! �A� ����EPEH��POBAH��
    PAR(Q+10)=1                 ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE ��E��ET B�BO��T� �H�OPMA���
    PAR(Q+11)=3                 ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 3 )
! ����� ������
    CALL A9 (N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VA9
