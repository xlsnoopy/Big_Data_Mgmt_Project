# run score function on each row of the data set
# insert results into table result_rel
# replace preferential_attachment by other score functions
# 

delimiter //
create procedure run_test(in m int, in n int)
begin
#declare n int default 0;
#declare m int default 0;
declare i int default 0;
declare j int default 0;

if m < 0 then
	select count(*) from entity_in into m;
end if;

if n < 0 then
	select count(*) from entity_out into n;
end if;

#set m=10;
#set n=10;

set i=0;
set j=0;
while i<m do
	set @x = (select ein from entity_in limit i, 1);
	while j<n do
		set @y = (select eout from entity_out limit j, 1);
		#select @x;
        #select @y;
        #select preferential_attachment(@x, @y);
		insert into result_rel (rel) select common_neighbor(@x, @y);
        set j = j + 1;
	end while;
	set i = i + 1;
    set j = 0;
end while;
end//
delimiter ;