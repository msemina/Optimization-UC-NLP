! TECT�POBAH�E METO�OB �� �AKETA �M METO� ����-������ (AP4)
PROGRAM VAP4
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A FUNCTION ��� B���C�EH�� �HA�EH�� KP�TEP��
    ! GRAD - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH�� �PA��EHTA (HE �C�O����ETC�)
    ! AGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA MATP��� BTOP�X �PO��BO�H�X (HE �C�O����ETC�)
    ! Y - �HA�EH�E KP�TEP��
    ! G1 - BEKTOP �HA�EH�� �PO��BO�H�X ��HK��� F
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 0)
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! FNLP - ��KC�POBAHHOE �M� �O��PO�PAMM�
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /AP41/ X1
    COMMON /AP42/ X2
    COMMON /AP43/ ST
    COMMON /AP44/ SS
    COMMON /AP45/ SF
    REAL(8)::F,FNLP,Y
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1 PABHA N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� BCEX MACC�BOB = N
    REAL(8),DIMENSION(2)::X1,X2,ST
    INTEGER,DIMENSION(2)::SS,SF
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
    PAR(Q+1)=0.00001 ! TO�HOCT� PE�EH�� �A�A��
    PAR(Q+2)=100.    ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0       ! B�XO�HO� �APAMETP
    PAR(Q+4)=0.01    ! HA�A��H�� �A� C��CKA
    PAR(Q+5)=0.125   ! KO������EHT �MEH��EH�� �A�A
    PAR(Q+6)=0.00001 ! "HEO�PE�E�EHHOCT�" �A�AH�� �PAH�� �APA��E�E���E�A
    PAR(Q+ 7)=1      ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR( Q+8)=3      ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA���: OT 0 �O 3
! ����� ������
    CALL AP4(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VAP4
