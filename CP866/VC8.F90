C                                                                       
C           �C�O���OBAH�E METO�OB �� �AKETA O�T�M��A��� H��             
C                    METO� H��TOHA  ( C8 )                              
C                                                                       
C           XAPAKTEP�CT�KA �APAMETPOB �PO�PAMM� METO�A                  
C                                                                       
C     N - PA�MEPHOCT� BEKTOPA ��PAB��EM�X �EPEMEHH�X                    
C     L - ��C�O O�PAH��EH�� T��A PABEHCTB                               
C     M - O��EE ��C�O O�PAH��EH��                                       
C     X - BEKTOP ��PAB��EM�X �EPEMEHH�X                                 
C     A - BEKTOP �EB�X �PAH�� ��MEHEH�� ��PAB�. �EPEMEHH�X              
C     B - BEKTOP �PAB�X �PAH�� ��MEHEH�� ��PAB�.�EPEMEHH�X              
C     P - BEKTOP �BO�CTBEHH�X �EPEMEHH�X                                
C     F - �M� �O��PO�PAMM� T��A SUBROUTINE ��� B���C�EH��               
C         �HA�EH�� KP�TEP�� � O�PAH��EH��                               
C     CGR - �M� �O��PO�PAMM� T��A SUBROUTINE ���                        
C         B���C�EH�� �PA��EHTOB �E�EBO� ��HK��� �                       
C         O�PAH��EH��                                                   
C     CGS - �M� �O��PO�PAMM� T��A SUBROUTINE ��� PAC�ETA                
C           MATP��� BTOP�X �PO��BO�H�X �E�EBO� ��HK��� �                
C           O�PAH��EH��                                                 
C     Y - BEKTOP �HA�EH�� KP�TEP�� � O�PAH��EH��                        
C     PAR - BEKTOP �APAMETPOB METO�A                                    
C     Q - �APAMETP C ��KC�POBAHH�M �HA�EH�EM ( = 20)                    
C     UNCONS -  �M� �O��PO�PAMM� METO�A �E��C�OBHO�                     
C               M�H�M��A���                                             
C                                                                       
C      O��CAH�E �APAMETPOB �PO�PAMM� METO�A                             
C                                                                       
C      PA�MEPHOCT� MACC�BOB X,A,B  PABHA  N                             
         REAL *8 X(2),A(2),B(2)                                         
C      PA�MEPHOCT� MACC�BA  P   PABHA  M                                
         REAL *8 P(4)                                                   
C      PA�MEPHOCT� MACC�BA  Y   PABHA  M1=M+1                           
         REAL *8 Y(4)                                                   
         REAL *8 PAR(40)                                                
         REAL *8 F                                                      
         COMMON /A10/NF /A1/M1,N,L                                      
         INTEGER N,L,M1,Q,M,NF                                          
         EXTERNAL F,CGR,CGS,UNCONS                                      
C                                                                       
C           O��CAH�E O���X O��ACTE� METO�A                              
C                                                                       
      COMMON/A5/FUNC /A8/Y1 /A9/Y2 /A13/Y11 /C81/ACTIV /C82/XPR         
      COMMON/C83/GR /C84/HES /C85/LZ /C86/LZZ /C87/NAPR /C88/DVOY       
      COMMON/C89/DVPR /C80/ZNFPR /C801/LRAB /C802/MRAB                  
C                                                                       
C       PA�MEPHOCT�  MACC�BOB GR,XPR  = N                               
      REAL*8 XPR(2),GR(2)                                               
C       PA�MEPHOCT�  MACC�BOB DVOY,DVPR = M                             
      REAL*8 DVOY(3),DVPR(3)                                            
C       PA�MEPHOCT�  MACC�BOB Y1,Y2,Y11,FUNC,ZNFPR,ACTIV  = M+1         
      REAL*8 FUNC(4),Y1(4),Y2(4),Y11(4),ZNFPR(4)                        
      INTEGER ACTIV(4)                                                  
C       PA�MEPHOCT�  MACC�BA HES = ( N,N )                              
      REAL*8 HES(2,2)                                                   
C       PA�MEPHOCT�  MACC�BA LZZ = ( N+M,N+M )                          
      REAL*8 LZZ(7,7)                                                   
