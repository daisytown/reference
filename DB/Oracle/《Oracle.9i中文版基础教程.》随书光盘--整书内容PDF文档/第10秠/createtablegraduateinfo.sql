CREATE TABLE "GRADUATEUSER"."GRADUATE_INFO" ("ID" NUMBER(10) NOT 
    NULL, "NAME" VARCHAR2(10) NOT NULL, "SEX" VARCHAR2(2) NOT 
    NULL, "TYPE" VARCHAR2(10) NOT NULL, "BIRTHDAY" DATE NOT NULL,
    "CLASSNO" NUMBER(6) NOT NULL, "MAJOR" VARCHAR2(30) NOT NULL,
    "DIRECTOR" VARCHAR2(10) NOT NULL, "SOURCE" VARCHAR2(50) NOT 
    NULL, 
    CONSTRAINT "研究生学号主码" PRIMARY KEY("ID"))  
    TABLESPACE "USERS" 