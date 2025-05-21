clear all
set more off
global datadir "C:\Users\suthe\Downloads"


use "$datadir/CleanedData.dta", clear


* Multiple Regression
reg HConsumption State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime Wedding_Costs Tragedies 
predict HConsumptionHat, xb
predict uHat, residual

summarize HConsumption HConsumptionHat uHat

* Partialling Out
reg State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime Wedding_Costs Tragedies 
predict ehat, residual

regress HConsumption ehat

* Goodness of Fit (R^2 and adjusted R^2)

reg log_HConsumption State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime log_Wedding_Costs Tragedies 



*Multicollinearity using VIF
correlate State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime log_Wedding_Costs Tragedies 

reg log_HConsumption State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime log_Wedding_Costs Tragedies 
vif

* Homoscedasticity & Heteroscedasticity (White test)
reg log_HConsumption State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime log_Wedding_Costs Tragedies 
predict uHat10, residual
reg uHat10 State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks Living_Conditions CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime Wedding_Costs Tragedies log_Livestocks log_Assets log_Wedding_Costs Livestocks_sq Assets_sq Wedding_Costs_sq


*Hypothesis Testing (comparing p-value with significance level)
reg log_HConsumption State_1 State_2 State_3 State_4 State_5 State_6 State_7 State_8 State_9 State_10 State_11 State_12 State_13 State_14 State_15 State_16 State_17 State_18 State_19 State_20 State_21 State_22 State_23 State_24 State_25 State_26 State_27 State_28 State_29 State_30 State_31 State_32 State_33 Religion_1 Religion_2 Religion_3 Religion_4 Religion_5 Religion_6 Religion_7 Religion_8 Religion_9 INCOMEPC Migrant_Work Livestocks CS_Knowledge House_Ownership Income_Class Assets Debt Marriage_Status Rooms Family_Size Education Life_Insurance Health_Insurance Crime log_Wedding_Costs Tragedies 

predict yHat, xb
gen uHat_sq = uHat^2
gen log_uHat = log(uHat)
gen log_yHat = log(yHat)
gen yHat_sq = yHat^2

//twoway (scatter uHat yHat_sq) (lfit uHat yHat_sq)
//twoway (scatter log_uHat yHat) (lfit log_uHat yHat)
//twoway (scatter uHat yHat) (lfit uHat yHat)
//twoway (scatter uHat_sq yHat) (lfit uHat_sq yHat)
//twoway (scatter log_uHat log_yHat) (lfit log_uHat log_yHat)
twoway (scatter log_HConsumption Wedding_Costs) (lfit log_HConsumption Wedding_Costs)
//twoway (scatter log_HConsumption log_Wedding_Costs) (lfit log_HConsumption log_Wedding_Costs)

*Cook's Distance
predict cookdistance if e(sample), cooksd
//graph box cookdistance, mark(1, mlab(Wedding_Costs))
sort cookdistance
//list make cookdistance

*Measurement Errors
predict residuals, resid
//scatter residuals Wedding_Costs
//scatter residuals Assets
//scatter residuals log_HConsumption
  * Standardized residuals
predict std_resid, rstandard
//scatter std_resid Wedding_Costs

log close