C       PA�MEPHOCT�  MACC�BOB LZ,NAPR,LRAB,MRAB = ( N+M )               
      REAL*8  LZ(7), NAPR(7),LRAB(7),MRAB(7)                            
C                                                                       
      NF=0                                                              
      Q=20                                                              
C                                                                       
C                                                                       
C         �CXO�H�E �AHH�E �A�A��                                        
C                                                                       
C     PA�MEPHOCT� �A�A��                                                
      M1=4                                                              
      M=M1-1                                                            
      L=0                                                               
      N=2                                                               
C     HA�A��HA� TO�KA                                                   
         X(1)=0.1                                                       
         X(2)=0.7                                                       
         X(3)=0.2                                                       
C     �EB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE             
         A(1)= -100000.                                                 
         A(2)= -100000.                                                 
         A(3)= -100000.                                                 
C     �PAB�E �PAH��� ��PAB�. �EPEMEHH�X �O KA��O� KOOP��HATE            
         B(1)=100000.                                                   
         B(2)=100000.                                                   
         B(3)=100000.                                                   
C                                                                       
C   �HA�EH�� �BO�CTBEHH�X �EPEMEHH�X                                    
         P(1)=1.D0                                                      
         P(2)=1.D0                                                      
         P(3)=0.D0                                                      
         P(4)=0.D0                                                      
         P(5)=0.D0                                                      
C                                                                       
C    �A�AH�E �APAMETPOB METO�A                                          
C                                                                       
C     TO�HOCT� PE�EH�� �A�A�� �O HOPME �PA��EHTA ��HK���                
C     �A�PAH�A                                                          
         PAR(1)=0.0001                                                  
C     MAKC�MA��HO BO�MO�HOE ��C�O �TEPA���                              
         PAR(2)=15                                                      
C     �AKT��ECK� C�E�AHHOE ��C�O �TEPA���                               
         PAR(3)=0                                                       
C     �APAMETP B��OPA �A�A �B��EH�� ( MA�OPAHTA �O��CTE�HA )            
         PAR(4)=0.8                                                     
C     �APAMETP B��E�EH�� AKT�BH�X O�PAH��EH��                           
         PAR(5)=0.01                                                    
C     �HA�EH�E,�P�CBA�BAEMOE �BO�CTBEHH�M �EPEMEHH�M,                   
C     COOTBETCTB����M O�PAH��EH��M T��A HEPABEHCTBA,                    
C     HA�A��H�E �HA�EH�� KOTOP�X MEH��E 10** ( -18 )                    
         PAR(6)=0.1                                                     
C     M�H�MA��HOE �HA�EH�E �BO�CTBEHHO� �EPEMEHHO�,                     
C     �P� KOTOPOM O�PAH��EH�E T��A HEPABEHCTBA E�E                      
C     C��TAETC� AKT�BH�M                                                
         PAR(7)=0.1                                                     
C     �A� ��C�EHHO�O B���C�EH�� �PA��EHTA                               
         PAR(8)=0.0001                                                  
C     HOMEP PA�HOCTHO� CXEM� ��C�EHHO�O B���C�EH��                      
C     �PA��EHTA ( = 1 ��� 2 )                                           
         PAR(9)=2                                                       
C     �A� ��C�EHHO�O B���C�EH�� �ECC�AHA                                
         PAR(10)=0.0001                                                 
C     HOMEP PA�HOCTHO� CXEM� ��C�EHHO�O B���C�EH��                      
C     �ECC�AHA  ( = 1,2 ��� 3 )                                         
         PAR(11)=1                                                      
C     ��C�O �A�OB,�EPE� KOTOPOE  C�E��ET B�BO��T�                       
C     �H�OPMA���                                                        
         PAR(12)=1                                                      
C     CTE�EH� �O�PO�HOCT� B�BO��MO� �H�OPMA��� ( OT 0 �O 4 )            
         PAR(13)=4                                                      
C                                                                       
      CALL C8(N,L,M,X,A,B,P,F,CGR,CGS,Y,PAR,Q,UNCONS)                   
C                                                                       
      STOP                                                              
      END                                                               
