SUBROUTINE F(X,Y,J)
!       �P�MEP �O��OTOBK� �O��PO�PAMM� PAC�ETA �E�EBO�
!    ��HK��� � O�PAH��EH�� ��� �A�A�� �C�OBHO� O�T�M��A���
!  ( BAP�AHT �E� �BHO�O ��ETA �APA��E�E���E�H�X O�PAH��EH�� )
!   N,M1 - O�PE�E���T PA�MEPHOCT� �A�A��
    COMMON /A1/ M1,N
!   NF - C�ET��K B���C�EH�� ��HK��� � O�PAH��EH��
    COMMON /A10/ NF
!   X - BEKTOP BAP��P�EM�X �EPEMEHH�X
!   Y - BEKTOP �HA�EH�� KP�TEP�� � O�PAH��EH��
    INTEGER::M1,N,NF,J
    REAL(8),DIMENSION(N)::X
    REAL(8),DIMENSION(M1)::Y
!   EC�� J < 0,TO B���C��EM  �E�EB�� ��HK��� � BCE O�PAH��EH��
!   EC�� J = 0,TO B���C��EM  �E�EB�� ��HK���
!   EC�� J > 0,TO B���C��EM  J-OE  O�PAH��EH�E
    IF(J==0.OR.J==-1)THEN
        Y(M1)=100 * (X(2) - X(1)**2 )**2 + (1 - X(1))**2
        NF=NF+1
    END IF
    IF(J==1.OR.J==-1)THEN
        Y(1)=(X(1)-1.D0)**2 + (X(2)-1.D0)**2 - 4
        NF=NF+1
    END IF
    IF(J==2.OR.J==-1)THEN
        Y(2)=-X(1)
        NF=NF+1
    END IF
    IF(J==3.OR.J==-1)THEN
        Y(3)=-X(2)
        NF=NF+1
    END IF
!
    RETURN
END SUBROUTINE F
