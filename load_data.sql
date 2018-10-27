create database project590;
create table wn18rr (ein char(8), rel char(28), eout char(8));
load data local infile 'all.txt' into table wn18rr;

