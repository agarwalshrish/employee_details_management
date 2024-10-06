EMPLOYEE_DETAILS: 

CREATE TABLE EMPLOYEE_DETAILS (EMP_ID NUMBER(5) PRIMARY KEY,EMP_NAME VARCHAR2(50) NOT NULL,DESIGNATION VARCHAR2(30),DEPARTMENT VARCHAR2(10),USERNAME VARCHAR2(10),PASSWORD VARCHAR2(10),EXECUTIVE_ID VARCHAR2(10));

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMP_ID                                    NOT NULL NUMBER(5)
 EMP_NAME                                  NOT NULL VARCHAR2(40)
 DESIGNATION                                        VARCHAR2(20)
 DEPARTMENT                                         VARCHAR2(10)
 USERNAME                                           VARCHAR2(10)
 PASSWORD                                           VARCHAR2(10)
 EXECUTIVE_ID                                       VARCHAR2(10)


PROPOSAL_TABLE:

CREATE TABLE PROPOSAL_TABLE (PROPOSAL_ID NUMBER(5) PRIMARY KEY,EMP_Id NUMBER(5) REFERENCES EMPLOYEE_DETAILS(EMP_ID),PROPOSAL_DATE DATE DEFAULT SYSDATE, PROPOSED_OUTCOME VARCHAR2(10),PROPOSED_DURATION VARCHAR2(10), HUMAN_RESOURCE NUMBER(10),PROPOSED_BUDGET NUMBER(10),STATUS VARCHAR2(10) DEFAULT 'PENDING', APPROVED_BY VARCHAR2(10),DATE_OF_APPROVAL DATE,REMARKS VARCHAR2(10),PROJECT_TITLE VARCHAR2(10));

ALTER TABLE PROPOSAL_TABLE
ADD CONSTRAINT PROJECT_TITLE UNIQUE (PROJECT_TITLE);

ALTER TABLE PROPOSAL_TABLE
ADD PROJECT_TITLE VARCHAR2(50);

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PROPOSAL_ID                               NOT NULL NUMBER(5)
 EMP_ID                                             NUMBER(5)
 PROPOSAL_DATE                                      DATE
 PROPOSED_OUTCOME                                   VARCHAR2(10)
 PROPOSED_DURATION                                  VARCHAR2(10)
 HUMAN_RESOURCE                                     NUMBER(10)
 PROPOSED_BUDGET                                    NUMBER(10)
 STATUS                                             VARCHAR2(10)
 APPROVED_BY                                        VARCHAR2(10)
 DATE_OF_APPROVAL                                   DATE
 REMARKS                                            VARCHAR2(10)
 PROJECT_TITLE                                      VARCHAR2(50)


HUMAN_RESOURCE:

CREATE TABLE HUMAN_RESOURCE (RESOURCE_ID NUMBER(5) PRIMARY KEY,PROJECT_ID NUMBER(10),EMP_ID NUMBER(5) REFERENCES EMPLOYEE_DETAILS(EMP_ID),ROLE_OF_EMP_PARTICULARPROJECT VARCHAR2(10),REMARKS VARCHAR2(10));

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 RESOURCE_ID                               NOT NULL NUMBER(5)
 PROJECT_ID                                         NUMBER(10)
 EMP_ID                                             NUMBER(5)
 ROLE_OF_EMP_PARTICULARPROJECT                      VARCHAR2(10)
 REMARKS                                            VARCHAR2(10)


PROJECT:

CREATE TABLE PROJECT(PROJECT_ID NUMBER(5) PRIMARY KEY, PROPOSAL_ID NUMBER(5) REFERENCES PROPOSAL_TABLE(PROPOSAL_ID),APPROVED_BUDGET NUMBER(10),APPROVED_DURATION VARCHAR2(10),STATUS VARCHAR2(10) DEFAULT 'ONGOING',PROJECT_START_DATE VARCHAR2(10));

ALTER TABLE PROJECT
ADD PROJECT_NAME VARCHAR2(50) REFERENCES PROPOSAL_TABLE(PROJECT_TITLE);

ALTER TABLE PROJECT
ADD PROJECT_START_DATE VARCHAR2(10);

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PROJECT_ID                                NOT NULL NUMBER(5)
 PROPOSAL_ID                                        NUMBER(5)
 APPROVED_BUDGET                                    NUMBER(10)
 APPROVED_DURATION                                  VARCHAR2(10)
 STATUS                                             VARCHAR2(10)
 PROJECT_START_DATE                                 VARCHAR2(10)
 PROJECT_NAME                                       VARCHAR2(10)


PROJECT_REVIEW:

CREATE TABLE PROJECT_REVIEW (REVIEW_ID NUMBER(10),PROJECT_ID NUMBER(5) REFERENCES PROJECT(PROJECT_ID),DATE_OF_REVIEW DATE,REVIEWED_BY NUMBER(5) REFERENCES EMPLOYEE_DETAILS(EMP_ID),COMMENT1 VARCHAR2(10),NEXT_REVIEW_DATE DATE,REMARKS VARCHAR2(10));

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 REVIEW_ID                                          NUMBER(10)
 PROJECT_ID                                         NUMBER(5)
 DATE_OF_REVIEW                                     DATE
 REVIEWED_BY                                        NUMBER(5)
 COMMENT1                                           VARCHAR2(10)
 NEXT_REVIEW_DATE                                   DATE
 REMARKS                                            VARCHAR2(10)


PAYMENT_REQUESTION :

CREATE TABLE PAYMENT_REQUESTION (PAYMENT_REQUEST_ID NUMBER(10) PRIMARY KEY,PROJECT_ID NUMBER(5) REFERENCES PROJECT(PROJECT_ID),DATE_OF_REQUEST DATE,AMOUNT NUMBER(10),DESCRIIPTION VARCHAR2(10),SEND_BY NUMBER(5) REFERENCES EMPLOYEE_DETAILS(EMP_ID),APPROVING_AUTHORITY NUMBER(10),STATUS VARCHAR2(10),EXPECTED_AUTHORITY NUMBER(10),EXPECTED_REMARKS VARCHAR2(10));

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_REQUEST_ID                        NOT NULL NUMBER(10)
 PROJECT_ID                                         NUMBER(5)
 DATE_OF_REQUEST                                    DATE
 AMOUNT                                             NUMBER(10)
 DESCRIIPTION                                       VARCHAR2(10)
 SEND_BY                                            NUMBER(5)
 APPROVING_AUTHORITY                                NUMBER(10)
 STATUS                                             VARCHAR2(10)
 EXPECTED_AUTHORITY                                 NUMBER(10)
 EXPECTED_REMARKS                                   VARCHAR2(10)


PAYMENT:

CREATE TABLE PAYMENT(PAYMENT_ID NUMBER(10) PRIMARY KEY,PAYMENT_REQUEST_ID NUMBER(10) REFERENCES PAYMENT_REQUESTION(PAYMENT_REQUEST_ID),DATE_OF_PAYMENT DATE,AMOUNT_OF_PAYMENT NUMBER(10),MODE_OF_PAYMENT VARCHAR2(10),PAYMENT_DESCRIPTION VARCHAR2(10));

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PAYMENT_ID                                NOT NULL NUMBER(10)
 PAYMENT_REQUEST_ID                                 NUMBER(10)
 DATE_OF_PAYMENT                                    DATE
 AMOUNT_OF_PAYMENT                                  NUMBER(10)
 MODE_OF_PAYMENT                                    VARCHAR2(10)
 PAYMENT_DESCRIPTION                                VARCHAR2(10)