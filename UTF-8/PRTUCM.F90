SUBROUTINE PRTUCM(IT,NF,N,X,FX,NGR,SHAGP,PODRP)
! ПOДПPOГPAMMA ПEЧATИ PEЗУЛЬTATOB  БM
    INTEGER::IT, NF, N, SHAGP, PODRP
    REAL(8), DIMENSION(N)::X
    REAL(8)::FX, NGR
!
    IF(IT==0)THEN
        IF(IT-IT/SHAGP*SHAGP/=0)RETURN
    ELSE
        IF((PODRP<1).OR.(PODRP>3))RETURN
    END IF
!
    IF(IT==0)THEN
        WRITE(*,"(/A,I5)")                '     ЧИCЛO ИTEPAЦИЙ                          IT= ',IT
        WRITE(*,"(A,I5)")                 '     ЧИCЛO BЫЧИCЛEHИЙ ФУHKЦИИ                NF= ',NF
        SELECT CASE(PODRP)
            CASE(1)
                WRITE(*,"(A,D12.5)")      '     ЗHAЧEHИE ФУHKЦИИ                        F=  ',FX
            CASE(2)
                WRITE(*,"(A,D12.5)")      '     ЗHAЧEHИE ФУHKЦИИ                        F=  ',FX
                WRITE(*,"(A,D12.5)")      '     HOPMA ГPAДИEHTA                         NGR=',NGR
            CASE(3)
                WRITE(*,"(A,D12.5)")      '     ЗHAЧEHИE ФУHKЦИИ                        F=  ',FX
                WRITE(*,"(A,D12.5)")      '     HOPMA ГPAДИEHTA                         NGR=',NGR
                WRITE(*,"(A,8(D12.5,1X))")'     TEKУЩAЯ TOЧKA                           X=  ',(X(I),I=1,N)
        END SELECT
    ELSE
        SELECT CASE(PODRP)
            CASE(1)
                WRITE(*,"(/5X,'IT=',I5,5X,'NF=',I5,5X,'F=',D12.5)")IT,NF,FX
            CASE(2)
                WRITE(*,"(/5X,'IT=',I5, 5X,'NF=',I5, 5X,'F=',D12.5,5X,'NGR=',D12.5)")IT,NF,FX,NGR
            CASE(3)
                WRITE(*,"(/5X,'IT=',I5, 5X,'NF=',I5, 5X,'F=',D12.5,5X,'NGR=',D12.5)")IT,NF,FX,NGR
                WRITE(*,"(3X,'X= ',8(D12.5,1X))")(X(I),I=1,N)
        END SELECT
    END IF
    WRITE(*,"(120X)")
!
    RETURN
END SUBROUTINE PRTUCM
