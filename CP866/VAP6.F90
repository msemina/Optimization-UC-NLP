! TECT�POBAH�E METO�OB �� �AKETA �M METO� C��������� ������ (AP6)
PROGRAM VAP6
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
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
    COMMON /AP61/ Z1
    COMMON /AP62/ XM
    COMMON /AP63/ W
    COMMON /AP64/ WM
    COMMON /AP65/ X1
    REAL(8)::F,FNLP,Y
    INTEGER::Q
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1  PABHA  N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT� BCEX MACC�BOB = N
    REAL(8),DIMENSION(2)::Z1,XM,W,WM,X1
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
    PAR(1)=0.0001   ! TO�HOCT� PE�EH�� �A�A��
    PAR(2)=500      ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(3)=0        ! B�XO�HO� �APAMETP
    PAR(4)=0.1      ! HA�A��H�� �A� C��CKA
    PAR(5)=1.5      ! KO������EHT �BE���EH�� �A�A C��CKA
    PAR(6)=0.903602 ! KO������EHT �MEH��EH�� �A�A C��CKA
    PAR(7)=5.0      ! �APAMETP ��MEHEH�� ��OTHOCT� PAC�PE�E�EH��
    PAR(8)=10       ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE MEH�ETC� ��OTHOCT� PAC�PE�E�EH�� C���A�H�X ��CE�
    PAR(9) =20      ! O��EE ��C�O �A�OB,�EPE� KOTOPOE MEH�ETC� ��OTHOCT� PAC�PE�E�EH�� C���A�H�X ��CE�
    PAR(10)= 13579  ! HE�ETHOE ��C�O �� �HTEPBA�A (1;67108863) ��� �A��CKA �EHEPATOPA C���A�H�X ��CE�
    PAR(11)=1       ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(12)=3       ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA���: OT 0 �O 3
! ����� ������
    CALL AP6(N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VAP6
