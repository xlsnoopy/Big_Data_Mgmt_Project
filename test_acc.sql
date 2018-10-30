# run score function on test
# output accuracy
# replace preferential_attachment by other score functions
# score functions:
# preferential_attachment
# common_neighbor
# usage:
# call test_acc(@acc);
# select @acc;

delimiter //
create procedure test_acc(out acc double, in m int)
begin

#declare m int default 0;
declare n int default 0;

declare i int default 0;

declare pred varchar(28);
declare corr varchar(28);

if (m < 0) then
	select count(*) from test_set into m;
end if;

#set m=10;


set i=0;

while i<m do
	set @x = (select ein from test_set limit i, 1);
    set @y = (select eout from test_set limit i, 1);
	
	set pred = (select preferential_attachment(@x, @y));
    set corr = (select rel from test_set where ein=@x and eout=@y);
    set n = if(pred=corr, n+1, n);
    
	#insert into result_rel (rel) select preferential_attachment(@x, @y);
	
	set i = i + 1;
    
end while;
set acc = n / m;
end//
delimiter ;