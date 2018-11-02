delimiter //
create function max_single (x char(8), y char(8)) 
	returns varchar(28) 
	begin  
		declare s char(28);
		
		set s = (select rel from wn18rr_train where ein = x and eout = y);
        
		if (s is null) then 
			
            select rel into @r1 
            from (select * from wn18rr_train where ein=x) as a 
            group by rel 
            order by count(rel) desc 
            limit 1;
			
            select rel into @r2 
            from (select * from wn18rr_train where eout=y) as a 
            group by rel 
            order by count(rel) desc 
            limit 1;
			
            select count(rel) into @c1 
            from (select * from wn18rr_train where ein = x) as a 
            group by rel 
            order by count(rel) desc 
            limit 1;
            
			select count(rel) into @c2 
            from (select * from wn18rr_train where eout = y) as a 
            group by rel 
            order by count(rel) desc 
            limit 1;
			
            
            if @c1 < @c2 then 
				set s = @r2;
			elseif @c1 > @c2 then 
				set s = @r1;
			else 
				if rand() < 0.5 then
					set s = @r1;
                else
					set s = @r2;
				end if;
			end if;
			
			
			
            #set s = if(@c1 < @c2, @r2, @r1);	
            
		end if;  
		return s; 
	end//


delimiter ;
