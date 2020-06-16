CREATE OR REPLACE FORCE EDITIONABLE VIEW  "VW_OSSA_CSS" ("CSS_1", "CSS_2", "R", "R1", "R2", "R3", "ID", "PA_NUMBER", "CUSTOMER_NAME", "PROJECT_TITLE", "DIVISION", "SUB_1", "SUB_2", "SUB_3", "PA_STATUS", "PROJECT_TYPE", "OSSA_STATUS", "ATTESTATION_STATUS", "ATTESTATION_UPDATED", "NEXT_ATTESTATION_DATE", "GPS_WATCHLIST", "DIVISION_WATCHLIST", "PROJECT_MANAGER", "CSS_ASSIGNED", "CSL", "CSS", "SECURITY_EDUCATION", "SECURITY_EDUCATION_COMMENT", "MALWARE_PREVENTION", "MALWARE_PREVENTION_COMMENT", "THIRD_PARTY_DEPENDENCIES", "THIRD_PARTY_DEPENDENCIES_CO", "SECURE_DESIGN", "SECURE_DESIGN_COMMENT", "SECURE_CONFIGURATION", "SECURE_CONFIGURATION_COMMEN", "SECURE_CODING_STANDARDS", "SECURE_CODING_STANDARDS_COM", "STATIC_SOURCE_CODE_ANALYSIS", "STATIC_SOURCE_CODE_ANALYSIS2", "SECURITY_TESTING", "SECURITY_TESTING_COMMENT") AS 
  select "CSS_1","CSS_2","R","R1","R2","R3","ID","PA_NUMBER","CUSTOMER_NAME","PROJECT_TITLE","DIVISION","SUB_1","SUB_2","SUB_3","PA_STATUS","PROJECT_TYPE","OSSA_STATUS","ATTESTATION_STATUS","ATTESTATION_UPDATED","NEXT_ATTESTATION_DATE","GPS_WATCHLIST","DIVISION_WATCHLIST","PROJECT_MANAGER","CSS_ASSIGNED","CSL","CSS","SECURITY_EDUCATION","SECURITY_EDUCATION_COMMENT","MALWARE_PREVENTION","MALWARE_PREVENTION_COMMENT","THIRD_PARTY_DEPENDENCIES","THIRD_PARTY_DEPENDENCIES_CO","SECURE_DESIGN","SECURE_DESIGN_COMMENT","SECURE_CONFIGURATION","SECURE_CONFIGURATION_COMMEN","SECURE_CODING_STANDARDS","SECURE_CODING_STANDARDS_COM","STATIC_SOURCE_CODE_ANALYSIS","STATIC_SOURCE_CODE_ANALYSIS2","SECURITY_TESTING","SECURITY_TESTING_COMMENT" from
(
select 
    case when r = 1 and r2=0
    then
       CSS_ASSIGNED
    else 
    ltrim(substr(replace(';'||CSS_ASSIGNED,' ')||';',r3+1, r1-r3 ),';')
    end css_1,    
    a.* from 
(
select replace(CSS_ASSIGNED,' ')||';' css_2,  
    r,
instr(replace(CSS_ASSIGNED,' ')||';',';',1,r) r1,
    instr(replace(CSS_ASSIGNED,' ')||';',';',1,r+1) r2,
    case when r > 1 then
    instr(replace(CSS_ASSIGNED,' ')||';',';',1,r-1) 
    else
      1
    end r3,
    ossa.*
from ossa, (select rownum r from dual connect by level < 7)
) a where r1 > 0
)
/
