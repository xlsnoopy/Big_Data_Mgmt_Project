
# common neighbor result
drop table if exists result_cn;

create table result_cn 
(ein char(8), 
eout char(8),
hn_ int, 
drf_ int, 
ih_ int, 
as_ int, 
mm_ int, 
sdto_ int, 
hp_ int, 
modu_ int, 
modr_ int, 
vg_ int, 
st_ int,
primary key (ein, eout)
);

# jaccord coefficient result
drop table if exists result_jc;

create table result_jc
(ein char(8), 
eout char(8),
hn_ int, 
drf_ int, 
ih_ int, 
as_ int, 
mm_ int, 
sdto_ int, 
hp_ int, 
modu_ int, 
modr_ int, 
vg_ int, 
st_ int,
primary key (ein, eout)
);


# preferential attachment result
drop table if exists result_pa;

create table result_pa
(ein char(8), 
eout char(8),
hn_ int, 
drf_ int, 
ih_ int, 
as_ int, 
mm_ int, 
sdto_ int, 
hp_ int, 
modu_ int, 
modr_ int, 
vg_ int, 
st_ int,
primary key (ein, eout)
);
