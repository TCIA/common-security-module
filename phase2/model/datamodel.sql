USE csd;



--  Drop Tables 
DROP TABLE IF EXISTS APPLICATION
;

DROP TABLE IF EXISTS GROUPS
;

DROP TABLE IF EXISTS PRIVILEGE
;

DROP TABLE IF EXISTS PROTECTION_ELEMENT
;

DROP TABLE IF EXISTS PROTECTION_GROUP
;

DROP TABLE IF EXISTS PROTECTION_GROUP_PROTECTION_ELEMENT
;

DROP TABLE IF EXISTS ROLE
;

DROP TABLE IF EXISTS ROLE_PRIVILEGE
;

DROP TABLE IF EXISTS USER
;

DROP TABLE IF EXISTS USER_GROUP
;

DROP TABLE IF EXISTS USER_GROUP_ROLE_PROTECTION_GROUP
;

DROP TABLE IF EXISTS USER_PROTECTION_ELEMENT
;


--  Create Tables 
CREATE TABLE APPLICATION ( 
	APPLICATION_ID NUMERIC(10) NOT NULL,
	APPLICATION_NAME VARCHAR(100),
	APPLICATION_DESCRIPTION VARCHAR(200),
	DECLARATIVE_FLAG BOOL NOT NULL,
	ACTIVE_FLAG BOOL NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(APPLICATION_ID)
)Type=InnoDB
;

CREATE TABLE GROUPS ( 
	GROUP_ID NUMERIC(10) NOT NULL,
	GROUP_NAME VARCHAR(100),
	GROUP_DESC VARCHAR(200),
	UPDATE_DATE DATE,
	APPLICATION_ID NUMERIC(10,2) NOT NULL,
	PRIMARY KEY(GROUP_ID)
)Type=InnoDB
;

CREATE TABLE PRIVILEGE ( 
	PRIVILEGE_ID NUMERIC(10) NOT NULL,
	PRIVILEGE_NAME VARCHAR(100),
	PRIVILEGE_DESCRIPTION VARCHAR(200),
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(PRIVILEGE_ID)
)Type=InnoDB
;

CREATE TABLE PROTECTION_ELEMENT ( 
	PROTECTION_ELEMENT_ID NUMERIC(10) NOT NULL,
	PROTECTION_ELEMENT_NAME VARCHAR(100) NOT NULL,
	PROTECTION_ELEMENT_DESCRIPTION VARCHAR(200),
	OBJECT_ID VARCHAR(100) NOT NULL,
	ATTRIBUTE VARCHAR(50),
	PROTECTION_ELEMENT_TYPE_ID NUMERIC(10) NOT NULL,
	APPLICATION_ID NUMERIC(10) NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(PROTECTION_ELEMENT_ID)
)Type=InnoDB
;

CREATE TABLE PROTECTION_GROUP ( 
	PROTECTION_GROUP_ID NUMERIC(10) NOT NULL,
	PROTECTION_GROUP_NAME VARCHAR(100) NOT NULL,
	PROTECTION_GROUP_DESCRIPTION VARCHAR(200),
	APPLICATION_ID NUMERIC(10) NOT NULL,
	LARGE_ELEMENT_COUNT_FLAG BOOL NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PARENT_PROTECTION_GROUP_ID NUMERIC(10),
	PRIMARY KEY(PROTECTION_GROUP_ID)
)Type=InnoDB
;

CREATE TABLE PROTECTION_GROUP_PROTECTION_ELEMENT ( 
	PROTECTION_GROUP_PROTECTION_ELEMENT_ID NUMERIC(10) NOT NULL,
	PROTECTION_GROUP_ID NUMERIC(10) NOT NULL,
	PROTECTION_ELEMENT_ID NUMERIC(10) NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(PROTECTION_GROUP_PROTECTION_ELEMENT_ID)
)Type=InnoDB
;

CREATE TABLE ROLE ( 
	ROLE_ID NUMERIC(10) NOT NULL,
	ROLE_NAME VARCHAR(100),
	ROLE_DESCRIPTION VARCHAR(200),
	APPLICATION_ID NUMERIC(10) NOT NULL,
	ACTIVE_FLAG BOOL NOT NULL,
	UPDATE_DATE DATE,
	PRIMARY KEY(ROLE_ID)
)Type=InnoDB
;

CREATE TABLE ROLE_PRIVILEGE ( 
	ROLE_PRIVILEGE_ID NUMERIC(10) NOT NULL,
	ROLE_ID NUMERIC(10) NOT NULL,
	PRIVILEGE_ID NUMERIC(10) NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(ROLE_PRIVILEGE_ID)
)Type=InnoDB
;

