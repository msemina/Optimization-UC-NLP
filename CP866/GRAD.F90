SUBROUTINE GRAD(N,F,X,Y,GR,N1,N2,H,A,FNLP)
! OPOPAMMA CEHHOO BCEH PAEHTA  METOOB M
!  
    INTEGER::A, N, I, N1, N2
    REAL(8), DIMENSION(N)::X, GR
    REAL(8)::H, Y, XA, XB, XC, Y1, F
    EXTERNAL FNLP
!  
    IF(A/=2)THEN
        DO I=N1, N2
            XA=X(I)
            XB=H*(1.D0+0.001D0*DABS(XA))
            X(I)=XA+XB
            Y1=F(X,FNLP)
            GR(I)=(Y1-Y)/XB
            X(I)=XA
        END DO
    ELSE
        DO I=N1, N2
            XA=X(I)
            XB=H*(1.D0+0.001D0*DABS(XA))
            X(I)=XA+XB
            XC=F(X,FNLP)
            X(I)=XA-XB
            Y1=F(X,FNLP)
            GR(I)=(XC-Y1)/2/XB
            X(I)=XA
        END DO
    END IF
!
    RETURN
END SUBROUTINE GRAD
