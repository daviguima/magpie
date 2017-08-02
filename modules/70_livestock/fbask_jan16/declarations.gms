*** (C) 2008-2017 Potsdam Institute for Climate Impact Research (PIK),
*** authors, and contributors see AUTHORS file
*** This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** Contact: magpie@pik-potsdam.de


positive variables
 vm_dem_feed(i,kap,kall)          regional feed demand including byproducts (Mt DM)
;

equations
 q70_feed(i,kap,kall)             regional feed demand
 q70_cost_prod_liv(i,kall)         regional factor input costs for livestock production
 q70_cost_prod_fish(i)               regional factor input costs for fish production

parameters
 im_slaughter_feed_share(t_all,i,kap,attributes) share of feed that is incorprated in animal biomass (1)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_dem_feed(t,i,kap,kall,type)    regional feed demand including byproducts (Mt DM)
 oq70_feed(t,i,kap,kall,type)      regional feed demand
 oq70_cost_prod_liv(t,i,kall,type) regional factor input costs for livestock production
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################