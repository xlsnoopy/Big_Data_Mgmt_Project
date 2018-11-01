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

query:

select common_neighbor('123', '456');

### preferential attachment

query:

select preferential_attachment('123', '456');

### Jaccard's coefficient

### max single

Let Cij be the count of relation i involving entity j, then Mj = max(Cij) and Kj = argmax_i(Mj).

Then max_single(x, y) = Kx if Mx >= My, else Ky. 

query:

select max_single('123', '456');

### accuracy

Note: make sure you edit test_acc.sql to use the correct metric and then source setup.sql before call test_acc. 

call test_acc(@acc,-1);

select @acc;

### results

| metric                  | acc   |
|-------------------------|:-----:|
| preferential attachment | 0.201 |
| common neighbor         | 0.014 |
| Jaccard's coefficient   | 0.385 |
| max single              | 0.656 |
