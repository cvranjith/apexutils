CREATE TABLE  "OSSA" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"PA_NUMBER" NUMBER, 
	"CUSTOMER_NAME" VARCHAR2(255), 
	"PROJECT_TITLE" VARCHAR2(255), 
	"DIVISION" VARCHAR2(50), 
	"SUB_1" VARCHAR2(50), 
	"SUB_2" VARCHAR2(50), 
	"SUB_3" VARCHAR2(50), 
	"PA_STATUS" VARCHAR2(50), 
	"PROJECT_TYPE" VARCHAR2(50), 
	"OSSA_STATUS" VARCHAR2(50), 
	"ATTESTATION_STATUS" VARCHAR2(50), 
	"ATTESTATION_UPDATED" DATE, 
	"NEXT_ATTESTATION_DATE" DATE, 
	"GPS_WATCHLIST" VARCHAR2(1), 
	"DIVISION_WATCHLIST" VARCHAR2(50), 
	"PROJECT_MANAGER" VARCHAR2(255), 
	"CSS_ASSIGNED" VARCHAR2(255), 
	"CSL" VARCHAR2(50), 
	"CSS" VARCHAR2(50), 
	"SECURITY_EDUCATION" VARCHAR2(50), 
	"SECURITY_EDUCATION_COMMENT" VARCHAR2(255), 
	"MALWARE_PREVENTION" VARCHAR2(50), 
	"MALWARE_PREVENTION_COMMENT" VARCHAR2(4000), 
	"THIRD_PARTY_DEPENDENCIES" VARCHAR2(50), 
	"THIRD_PARTY_DEPENDENCIES_CO" VARCHAR2(4000), 
	"SECURE_DESIGN" VARCHAR2(50), 
	"SECURE_DESIGN_COMMENT" VARCHAR2(4000), 
	"SECURE_CONFIGURATION" VARCHAR2(50), 
	"SECURE_CONFIGURATION_COMMEN" VARCHAR2(4000), 
	"SECURE_CODING_STANDARDS" VARCHAR2(50), 
	"SECURE_CODING_STANDARDS_COM" VARCHAR2(4000), 
	"STATIC_SOURCE_CODE_ANALYSIS" VARCHAR2(50), 
	"STATIC_SOURCE_CODE_ANALYSIS2" VARCHAR2(4000), 
	"SECURITY_TESTING" VARCHAR2(50), 
	"SECURITY_TESTING_COMMENT" VARCHAR2(4000), 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/