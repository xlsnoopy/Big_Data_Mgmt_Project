#drop procedure if exists cn;
#drop procedure if exists pa;
#drop procedure if exists jc;

#drop procedure if exists test_cn;
#drop procedure if exists test_pa;
#drop procedure if exists test_jc;

drop function if exists preferential_attachment;
drop function if exists common_neighbor;
drop function if exists max_single;
drop function if exists jaccard_coefficient;
drop function if exists friend_measure;

drop procedure if exists test_acc;

#source cn_score.sql;
#source pa_score.sql;
#source jc_score.sql;

#source test_cn.sql;
#source test_pa.sql;
#source test_jc.sql;

source preferential_attachment.sql;
source common_neighbor.sql;
source max_single.sql;
source jaccard_coefficient.sql;
source friend_measure.sql;

source test_acc.sql;