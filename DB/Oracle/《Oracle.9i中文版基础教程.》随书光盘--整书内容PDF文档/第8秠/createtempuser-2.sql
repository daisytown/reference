BEGIN
	dbms_resource_manager_privs.grant_switch_consumer_group( 
		grantee_name => 'TEMPUSER',
		consumer_group => 'DEFAULT_CONSUMER_GROUP',
		grant_option => TRUE
	);
END;
