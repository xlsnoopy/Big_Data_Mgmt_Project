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


# create demo table
drop table if exists demo_set;

create table demo_set as
select * from wn18rr_test A 
where exists (select * from wn18rr_train B where B.ein = A.ein) 
and exists (select * from wn18rr_train C where C.eout = A.eout);


# create relation table
drop table if exists relation;

create table relation (
id int not null auto_increment, 
rel char(28), 
unique (rel), 
primary key (id));

insert into relation (rel) 
(select distinct rel from wn18rr_train);