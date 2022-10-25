use "C:\Users\user\Desktop\India\Data\India base data 24122021.dta",clear
cd "C:\Users\user\Desktop"

*Table_1

sum Persondays_NREGA_overpop Exp_NREGA_overpop log_Naxal lit_ratio rural_ratio st_pop_ratio sc_pop_ratio total_light_cal_ worker_ratio waterdeficit_milimeters forest_ratio cropped_ratio landgini_imp log_ruralviolentprotest if year > 2005 & year < 2015
sum percapitacurrentprices1000inrs primarysectorcurrentsharespercen if year > 2007 & year < 2015 

*********For baseline***********************************************************
xtset distid year

*Table_2
*IV2sls with Persondays_NREGA_overpop
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using table2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.lit_ratio L.rural_ratio if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using table2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using table2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using table2.xls, append excel dec(3)

*Appendix: Part C.1
*Robustness checks for the NREGA models
*Additional controls
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.percapitacurrentprices1000inrs L.primarysectorcurrentsharespercen L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2007 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
*District level fixed effect
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(distname year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
*Spatial autocorrelation
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.Persondays_NREGA_overpop L.Persondays_overpop_splag L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio  L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.Persondays_NREGA_overpop L.Naxal_splag L.Persondays_overpop_splag L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
*Alternative DVs
ivreghdfe Exp_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
ivreghdfe log_Persondays_pop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1.xls, append excel dec(3)
*Alternative IVs
*violent and non_violent_Naxal (both significant)
ivreghdfe Persondays_NREGA_overpop (L.log_violent_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_non_violent_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
*rural and urban_Naxal (both significant)
ivreghdfe Persondays_NREGA_overpop (L.log_rural_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_urban_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
********Yani Naxal sadece non_violent artmıyor, tümüyle hem violent hem non_violent, hem rural hem urban artıyor... 
*Less lagged instrument:
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2005 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC1_2.xls, append excel dec(3)

*To see first stage results:
ivregress 2sls Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio i.statecode i.year if year > 2005 & year < 2015, vce (robust) first


*********For mobilization***********************************************************

*Table 3: Mobilization
nbreg log_Naxal L.Naxal_splag L.log_Naxal L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode if year > 2006 & year < 2015, cluster(distname) difficult technique(bhhh)
outreg2 using table3.xls, append excel dec(3)
*Persondays_NREGA_overpop
nbreg log_Naxal L.Naxal_splag L.log_Naxal L.Persondays_NREGA_overpop L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode if year > 2006 & year < 2015, cluster(distname) difficult technique(bhhh)
outreg2 using table3.xls, append excel dec(3)
nbreg log_Naxal L.Naxal_splag c.L.log_Naxal##c.L.Persondays_NREGA_overpop L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, cluster(distname) difficult technique(bhhh)
outreg2 using table3.xls, append excel dec(3)

*Appendix: Part C.2
*Robustness checks for the Naxalite models
nbreg log_Naxal L.Naxal_splag L.log_Naxal L.Exp_NREGA_overpop L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode if year > 2006 & year < 2015, cluster(distname) difficult technique(bhhh)
outreg2 using tableC2.xls, append excel dec(3)
nbreg log_Naxal L.log_Naxal L.Naxal_splag L.Persondays_overpop_splag L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, cluster(distname) difficult technique(bhhh)
outreg2 using tableC2.xls, append excel dec(3)

logit Naxal_dummy L.Naxal_splag L.log_Naxal L.Persondays_NREGA_overpop L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, cluster(distname)
outreg2 using tableC2.xls, append excel dec(3)
logit Naxal_dummy L.log_Naxal L.Naxal_splag L.Exp_NREGA_overpop L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, cluster(distname)
outreg2 using tableC2.xls, append excel dec(3)


*Appendix: Part C.2
*Instrument for the impact of NREGA on Naxal
*Create an instrument
gen instrumentforNREGA = HouseholdsNonSCST / population_imp
*First-stage
reghdfe L.Persondays_NREGA_overpop L.instrumentforNREGA L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_, absorb(statename_2019 year) cluster(distname)
outreg2 using tableC2_2.xls, append excel dec(3)
*Predict the independent variable of interest
predict Predicted_P_N_overpop
*Negative binomial model
nbreg log_Naxal Predicted_P_N_overpop L.Naxal_splag L.log_Naxal L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, cluster(distname) difficult technique(bhhh)
outreg2 using tableC2_2.xls, append excel dec(3)
*Same analysis with as in logistic regression with ivprobit
ivprobit Naxal_dummy (L.Persondays_NREGA_overpop=L.instrumentforNREGA) L.waterdeficit_milimeters L.landgini_imp L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.forest_ratio L.total_light_cal_ i.year i.statecode, vce(robust)
outreg2 using tableC2_2.xls, append excel dec(3)


*********For substitution***********************************************************

*Appendix: Part D
*with Persondays_NREGA_overpop
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.SEZ_area L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2006 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableD_1.xls, append excel dec(3)
ivreghdfe Persondays_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.SEZ_denotification L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters, absorb(statename_2019 year) cluster(distname)
outreg2 using tableD_1.xls, append excel dec(3)
nbreg SEZ_area L.Persondays_NREGA_overpop L.log_Naxal L.rural_ratio L.forest_ratio L.cropped_ratio L.worker_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ i.statecode i.year if year > 2006 & year < 2015, cluster(distname) difficult
outreg2 using tableD_1.xls, append excel dec(3)

*with Exp_NREGA_overpop
ivreghdfe Exp_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.SEZ_area L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters if year > 2006 & year < 2015, absorb(statename_2019 year) cluster(distname)
outreg2 using tableD_2.xls, append excel dec(3)
ivreghdfe Exp_NREGA_overpop (L.log_Naxal=L.L.L.L.log_ruralviolentprotest) L.SEZ_denotification L.rural_ratio L.lit_ratio L.st_pop_ratio L.sc_pop_ratio L.total_light_cal_ L.worker_ratio L.cropped_ratio L.waterdeficit_milimeters, absorb(statename_2019 year) cluster(distname)
outreg2 using tableD_2.xls, append excel dec(3)
nbreg SEZ_area L.Exp_NREGA_overpop L.log_Naxal L.rural_ratio L.forest_ratio L.cropped_ratio L.worker_ratio L.st_pop_ratio L.sc_pop_ratio L.cropped_ratio L.total_light_cal_ i.statecode i.year if year > 2006 & year < 2015, cluster(distname) difficult 
outreg2 using tableD_2.xls, append excel dec(3)


*************************************************************************************
*Appendix: Part B
***association of log_ruralviolentprotest with cropped_ratio, waterdeficit_milimetersvity and total_light_cal_
twoway (scatter log_ruralviolentprotest waterdeficit_milimeters) (lfit log_ruralviolentprotest waterdeficit_milimeters) if year > 2004 & year < 2014


