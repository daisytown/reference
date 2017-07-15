select  *  from  scott.emp  where  job='MANAGER';
select  *  from  scott.emp  where  sal=1100;


select  *  from  scott.emp  where  job!='MANAGER';
select  *  from  scott.emp  where  sal!=1100;


select  *  from  scott.emp  where  job^='MANAGER';
select  *  from  scott.emp  where  sal^=1100;


select  *  from  scott.emp  where  job<>'MANAGER';
select  *  from  scott.emp  where  sal<>1100;


select  *  from  scott.emp  where  sal<2000;
select  *  from  scott.emp  where  job<'MANAGER';


select  *  from  scott.emp  where  sal>2000;
select  *  from  scott.emp  where  job>'MANAGER';


select  *  from  scott.emp  where  sal<£½2000;
select  *  from  scott.emp  where  job<£½'MANAGER';


select  *  from  scott.emp  where  sal>=2000;
select  *  from  scott.emp  where  job>='MANAGER';


select  *  from  scott.emp  where  sal in (2000,1000,3000);
select  *  from  scott.emp  where  job in ('MANAGER','CLERK');


select  *  from  scott.emp  where  sal not in (2000,1000,3000);
select  *  from  scott.emp  where  job not in ('MANAGER','CLERK');


select  *  from  scott.emp  where  sal  between 2000 and 3000;
select  *  from  scott.emp  where  job  between 'MANAGER' and 'CLERK';


select  *  from  scott.emp  where  sal  not between 2000 and 3000;
select  *  from  scott.emp  where  job  not between 'MANAGER' and 'CLERK';


select  *  from  scott.emp  where  job  like  'M%';
select  *  from  scott.emp  where  job  like  'M__';


select  *  from  scott.emp  where  job  not  like  'M%';
select  *  from  scott.emp  where  job  not  like  'M__';


select  *  from  scott.emp  where  sal  is null;
select  *  from  scott.emp  where  job  is null;


select  *  from  scott.emp  where  sal  is  not  null;
select  *  from  scott.emp  where  job  is  not  null;




