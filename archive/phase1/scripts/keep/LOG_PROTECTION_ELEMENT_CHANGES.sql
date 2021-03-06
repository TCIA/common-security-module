/*L
   Copyright Ekagra Software Technologies Ltd.
   Copyright SAIC, SAIC-Frederick

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-security-module/LICENSE.txt for details.
L*/

CREATE OR REPLACE TRIGGER Log_ELEMENT_Changes
  BEFORE INSERT OR DELETE OR UPDATE ON AS_PROTECTION_ELEMENT
  FOR EACH ROW
DECLARE
  V_ChangeType CHAR(1);
  oldTempRec  VARCHAR2(500);
  newTempRec  VARCHAR2(500);
  V_RecordId  NUMBER;
  V_TableName VARCHAR2(100);
  V_AttributeName VARCHAR2(80);
/*
  objId  VARCHAR2(100);
  atr	   VARCHAR2(50);
  elemName  VARCHAR2(100);
  elemDesc  VARCHAR2(200);
  ownerId  NUMBER;
*/
BEGIN
  V_TableName := 'AS_PROTECTION_ELEMENT';

  V_AttributeName := 'all_columns';
  /* User 'I' for an INSERT, 'D' for DELETE, and 'U' for UPDATE. */
  IF INSERTING THEN
    v_ChangeType := 'I';
	oldTempRec := 'not existing yet';
	V_RecordId := :new.PROTECTION_ELEMENT_ID;
	newTempRec := TO_CHAR(:new.PROTECTION_ELEMENT_ID) || '|' || :new.OBJECT_ID || '|'|| :new.ATTRIBUTE|| '|'
	           || :new.PROTECTION_ELEMENT_NAME || '|' || :new.PROTECTION_ELEMENT_DESC || '|' || TO_CHAR(:new.UPDATE_DATE)
                   || '|' || TO_CHAR(:new.USER_ID);
  ELSIF UPDATING THEN
    v_ChangeType := 'U';
	V_RecordId := :old.PROTECTION_ELEMENT_ID;


	oldTempRec := TO_CHAR(:old.PROTECTION_ELEMENT_ID) || '|' || :old.OBJECT_ID || '|'|| :old.ATTRIBUTE|| '|'
	           || :old.PROTECTION_ELEMENT_NAME || '|' || :old.PROTECTION_ELEMENT_DESC || '|' || TO_CHAR(:old.UPDATE_DATE)
                   || '|' || TO_CHAR(:old.USER_ID);
	newTempRec := TO_CHAR(:new.PROTECTION_ELEMENT_ID) || '|' || :new.OBJECT_ID || '|'|| :new.ATTRIBUTE|| '|'
	           || :new.PROTECTION_ELEMENT_NAME || '|' || :new.PROTECTION_ELEMENT_DESC || '|' || TO_CHAR(:new.UPDATE_DATE)
                   || '|' || TO_CHAR(:new.USER_ID);
/*

	IF :new.OBJECT_ID IS NULL THEN
	  objId := :old.OBJECT_ID;
	ELSE
	  objId := :new.OBJECT_ID;
    END IF;

	IF :new.ATTRIBUTE IS NULL THEN
	  atr := :old.ATTRIBUTE;
	ELSE
	  atr := :new.ATTRIBUTE;
    END IF;

	IF :new.PROTECTION_ELEMENT_NAME IS NULL THEN
	  elemName := :old.PROTECTION_ELEMENT_NAME;
	ELSE
	  elemName := :new.PROTECTION_ELEMENT_NAME;
    END IF;

	IF :new.PROTECTION_ELEMENT_DESC IS NULL THEN
	  elemDesc := :old.PROTECTION_ELEMENT_DESC;
	ELSE
	  elemDesc := :new.PROTECTION_ELEMENT_DESC;
    END IF;

	IF :new.USER_ID IS NULL THEN
	  ownerId := :old.USER_ID;
	ELSE
	  ownerId := :new.USER_ID;
    END IF;


	newTempRec := TO_CHAR(:new.PROTECTION_ELEMENT_ID) || '|' || objId || '|'|| atr || '|'
	           || elemName || '|' || elemDesc || '|' || TO_CHAR(:new.UPDATE_DATE)
                   || '|' || TO_CHAR(ownerId);
*/
  ELSE
    v_ChangeType := 'D';
	oldTempRec := TO_CHAR(:old.PROTECTION_ELEMENT_ID) || '|' || :old.OBJECT_ID || '|'|| :old.ATTRIBUTE|| '|'
	           || :old.PROTECTION_ELEMENT_NAME || '|' || :old.PROTECTION_ELEMENT_DESC || '|' || TO_CHAR(:old.UPDATE_DATE)
                   || '|' || TO_CHAR(:old.USER_ID);
	newTempRec := 'deleted';
	V_RecordId := :old.PROTECTION_ELEMENT_ID;
  END IF;
  /* Record all the changes made to AS_APPLICATION in AS_LOG. Use
     SYSDATE to generate the timestamp, ad USER to return the
     userid of the current user*/
  INSERT INTO AS_LOG
  (
    TIMESTAMP, TABLE_NAME, RECORD_ID, ACTION_TYPE, ATTRIBUTE_NAME,
	OLD_VALUE, NEW_VALUE, LOG_ID, ACTION_USER_NAME
  )
  VALUES
  (
    to_number(to_char(sysdate,'yyyymmddhhmiss')), V_TableName,V_RecordId, v_ChangeType, V_AttributeName,
	oldTempRec, newTempRec, SEQ_LOGID.nextval, USER
  );
END Log_ELEMENT_Changes;
