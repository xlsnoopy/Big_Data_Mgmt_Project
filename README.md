# Big_Data_Mgmt_Project
Link prediction in knowledge graph. 

### Data
#### wn18rr:

all.txt - full data set

train.txt - train set

valid.txt - validation set

test.txt - test set

### Load data

load_data.sql

### Link prediction metrics

http://be.amazd.com/link-prediction/

### Setup

Note: source setup.sql again if you make change to any stored procedures/funcs. 

source setup.sql

### common neighbor

select common_neighbor('123', '456');

### preferential attachment

select preferential_attachment('123', '456');

### testing

#### calculate accuracy

1. edit test_acc.sql changing score func to the one you like to test (e.x. preferential_attachment)

2.1 calculate acc on the entire test set

call test_acc(@acc, -1);

2.2 calculate acc on 1000 samples of the test set

call test_acc(@acc, 1000);



