*** (C) 2008-2017 Potsdam Institute for Climate Impact Research (PIK),
*** authors, and contributors see AUTHORS file
*** This file is part of MAgPIE and licensed under GNU AGPL Version 3 
*** or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** Contact: magpie@pik-potsdam.de


*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/71_disagg_lvst/simple_oct17/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/71_disagg_lvst/simple_oct17/declarations.gms"
$Ifi "%phase%" == "equations" $include "./modules/71_disagg_lvst/simple_oct17/equations.gms"
$Ifi "%phase%" == "preloop" $include "./modules/71_disagg_lvst/simple_oct17/preloop.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/71_disagg_lvst/simple_oct17/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################
