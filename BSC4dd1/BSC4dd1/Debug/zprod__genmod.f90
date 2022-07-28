        !COMPILER-GENERATED INTERFACE MODULE: Wed Jan 26 16:54:04 2022
        MODULE ZPROD__genmod
          INTERFACE 
            FUNCTION ZPROD(ZZ,KS,N,Z,BETAM)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: ZZ
              INTEGER(KIND=4) :: KS
              COMPLEX(KIND=8) :: Z(N)
              REAL(KIND=8) :: BETAM(N)
              COMPLEX(KIND=8) :: ZPROD
            END FUNCTION ZPROD
          END INTERFACE 
        END MODULE ZPROD__genmod
