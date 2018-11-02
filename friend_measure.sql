DELIMITER //
CREATE function friend_measure(x char(8), y char(8))
	returns varchar(28)
	begin
	
	#DROP TABLE IF EXISTS FRI;
	#CREATE TABLE FRI (name char(28), jac FLOAT);
		declare s char(28);
		
		set s = (select rel from wn18rr_train where ein = x and eout = y);  
        
		if (s is null) then
        
			select count(*) into @num from relation;
			set @max_score = 0;
			set @r = null;
		
			set @itr = 0;
        
			label4: LOOP
				set @itr = @itr+1;
				
				IF @itr <= @num THEN
					SELECT rel into @RelStr FROM relation WHERE id = @itr;
					
                    select count(*) into @num_friend from wn18rr_train where 
                    rel = @RelStr and 
                    ein in (
                    select * from (
					SELECT eout as name FROM wn18rr_train WHERE ein=x AND rel=@RelStr 
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=x AND rel=@RelStr) t1)
                    and 
                    eout in (
                    select * from (
					SELECT eout as name FROM wn18rr_train WHERE ein=y AND rel=@RelStr 
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=y AND rel=@RelStr) t2)
                    or 
                    rel = @RelStr and 
                    eout in (
                    select * from (
					SELECT eout as name FROM wn18rr_train WHERE ein=x AND rel=@RelStr 
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=x AND rel=@RelStr) t3)
                    and 
                    ein in (
                    select * from (
					SELECT eout as name FROM wn18rr_train WHERE ein=y AND rel=@RelStr 
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=y AND rel=@RelStr) t4);
                    
                    
					if @max_score < @num_friend then 
						set @r = @RelStr;
                        set @max_score = @num_friend;
					end if;
				
			
				ITERATE label4;
        
				END IF;
				LEAVE label4;
			END LOOP label4;
		end if;
        
        if (@r is null) then
			select rel into s from relation order by rand() limit 1;
		else
			set s = @r;
		end if;
        #set s = if(@r is null, '_no_rel', @r);
        return s;
	END //
DELIMITER ;
