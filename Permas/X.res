  
 +------------------------------------------------------------------------------+
 |                                                                              |
 |           This is the PERMAS Education Edition, which is intended            |
 |           for testing and demonstration purposes only and which is           |
 |           expressly not licensed for commercial use. If you want             |
 |           to get a commercial license of PERMAS, please contact              |
 |                                                                              |
 |                         INTES GmbH                                           |
 |                         Breitwiesenstrasse 28                                |
 |                         D-70565 Stuttgart                                    |
 |                         Phone: (49)-711-784 99-0                             |
 |                         Fax:   (49)-711-784 9910                             |
 |                         E-mail: sales@intes.de                               |
 |                                                                              |
 |           or your local PERMAS distributor.                                  |
 |                                                                              |
 |           Permission is granted to make & distribute copies of this          |
 |           PERMAS Education Edition provided this permission notice           |
 |           and the above license notice are preserved in all copies.          |
 |                                                                              |
 +------------------------------------------------------------------------------+
  
 +------------------------------------------------------------------------------+
 |                                 P E R M A S                                  |
 |                     Education Edition Version 20.00.333                      |
 |                        Distributed by INTES Stuttgart                        |
 |                     Date:  2-Jul-25 20:23:40 (PID=13936)                     |
 |                    +-----------------------------------+                     |
 |                    |                 X                 |                     |
 |                    +-----------------------------------+                     |
 |              Site: amirhossein.isfahani rwth-aachen.de (3732/1)              |
 |                   Host: AMIR / Windows 10 Pro-AMD64-19045                    |
 |         16 core AMD Ryzen 7 5700G with Radeon Graphics / 13.90 GiByte        |
 |                          Code: M9v20 (F90, 32 bpw)                           |
 +------------------------------------------------------------------------------+
  
 *W* 115/1230 Wrong checksum for global PERMAS format file 'C:\Program
              Files\INTES\EDU\etc\formats'
              (file does not match current PERMAS version).
              MD5-File = F5A40F1208F71952948E658EC1E7E204
              MD5-Vers = 49D53B52C932B2D033E747375D03160F
 >>>>>> Start reading 'X.dat'
 13             $ENTER COMPONENT  NAME = DFLT_COMP  DOFTYPE = DISP TEMP MATH
 15                $SITUATION  NAME = STEP_1
 17                $END SITUATION
 19                $STRUCTURE
 21                   $ELEMENT TYPE = HEXE20
 1750                 $ELEMENT TYPE = CONA8
 2648                 $SURFACE ELEMENTS  SURFID =          1  SYSTEM = LOCAL
 3546                 $NSET NAME = ABA_NALL_INP
 3899                 $NSET NAME = GJSLIM_1.SET_1
 4252                 $NSET NAME = PICKEDSET5_
 4605                 $NSET NAME = SPC_NODES
 4611                 $ESET NAME = ABA_CONA_CONS_CONVECTION
 4676                 $ESET NAME = CVG1A_CONA_U1000.000  DESCRIPTION = 'Convection Element Set for Geodats'
 4741                 $ESET NAME = CVT1T_CONA_U25  DESCRIPTION = 'Convection Element Set for Geodats'
 4806                 $ESET NAME = GJSLIM_1.SET_1
 4869                 $ESET NAME = PICKEDSET5_
 4932                 $ESET NAME = SURF__1_S1
 4945                 $ESET NAME = SURF__1_S2
 4961                 $ESET NAME = SURF__1_S3
 4967                 $ESET NAME = SURF__1_S4
 4984                 $ESET NAME = SURF__1_S5
 4990                 $ESET NAME = SURF__1_S6
 5005                 $SFSET NAME = SURF_1
 5008                 $COOR
 9935                 $PART  NAME = ABA_CONA_CONS_CONVECTION
 9937                 $PART  NAME = GJSLIM_1.SET_1
 9940              $END STRUCTURE
 9942              $SYSTEM  NAME = NSV
 9944                 $GEODAT SOLID     CONT = VMASS
 9946                 $GEODAT CONA      CONT = ALPHA
 9949                 $ELPROP
 9954              $END SYSTEM
 9956              $CONSTRAINTS  NAME = C_STEP_1
 9958                 $SUPPRESS  DOFS = 1,2,3  DOFTYPE = DISP
 9961              $END CONSTRAINTS
 9963              $LOADING  NAME = L_STEP_1
 9965                 $DISLOADN TEMP  LPAT = 1  DOFTYPE = DISP
 9968                 $DISLOAD PRESS  LPAT = 1  IDS = ELGEO  NODES = ALL  DOFTYPE = DISP
 9986                 $DISLOAD TEMPFILM  LPAT = 1  NODES = ALL  DOFTYPE = TEMP
 9989                 $INIVAL TEMP  DOFTYPE = TEMP
 9992                 $PARAMETER
 9995              $END LOADING
 9997           $EXIT COMPONENT
 9999           $ENTER MATERIAL
 10001             $MATERIAL  NAME = GJSLIM  TYPE = ISO
 10003                $DENSITY  GENERAL  INPUT = DATA
 10006                $CONDUCTIVITY  GENERAL  INPUT = TABLE  DEP = TEMP
 10017                $HEATCAP  GENERAL  INPUT = TABLE  DEP = TEMP
 10029             $END MATERIAL
 10031             $MATERIAL  NAME = GJS  TYPE = ISO
 10033                $ELASTIC  GENERAL  INPUT = DATA
 10036                $DENSITY  GENERAL  INPUT = DATA
 10039                $CONDUCTIVITY  GENERAL  INPUT = TABLE  DEP = TEMP
 10050                $HEATCAP  GENERAL  INPUT = TABLE  DEP = TEMP
 10062             $END MATERIAL
 10064          $EXIT MATERIAL
 10066          $FIN
 <<<<<< Returning from 'X.dat'
  
 > Surface definitions in component DFLT_COMP
 +------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------+
 |  Surface   | #Patches |  #Nodes  | Area Sum  |          Center of Area          |  Midnode  | MaxSmooth |Max.Kink Angle|
 |------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------|
 |          1 |      896 |     2690 | 2.240E+00 | -4.643E-02,+8.214E-02,+1.000E-01 |     -     |     -     |    9.000E+01 |
 |          2 |      896 |     2690 | 2.240E+00 | -4.643E-02,+8.214E-02,+1.000E-01 |    USE    |     -     |    9.000E+01 |
 +------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------+
  
 > Characteristics of component DFLT_COMP
 +-------------------------------+-------------+--------------------+--------------------+
 |                               |      Number |  Lowest Identifier | Highest Identifier |
 |-------------------------------+-------------+--------------------+--------------------|
 | Nodes                         |        4925 |                  1 |               4925 |
 | Elements                      |        1760 |                  1 |               1760 |
 +-------------------------------+-------------+--------------------+--------------------+
  
 > Elements used in component DFLT_COMP
 +----------------------+----------------------+
 |   No. of Elements    |     Element Type     |
 |----------------------+----------------------|
 |                  864 | HEXE20               |
 |                  896 | CONA8                |
 +----------------------+----------------------+
  
 *E* 343/1107 Element <see list> has multiple assignment of material data.
              Element may be a member of several element sets.
 <864 items>           1 ....... 864
 *W* 330/6011 (PRTMATSUM): DMS-Table ELPROP. has wrong status -1, required 1.
                           Check messages from previous processors.
 *W* 330/6011 (ELSTFSET): DMS-Table ELPROP. has wrong status -1, required 1.
                          Check messages from previous processors.
 *W* 330/6011 (XELPROP): DMS-Table ELPROP. has wrong status -1, required 1.
                         Check messages from previous processors.
 *W* 330/6011 (ELTYPX): DMS-Table XELPROP. has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (ELDAFVT): DMS-Table XELPROP. has wrong status -1, required 1.
                         Check messages from previous processors.
 *E* 330/0007 (ELDA): Data object ELTYPX. used for translation EITPX has wrong
                      state -1
 *W* 330/6011 (NEWELDAX): DMS-Table ELPROP. has wrong status -1, required 1.
                          Check messages from previous processors.
 *E* 330/0007 (NEWELDAX): Data object ELTYPX. used for translation EITPX has
                          wrong state -1
 *W* 330/6011 (ELDASB): DMS-Table ELPROP. has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (ELDASB): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (ELDCGA): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (ELDTRAN): DMS-Table ELPROP. has wrong status -1, required 1.
                         Check messages from previous processors.
 *W* 330/6011 (EPTS): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                      Check messages from previous processors.
 *W* 330/6011 (MATIST): DMS-Table ELPROP. has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (MAT2ELEM): DMS-Table ELPROP. has wrong status -1, required 1.
                          Check messages from previous processors.
 *W* 330/6011 (SMEXISET): DMS-Table ELPROP. has wrong status -1, required 1.
                          Check messages from previous processors.
 *E* 330/0007 (HYELASESET): Data object XELPROP. used for translation EL2MATID
                            has wrong state -1
 *W* 330/6011 (ECVSET): DMS-Table ELPROP. has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (ECESET): DMS-Table ELPROP. has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (CNV2ELEM): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                          Check messages from previous processors.
 *W* 330/6011 (CONASSET): DMS-Table ELPROP. has wrong status -1, required 1.
                          Check messages from previous processors.
  
 *W* 344/3234 Element load TEMP of CONA8 element <see list> cannot be defined at
              structural nodes. Load ignored in loading pattern 1.
 <896 items>         865 ...... 1760
 *E* 349/0023 System variant NSV not properly consolidated in situation STEP_1 of
              component DFLT_COMP
 *F* 323/0002 Task Execution Terminated Because of Preceding Errors
                  0 *X*         1 *F*          5 *E*         20 *W*
         ERRORS  ERRORS ERRORS ERRORS  ERRORS ERRORS ERRORS  ERRORS
