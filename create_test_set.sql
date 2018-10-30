# create test table
drop table if exists test_set;

create table test_set as
select B.ein, B.rel, B.eout 
from (select ein, rel, eout from wn18rr_train) A 
join (select ein, rel, eout from wn18rr_test) B on A.ein = B.ein 
union 
select D.ein, D.rel, D.eout 
from (select ein, rel, eout from wn18rr_train) C 
join (select ein, rel, eout from wn18rr_test) D 
on C.eout = D.eout;
