CREATE USER "TEMPUSER"  PROFILE "DEFAULT" 
    IDENTIFIED BY "tempuser" DEFAULT TABLESPACE "USERS" 
    ACCOUNT UNLOCK;
GRANT CREATE ANY TABLE TO "TEMPUSER" WITH ADMIN OPTION;
GRANT "CONNECT" TO "TEMPUSER" WITH ADMIN OPTION;

