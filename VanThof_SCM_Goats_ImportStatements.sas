/*===========================================================================================================
 Author: Elizabeth Orvek	
 Script Name: Import Statements for Tuft Vet School Project
 File Name: VanThof_SCM_Goats_ImportStatements.sas
 Project: SCM Goats Bangladesh
 PI: Chelsea Van Thof (Tufts Vet School)
 Create date: December 22, 2016
 
 Description: 
 This script creates two datasets:
1. Farms (for the owner/farm level data)
2. Goats (for the goat/sample level data)


**Prior to running the import statements I manually cleaned up the excel file
by removing blank columns and separating the farm level data from the goat level data.
The two datasets are saved as separate CSV files.

 Revision History: 
=============================================================================================================*/


*libname goats 'Z:\Tufts_Van_Thof\SAS_Files\Datasets';
                                                      
proc format;
value yesnof 1="No" 2="Yes" 3="Don't Know";
value occupationf 1="Businessman" 2="Farmer" 3="Student" 4="Housewife" 5="Rickshaw Driver" 6="Gatekeeper";
value educationf 2="Primary School Completed" 3="Secondary School Completed" 4="High School Completed";
value vill_wardf 1="foys lake" 2="jalalabad" 3="high level road" 4="tigerpass";
value upazillaf 1="Khulshi" 2="Pahartoli" 3="Double Mooring" 4="Ambogan";
value distf 1="Chittagong";
value animal_sourcef 1="Farm Born" 2="Bought" 3="Both Farm Born and Bought";
value breedf 1="Local" 2="BBG" 3="Jamnapari" 4="Cross" 5="Others";
value $rearingf 1="IntRearSys" 2="SemIntRearSys" 3="TethRearSys" 4="FreeSameHouseRearSys" 5="FreeSepHouseRearSys"
					6="OtherRearSys";
value speciesf 1="Sheep" 2="Poultry" 3="Cattle" 4="Other";
value $floorf 1="wood" 2="straw" 3="concrete" 4="mud";
value cleanlinessf 1="Clean" 2="Not Clean";
value clean_materialsf 1="ash" 2="sand" 3="water" 4="detergent" 5="soap" 6="other";
value agree5f 1="strongly disagree" 2="disagree" 3="neutral" 4="agree" 5="strongly agree";
value precautionf 1="gloves" 2="towel" 3="face mask" 4="wash hands between goats" 5="other";
value transportf 1="walk" 2="rickshaw" 3="taxi" 4="multiple ways" 5="other";
value $colorf 1="Black" 2="Brown" 3="Brown-Black" 4="Red" 5="Black and White";
value breedingf 1="Natural" 2="AI";
value practicesf 1="iodine dip" 2="tail docking" 3="ear tagging" 4="other" 5="NA";
value treatmentf 1="Natural Remedy" 2="Medication";
value $diseasesf 1="pregnancy toxemia" 2="periparturient hypocalcemia" 3="lactation tetany" 
			4="lactational ketosis" 5="lactic acidosis" 6="other";
value $drugf 1="antibiotic";
value give_treatf 1="home remedy" 2="neighbor/friend" 3="veterinarian" 4="other";
value $treatment_helpf 1="Vet" 2="VFA" 3="Self" 4="Neighbor";
run;




