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

source create_aux_tb.sql # creates test_set, demo_set, and relation


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

query:

select jaccard_coefficient('123', '456');

### max single

Let Cij be the count of relation i involving entity j, then Mj = max(Cij) and Kj = argmax_i(Mj).

Then max_single(x, y) = Kx if Mx >= My, else Ky. 

query:

select max_single('123', '456');

### friend measure

query:

select friend_measure('123', '456');

### accuracy

Note: make sure you edit test_acc.sql to use the correct metric and then source setup.sql before call test_acc. 

call test_acc(@acc,-1);

select @acc;

### results

| metric                  | acc   |
|-------------------------|:-----:|
| preferential attachment | 0.237 |
| common neighbor         | 0.106 |
| Jaccard's coefficient   | 0.385 |
| max single              | 0.686 |
| friends measure         | 0.766 |

### neo4j

#### Note: database contains Word, Index, and they are related as the following

(w:Word)-[r:ASSOCIATE_WITH]->(i:Index)

(ein:Index)-[r:POINT_TO]->(eout:Index)

Word/Index has attribute value

POINT_TO has attribute name (the 11 relationships)

#### load data

(Note: move files to /var/lib/neo4j/import before you can load them to neo4j. Specifically, put all.txt, id.txt, word.txt, and word_id_pair.txt to /var/lib/neo4j/import)

##### load word

load csv from "file:///wn18rr/word.txt" as line create (:Word {value: line[0]});

load csv from "file:///wn18rr/id.txt" as line create (:Index {value: line[1]});

create index on :Word(value)

create index on :Index(value)

##### load word-index relationship

load csv from "file:///wn18rr/word_id_pair.txt" as line fieldterminator "\t"

merge (w:Word {value : line[0]})

merge (i:Index {value : line[1]})

create (w)-[:ASSOCIATE_WITH {name : '_associate_with'}]->(i)

##### load ein-rel-eout

using periodic commit 1000

load csv from "file:///wn18rr/all.txt" as line fieldterminator "\t"

merge (ein:Word {value : line[0]})

merge (eout:Word {value : line[2]})

create (ein)-[:POINT_TO {name : line[1]}]->(eout)
