! TECT�POBAH�E METO�OB �� �AKETA �M MO������POBAHH�� METO� H��TOHA (A8)
! BH�MAH�E: ��� O�PA�EH�� MATP��� �C�O����ETC� �O��PO�PAMMA DMINV. �O�TOM� HEO�XO��MO �O�K���EH�E �����OTEK� SSPLIB
PROGRAM VA8
! XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A
    ! N - PA�MEPHOCT� �A�A��
    ! X - BEKTOP ��PAB��EM�X �EPEMEHH�X
    ! A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X
    ! B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X
    ! F - �M� �O��PO�PAMM� T��A FUNCTION ��� B���C�EH��
    ! �HA�EH�� KP�TEP��
    ! GRAD - �M� �O��PO�PAMM� T��A SUBROUTINE ���
    ! B���C�EH�� �PA��EHTA  ( �C�O����ETC� CBO�
    ! BCTPOEHHA� �PO�PAMMA B���C�EH�� �PA��EHTA )
    ! AGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA
    ! MATP��� BTOP�X �PO��BO�H�X (HE �C�O����ETC� )
    ! Y - �HA�EH�E KP�TEP��
    ! G1 - BEKTOP �HA�EH�� �PO��BO�H�X ��HK��� F
    ! Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 0)
    ! PAR - BEKTOP �APAMETPOB METO�A
    ! FNLP - ��KC�POBAHHOE �M� �O��PO�PAMM�
! O��CAH�E �APAMETPOB �PO�PAMM� METO�A
    ! O��CAH�E O���X O��ACTE� METO�A
    COMMON /A81/  HES
    COMMON /A82/  P1
    COMMON /A83/  P2
    COMMON /A84/  XV
    COMMON /A85/  FV
    COMMON /A86/  XT
    COMMON /A87/  TR
    COMMON /A88/  L1
    COMMON /A829/ M1
    ! PA�MEPHOCT� MACC�BOB X,A,B,G1  PABHA  N
    REAL(8),DIMENSION(2)::X,A,B,G1
    REAL(8),DIMENSION(40)::PAR
    ! PA�MEPHOCT�  MACC�BA HES  = N*N
    REAL(8),DIMENSION(2,2)::HES
    ! PA�MEPHOCT�  MACC�BA P2   = 3*N
    REAL(8),DIMENSION(3,2)::P2
    ! PA�MEPHOCT�  BCEX MACC�BOB  = N
    REAL(8),DIMENSION(2)::P1,XV,L1,M1,FV,XT,TR
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
    PAR(Q+1)=0.00001 ! TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA
    PAR(Q+2)=25      ! MAKC�MA��HOE ��C�O �A�OB,KOTOPOE MO�HO C�E�AT�
    PAR(Q+3)=0       ! B�XO�HO� �APAMETP
    PAR(Q+4)=0       ! �P��HAK HA�A��HO� O�PE�E�EHHOCT� �APAMETPOB Y � G1 ( 0,1 ��� 2 )
    PAR(Q+5)=0.001   ! HA�A��H�� �A� C��CKA
    PAR(Q+6)=0.45    ! MA�OPAHTA �O��CTE�HA
    PAR(Q+7)=0.00001 ! �A� KOHE�HO-PA�HOCTHO� A��POKC�MA��� �PO��BO�H�X
    PAR(Q+8)=1       ! ��C�O ��A�H�X �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T� �H�OPMA���
    PAR(Q+9)=3       ! CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 3 )
! ����� ������
    CALL A8 (N,X,A,B,F,GRAD,AGS,Y,G1,Q,PAR,FNLP)
END PROGRAM VA8