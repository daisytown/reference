CREATE PROFILE "TEMPPROFILE" 
    LIMIT CPU_PER_SESSION 1000 CPU_PER_CALL 1000 CONNECT_TIME 30 
    IDLE_TIME DEFAULT SESSIONS_PER_USER 10 
    LOGICAL_READS_PER_SESSION 1000 LOGICAL_READS_PER_CALL 1000 
    PRIVATE_SGA 16K COMPOSITE_LIMIT 1000000 FAILED_LOGIN_ATTEMPTS
    3 PASSWORD_LOCK_TIME 5 PASSWORD_GRACE_TIME 60 
    PASSWORD_LIFE_TIME 30 PASSWORD_REUSE_MAX UNLIMITED 
    PASSWORD_REUSE_TIME 30 PASSWORD_VERIFY_FUNCTION DEFAULT