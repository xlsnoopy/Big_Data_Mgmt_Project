DELIMITER //

create function freq (x char(8), y char(8))
	returns varchar(28)
	begin
		declare s char(28);
		SELECT rel, COUNT(rel) as count from wn18rr_train where ein = @x or eout = @x GROUP BY rel ORDER BY count DESC LIMIT 1 A;
		SELECT rel, COUNT(rel) as count from wn18rr_train where ein = @y or eout = @y GROUP BY rel ORDER BY count DESC LIMIT 1 B;
		set s = if(A.count > B.count, A.rel, B.rel);
		return s;
	end//
delimiter;
	
