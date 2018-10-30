# preferential attachment


delimiter //
create procedure pa (in x char(8), in y char(8)) 
	#returns varchar(28) 
	begin  
		
        select count(*) into @hn1
        from hn_train
        where ein=x;
        
        select count(*) into @hn2
        from hn_train
        where eout=y;
        
        set @hn_ = @hn1 * @hn2;
        
        select count(*) into @drf1
        from drf_train
        where ein=x;
        
        select count(*) into @drf2
        from drf_train
        where eout=y;
        
        set @drf_ = @drf1 * @drf2;
        
		select count(*) into @ih1
        from ih_train
        where ein = x;
        
        select count(*) into @ih2
        from ih_train
        where eout = y;
        
        set @ih_ = @ih1 * @ih2;
        
        select count(*) into @as1
        from as_train
        where ein=x;
        
        select count(*) into @as2
        from as_train
        where eout=y;
        
        set @as_ = @as1 * @as2;
        
        select count(*) into @mm1
        from mm_train
        where ein=x;
        
        select count(*) into @mm2
        from mm_train
        where eout=y;
        
        set @mm_ = @mm1 * @mm2;
        
        select count(*) into @sdto1
        from sdto_train
        where ein=x;
        
        select count(*) into @sdto2
        from sdto_train
        where eout=y;
        
        set @sdto_ = @sdto1 * @sdto2;
        
        select count(*) into @hp1
        from hp_train
        where ein=x;
        
        select count(*) into @hp2
        from hp_train
        where eout=y;
        
        set @hp_ = @hp1 * @hp2;
        
        select count(*) into @modu1
        from modu_train
        where ein=x;
        
        select count(*) into @modu2
        from modu_train
        where eout=y;
        
        set @modu_ = @modu1 * @modu2;
        
        select count(*) into @modr1
        from modr_train
        where ein=x;
        
        select count(*) into @modr2
        from modr_train
        where eout=y;
        
        set @modr_ = @modr1 * @modr2;
        
        
        select count(*) into @vg1
        from vg_train
        where ein=x;
        
        select count(*) into @vg2
        from vg_train
        where eout=y;
        
        set @vg_ = @vg1 * @vg2;
        
        select count(*) into @st1
        from st_train
        where ein=x;
        
        select count(*) into @st2
        from st_train
        where eout=y;
        
        set @st_ = @st1 * @st2;
        
		select @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_;
        #insert into result_pa 
        #(ein, eout, hn_, drf_, ih_, as_, mm_, sdto_, hp_, modu_, modr_, vg_, st_) 
        #values 
        #(x, y, @hn_, @drf_, @ih_, @as_, @mm_, @sdto_, @hp_, @modu_, @modr_, @vg_, @st_);
		#return s; 
	end//


delimiter ;


