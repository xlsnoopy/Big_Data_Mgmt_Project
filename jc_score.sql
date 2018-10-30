# Jaccord's coefficient


delimiter //
create procedure jc (in x char(8), in y char(8)) 
	#returns varchar(28) 
	begin  
        select count(*) into @hn1
        from hn_train
        where ein=x;
        
        select count(*) into @hn2
        from hn_train
        where eout=y;
        
		select count(A.eout) into @hn3
        from (select eout from hn_train where ein=x) A 
        join (select ein from hn_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @hn1 + @hn2;
        set @hn_ = if(@a = 0, 0, @hn3 / @a);
        
        select count(*) into @drf1
        from drf_train
        where ein=x;
        
        select count(*) into @drf2
        from drf_train
        where eout=y;
        
        select count(A.eout) into @drf3
        from (select eout from drf_train where ein=x) A 
        join (select ein from drf_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @drf1 + @drf2;
        set @drf_ = if(@a = 0, 0, @drf3 / @a);
        
		select count(*) into @ih1
        from ih_train
        where ein = x;
        
        select count(*) into @ih2
        from ih_train
        where eout = y;
        
        select count(A.eout) into @ih3
        from (select eout from ih_train where ein=x) A 
        join (select ein from ih_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @ih1 + @ih2;
        set @ih_ = if(@a = 0, 0, @ih3 / @a);
        
        select count(*) into @as1
        from as_train
        where ein=x;
        
        select count(*) into @as2
        from as_train
        where eout=y;
        
        select count(A.eout) into @as3
        from (select eout from as_train where ein=x) A 
        join (select ein from as_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @as1 + @as2;
        set @as_ = if(@a = 0, 0, @as3 / @a);
        
        select count(*) into @mm1
        from mm_train
        where ein=x;
        
        select count(*) into @mm2
        from mm_train
        where eout=y;
        
        select count(A.eout) into @mm3
        from (select eout from mm_train where ein=x) A 
        join (select ein from mm_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @mm1 + @mm2;
        set @mm_ = if(@a=0, 0, @mm3 / @a);
        
        select count(*) into @sdto1
        from sdto_train
        where ein=x;
        
        select count(*) into @sdto2
        from sdto_train
        where eout=y;
        
        select count(A.eout) into @sdto3
        from (select eout from sdto_train where ein=x) A 
        join (select ein from sdto_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @sdto1 + @sdto2;
        set @sdto_ = if(@a=0, 0, @sdto3 / @a);
        
        select count(*) into @hp1
        from hp_train
        where ein=x;
        
        select count(*) into @hp2
        from hp_train
        where eout=y;
        
        select count(A.eout) into @hp3
        from (select eout from hp_train where ein=x) A 
        join (select ein from hp_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @hp1 + @hp2;
        set @hp_ = if(@a=0, 0, @hp3 / @a);
        
        select count(*) into @modu1
        from modu_train
        where ein=x;
        
        select count(*) into @modu2
        from modu_train
        where eout=y;
        
        select count(A.eout) into @modu3
        from (select eout from modu_train where ein=x) A 
        join (select ein from modu_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @modu1 + @modu2;
        set @modu_ = if(@a=0, 0, @modu3 / @a);
        
        select count(*) into @modr1
        from modr_train
        where ein=x;
        
        select count(*) into @modr2
        from modr_train
        where eout=y;
        
        select count(A.eout) into @modr3
        from (select eout from modr_train where ein=x) A 
        join (select ein from modr_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @modr1 + @modr2;
        set @modr_ = if(@a=0, 0, @modr3 / @a);
        
        
        select count(*) into @vg1
        from vg_train
        where ein=x;
        
        select count(*) into @vg2
        from vg_train
        where eout=y;
        
        select count(A.eout) into @vg3
        from (select eout from vg_train where ein=x) A 
        join (select ein from vg_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @vg1 + @vg2;
        set @vg_ = if(@a=0, 0, @vg3 / @a);
        
        select count(*) into @st1
        from st_train
        where ein=x;
        
        select count(*) into @st2
        from st_train
        where eout=y;
        
        select count(A.eout) into @st3
        from (select eout from st_train where ein=x) A 
        join (select ein from st_train where eout=y) B 
        on A.eout = B.ein;
        
        set @a = @st1 + @st2;
        set @st_ = if(@a=0, 0, @st3 / @a);
        
		select @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_;
        #insert into result_cn 
        #(ein, eout, hn_, drf_, ih_, as_, mm_, sdto_, hp_, modu_, modr_, vg_, st_) 
        #values 
        #(x, y, @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_);
		#return s; 
	end//


delimiter ;


