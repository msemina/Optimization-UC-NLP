FUNCTION F(X,FNLP)
! PMEP OOTOBK HK  AA ECOBHO MHMA
!                (   )
    COMMON /C/ NF
    REAL(8), DIMENSION(2)::X
    REAL(8)::F
    INTEGER::NF
! CETK BCEH HK
    NF=NF+1
! PACET MHMPEMO HK
    F=100 * (X(2) - X(1)**2 )**2 + (1 - X(1))**2
    RETURN
END FUNCTION F
