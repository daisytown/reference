SYS_Context([#]namespace, attribute_name)
/*���﷨��SYS_CONTEXT(c1,c2)
�����ܡ�����ϵͳc1��Ӧ��c2��ֵ������ʹ����SQL/PLSQL�У������������ڲ��в�ѯ����RAC������
��������
c1��'USERENV'
c2,���������ʾ��
�����ء��ַ���
��ʾ����
select
SYS_CONTEXT('USERENV','TERMINAL') terminal,
SYS_CONTEXT('USERENV','LANGUAGE') language,
SYS_CONTEXT('USERENV','SESSIONID') sessionid,
SYS_CONTEXT('USERENV','INSTANCE') instance,
SYS_CONTEXT('USERENV','ENTRYID') entryid,
SYS_CONTEXT('USERENV','ISDBA') isdba,
SYS_CONTEXT('USERENV','NLS_TERRITORY') nls_territory,
SYS_CONTEXT('USERENV','NLS_CURRENCY') nls_currency,
SYS_CONTEXT('USERENV','NLS_CALENDAR') nls_calendar,
SYS_CONTEXT('USERENV','NLS_DATE_FORMAT') nls_date_format,
SYS_CONTEXT('USERENV','NLS_DATE_LANGUAGE') nls_date_language,
SYS_CONTEXT('USERENV','NLS_SORT') nls_sort,
SYS_CONTEXT('USERENV','CURRENT_USER') current_user,
SYS_CONTEXT('USERENV','CURRENT_USERID') current_userid,
SYS_CONTEXT('USERENV','SESSION_USER') session_user,
SYS_CONTEXT('USERENV','SESSION_USERID') session_userid,
SYS_CONTEXT('USERENV','PROXY_USER') proxy_user,
SYS_CONTEXT('USERENV','PROXY_USERID') proxy_userid,
SYS_CONTEXT('USERENV','DB_DOMAIN') db_domain,
SYS_CONTEXT('USERENV','DB_NAME') db_name,
SYS_CONTEXT('USERENV','HOST') host,
SYS_CONTEXT('USERENV','OS_USER') os_user,
SYS_CONTEXT('USERENV','EXTERNAL_NAME') external_name,
SYS_CONTEXT('USERENV','IP_ADDRESS') ip_address,
SYS_CONTEXT('USERENV','NETWORK_PROTOCOL') network_protocol,
SYS_CONTEXT('USERENV','BG_JOB_ID') bg_job_id,
SYS_CONTEXT('USERENV','FG_JOB_ID') fg_job_id,
SYS_CONTEXT('USERENV','AUTHENTICATION_TYPE') authentication_type,
SYS_CONTEXT('USERENV','AUTHENTICATION_DATA') authentication_data
from dual
*/