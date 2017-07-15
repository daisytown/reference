CREATE USER "TEMPUSER"  PROFILE "DEFAULT" 
    IDENTIFIED BY "tempuser" DEFAULT TABLESPACE "USERS" 
    ACCOUNT UNLOCK;
GRANT CREATE ANY TABLE TO "TEMPUSER" WITH ADMIN OPTION;
GRANT "CONNECT" TO "TEMPUSER" WITH ADMIN OPTION;


BEGIN
	dbms_resource_manager_privs.grant_switch_consumer_group( 
		grantee_name => 'TEMPUSER',
		consumer_group => 'DEFAULT_CONSUMER_GROUP',
		grant_option => TRUE
	);
END;


BEGIN 
	dbms_resource_manager.set_initial_consumer_group( 
		user => 'TEMPUSER',
		consumer_group => 'DEFAULT_CONSUMER_GROUP'
	);
END;