MERGE INTO A
USING B
ON (A.id = B.id)
WHEN MATCHED THEN
  UPDATE
     SET a.name = B.name;
