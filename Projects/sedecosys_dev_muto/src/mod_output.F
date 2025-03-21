
!!!=== Copyright (c) 2017-2022 Takashi NAKAMURA  =====
!!!  edited by Masa Muto 2023

!--------------------------------------------------------------------------------
!
!              Output module
!
!--------------------------------------------------------------------------------

#include "cppdefs.h"

MODULE mod_output

contains

! **********************************************************************
!  Open files
! **********************************************************************
  SUBROUTINE files_open
  
    implicit none

    character(256) :: OUTFILE_prefix

    namelist/output/OUTFILE_prefix
  
    read (5, nml=output)
    rewind(5)
  
#if defined CHAMBER_SITE4
    open(10,file='./output/site04-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site04-crl1_his.csv')
    open(12,file='./output/site04-crl2_his.csv')
    open(21,file='./output/site04-crl1_ave.csv')
    open(22,file='./output/site04-crl2_ave.csv')
    open(31,file='./output/site04-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site04-ecosys_his.csv')
# endif
#elif defined CHAMBER_SITE5
    open(10,file='./output/site05-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site05-crl1_his.csv')
    open(12,file='./output/site05-crl2_his.csv')
    open(21,file='./output/site05-crl1_ave.csv')
    open(22,file='./output/site05-crl2_ave.csv')
    open(31,file='./output/site05-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site05-ecosys_his.csv')
# endif
#elif defined CHAMBER_SITE6
    open(10,file='./output/site06-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site06-crl1_his.csv')
    open(12,file='./output/site06-crl2_his.csv')
    open(21,file='./output/site06-crl1_ave.csv')
    open(22,file='./output/site06-crl2_ave.csv')
    open(31,file='./output/site06-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site06-ecosys_his.csv')
# endif
#elif defined CHAMBER_SITE7
    open(10,file='./output/site07-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site07-crl1_his.csv')
    open(12,file='./output/site07-crl2_his.csv')
    open(21,file='./output/site07-crl1_ave.csv')
    open(22,file='./output/site07-crl2_ave.csv')
    open(31,file='./output/site07-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site07-ecosys_his.csv')
# endif
#elif defined CHAMBER_SITE9
    open(10,file='./output/site09-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site09-crl1_his.csv')
    open(12,file='./output/site09-crl2_his.csv')
    open(21,file='./output/site09-crl1_ave.csv')
    open(22,file='./output/site09-crl2_ave.csv')
    open(31,file='./output/site09-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site09-ecosys_his.csv')
# endif
#elif defined CHAMBER_SITE10
    open(10,file='./output/site10-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/site10-crl1_his.csv')
    open(12,file='./output/site10-crl2_his.csv')
    open(21,file='./output/site10-crl1_ave.csv')
    open(22,file='./output/site10-crl2_ave.csv')
    open(31,file='./output/site10-zoo1_his.csv')
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/site10-ecosys_his.csv')
# endif