data WORK.FARMS    ;
     %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
     infile 'Z:\Tufts_Van_Thof\Farm_Dataset_For_upload.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
        informat Farm_ID $4. ;
        informat Owner_Age best32. ;
        informat Occupation best32. ;
        informat Education best32. ;
        informat Vill_ward best32. ;
        informat Upazilla best32. ;
        informat Dist best32. ;
        informat Source_of_Animals best32. ;
        informat Breeds_Reared best32. ;
        informat Farm_size best32. ;
        informat Num_Does best32. ;
        informat Num_Bucks best32. ;
        informat Num_Kids best32. ;
        informat Num_Pregnant_animal best32. ;
        informat Num_parity best32. ;
        informat Num_Lactating_animal best32. ;
        informat Lactation_Stage best32. ;
        informat Rearing_System $5. ;
        informat Goats_Live_w_Oth_Species best32. ;
        informat Live_w_Oth_Species_Which best32. ;
        informat Grass best32. ;
        informat Concentrate best32. ;
        informat Other_roughage best32. ;
        informat Jackfruit best32. ;
        informat Other best32. ;
        informat Goats_Eat_w_oth_Species best32. ;
        informat Flooring_material $5. ;
        informat Dirt_score_for_muddiness best32. ;
        informat Dirt_score_for_feces best32. ;
        informat Cleaning_Freq_floor best32. ;
        informat Cleaning_Freq_feeding_trough best32. ;
        informat Cleanliness_feeding_trough best32. ;
        informat No_of_animals_per_square_meter best32. ;
        informat cleaning_materials best32. ;
        informat SCM_threat_to_Lactating_Goat best32. ;
        informat SCM_threat_to_nursing_goat best32. ;
        informat CM_threat_to_lactating_goat best32. ;
        informat CM_threat_to_kid best32. ;
        informat Mastitis_cant_be_prevented best32. ;
        informat disease_from_sick_goat best32. ;
        informat mastitis_from_sick_goat best32. ;
        informat can_mastitis_be_spread best32. ;
        informat take_precautions best32. ;
        informat antimicrobials best32. ;
        informat freq_treatment best32. ;
        informat antiparasitic best32. ;
        informat antifungal best32. ;
        informat vaccine best32. ;
        informat oth_treatment best32. ;
        informat treatment_freq_per_wk best32. ;
        informat live_market best32. ;
        informat cattle_live_market best32. ;
        informat poultry_live_market best32. ;
        informat transport_to_live_market best32. ;
        informat transport_w_owned_animals best32. ;
        informat transport_w_owned_sheep best32. ;
        informat transport_w_owned_cattle best32. ;
        informat transport_w_owned_goats best32. ;
        informat transport_w_outside_animals best32. ;
        informat transport_w_outside_sheep best32. ;
        informat transport_w_outside_cattle best32. ;
        informat transport_w_outside_goats best32. ;
        format Farm_ID $4. ;
        format Owner_Age best12. ;
        format Occupation best12. ;
        format Education best12. ;
        format Vill_ward best12. ;
        format Upazilla best12. ;
        format Dist best12. ;
        format Source_of_Animals best12. ;
        format Breeds_Reared best12. ;
        format Farm_size best12. ;
        format Num_Does best12. ;
        format Num_Bucks best12. ;
        format Num_Kids best12. ;
        format Num_Pregnant_animal best12. ;
        format Num_parity best12. ;
        format Num_Lactating_animal best12. ;
        format Lactation_Stage best12. ;
        format Rearing_System $5. ;
        format Goats_Live_w_Oth_Species best12. ;
        format Live_w_Oth_Species_Which best12. ;
        format Grass best12. ;
        format Concentrate best12. ;
        format Other_roughage best12. ;
        format Jackfruit best12. ;
        format Other best12. ;
        format Goats_Eat_w_oth_Species best12. ;
        format Flooring_material $5. ;
        format Dirt_score_for_muddiness best12. ;
        format Dirt_score_for_feces best12. ;
        format Cleaning_Freq_floor best12. ;
        format Cleaning_Freq_feeding_trough best12. ;
        format clean_feed_trough best12. ;
        format No_of_animals_per_square_meter best12. ;
        format cleaning_materials best12. ;
        format SCM_threat_to_Lactating_Goat best12. ;
        format SCM_threat_to_nursing_goat best12. ;
        format CM_threat_to_lactating_goat best12. ;
        format CM_threat_to_kid best12. ;
        format Mastitis_cant_be_prevented best12. ;
        format disease_from_sick_goat best12. ;
        format mastitis_from_sick_goat best12. ;
        format can_mastitis_be_spread best12. ;
        format take_precautions best12. ;
        format antimicrobials best12. ;
        format freq_treatment best12. ;
        format antiparasitic best12. ;
        format antifungal best12. ;
        format vaccine best12. ;
        format oth_treatment best12. ;
        format treatment_freq_per_wk best12. ;
        format live_market best12. ;
        format cattle_live_market best12. ;
        format poultry_live_market best12. ;
        format transport_to_live_market best12. ;
        format transport_w_owned_animals best12. ;
        format transport_w_owned_sheep best12. ;
        format transport_w_owned_cattle best12. ;
        format transport_w_owned_goats best12. ;
        format transport_w_outside_animals best12. ;
        format transport_w_outside_sheep best12. ;
        format transport_w_outside_cattle best12. ;
        format transport_w_outside_goats best12. ;
     input
                 Farm_ID $
                 Owner_Age
                 Occupation
                 Education
                 Vill_ward
                 Upazilla
                 Dist
                 Source_of_Animals
                 Breeds_Reared
                 Farm_size
                 Num_Does
                 Num_Bucks
                 Num_Kids
                 Num_Pregnant_animal
                 Num_parity
                 Num_Lactating_animal
                 Lactation_Stage
                 Rearing_System $
                 Goats_Live_w_Oth_Species
                 Live_w_Oth_Species_Which
                 Grass
                 Concentrate
                 Other_roughage
                 Jackfruit
                 Other
                 Goats_Eat_w_oth_Species
                 Flooring_material $
                 Dirt_score_for_muddiness
                 Dirt_score_for_feces
                 Cleaning_Freq_floor
                 Cleaning_Freq_feeding_trough
                 clean_feed_trough
                 No_of_animals_per_square_meter
                 cleaning_materials
                 SCM_threat_to_Lactating_Goat
                 SCM_threat_to_nursing_goat
                 CM_threat_to_lactating_goat
                 CM_threat_to_kid
                 Mastitis_cant_be_prevented
                 disease_from_sick_goat
                 mastitis_from_sick_goat
                 can_mastitis_be_spread
                 take_precautions
                 antimicrobials
                 freq_treatment
                 antiparasitic
                 antifungal
                 vaccine
                 oth_treatment
                 treatment_freq_per_wk
                 live_market
                 cattle_live_market
                 poultry_live_market
                 transport_to_live_market
                 transport_w_owned_animals
                 transport_w_owned_sheep
                 transport_w_owned_cattle
                 transport_w_owned_goats
                 transport_w_outside_animals
                 transport_w_outside_sheep
                 transport_w_outside_cattle
                 transport_w_outside_goats
     ;
     if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
     run;

