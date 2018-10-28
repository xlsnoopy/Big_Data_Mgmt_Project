# run score function on test
# output accuracy
# replace preferential_attachment by other score functions
# usage:
# call test_on_test(@acc);
# select @acc;

delimiter //
create procedure test_acc(out acc double)
begin

declare m int default 0;
declare n int default 0;

declare i int default 0;

declare pred varchar(28);
declare corr varchar(28);

select count(*) from wn18rr_test into m;

#set m=10;


set i=0;

while i<m do
	set @x = (select ein from wn18rr_test limit i, 1);
    set @y = (select eout from wn18rr_test limit i, 1);
	
	set pred = (select preferential_attachment(@x, @y));
    set corr = (select rel from wn18rr_test where ein=@x and eout=@y);
    set n = if(pred=corr and pred is not null, n+1, n);
    
	#insert into result_rel (rel) select preferential_attachment(@x, @y);
	
	set i = i + 1;
    
end while;
set acc = n / m;
end//
delimiter ;