CREATE TABLE USER ( 
	USER_ID NUMERIC(10) NOT NULL,
	LOGIN_NAME VARCHAR(30),
	FIRST_NAME VARCHAR(35),
	LAST_NAME VARCHAR(35),
	ORGANIZATION VARCHAR(35),
	DEPARTMENT VARCHAR(35),
	TITLE VARCHAR(35),
	PHONE_NUMBER VARCHAR(15),
	PASSWORD VARCHAR(30),
	EMAIL_ID VARCHAR(70),
	START_DATE DATE,
	END_DATE DATE,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(USER_ID)
)Type=InnoDB
;

CREATE TABLE USER_GROUP ( 
	USER_GROUP_ID NUMERIC(10) NOT NULL,
	USER_ID NUMERIC(10) NOT NULL,
	GROUP_ID NUMERIC(10) NOT NULL,
	PRIMARY KEY(USER_GROUP_ID)
)Type=InnoDB
;

CREATE TABLE USER_GROUP_ROLE_PROTECTION_GROUP ( 
	USER_GROUP_ROLE_PROTECTION_GROUP_ID NUMERIC(10) NOT NULL,
	USER_ID NUMERIC(10),
	GROUP_ID NUMERIC(10),
	ROLE_ID NUMERIC(10) NOT NULL,
	PROTECTION_GROUP_ID NUMERIC(10) NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(USER_GROUP_ROLE_PROTECTION_GROUP_ID)
)Type=InnoDB
;

CREATE TABLE USER_PROTECTION_ELEMENT ( 
	USER_PROTECTION_ELEMENT_ID NUMERIC(10) NOT NULL,
	PROTECTION_ELEMENT_ID NUMERIC(10) NOT NULL,
	USER_ID NUMERIC(10) NOT NULL,
	UPDATE_DATE DATE NOT NULL,
	PRIMARY KEY(USER_PROTECTION_ELEMENT_ID)
)Type=InnoDB
;



--  Create Indexes 
CREATE INDEX idx_APPLICATION_ID ON GROUPS(APPLICATION_ID)
;
ALTER TABLE GROUPS
ADD CONSTRAINT UQ_GROUP_GROUP_NAME UNIQUE (APPLICATION_ID, GROUP_NAME)
;
CREATE INDEX idx_APPLICATION_ID ON PROTECTION_ELEMENT(APPLICATION_ID)
;
ALTER TABLE PROTECTION_ELEMENT
ADD CONSTRAINT UQ_PROTECTION_ELEMENT_OBJECT_ID_APPLICATION_ID UNIQUE (OBJECT_ID, APPLICATION_ID)
;
CREATE INDEX idx_APPLICATION_ID ON PROTECTION_GROUP(APPLICATION_ID)
;
ALTER TABLE PROTECTION_GROUP
ADD CONSTRAINT UQ_PROTECTION_GROUP_PROTECTION_GROUP_NAME UNIQUE (APPLICATION_ID, PROTECTION_GROUP_NAME)
;
CREATE INDEX idx_PARENT_PROTECTION_GROUP_ID ON PROTECTION_GROUP(PARENT_PROTECTION_GROUP_ID)
;
CREATE INDEX idx_PROTECTION_ELEMENT_ID ON PROTECTION_GROUP_PROTECTION_ELEMENT(PROTECTION_ELEMENT_ID)
;
CREATE INDEX idx_PROTECTION_GROUP_ID ON PROTECTION_GROUP_PROTECTION_ELEMENT(PROTECTION_GROUP_ID)
;
ALTER TABLE PROTECTION_GROUP_PROTECTION_ELEMENT
ADD CONSTRAINT UQ_PROTECTION_GROUP_PROTECTION_ELEMENT_PROTECTION_GROUP_ID UNIQUE (PROTECTION_ELEMENT_ID, PROTECTION_GROUP_ID)
;
CREATE INDEX idx_APPLICATION_ID ON ROLE(APPLICATION_ID)
;
ALTER TABLE ROLE
ADD CONSTRAINT UQ_ROLE_ROLE_NAME UNIQUE (APPLICATION_ID, ROLE_NAME)
;
CREATE INDEX idx_PRIVILEGE_ID ON ROLE_PRIVILEGE(PRIVILEGE_ID)
;
ALTER TABLE ROLE_PRIVILEGE
ADD CONSTRAINT UQ_ROLE_PRIVILEGE_ROLE_ID UNIQUE (PRIVILEGE_ID, ROLE_ID)
;
CREATE INDEX idx_ROLE_ID ON ROLE_PRIVILEGE(ROLE_ID)
;
CREATE INDEX idx_USER_ID ON USER_GROUP(USER_ID)
;
CREATE INDEX idx_GROUP_ID ON USER_GROUP(GROUP_ID)
;
CREATE INDEX idx_USER_ID ON USER_GROUP_ROLE_PROTECTION_GROUP(USER_ID)
;
CREATE INDEX idx_PROTECTION_GROUP_ID ON USER_GROUP_ROLE_PROTECTION_GROUP(PROTECTION_GROUP_ID)
;
CREATE INDEX idx_ROLE_ID ON USER_GROUP_ROLE_PROTECTION_GROUP(ROLE_ID)
;
CREATE INDEX idx_USER_ID ON USER_PROTECTION_ELEMENT(USER_ID)
;
CREATE INDEX idx_PROTECTION_ELEMENT_ID ON USER_PROTECTION_ELEMENT(PROTECTION_ELEMENT_ID)
;
ALTER TABLE USER_PROTECTION_ELEMENT
ADD CONSTRAINT UQ_USER_PROTECTION_ELEMENT_PROTECTION_ELEMENT_ID UNIQUE (USER_ID, PROTECTION_ELEMENT_ID)
;