data farms;
set farms;
format occupation occupationf.;
format education educationf.;
format vill_ward vill_wardf.;
format upazilla upazillaf.;
format dist distf.;
format source_of_animals animal_sourcef.;
format breeds_reared breedf.;
format rearing_system rearingf.;
format Goats_Live_w_Oth_Species Grass Concentrate Other_roughage Jackfruit Other 
Goats_Eat_w_oth_Species disease_from_sick_goat mastitis_from_sick_goat 
can_mastitis_be_spread take_precautions
antimicrobials antiparasitic antifungal vaccine oth_treatment 
live_market cattle_live_market poultry_live_market
transport_w_owned_animals transport_w_owned_sheep transport_w_owned_cattle
transport_w_owned_goats
transport_w_outside_animals transport_w_outside_sheep transport_w_outside_cattle
transport_w_outside_goats
yesnof.;
format Live_w_Oth_Species_Which speciesf.;
format flooring_material floorf.;
format clean_feed_trough cleanlinessf.;
format cleaning_materials clean_materialsf.;
format Mastitis_cant_be_prevented agree5f.;
format transport_to_live_market transportf.;
LABEL
Farm_ID="Farm ID"
Owner_Age="Age of Owner (Years)"
Occupation="Owner Occupation"
Education="Education Level"
Vill_ward="Vill/Ward"
Upazilla="Upazilla"
Dist="Dist"
Source_of_Animals="Source of Animals"
Breeds_Reared="Types of Breeds Reared"
Farm_size="Farm Size"
Num_Does="Number of Adult Does"
Num_Bucks="Number of Adult Bucks"
Num_Kids="Number of Goat Kids"
Num_Pregnant_animal="Number of Pregnant Animals"
Num_parity="Number of Parity"
Num_Lactating_animal="Number of Lactating Animals"
Lactation_Stage="Stage of Lactation (Weeks)"
Rearing_System="Rearing System"
Goats_Live_w_Oth_Species="Do your goats live with other species?"
Live_w_Oth_Species_Which="If Yes, Which Other Species (do they live with)"
Grass="Grass"
Concentrate="Concentrate"
Other_roughage="Other Roughage"
Jackfruit="Jackfruit"
Other="Other (food?)"
Goats_Eat_w_oth_Species="Do your goats eat with other species?"
Flooring_material="Flooring Material"
Dirt_score_for_muddiness="Dirt Score for Muddiness"
Dirt_score_for_feces="Dirt Score for Feces"
Cleaning_Freq_floor="Cleaning Frequency of the Floor (per day)"
Cleaning_Freq_feeding_trough="Cleaning Frequency of the Feeding Trough (per day)"
clean_feed_trough="Cleanlines of the Feeding Trough"
No_of_animals_per_square_meter="Number of Animals per Square Meter"
cleaning_materials="Cleaning Materials Used"
SCM_threat_to_Lactating_Goat="SCM Threat to Health of Lactating Goat"
SCM_threat_to_nursing_goat="SCM Threat to Health of Nursing Goat"
CM_threat_to_lactating_goat="CM Threat to Health of Lactating Goat"
CM_threat_to_kid="CM Threat to Health of Kid"
Mastitis_cant_be_prevented="Mastitis Cannot be Prevented in Lactating Goat"
disease_from_sick_goat="Contracting disease from sick goat"
mastitis_from_sick_goat="Contracting mastitis from effected goat"
can_mastitis_be_spread="Can mastitis be spread from one goat to other goats"
take_precautions="Do you take precautions when handling sick goat"	
/*what precautions*/
antimicrobials="Antimicrobials"
freq_treatment="How often have you used these treatments?"
antiparasitic="Antiparasitic"
antifungal="Antifungal"
vaccine="Vaccine"
oth_treatment="Other Treatment"
treatment_freq_per_wk="How often (per week)"
live_market="Do you take your goats to the live goat market?"
cattle_live_market="Exposure to cattle at the live goat market" 
poultry_live_market="Exposure to poultry at live goat market"
transport_to_live_market="How do you transport your goats to the live goat market?"
transport_w_owned_animals="Are goats transported with other animals from your farm?"
transport_w_owned_sheep="Are goats transported with other Sheep from your farm?"
transport_w_owned_cattle="Are goats transported with other Cattle from your farm?"
transport_w_owned_goats="Are goats transported with other Goats from your farm?"
transport_w_outside_animals="Are goats transported with other animals from outside your farm?"
transport_w_outside_sheep="Are goats transported with sheep from outside your farm?"
transport_w_outside_cattle="Are goats transported with cattle from outside your farm?"
transport_w_outside_goats="Are goats transported with goats from outside your farm?";
run;


