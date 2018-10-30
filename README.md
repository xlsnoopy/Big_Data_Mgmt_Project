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


### Setup

Note: source setup.sql again if you make change to any stored procedures/funcs. 

source setup.sql

### common neighbor


### preferential attachment

query: 

select preferential_attachment('123', '456');


### Jaccord's coefficient


### accuracy

Note: make sure you edit test_acc.sql to use the correct metric and then source setup.sql before call test_acc. 

call test_acc(@acc,-1);

select @acc;

### results

| metric                  | acc         |
|-------------------------|:-----------:|
| preferential attachment | 0.201292407 |
| common neighbor         | 0.013893376 |
| Jaccord's coefficient   |             |
| max single              |             |
