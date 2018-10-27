delimiter //
create function get_rel (x char(8), y char(8)) 
	returns varchar(28) 
	begin  
		declare s char(28);
			
		set s = (select rel from wn18rr where ein = @x and eout = @y);  
		if (s is null) then 
			set @r1 := (select rel from (select * from wn18rr where ein=@x) as a group by rel order by count(rel) desc limit 1);
			set @r2 := (select rel from (select * from wn18rr where eout=@y) as a group by rel order by count(rel) desc limit 1);
			set @c1 := (select count(rel) from (select * from wn18rr where ein = @x) as a group by rel order by count(rel) desc limit 1);
			set @c2 := (select count(rel) from (select * from wn18rr where eout = @y) as a group by rel order by count(rel) desc limit 1);
			set s = if(@c1 < @c2, @r2, @r1);	
		end if;  
		return s; 
	end//


delimiter ;