--  Create Foreign Key Constraints 
ALTER TABLE GROUPS ADD CONSTRAINT FK_APPLICATION_GROUP 
FOREIGN KEY (APPLICATION_ID) REFERENCES APPLICATION (APPLICATION_ID)
;

ALTER TABLE PROTECTION_ELEMENT ADD CONSTRAINT FK_PE_APPLICATION 
FOREIGN KEY (APPLICATION_ID) REFERENCES APPLICATION (APPLICATION_ID)
;

ALTER TABLE PROTECTION_GROUP ADD CONSTRAINT FK_PG_APPLICATION 
FOREIGN KEY (APPLICATION_ID) REFERENCES APPLICATION (APPLICATION_ID)
;

ALTER TABLE PROTECTION_GROUP ADD CONSTRAINT FK_PROTECTION_GROUP 
FOREIGN KEY (PARENT_PROTECTION_GROUP_ID) REFERENCES PROTECTION_GROUP (PROTECTION_GROUP_ID)
;

ALTER TABLE PROTECTION_GROUP_PROTECTION_ELEMENT ADD CONSTRAINT FK_PROTECTION_ELEMENT_PROTECTION_GROUP 
FOREIGN KEY (PROTECTION_ELEMENT_ID) REFERENCES PROTECTION_ELEMENT (PROTECTION_ELEMENT_ID)
;

ALTER TABLE PROTECTION_GROUP_PROTECTION_ELEMENT ADD CONSTRAINT FK_PROTECTION_GROUP_PROTECTION_ELEMENT 
FOREIGN KEY (PROTECTION_GROUP_ID) REFERENCES PROTECTION_GROUP (PROTECTION_GROUP_ID)
;

ALTER TABLE ROLE ADD CONSTRAINT FK_APPLICATION_ROLE 
FOREIGN KEY (APPLICATION_ID) REFERENCES APPLICATION (APPLICATION_ID)
;

ALTER TABLE ROLE_PRIVILEGE ADD CONSTRAINT FK_PRIVILEGE_ROLE 
FOREIGN KEY (PRIVILEGE_ID) REFERENCES PRIVILEGE (PRIVILEGE_ID)
;

ALTER TABLE ROLE_PRIVILEGE ADD CONSTRAINT FK_ROLE 
FOREIGN KEY (ROLE_ID) REFERENCES ROLE (ROLE_ID)
;

ALTER TABLE USER_GROUP ADD CONSTRAINT FK_USER_GROUP 
FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
;

ALTER TABLE USER_GROUP ADD CONSTRAINT FK_UG_GROUP 
FOREIGN KEY (GROUP_ID) REFERENCES GROUPS (GROUP_ID)
;

ALTER TABLE USER_GROUP_ROLE_PROTECTION_GROUP ADD CONSTRAINT FK_USER_GROUP_ROLE_PROTECTION_GROUP_USER 
FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
;

ALTER TABLE USER_PROTECTION_ELEMENT ADD CONSTRAINT FK_PE_USER 
FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
;

ALTER TABLE USER_PROTECTION_ELEMENT ADD CONSTRAINT FK_PROTECTION_ELEMENT_USER 
FOREIGN KEY (PROTECTION_ELEMENT_ID) REFERENCES PROTECTION_ELEMENT (PROTECTION_ELEMENT_ID)
;