#else
    open(10,file='./output/'//trim(OUTFILE_prefix)//'-env_his.csv')
# if defined CORAL_TESTMODE
    open(11,file='./output/'//trim(OUTFILE_prefix)//'-crl1_his.csv')
    open(12,file='./output/'//trim(OUTFILE_prefix)//'-crl2_his.csv')
    open(21,file='./output/'//trim(OUTFILE_prefix)//'-crl1_ave.csv')
    open(22,file='./output/'//trim(OUTFILE_prefix)//'-crl2_ave.csv')
#  if defined CORAL_ZOOXANTHELLAE
    open(31,file='./output/'//trim(OUTFILE_prefix)//'-zoo1_his.csv')
    open(32,file='./output/'//trim(OUTFILE_prefix)//'-zoo2_his.csv')
    open(41,file='./output/'//trim(OUTFILE_prefix)//'-zphot1_his.csv')
    open(42,file='./output/'//trim(OUTFILE_prefix)//'-zphot2_his.csv')
#  endif
# endif
# if defined ECOSYS_TESTMODE
    open(40,file='./output/'//trim(OUTFILE_prefix)//'-ecosys_his.csv')
# endif
# if defined REEF_FLOW_TESTMODE
    open(45,file='./output/'//trim(OUTFILE_prefix)//'-flow_his.csv')
# endif

#endif
      
#if defined SEDIMENT_TESTMODE
    ! open(56,file='./output/eco5-sedDIC_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(57,file='./output/eco5-sedTA_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    open(58,file='./output/eco5-sedDO_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    ! open(59,file='./output/eco5-sedpH_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(60,file='./output/eco5-sedWarg_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    open(61,file='./output/eco5-sedNH4_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
!    open(62,file='./output/eco5-sedNO2_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    open(63,file='./output/eco5-sedNO3_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(64,file='./output/eco5-sedPO4_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(65,file='./output/eco5-sedDOCf_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(66,file='./output/eco5-sedPOCf_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    ! open(67,file='./output/eco5-sedDON_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(68,file='./output/eco5-sedPON_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(69,file='./output/eco5-sedDOP_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(70,file='./output/eco5-sedPOP_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(71,file='./output/eco5-sedPg_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(72,file='./output/eco5-sedRdoc_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(73,file='./output/eco5-sedRpoc_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(74,file='./output/eco5-sedGn_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(75,file='./output/eco5-sedNit1_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(76,file='./output/eco5-sedNit2_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(78,file='./output/eco5-sedDNd_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    ! open(79,file='./output/eco5-sedDNp_his.txt')!!!!!!!!!!!!!!!!!!!for debug

    !! MM edit 2023
    open(80,file='./output/eco5-sedCO2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(81,file='./output/eco5-sedN2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(82,file='./output/eco5-sedDOCs_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(83,file='./output/eco5-sedPOCs_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(84,file='./output/eco5-sedMn2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(85,file='./output/eco5-sedMnO2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(86,file='./output/eco5-sedFe2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(87,file='./output/eco5-sedFeS_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(88,file='./output/eco5-sedFeS2_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(89,file='./output/eco5-sedFeOOH_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(90,file='./output/eco5-sedFeOOH_PO4_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(91,file='./output/eco5-sedH2S_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    ! open(92,file='./output/eco5-sedHS_his.txt')!!!!!!!!!!!!!!!!!!!for debug
    open(93,file='./output/eco5-sedS0_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(94,file='./output/eco5-sedSO4_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    ! open(95,file='./output/eco5-sedS2_his.txt')!!!!!!!!!!!!!!!!!!!for debug

    open(96,file='./output/sedeco-calcheck0.csv',status='replace')!!!!!!!!!for debug
    open(97,file='./output/sedeco-calcheck1.csv',status='replace')!!!!!!!!!for debug
    open(98,file='./output/redoxlevel.txt',status='replace')!!!!!!!!!for debug
    open(99,file='./output/depth.txt',status='replace')!!!!!!!!!for debug
    open(100,file='./output/eco5-sedPOCn_his.txt',status='replace')!!!!!!!!!!!!!!!!!!!for debug
    open(101,file='./output/sedeco-v1.txt',status='replace')!!!!!!!!!for debug
    open(102,file='./output/sedeco-v2.txt',status='replace')!!!!!!!!!for debug
    open(103,file='./output/sedeco-v3.txt',status='replace')!!!!!!!!!for debug
    open(104,file='./output/sedeco-v4.txt',status='replace')!!!!!!!!!for debug
    open(105,file='./output/sedeco-v5.txt',status='replace')!!!!!!!!!for debug
    open(106,file='./output/sedeco-vom.txt',status='replace')!!!!!!!!!for debug
    open(107,file='./output/sedeco-R_O2.txt',status='replace')!!!!!!!!!for debug
    open(108,file='./output/sedeco-flux_DO.txt',status='replace')!!!!!!!!!for debug
#endif
    RETURN

END SUBROUTINE files_open

! **********************************************************************
!  Close files
! **********************************************************************
  SUBROUTINE files_close
  
    implicit none
    
    close(10)
#if defined CORAL_TESTMODE
    close(11)
    close(12)
    close(21)
    close(22)
# if defined CORAL_ZOOXANTHELLAE
    close(31)
    close(32)
    close(41)
    close(42)
# endif
#endif
#if defined ECOSYS_TESTMODE
    close(40)
#endif
#if defined REEF_FLOW_TESTMODE
    close(45)
#endif
#if defined SEDIMENT_TESTMODE
    ! close(56)
    ! close(57)
    close(58)
    ! close(59)
    ! close(60)
    close(61)
    ! close(62)
    close(63)
    close(64)
    close(65)
    close(66)
    ! close(67)
    ! close(68)
    ! close(69)
    ! close(70)
    ! close(71)
    ! close(72)
    ! close(73)
    ! close(74)
    ! close(75)
    ! close(76)
    ! close(78)
    ! close(79)
    close(80)
    close(81)
    close(82)
    close(83)
    close(84)
    close(85)
    close(86)
    close(87)
    close(88)
    close(89)
    close(90)
    close(91)
    ! close(92)
    close(93)
    close(94)
    ! close(95)
    close(96)
    close(97)
    close(98)
    close(99)
    close(100)
    close(101)
    close(102)
    close(103)
    close(104)
    close(105)
    close(106)
    close(107)
    close(108)

#endif

    RETURN

END SUBROUTINE files_close


! **********************************************************************
!  Write lavel of environmental data
! **********************************************************************

  SUBROUTINE write_lavel(fid)
  
    ! USE mod_param
    
    implicit none
    
    integer, intent(in) :: fid
    
    ! write(fid,'(*(g0:,", "))') 'time', 'Temp', 'Salt' , 'O2'                         &
    !     ,'Dw_O2','Ds_O2','Fd_O2','Fb_O2','Fc_O2','FT_O2','v1','R_O2'

    ! write(fid,'(*(g0:,", "))') 'time', 'Temp', 'Salt' , 'DOCf'                         &
    !     ,'Dw_DOCf','Ds_DOCf','Fd_DOCf','Fb_DOCf','Fc_DOCf','FT_DOCf','vdomf','R_DOCf'

    write(fid,'(*(g0:,", "))') 'time', 'Temp', 'vOM','v1', 'v2', 'v3', 'v4', 'v5'

    RETURN

  END SUBROUTINE write_lavel

! **********************************************************************
!  Write lavel of environmental data
! **********************************************************************

!   SUBROUTINE write_env_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!     write(fid,'(*(g0:,", "))') 'time', 'PFDsurf'                           &
!         ,'Temp','Salt','TA','DIC','DO'                                     &
! #if defined ORGANIC_MATTER
!         ,'DOC1','DOC2','POC1','POC2','Phyt1','Phyt2','Phyt3','Zoop','PIC'  &
! # if defined FOODWEB_TESTMODE
!         ,'DeadPhyt1','DeadPhyt2','DeadPhyt3'                               &
! # endif
! #endif
! #if defined NUTRIENTS            
!         ,'NO3','NH4','PO4'                                                 &
! # if defined ORGANIC_MATTER
!         ,'DON1','DON2','PON1','PON2','DOP1','DOP2','POP1','POP2'           &
! # endif
! #endif
! #if defined CARBON_ISOTOPE
!         ,'d13C_DIC'                                                        &
! #endif
! #if defined COT_STARFISH
!         ,'COT','COTl'                                                      &
! #endif
! #if defined REEF_FLOW
!         ,'Q_rc', 'Q_ch','el_reef'                                          &
! #endif
!         ,'dz', 'el'
      

!     RETURN

!   END SUBROUTINE write_env_lavel

! **********************************************************************
!  Write lavel of reef_flow data
! **********************************************************************

!   SUBROUTINE write_flow_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!     write(fid,'(*(g0:,", "))') 'time'   &
!     , 'Hs_o', 'Tp', 'd_o', 'd_i'        & 
!     , 'el_o', 'reef_el'                 &
!     , 'Qrc', 'Qch'

!     RETURN

!   END SUBROUTINE write_flow_lavel

! **********************************************************************
!  Write timeseries environmental data
! **********************************************************************

!   SUBROUTINE write_env_data(fid)
  
!     USE mod_param
! #ifdef CORAL_POLYP
!     USE mod_coral
! #endif
! #ifdef SEAGRASS
!     USE mod_seagrass
! #endif
! #ifdef MACROALGAE
!     USE mod_macroalgae
! #endif
! #ifdef SEDIMENT_ECOSYS
!     USE mod_sedecosys
! #endif
! #if defined CARBON_ISOTOPE
!     USE mod_geochem
! #endif
! #if defined REEF_FLOW
!       USE mod_reef_flow
! #endif
      
!     implicit none
      
!     integer, intent(in) :: fid
! #if defined CARBON_ISOTOPE
!     real(8) :: d13C_DIC

!     d13C_DIC=d13C_fromR13C(C(1,1,1,iT13C)/C(1,1,1,iTIC_))
! #endif
        
!     write(fid,'(*(g0:,", "))') time, PFDsurf                               &
!            , C(1,1,1,iTemp), C(1,1,1,iSalt)                            &
!            , C(1,1,1,iTAlk), C(1,1,1,iTIC_), C(1,1,1,iOxyg)          &
! #if defined ORGANIC_MATTER
!            , C(1,1,1,iDOC(1)), C(1,1,1,iDOC(2))                        &
!            , C(1,1,1,iPOC(1)), C(1,1,1,iPOC(2))                        &
!            , C(1,1,1,iPhyt(1)), C(1,1,1,iPhyt(2)), C(1,1,1,iPhyt(3)) &
!            , C(1,1,1,iZoop(1)), C(1,1,1,iPIC(1))                       &
! # if defined FOODWEB_TESTMODE
!            , C(1,1,1,iDeadPhyt(1)), C(1,1,1,iDeadPhyt(2))              &
!            , C(1,1,1,iDeadPhyt(3))                                       &
! # endif
! #endif
! #if defined NUTRIENTS            
!            , C(1,1,1,iNO3_), C(1,1,1,iNH4_), C(1,1,1,iPO4_)          &
! # if defined ORGANIC_MATTER
!            , C(1,1,1,iDON(1)), C(1,1,1,iDON(2))                        &
!            , C(1,1,1,iPON(1)), C(1,1,1,iPON(2))                        &
!            , C(1,1,1,iDOP(1)), C(1,1,1,iDOP(2))                        &
!            , C(1,1,1,iPOP(1)), C(1,1,1,iPOP(2))                        &
! # endif
! #endif
! #if defined CARBON_ISOTOPE
!            , d13C_DIC                                                      &
! #endif
! #if defined COT_STARFISH
!            , C(1,1,1,iCOTe), C(1,1,1,iCOTl)                            &
! #endif
! #if defined REEF_FLOW
!            , REEF(1)%Qrc(1,1), REEF(1)%Qch(1,1), REEF(1)%el (1,1)          &
! #endif
!            , dz(1,1,1), tide 


!     RETURN

!   END SUBROUTINE write_env_data
    
#if defined CORAL_TESTMODE
! **********************************************************************
!  Write lavel of coral internal conditions
! **********************************************************************

!   SUBROUTINE write_crl_his_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!     write(fid,'(*(g0:,", "))') 'time', 'PFD'                  &
!        ,'Pg', 'R', 'Pn', 'G','QC'                            &
!        ,'TAcal',  'TAcoe',  'TAamb'                          &
!        ,'DICcal', 'DICcoe', 'DICamb'                         &
!        ,'DOcoe', 'DOamb'                                     &
!        ,'pHcal','pHcoe','pHamb','Wacal','Waamb'              &
!        ,'fCO2cal','fCO2coe','fCO2amb'                        &
!        ,'CO2aqcal','HCO3cal','CO3cal'                        &
!        ,'CO2aqcoe','HCO3coe','CO3coe'                        &
! # if defined CORAL_CARBON_ISOTOPE
!        ,'d13C_DICamb','d13C_DICcoe','d13C_QC','d13C_DICcal'  &
!        ,'d13C_arg','d13C_argxGn'                             &
!        ,'d13C_CO2aqcal','d13C_HCO3cal','d13C_CO3cal'         &
!        ,'d13C_CO2aqcoe','d13C_HCO3coe','d13C_CO3coe'         &
!        ,'c13CO2aqcal','cH13CO3cal','c13CO3cal'               &
!        ,'c13CO2aqcoe','cH13CO3coe','c13CO3coe'               &
! # endif
! # if defined CORAL_ZOOXANTHELLAE
!        ,'ROS','Rz', 'F_Csec', 'F_ROS','F_detox','F_dam'      &
! # endif
! # if defined CORAL_BORON_ISOTOPE
!        ,'d11Barg'                                            &
! # endif
! # if defined ORGANIC_MATTER
!        ,'DOCuptake'                                          &
! # endif
! # if defined CORAL_INGESTION
!        ,'ZOOuptake'                                          &
! # endif
! # if defined CORAL_SIZE_DYNAMICS
!        ,'growth','mort','Damage','F_Cgrowth'                 &
! # endif
!        ,'E_ca','F_Cgrowth','Si_DIC','Si_DIC'

!     RETURN

!   END SUBROUTINE write_crl_his_lavel
    
    
!   SUBROUTINE write_crl_ave_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!       write(fid,'(*(g0:,", "))') 'day'  &
!        ,'S_PFD_dt'                     &   ! Photon flux density (mol m-2 d-1)
! # if defined CORAL_CARBON_ISOTOPE
! !       ,'S_d13CargxGn_dt'              &
!        ,'d13Carg'                      &   ! d13C
!        ,'S_d13C_QC_dt'                 &   ! 1 day avaraged value of d13C_QC
! # endif
! # if defined CORAL_BORON_ISOTOPE
!        ,'d11Barg'                      & 
! # endif
!        ,'S_Gn_dt'                      &   ! Calcification rate (umol cm-2 d-1)
!        ,'S_Pg_dt'                      &   ! Gross photosynthesis rate (umol cm-2 d-1)
!        ,'S_R_dt'                       &   ! Respiration rate (umol cm-2 d-1)
!        ,'S_QC_dt'                      &   ! 1 day avaraged value of QC
!        ,'S_Pn_dt'                          ! Net photosynthesis rate (umol cm-2 d-1)

!     RETURN

! END SUBROUTINE write_crl_ave_lavel

! # if defined CORAL_ZOOXANTHELLAE
!   SUBROUTINE write_zox_his_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!     write(fid,'(*(g0:,", "))')                &
!        'time', 'PFD'                          &
!        ,'Pg','R','Pn','dens'                  &
!        ,'QC', 'Chl'                           &
!        ,'Cg_bio','Cn_bio','Repro','Morta','F_zROS','F_Csec' &
!        ,'F_Zelm','Repro*dens','Morta*dens'    &
! #  if defined CORAL_NUTRIENTS
!        ,'QN','QP'                             &
!        ,'N_repro','P_repro'                   &
!        ,'NO3'                                 &
!        ,'NH4','F_ONOO'                        &
!        ,'NO3_trans','NH4_trans'               &
!        ,'NO3_reduc'                           &
!        ,'N_assim','N_dissim'                  &
!        ,'PO4','PO4_trans','P_assim'           &
! #  endif
!        ,'ROS','ROS_pmol_cell-1'               &
!        ,'Chl_ug_cm-2'

!     RETURN

!   END SUBROUTINE write_zox_his_lavel
    
  SUBROUTINE write_zphot_his_lavel(fid)
    
    implicit none
    
    integer, intent(in) :: fid
    
    write(fid,'(*(g0:,", "))')                                  &
        'time','PFD','Tamb'                                     &
       ,'QAo','QAr','QAi'                                       &
       ,'QAt','QAa','Fv/Fm','Y(II)'                             &
       ,'J_ea','J_ep_in','J_ep','J_ee','J_ep_max'               &
       ,'Ji2a','Ja2i','kr','s_ab','F_ROS','ROS'                 &
       ,'Pg','Pgcal','Pgmax', 'F_zDIC', 'F_zDO'                 &
       ,'Chl', '[CO2]', 'DO'
     
    RETURN

  END SUBROUTINE write_zphot_his_lavel

! # endif
#endif
#if defined ECOSYS_TESTMODE
! **********************************************************************
!  Write lavel of coral internal conditions
! **********************************************************************

!   SUBROUTINE write_ecosys_his_lavel(fid)
  
!     USE mod_param
    
!     implicit none
    
!     integer, intent(in) :: fid
    
!     write(fid,'(*(g0:,", "))') 'time', 'PFDbott'              &
! # ifdef CORAL_POLYP
!         ,'coral1_Pg', 'coral1_R', 'coral1_Pn', 'coral1_G'    &
!         ,'coral2_Pg', 'coral2_R', 'coral2_Pn', 'coral2_G'    &
! # endif
! # ifdef SEAGRASS
!         ,'sgrass_Pg', 'sgrass_R', 'sgrass_Pn'                &
! # endif
! # ifdef MACROALGAE
!         ,'algae_Pg' , 'algae_R' , 'algae_Pn'                 &
! # endif
! # ifdef SEDIMENT_ECOSYS
!         ,'sedeco_Pg', 'sedeco_R', 'sedeco_Pn', 'sedeco_G'    &
! # endif
!         ,'dDIC_dt','dTA_dt','dDO_dt'                         &
! # if defined ORGANIC_MATTER
!         ,'dDOC_dt','dPOC_dt'                                 &
! # endif
! # if defined CARBON_ISOTOPE
!         ,'dDI13C_dt'                                         &
! # endif
! # if defined NUTRIENTS
!         ,'dNO3_dt','dNH4_dt'                                 &
!         ,'dPO4_dt'                                           &
! #  if defined ORGANIC_MATTER
!         ,'dDON_dt','dPON_dt','dDOP_dt','dPOP_dt'             &
! #  endif
! # endif
!         ,'pH', 'fCO2', 'Warg'                                &
!         ,'U10', 'CO2flux' , 'O2flux'

!     RETURN

!   END SUBROUTINE write_ecosys_his_lavel
#endif
      
END MODULE mod_output

