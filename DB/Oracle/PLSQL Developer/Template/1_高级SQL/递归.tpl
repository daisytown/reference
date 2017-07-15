--�ݹ�����
WITH tree AS (
SELECT 1 AS ID ,-1 AS pid, '�游' AS NAME FROM dual 
UNION ALL 
SELECT 2 AS ID ,1 AS pid, '��' AS NAME FROM dual 
UNION ALL 
SELECT 4 AS ID ,2 AS pid, '�󲮶���' AS NAME FROM dual 
UNION ALL 
SELECT 3 AS ID ,1 AS pid, '�ְ�' AS NAME FROM dual 
UNION ALL 
SELECT 5 AS ID ,3 AS pid, '����' AS NAME FROM dual 
)  select tree.*,
       level,
       connect_by_isleaf,
       connect_by_root NAME,
       substr(sys_connect_by_path(trim(name), '-->'), 4) as path
  from tree 
 start with pid = -1
connect by prior id = pid