# common neighbor


delimiter //
create function common_neighbor (x char(8), y char(8)) 
	returns varchar(28) 
	begin  
		declare s char(28);
		
		set s = (select rel from wn18rr_train where ein = x and eout = y);  
		if (s is null) then 
			
            set @r = (select rel from
            (select A.rel, count(*) as count 
            from  (select rel, eout from wn18rr_train where ein=x) A 
            join (select rel, ein from wn18rr_train where eout=y) B 
            on A.eout = B.ein and A.rel = B.rel
            group by A.rel 
            order by count desc
            limit 1) C);
            
            set s = if(@r is null, '_no_rel', @r);
            
		end if;  
		return s; 
	end//


delimiter ;


