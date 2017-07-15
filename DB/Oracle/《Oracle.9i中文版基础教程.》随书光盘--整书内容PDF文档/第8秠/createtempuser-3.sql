BEGIN 
	dbms_resource_manager.set_initial_consumer_group( 
		user => 'TEMPUSER',
		consumer_group => 'DEFAULT_CONSUMER_GROUP'
	);
END;