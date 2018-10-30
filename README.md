# Big_Data_Mgmt_Project
Link prediction in knowledge graph. 

### Data
#### wn18rr:

all.txt - full data set

train.txt - training set

valid.txt - validation set

test.txt - test set (Note: the actual test set is a subset of this set)

### Link prediction metrics

http://be.amazd.com/link-prediction/

### Load data

source load_data.sql

source create_test_set.sql # Note: this creates a test set w/ at least one of the entities in training set

source create_score_tables.sql # Note: score tables store scores for records in the test set

source create_views.sql # Note: each view only contains one relationship

### Setup

Note: source setup.sql again if you make change to any stored procedures/funcs. 

source setup.sql

### common neighbor

query: 

call cn_score('123', '456');

test:

call test_cn(-1); # test over test set

call test_cn(10); # test on 10 samples in test set

(Note: test_cn.sql populates result_cn table, i.e. calculating cn score for each relation over the test set)



### preferential attachment

query: 

call pa_score('123', '456');

test: 

call test_pa(-1); # test over test set

call test_pa(10); # test on 10 samples in test set

(Note: test_pa.sql populates result_pa table, i.e. calculating pa score for each relation over the test set)


### Jaccord's coefficient

query: 

call jc_score('123', '456');

test: 

call test_jc(-1); # test over test set

call test_jc(10); # test on 10 samples in test set

(Note: test_jc.sql populates result_jc table, i.e. calculating jc score for each relation over the test set)




### accuracy