****IMPORTING THE GOAT/SAMPLE LEVEL DATA****;
data WORK.GOATS    ;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile 'Z:\Tufts_Van_Thof\Goat_Dataset_For_upload.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
      informat Sample_ID $6. ;
      informat Farm_ID $4. ;
      informat Goat_ID $2. ;
      informat Age_mths best32. ;
      informat Body_weight best32. ;
      informat BCS best32. ;
      informat Color $7. ;
      informat Breed best32. ;
      informat Type_of_Breeding best32. ;
      informat Date_Last_Parturition mmddyy10. ;
      informat Num_Parity_12_mths best32. ;
      informat Practices best32. ;
      informat Days_in_milk_1st_partuition best32. ;
      informat days_in_milk_2nd_partuition best32. ;
      informat Rectal_Temp best32. ;
      informat Nurse_Non_Bio_Kids best32. ;
      informat Num_Kids_Nursing best32. ;
      informat Time_To_Breed_Again best32. ;
      informat Signs_mastitis_hot_udder best32. ;
      informat Signs_mastitis_swollen_udder best32. ;
      informat Signs_mast_painful best32. ;
      informat Signs_mastitis_other best32. ;
      informat Prior_Med_for_Current_illness best32. ;
      informat What_Prior_Med $1. ;
      informat Previous_history_of_mastitis best32. ;
      informat date_prior_mastitis mmddyy10. ;
      informat Treatment_for_mastitis best32. ;
      informat periparturient_disease best32. ;
      informat what_periparturient_disease $1. ;
      informat treatment_periparturient_disease $1. ;
      informat who_gives_treatment best32. ;
      informat History_of_udder_edema best32. ;
      informat who_helps_treatment $7. ;
      informat Udder_cleanliness best32. ;
      informat Thigh_cleanliness best32. ;
      informat Leg_cleanliness best32. ;
      informat Body_Length best32. ;
      informat Body_Height best32. ;
      informat Body_Width best32. ;
      informat Sample_ID_QR $8. ;
      informat Sample_ID_QL $8. ;
      informat CMT_GRADE_QR best32. ;
      informat CMT_GRADE_QL best32. ;
       informat SCC_QR best32. ;
       informat SCC_QL best32. ;
       informat Date $10. ;
       informat Dx_QR $20. ;
       informat Dx_QL $20. ;
       informat CNS best32. ;
       informat STREP best32. ;
       informat S_AUREUS best32. ;
       informat PSEUDO best32. ;
       informat KLEBS best32. ;
       format Sample_ID $6. ;
       format Farm_ID $4. ;
       format Goat_ID $2. ;
       format Age_mths best12. ;
       format Body_weight best12. ;
       format BCS best12. ;
       format Color $7. ;
       format Breed best12. ;
       format Type_of_Breeding best12. ;
       format Date_Last_Parturition mmddyy10. ;
       format Num_Parity_12_mths best12. ;
       format Practices best12. ;
       format Days_in_milk_1st_partuition best12. ;
       format days_in_milk_2nd_partuition best12. ;
       format Rectal_Temp best12. ;
       format Nurse_Non_Bio_Kids best12. ;
       format Num_Kids_Nursing best12. ;
       format Time_To_Breed_Again best12. ;
       format Signs_mastitis_hot_udder best12. ;
       format Signs_mastitis_swollen_udder best12. ;
       format Signs_mast_painful best12. ;
       format Signs_mastitis_other best12. ;
       format Prior_Med_for_Current_illness best12. ;
       format What_Prior_Med $1. ;
       format Previous_history_of_mastitis best12. ;
       format date_prior_mastitis mmddyy10. ;
       format Treatment_for_mastitis best12. ;
       format periparturient_disease best12. ;
       format what_periparturient_disease $1. ;
       format treatment_periparturient_disease $1. ;
       format who_gives_treatment best12. ;
       format History_of_udder_edema best12. ;
       format who_helps_treatment $7. ;
       format Udder_cleanliness best12. ;
       format Thigh_cleanliness best12. ;
       format Leg_cleanliness best12. ;
       format Body_Length best12. ;
       format Body_Height best12. ;
       format Body_Width best12. ;
       format Sample_ID_QR $8. ;
       format Sample_ID_QL $8. ;
       format CMT_GRADE_QR best12. ;
       format CMT_GRADE_QL best12. ;
       format SCC_QR best12. ;
       format SCC_QL best12. ;
       format Date $10. ;
       format Dx_QR $20. ;
       format Dx_QL $20. ;
       format CNS best12. ;
       format STREP best12. ;
       format S_AUREUS best12. ;
       format PSEUDO best12. ;
       format KLEBS best12. ;
    input
                Sample_ID $
                Farm_ID $
                Goat_ID $
                Age_mths
                Body_weight
                BCS
                Color $
                Breed
                Type_of_Breeding
                Date_Last_Parturition
                Num_Parity_12_mths
                Practices
                Days_in_milk_1st_partuition
                days_in_milk_2nd_partuition
                Rectal_Temp
                Nurse_Non_Bio_Kids
                Num_Kids_Nursing
                Time_To_Breed_Again
                Signs_mastitis_hot_udder
                Signs_mastitis_swollen_udder
                Signs_mast_painful
                Signs_mastitis_other
                Prior_Med_for_Current_illness
                What_Prior_Med $
                Previous_history_of_mastitis
                date_prior_mastitis
                Treatment_for_mastitis
                periparturient_disease
                what_periparturient_disease $
                treatment_periparturient_disease $
                who_gives_treatment
                History_of_udder_edema
                who_helps_treatment $
                Udder_cleanliness
                Thigh_cleanliness
                Leg_cleanliness
                Body_Length
                Body_Height
                Body_Width
                Sample_ID_QR $
                Sample_ID_QL $
                CMT_GRADE_QR
                CMT_GRADE_QL
                SCC_QR
                SCC_QL
                Date $
                Dx_QR $
                Dx_QL $
                CNS
                STREP
                S_AUREUS
                PSEUDO
                KLEBS
    ;
    if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
    run;

