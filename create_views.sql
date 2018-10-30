create view hn_train as
select *
from wn18rr_train
where rel='_hypernym';

create view drf_train as
select *
from wn18rr_train
where rel='_derivationally_related_form';

create view ih_train as
select *
from wn18rr_train
where rel='_instance_hypernym';

create view as_train as
select *
from wn18rr_train
where rel='_also_see';

create view mm_train as
select *
from wn18rr_train
where rel='_member_meronym';

create view sdto_train as
select *
from wn18rr_train
where rel='_synset_domain_topic_of';

create view hp_train as
select *
from wn18rr_train
where rel='_has_part';

create view modu_train as
select *
from wn18rr_train
where rel='_member_of_domain_usage';

create view modr_train as 
select *
from wn18rr_train
where rel='_member_of_domain_region';

create view vg_train as
select *
from wn18rr_train
where rel='_verb_group';

create view st_train as
select *
from wn18rr_train
where rel='_similar_to';
