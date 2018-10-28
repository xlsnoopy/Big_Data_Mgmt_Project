create database project590;

create table wn18rr (ein char(8), rel char(28), eout char(8));
load data local infile 'data/wn18rr/all.txt' into table wn18rr;

create table wn18rr_train (ein char(8), rel char(28), eout char(8));
load data local infile 'data/wn18rr/train.txt' into table wn18rr_train;

create table wn18rr_test (ein char(8), rel char(28), eout char(8));
load data local infile 'data/wn18rr/test.txt' into table wn18rr_test;

create table wn18rr_valid (ein char(8), rel char(28), eout char(8));
load data local infile 'data/wn18rr/valid.txt' into table wn18rr_valid;
