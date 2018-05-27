*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

p39_cost_landcon_past(t,j,land) = 0;

** set the global range of establishment and clearing cost depending on the scenario
$Ifi "%c39_cost_scenario%" == "low" i39_establish_gdp(land,bound39) = f39_establish_gdp(land,"low_estimate",bound39);
$Ifi "%c39_cost_scenario%" == "medium" i39_establish_gdp(land,bound39) = f39_establish_gdp(land,"medium_estimate",bound39);
$Ifi "%c39_cost_scenario%" == "high" i39_establish_gdp(land,bound39) = f39_establish_gdp(land,"high_estimate",bound39);

$Ifi "%c39_cost_scenario%" == "low" i39_landclear_gdp(bound39) = f39_landclear_gdp("low_estimate",bound39);
$Ifi "%c39_cost_scenario%" == "medium" i39_landclear_gdp(bound39) = f39_landclear_gdp("medium_estimate",bound39);
$Ifi "%c39_cost_scenario%" == "high" i39_landclear_gdp(bound39) = f39_landclear_gdp("high_estimate",bound39);

*' @code
*' Regional establishment cost for agricultural land (cropland and pasture) and forestry 
*' are derived by scaling a global range of establishment 
*' cost `i39_establish_gdp` with regional GDP per capita `im_gdp_pc_mer`. 
*'
*' Determine global minimum and maximum GDP per capita in 1995:
s39_min_gdp = smin(i,im_gdp_pc_mer("y1995",i));
s39_max_gdp = smax(i,im_gdp_pc_mer("y1995",i));
*'
*' The region with the lowest (highest) GDP per capita in 1995 is assigned the lowest (highest) establishment cost per hectare.
*' The establishment cost per hectare of all other regions are distributed within the range of 
*' `i39_establish_gdp` according to the regional GDP per capita in 1995. 
*' `p39_establish_a` is the slope and `p39_establish_b` is the intercept of the function used below to calculate `p39_establish_costs`.
*' For future time steps, establishment cost scaled with the GDP per capita trajectory.
p39_establish_a(land) = (i39_establish_gdp(land,"high_gdp")
						- i39_establish_gdp(land,"low_gdp")) / (s39_max_gdp-s39_min_gdp);
p39_establish_b(land) = i39_establish_gdp(land,"low_gdp") - p39_establish_a(land) * s39_min_gdp;
p39_establish_costs_reg(t,i,land) = p39_establish_a(land) * im_gdp_pc_mer(t,i)
								+p39_establish_b(land);
*' Assume identical establishment cost in all cells belonging to a region. 
p39_establish_costs(t,j,land) = sum(cell(i,j), p39_establish_costs_reg(t,i,land));
*' @stop

** Costs for land clearing (determined by GDP, and reduced by relation of carbon density per cell in relation to maximal carbon density per region)
*' @code
*' Spatially explicit costs for land clearing (primary forest, secondary forest and other natural land) 
*' are derived by scaling a global range of clearing 
*' cost `i39_clearing_gdp` with regional GDP per capita `im_gdp_pc_mer` and 
*' spatially explicit vegetation carbon density. 
*'
*' Determine region with minimum and maximum GDP per capita in 1995:
reg_min_gdp(i) = YES$(im_gdp_pc_mer("y1995",i) = s39_min_gdp);
reg_max_gdp(i) = YES$(im_gdp_pc_mer("y1995",i) = s39_max_gdp);
*'
*' Maximum vegetation carbon density per region in 1995:
p39_max_carbon_reg(i) = smax(cell(i,j), fm_carbon_density("y1995",j,"primforest","vegc"));
*'
*' Maximum global vegetation carbon density in 1995:
p39_max_carbon_glo = smax(j,fm_carbon_density("y1995",j,"primforest","vegc"));
*'
*' `i39_landclear_gdp` is multiplied with the ratio of `p39_max_carbon_glo` and `p39_max_carbon_reg`.
*' This correction makes sure that the maximum land clearing costs in all regions are the same.
* costs are corrected in a way that the costs in cell with the highest forest carbin density in the region with the highest gdp later on gets the high_gdp value, even though costs are related to global maximum carbon density
* there is only one element in reg_max_gdp. Taking the sum is only to avoid "Uncontrolled set entered as constant" error
i39_landclear_gdp("high_gdp") = sum(reg_max_gdp, (i39_landclear_gdp("high_gdp") * p39_max_carbon_glo / p39_max_carbon_reg(reg_max_gdp)));
i39_landclear_gdp("low_gdp") = sum(reg_min_gdp, (i39_landclear_gdp("low_gdp") * p39_max_carbon_glo / p39_max_carbon_reg(reg_min_gdp)));
*'
*' @stop

display i39_landclear_gdp;

** NEW: costs are corrected so that region with the
* slope of the gdp function
p39_landclear_a =  (i39_landclear_gdp("high_gdp")-i39_landclear_gdp("low_gdp"))/(s39_max_gdp-s39_min_gdp);

* intercept of the gdp function
p39_landclear_b = i39_landclear_gdp("low_gdp")-p39_landclear_a*s39_min_gdp;

**



