  
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
 |                     Date:  2-Jul-25 21:02:02 (PID=23264)                     |
 |                    +-----------------------------------+                     |
 |                    |               Test3               |                     |
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
 >>>>>> Start reading 'Test3.dat'
 13             $ENTER COMPONENT  NAME = DFLT_COMP  DOFTYPE = DISP TEMP MATH
 15                $SITUATION  NAME = STEP_1
 17                $END SITUATION
 19                $STRUCTURE
 21                   $ELEMENT TYPE = HEXE20
 1751                 $SURFACE ELEMENTS  SURFID =          1  SYSTEM = LOCAL
 2649                 $NSET NAME = ABA_NALL_INP
 3002                 $NSET NAME = GJSLIM_1.SET_1
 3355                 $NSET NAME = PICKEDSET5_
 3708                 $NSET NAME = SPC_NODES
 3714                 $ESET NAME = GJSLIM_1.SET_1
 3777                 $ESET NAME = PICKEDSET5_
 3840                 $ESET NAME = SURF__1_S1
 3853                 $ESET NAME = SURF__1_S2
 3869                 $ESET NAME = SURF__1_S3
 3875                 $ESET NAME = SURF__1_S4
 3892                 $ESET NAME = SURF__1_S5
 3898                 $ESET NAME = SURF__1_S6
 3913                 $SFSET NAME = SURF_1
 3916                 $COOR
 8843                 $PART  NAME = GJSLIM_1.SET_1
 8846              $END STRUCTURE
 8848              $SYSTEM  NAME = NSV
 8850              $END SYSTEM
 8852              $CONSTRAINTS  NAME = C_STEP_1
 8854                 $SUPPRESS  DOFS = 1,2,3  DOFTYPE = DISP
 8857              $END CONSTRAINTS
 8859              $LOADING  NAME = L_STEP_1
 8861                 $DISLOAD PRESS  LPAT = 1  IDS = ELGEO  NODES = ALL  DOFTYPE = DISP
 8879              $END LOADING
 8881           $EXIT COMPONENT
 8883           $ENTER MATERIAL
 8885              $MATERIAL  NAME = GJS  TYPE = ISO
 8887                 $ELASTIC  GENERAL  INPUT = DATA
 8890                 $DENSITY  GENERAL  INPUT = DATA
 8893              $END MATERIAL
 8895           $EXIT MATERIAL
 8897           $FIN
 <<<<<< Returning from 'Test3.dat'
  
 > Surface definitions in component DFLT_COMP
 +------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------+
 |  Surface   | #Patches |  #Nodes  | Area Sum  |          Center of Area          |  Midnode  | MaxSmooth |Max.Kink Angle|
 |------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------|
 |          1 |      896 |     2690 | 2.240E+00 | -4.643E-02,+8.214E-02,+1.000E-01 |     -     |     -     |    9.000E+01 |
 +------------+----------+----------+-----------+----------------------------------+-----------+-----------+--------------+
  
 > Characteristics of component DFLT_COMP
 +-------------------------------+-------------+--------------------+--------------------+
 |                               |      Number |  Lowest Identifier | Highest Identifier |
 |-------------------------------+-------------+--------------------+--------------------|
 | Nodes                         |        4925 |                  1 |               4925 |
 | Elements                      |         864 |                  1 |                864 |
 +-------------------------------+-------------+--------------------+--------------------+
  
 > Elements used in component DFLT_COMP
 +----------------------+----------------------+
 |   No. of Elements    |     Element Type     |
 |----------------------+----------------------|
 |                  864 | HEXE20               |
 +----------------------+----------------------+
  
 *C* 320/0023 Situation STEP_1 activated in component DFLT_COMP
  
  
 > Degree of freedom information for doftype DISP in situation STEP_1 of component DFLT_COMP
 +----------------------+----------------------+
 |       Freedom        |     No. of DOFs      |
 |----------------------+----------------------|
 | local                |                14583 |
 | suppress             |                  192 |
 +----------------------+----------------------+
  
 *E* 363/1501 Missing elastic data in component DFLT_COMP, situation STEP_1,
              computation of stiffness impossible
  
 *E* 213/5020 Element <see list>: ELASTIC data missing. No material assigned.
 <864 items>           1 ....... 864
 *F* 323/0012 Execution terminated due to errors during scanning of task
                  0 *X*         1 *F*          2 *E*          1 *W*
         ERRORS  ERRORS ERRORS ERRORS  ERRORS ERRORS ERRORS  ERRORS
