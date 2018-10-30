# common neighbor
# populate result_cn table

delimiter //
create procedure test_cn (in m int) 
	begin
        
		declare i int default 0;
        
		#declare s char(28);
        if (m < 0) then
			select count(*) from test_set into m;
		end if;
		
        set i=0;

		while i<m do
			set @x = (select ein from test_set limit i, 1);
			set @y = (select eout from test_set limit i, 1);
        
			select count(A.eout) into @hn_
			from (select eout from hn_train where ein=@x) A 
			join (select ein from hn_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @drf_
			from (select eout from drf_train where ein=@x) A 
			join (select ein from drf_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @ih_
			from (select eout from ih_train where ein=@x) A 
			join (select ein from ih_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @as_
			from (select eout from as_train where ein=@x) A 
			join (select ein from as_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @mm_
			from (select eout from mm_train where ein=@x) A 
			join (select ein from mm_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @sdto_
			from (select eout from sdto_train where ein=@x) A 
			join (select ein from sdto_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @hp_
			from (select eout from hp_train where ein=@x) A 
			join (select ein from hp_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @modu_
			from (select eout from modu_train where ein=@x) A 
			join (select ein from modu_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @modr_
			from (select eout from modr_train where ein=@x) A 
			join (select ein from modr_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @vg_
			from (select eout from vg_train where ein=@x) A 
			join (select ein from vg_train where eout=@y) B 
			on A.eout = B.ein;
        
			select count(A.eout) into @st_
			from (select eout from st_train where ein=@x) A 
			join (select ein from st_train where eout=@y) B 
			on A.eout = B.ein;
        
			#select @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_;
			insert into result_cn 
			(ein, eout, hn_, drf_, ih_, as_, mm_, sdto_, hp_, modu_, modr_, vg_, st_) 
			values 
			(@x, @y, @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_);
			#return s;
            
            set i = i + 1;
		end while;
	end//


delimiter ;


