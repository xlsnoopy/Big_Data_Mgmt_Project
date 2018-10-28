drop function if exists preferential_attachment;
drop function if exists common_neighbor;

drop procedure if exists test_acc;
drop procedure if exists run_test;

source preferential_attachment.sql;
source common_neighbor.sql;
source test_acc.sql;
source test.sql;