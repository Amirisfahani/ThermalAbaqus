  
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
 |                     Date:  2-Jul-25 20:44:47 (PID=18592)                     |
 |                    +-----------------------------------+                     |
 |                    |                XXX                |                     |
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
 >>>>>> Start reading 'XXX.dat'
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
 9944                 $ELPROP
 9947              $END SYSTEM
 9949              $CONSTRAINTS  NAME = C_STEP_1
 9951                 $SUPPRESS  DOFS = 1,2,3  DOFTYPE = DISP
 9954              $END CONSTRAINTS
 9956              $LOADING  NAME = L_STEP_1
 9958                 $DISLOAD PRESS  LPAT = 1  IDS = ELGEO  NODES = ALL  DOFTYPE = DISP
 9976              $END LOADING
 9978           $EXIT COMPONENT
 9980           $ENTER MATERIAL
 9982              $MATERIAL  NAME = GJS  TYPE = ISO
 9984                 $ELASTIC  GENERAL  INPUT = DATA
 9987                 $DENSITY  GENERAL  INPUT = DATA
 9990              $END MATERIAL
 9992           $EXIT MATERIAL
 9994           $FIN
 <<<<<< Returning from 'XXX.dat'
  
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
  
 > Material reference in system variant NSV of component DFLT_COMP
 +----------------------+----------------------+
 |   No. of Elements    |       Material       |
 |----------------------+----------------------|
 |                  864 | GJS                  |
 +----------------------+----------------------+
  
 *E* 343/2010 Element <see list> (CONA8) has no geometrical data.
 <896 items>         865 ...... 1760
 *W* 330/6011 (ELDCGA): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                        Check messages from previous processors.
 *W* 330/6011 (EPTS): DMS-Book ELDAX.BLCK has wrong status -1, required 1.
                      Check messages from previous processors.
 *F* 330/4005 (PRITBL): Table ELGEO.INFO not found by processor ECVSET
                  0 *X*         1 *F*          1 *E*          3 *W*
         ERRORS  ERRORS ERRORS ERRORS  ERRORS ERRORS ERRORS  ERRORS
