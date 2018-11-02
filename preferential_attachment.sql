# preferential attachment


delimiter //
create function preferential_attachment (x char(8), y char(8)) 
	returns varchar(28) 
	begin  
		declare s char(28);
		
		set s = (select rel from wn18rr_train where ein = x and eout = y);  
		if (s is null) then 
			
            select rr into @r from
            (select AA.rel as rr, (AA.count * BB.count) as pre_att
			from
			(select A.rel, B.count 
			from (select rel from relation) A 
			left join 
			(select rel, count(rel) as count from wn18rr_train where ein=x group by rel) B 
			on A.rel = B.rel) AA
			join
			(select C.rel, D.count
			from (select rel from relation) C
			left join
			(select rel, count(rel) as count from wn18rr_train where eout=y group by rel) D
			on C.rel = D.rel) BB
			on AA.rel = BB.rel
            order by pre_att desc
            limit 1) aa;
            
            
            select pre_att into @c from
            (select AA.rel as rr, (AA.count * BB.count) as pre_att
			from
			(select A.rel, B.count 
			from (select rel from relation) A 
			left join 
			(select rel, count(rel) as count from wn18rr_train where ein=x group by rel) B 
			on A.rel = B.rel) AA
			join
			(select C.rel, D.count
			from (select rel from relation) C
			left join
			(select rel, count(rel) as count from wn18rr_train where eout=y group by rel) D
			on C.rel = D.rel) BB
			on AA.rel = BB.rel
            order by pre_att desc
            limit 1) aa;
            
            
            #select * from
            #(select rel, count(rel) from wn18rr_train where ein=x group by rel)
            
            
            
            if (@c is null) then
				select rel into s from relation order by rand() limit 1;
			else
				set s = @r;
			end if;
            #set s = if(@c is null, '_no_rel', @r);
            
		end if;  
		return s; 
	end//


delimiter ;


