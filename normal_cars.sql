DROP TABLE IF EXISTS make cascade;
DROP TABLE IF EXISTS model cascade;
DROP TABLE IF EXISTS vehicles cascade;
DROP TABLE IF EXISTS year cascade;


CREATE TABLE make (
  id serial primary key ,
  code character varying(125) not null,
  title character varying(125) not null
);

CREATE TABLE model (
  id serial primary key ,
  code character varying(125) not null,
  title character varying(125) not null
);

CREATE TABLE year (
  id serial primary key,
  year smallint NOT NULL
);

CREATE TABLE vehicles (
  id serial primary key,
  make_id integer references make NOT NULL,
  model_id integer references model NOT NULL,
  year_id integer references year NOT NULL
);


insert into make(code, title)
select distinct make_code, make_title
from car_models;

insert into model(code, title)
select distinct model_code, model_title
from car_models;

insert into year(year)
select distinct year
from car_models;

insert into vehicles(make_id, model_id, year_id)
select make.id, model.id, year.id
from make, model, year, car_models
WHERE make.code = car_models.make_code
  AND make.title = car_models.make_title
  AND model.code = car_models.model_code
  AND model.title = car_models.model_title
  AND year.year = car_models.year;

select distinct make.title
from make
inner join vehicles
on make.id = vehicles.id;

select distinct model.title
from vehicles
inner join make
on vehicles.make_id = make.id
inner join model
on vehicles.model_id = model.id
where make.code = 'VOLKS';

select distinct make.code, model.code, model.title, year.year
from vehicles
inner join make
on vehicles.make_id = make.id
inner join model
on vehicles.model_id = model.id
inner join year
on vehicles.year_id = year.id
where make.code = 'LAM';


select  model.code
from vehicles
inner join model
on vehicles.model_id = model.id
inner join year
on vehicles.year_id = year.id;
-- where year < 2016 AND year > 2009;
where year BETWEEN 2010 and 2015;