data goats;
set goats;

LABEL
Sample_ID="Sample (Farm+Goat) ID"
Farm_ID="Farm ID"
Goat_ID="Goat ID"
Age_mths="Age of Goat (Months)"
Body_weight="Body Weight"
BCS="BCS"
Color="Color"
Breed="Bread"
Type_of_Breeding="Type of Breeding"
Date_Last_Parturition="Date of Parturition (Last 12 Months)"
Num_Parity_12_mths="Number of Parity in Last 12 Months"
Practices="Practices performed at time of partuition"
Days_in_milk_1st_partuition="Days in Milk 1st Partuition"
days_in_milk_2nd_partuition="Days in Milk 2nd Partuition"
Rectal_Temp="Rectal Temp (F)"
Nurse_Non_Bio_Kids="Do non-biological kids nurse from the same goat or multiple goats?"
Num_Kids_Nursing="how many kids nurse from one goat?"
Time_To_Breed_Again="How soon after a kid is weaned is the doe bred again (days)?"
Signs_mastitis_hot_udder="Signs mastitis hot udder"
Signs_mastitis_swollen_udder="Signs mastitis swollen udder"
Signs_mast_painful="Signs mast painful"
Signs_mastitis_other="Signs mastitis other"
Prior_Med_for_Current_illness="Any previous medication used to treat current illness?"
What_Prior_Med="If yes, which drug used?"
Previous_history_of_mastitis="Previous history of mastitis"
date_prior_mastitis="Date of Previous Mastitis"
Treatment_for_mastitis="Treatment of Previous Mastitis"
periparturient_disease="History of periparturient disease"
what_periparturient_disease="What periparturient diseases?"
treatment_periparturient_disease="Drugs used for periparturient diseases"
who_gives_treatment="Who gives your treatments?"
History_of_udder_edema="History of udder edema"
who_helps_treatment="Treatment of animal by the help of"
Udder_cleanliness="Udder cleanliness"
Thigh_cleanliness="Thigh cleanliness"
Leg_cleanliness="Leg cleanliness"
Body_Length="Body Length"
Body_Height="Body Height"
Body_Width="Body Width"
Sample_ID_QR="Sample ID Right Quarter"
Sample_ID_QL="Sample ID Left Quarter"
CMT_GRADE_QR="CMT Grading Right Quarter"
CMT_GRADE_QL="CMT Grading Left Quarter"
SCC_QR="Somatic Cell Count (SCC) Right Quarter"
SCC_QL="Somatic Cell Count (SCC) Left Quarter"
Date="Sample Date"
Dx_QR="Combined Diagnosis Right Quarter"
Dx_QL="Combined Diagnosis Left Quarter"
CNS="CNS"
STREP="Streptococcus"
S_AUREUS="St. Aureus"
PSEUDO="Pseudomonas"
KLEBS="Klebsiella";

format Color colorf.;
format Breed breedf.;
format Type_of_Breeding breedingf.;
format Practices practicesf.;

format Nurse_Non_Bio_Kids
Signs_mastitis_hot_udder
Signs_mastitis_swollen_udder
Signs_mast_painful
Signs_mastitis_other
Prior_Med_for_Current_illness
Previous_history_of_mastitis
Treatment_for_mastitis
periparturient_disease
History_of_udder_edema
yesnof.;

format what_periparturient_disease diseasesf.;
format treatment_periparturient_disease drugf.;
format who_gives_treatment give_treatf.;
format who_helps_treatment treatment_helpf.;
RUN;
