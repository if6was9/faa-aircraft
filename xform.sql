### MODEL

drop table if exists acftref;
create table acftref as select * from 'temp/acftref.csv';


alter table acftref rename "TYPE-ACFT" to TYPE_ACFT;
alter table acftref rename "TYPE-ENG" to TYPE_ENG;
alter table acftref rename "AC-CAT" to AC_CAT;
alter table acftref rename "BUILD-CERT-IND" to BUILD_CERT_IND;
alter table acftref rename "NO-ENG" to NO_ENG;
alter table acftref rename "NO-SEATS" to NO_SEATS;
alter table acftref rename "AC-WEIGHT" to AC_WEIGHT;
alter table acftref rename "TC-DATA-SHEET" to TC_DATA_SHEET;
alter table acftref rename "TC-DATA-HOLDER" to TC_DATA_HOLDER;
alter table acftref drop column column13;


update acftref set 
TC_DATA_SHEET=trim(TC_DATA_SHEET),
TC_DATA_HOLDER=trim(TC_DATA_HOLDER),
MFR=trim(MFR),
MODEL=trim(model);

update acftref set MFR=trim(mfr);
update acftref set TC_DATA_SHEET=null where TC_DATA_SHEET='';

alter table acftref rename NO_SEATS to TMP;
alter table acftref add column NO_SEATS int;
update acftref set NO_SEATS=cast(TMP as int);
alter table acftref drop column TMP;


alter table acftref rename SPEED to SPEED_X;
alter table acftref add column SPEED int;
update acftref set SPEED=cast(speed_x as int);
alter table acftref drop column SPEED_X;

alter table acftref rename NO_ENG to NO_ENG_X;
alter table acftref add column NO_ENG int;
update acftref set NO_ENG=cast(NO_ENG_X as int);
alter table acftref drop column NO_ENG_X;





##### RESERVED
drop table if exists reserved;
create table reserved as select * from 'temp/reserved.csv';
alter table reserved drop column column12;

## N-NUMBER,REGISTRANT,STREET,STREET2,CITY,STATE,ZIP CODE,RSV DATE,TR,EXP DATE,N-NUM-CHG,PURGE DATE

alter table reserved rename "N-NUMBER" to N_NUMBER;
alter table reserved rename "ZIP CODE" to ZIP_CODE;
alter table reserved rename "RSV DATE" to RSV_DATE;
alter table reserved rename "EXP DATE" to EXP_DATE;
alter table reserved rename "PURGE DATE" to PURGE_DATE;
alter table reserved rename "N-NUM-CHG" to N_NUM_CHG;

update reserved set N_NUMBER=trim(upper(N_NUMBER)),
REGISTRANT=trim(registrant),
STREET=trim(STREET),
STREET2=trim(STREET2),
CITY=trim(city),
STATE=trim(STATE),
ZIP_CODE=trim(ZIP_CODE),
N_NUM_CHG=trim(N_NUM_CHG),
TR=trim(TR),
EXP_DATE=trim(EXP_DATE);

update reserved set N_NUMBER=concat('N',N_NUMBER) where N_NUMBER is not null and N_NUMBER not like 'N%';

########
######## ENGINE
########

drop table if exists engine;
create table engine as select * from 'temp/engine.csv';


alter table engine rename HORSEPOWER to HP;
alter table engine add column HORSEPOWER int;
update engine set HORSEPOWER=cast(HP as int);
alter table engine drop column HP;

alter table engine rename THRUST to TMP;
alter table engine add column THRUST int;
update engine set THRUST=cast(TMP as int);
alter table engine drop column tmp;

update engine set MFR=trim(mfr),MODEL=trim(model),TYPE=trim(type);



#### 
#### master
####






drop table if exists master;
create table master as select * from 'temp/master.csv';
alter table master drop column column34;
alter table master rename "N-NUMBER" to N_NUMBER;
alter table master rename "SERIAL NUMBER" to SERIAL_NUMBER;
alter table master rename "MFR MDL CODE" to MFR_MDL_CODE;
alter table master rename "ENG MFR MDL" to ENG_MFR_MDL;
alter table master rename "YEAR MFR" to YEAR_MFR;
alter table master rename "TYPE REGISTRANT" to TYPE_REGISTRANT;
alter table master rename "ZIP CODE" to ZIP_CODE;
alter table master rename "LAST ACTION DATE" to LAST_ACTION_DATE;
alter table master rename "CERT ISSUE DATE" to CERT_ISSUE_DATE;
alter table master rename "TYPE AIRCRAFT" to TYPE_AIRCRAFT;
alter table master rename "TYPE ENGINE" to TYPE_ENGINE;
alter table master rename "STATUS CODE" to STATUS_CODE;
alter table master rename "MODE S CODE" to MODE_S_CODE;
alter table master rename "FRACT OWNER" to FRACT_OWNER;
alter table master rename "AIR WORTH DATE" to AIR_WORTH_DATE;
alter table master rename "OTHER NAMES(1)" to OTHER_NAMES_1;
alter table master rename "OTHER NAMES(2)" to OTHER_NAMES_2;
alter table master rename "OTHER NAMES(3)" to OTHER_NAMES_3;
alter table master rename "OTHER NAMES(4)" to OTHER_NAMES_4;
alter table master rename "OTHER NAMES(5)" to OTHER_NAMES_5;
alter table master rename "EXPIRATION DATE" to EXPIRATION_DATE;
alter table master rename "UNIQUE ID" to UNIQUE_ID;
alter table master rename "KIT MFR" to KIT_MFR;
alter table master rename "KIT MODEL" to KIT_MODEL;
alter table master rename "MODE S CODE HEX" to MODE_S_CODE_HEX;


update master set N_NUMBER=trim(N_NUMBER),
    SERIAL_NUMBER=trim(SERIAL_NUMBER),
    NAME=trim(NAME),
    MFR_MDL_CODE=trim(MFR_MDL_CODE),
    ENG_MFR_MDL = trim(ENG_MFR_MDL),
    STREET=trim(STREET),
    STREET2=trim(STREET2),
    OTHER_NAMES_1=trim(OTHER_NAMES_1),
        OTHER_NAMES_2=trim(OTHER_NAMES_2),
            OTHER_NAMES_3=trim(OTHER_NAMES_3),
                OTHER_NAMES_4=trim(OTHER_NAMES_4),
                    OTHER_NAMES_5=trim(OTHER_NAMES_5),
                    CERTIFICATION=trim(CERTIFICATION),
 AIR_WORTH_DATE=trim(AIR_WORTH_DATE),
    KIT_MFR=trim(KIT_MFR),
    KIT_MODEL=trim(KIT_MODEL),
    MODE_S_CODE_HEX=trim(MODE_S_CODE_HEX),
    CITY=trim(CITY),
    ZIP_CODE=trim(ZIP_CODE),
      STATUS_CODE=trim(STATUS_CODE),
      REGION=trim(REGION),
      FRACT_OWNER=trim(FRACT_OWNER),
      YEAR_MFR=trim(YEAR_MFR)
    ;


update MASTER set N_NUMBER=concat('N',N_NUMBER) where N_NUMBER is not null and N_NUMBER not like 'N%';


