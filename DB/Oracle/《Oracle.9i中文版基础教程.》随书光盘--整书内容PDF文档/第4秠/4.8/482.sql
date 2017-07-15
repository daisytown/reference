update scott.emp
set  sal=
    (
     select sal+300 from scott.emp 
     where  empno=7599
     )
where  empno=7599;
