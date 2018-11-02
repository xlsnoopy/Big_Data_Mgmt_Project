DELIMITER //
CREATE function jaccard_coefficient(x char(8),  y char(8))
	returns varchar(28)
	BEGIN
		declare s char(28);
		
		set s = (select rel from wn18rr_train where ein = x and eout = y);  
        
		if (s is null) then
        
			select count(*) into @num from relation;
			set @max_score = 0;
			set @r = null;
		
			set @itr = 0.0;

			label1: LOOP
				set @itr = @itr+1;
                
				IF @itr <= @num THEN
				
					SET @rel_str = ( SELECT rel FROM relation WHERE id = @itr );

					set @num_union = (select count(*) from
					(SELECT eout as name FROM wn18rr_train WHERE ein=x AND rel=@rel_str
					UNION 
					SELECT ein as name FROM wn18rr_train WHERE eout=x AND rel=@rel_str
					union
					SELECT eout as name FROM wn18rr_train WHERE ein=y AND rel=@rel_str
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=y AND rel=@rel_str) t1);
					
                
					set @num_incpt = (select count(*) from
					(
					select t1.name from
					(SELECT eout as name FROM wn18rr_train WHERE ein=x AND rel=@rel_str
					UNION 
					SELECT ein as name FROM wn18rr_train WHERE eout=x AND rel=@rel_str) t1 
					where t1.name in (select name from 
					(SELECT eout as name FROM wn18rr_train WHERE ein=y AND rel=@rel_str
					UNION
					SELECT ein as name FROM wn18rr_train WHERE eout=y AND rel=@rel_str) t2)
					) t3 
                    );
                
					
					set @jac = if(@num_union = 0, 0, @num_incpt / @num_union);
					
					if @max_score < @jac then
						set @max_score = @jac;
						set @r = @rel_str;
					end if;
                
					ITERATE label1;
				END IF;
				LEAVE label1;
			END LOOP label1;
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