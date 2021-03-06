# |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
# |  authors, and contributors see AUTHORS file
# |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
# |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
# |  Contact: magpie@pik-potsdam.de


######################################
#### Script to start a MAgPIE run ####
######################################

library(lucode)
library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

#start MAgPIE run
source("config/default.cfg")
cfg$results_folder <- "output/:title:"
cfg$recalibrate <- TRUE

#specify the title flag for all the scenarios
flag <- ""

#SSPs
for (ssp in c("SSP1","SSP2","SSP3","SSP4","SSP5")) {
  for (rcp in c("Ref","26")) {
    cfg <- setScenario(cfg,c(ssp,if(rcp=="Ref") "NPI" else "NDC"))
    cfg$gms$c56_pollutant_prices <- paste(if(ssp %in% c("SSP3","SSP4")) "SSP2" else ssp,rcp,"SPA0",sep="-")
    cfg$gms$c60_2ndgen_biodem <- paste(if(ssp %in% c("SSP3","SSP4")) "SSP2" else ssp,rcp,"SPA0",sep="-")
    cfg$title <- paste(ssp,rcp,flag,sep="_")
    start_run(cfg,codeCheck=FALSE)
    cfg$recalibrate <- FALSE
  }
}

##CC
cfg$gms$c14_yields_scenario  <- "cc"
cfg$gms$c42_watdem_scenario  <- "cc"
cfg$gms$c43_watavail_scenario  <- "cc"
cfg$gms$c52_carbon_scenario  <- "cc"

# ##SSP1
# cfg$title <- paste("SSP1_Ref_RCP60_noco2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP1","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP1-Ref-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP1-Ref-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP1_Ref_RCP60_co2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP1","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP1-Ref-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP1-Ref-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP1_26_RCP26_noco2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP1","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP1-26-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP1-26-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP1_26_RCP26_co2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP1","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP1-26-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP1-26-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)

##SSP2
cfg$title <- paste("SSP2_Ref_RCP60_noco2",flag,sep="_")
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP60_co2",flag,sep="_")
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_26_RCP26_noco2",flag,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$c56_pollutant_prices <- "SSP2-26-SPA0"
cfg$gms$c60_2ndgen_biodem <- "SSP2-26-SPA0"
cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_26_RCP26_co2",flag,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$c56_pollutant_prices <- "SSP2-26-SPA0"
cfg$gms$c60_2ndgen_biodem <- "SSP2-26-SPA0"
cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
start_run(cfg,codeCheck=FALSE)

# ##SSP3
# cfg$title <- paste("SSP3_Ref_RCP60_noco2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP3","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP3_Ref_RCP60_co2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP3","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP3_26_RCP26_noco2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP3","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP2-26-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-26-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-noco2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP3_26_RCP26_co2",flag,sep="_")
# cfg <- setScenario(cfg,c("SSP3","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP2-26-SPA0"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-26-SPA0"
# cfg$input[1] <- "isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev32_h200_690d3718e151be1b450b394c1064b1c5.tgz"
# start_run(cfg,codeCheck=FALSE)
