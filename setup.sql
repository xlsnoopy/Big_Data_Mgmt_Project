drop procedure if exists cn_score;
drop procedure if exists pa_score;
drop procedure if exists jc_score;

drop procedure if exists test_cn;
drop procedure if exists test_pa;
drop procedure if exists test_jc;

source cn_score.sql;
source pa_score.sql;
source jc_score.sql;

source test_cn.sql;
source test_pa.sql;
source test_jc.sql;
