/*===========================================================================================================
 Author: Elizabeth Orvek	
 Script Name: Import Statements for Tuft Vet School Project
 File Name: VanThof_SCM_Goats_ImportStatements.sas
 Project: SCM Goats Bangladesh
 PI: Chelsea Van Thof (Tufts Vet School)
 Create date: December 22, 2016
 
 Description: 
Run the import program to create the goats and farms datasets before running any of the analysis below.

 Revision History: 
=============================================================================================================*/


*libname goats 'Z:\Tufts_Van_Thof\SAS_Files\Datasets';

/*****SECTION ONE************
Relationship between the CMT Grade and the Somatic Cell Count
*/

options orientation=portrait nodate number;
ods noproctitle;
ods rtf file="Z:\Tufts_Van_Thof\Output\Goats_Mastitis_12January2017.rtf" bodytitle style=listing startpage=no;
TITLE1 "Mastitis in Meat Goats";
TITLE2 "Analysis Date: 01/12/2017";
TITLE3 "Relationship between CMT Grade and SCC";

TITLE4 "Right Quarter";
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QR;
var SCC_QR;
run;
TITLE4 "Left Quarter";
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QL;
var SCC_QL;
run;

TITLE3;
TITLE2;
TITLE1;
/*
****SECTION TWO************
Relationship between the # of parity and
# of kids nursing
days lactating
breed
bcs
*/
TITLE3 "Relationship to Goat Characteristics";
TITLE4 "Number of Parity in Last 12 Months";
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QR;
var num_parity_12_mths;
run;
TITLE3;
proc npar1way data=goats wilcoxon;
class CMT_GRADE_QL;
var num_parity_12_mths;
run;

proc corr data=goats spearman;
var SCC_QR num_parity_12_Mths;
run;

proc corr data=goats spearman;
var SCC_QL num_parity_12_Mths;
run;
TITLE4 "Number of Kids Nursing";
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QR;
var num_kids_nursing;
run;
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QL;
var num_kids_nursing;
run;

proc corr data=goats spearman;
var SCC_QR num_kids_nursing;
run;

proc corr data=goats spearman;
var SCC_QL num_kids_nursing;
run;

TITLE4 "Days in Milk";
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QR;
var days_in_milk_1st_partuition;
run;
proc npar1way data=goats  wilcoxon;
class CMT_GRADE_QL;
var days_in_milk_1st_partuition;
run;

proc corr data=goats spearman;
var SCC_QR days_in_milk_1st_partuition;
run;

proc corr data=goats spearman;
var SCC_QL days_in_milk_1st_partuition;
run;

TITLE4 "Breed";
proc freq data = goats;
  tables CMT_GRADE_QR*breed / chisq;
run;

proc freq data = goats;
  tables CMT_GRADE_QL*breed / chisq;
run;

proc npar1way data=goats  wilcoxon;
class BREED;
var SCC_QL;
run;

proc npar1way data=goats  wilcoxon;
class BREED;
var SCC_QR;
run;

TITLE4 "BCS";
proc freq data = goats;
  tables CMT_GRADE_QR*bcs / chisq;
run;

proc freq data = goats;
  tables CMT_GRADE_QL*bcs / chisq;
run;

proc npar1way data=goats  wilcoxon;
class bcs;
var SCC_QL;
run;

proc npar1way data=goats  wilcoxon;
class bcs;
var SCC_QR;
run;

/*
****SECTION THREE************
Relationship with farm cleanliness
characteristics
*/
/*proc sort data=goats;
by farm_id;

proc sort data=farms;
by farm_id;
run;

data merged;
merge goats farms (Keep=farm_id 
Dirt_score_for_muddiness
Dirt_score_for_feces
Cleaning_Freq_floor
Cleaning_Freq_feeding_trough
clean_feed_trough);
by farm_id;
run;*/

TITLE3 "Relationship to Farm Cleanliness Factors";
TITLE4 "Dirt Score for Muddiness";
proc freq data = merged;
  tables CMT_GRADE_QR*dirt_score_for_muddiness / chisq;
run;
TITLE3;
proc freq data = merged;
  tables CMT_GRADE_QL*dirt_score_for_muddiness / chisq;
run;

proc npar1way data=merged  wilcoxon;
class dirt_score_for_muddiness;
var SCC_QL;
run;

proc npar1way data=merged  wilcoxon;
class dirt_score_for_muddiness;
var SCC_QR;
run;

TITLE4 "Dirt Score for Feces";

proc freq data = merged;
  tables CMT_GRADE_QR*dirt_score_for_feces / chisq;
run;

proc freq data = merged;
  tables CMT_GRADE_QL*dirt_score_for_feces / chisq;
run;

proc npar1way data=merged  wilcoxon;
class dirt_score_for_feces;
var SCC_QL;
run;

proc npar1way data=merged  wilcoxon;
class dirt_score_for_feces;
var SCC_QR;
run;


TITLE4 "Frequency of Cleaning the Floor";

proc npar1way data=merged  wilcoxon;
class CMT_GRADE_QR;
var Cleaning_Freq_floor ;
run;

proc npar1way data=merged  wilcoxon;
class CMT_GRADE_QL;
var Cleaning_Freq_floor ;
run;

proc corr data=merged  spearman;
var SCC_QL Cleaning_Freq_floor;
run;
proc corr data=merged  spearman;
var SCC_QR Cleaning_Freq_floor;
run;

TITLE4 "Frequency of Cleaning the Feeding Trough";

proc npar1way data=merged  wilcoxon;
class CMT_GRADE_QR;
var cleaning_freq_feeding_trough ;
run;

proc npar1way data=merged  wilcoxon;
class CMT_GRADE_QL;
var cleaning_freq_feeding_trough ;
run;

proc corr data=merged  spearman;
var SCC_QL cleaning_freq_feeding_trough;
run;
proc corr data=merged  spearman;
var SCC_QR cleaning_freq_feeding_trough;
run;


TITLE4 "Cleanliness of Feeding Trough";

proc freq data = merged;
  tables CMT_GRADE_QR*clean_feed_trough / chisq;
run;

proc freq data = merged;
  tables CMT_GRADE_QL*clean_feed_trough / chisq;
run;

proc npar1way data=merged  wilcoxon;
class clean_feed_trough;
var SCC_QL;
run;

proc npar1way data=merged  wilcoxon;
class clean_feed_trough;
var SCC_QR;
run;
TITLE4;
ODS RTF CLOSE;
/*CMT with SCC to find correlation (if any) - 
then look at relation with pregnancy  (number of pregnancies), *Num_Parity_12_mths
lactation (current), *not sure how to determine this
number of kids, *Num_Kids_Nursing
environment cleanliness 
*/
