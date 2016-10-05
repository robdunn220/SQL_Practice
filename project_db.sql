CREATE TABLE project (
  id serial PRIMARY KEY,
  name varchar,
  age integer
);

CREATE TABLE tech (
  id serial PRIMARY KEY,
  name varchar,
  age integer
);

CREATE TABLE project_uses_tech (
  id serial PRIMARY KEY,
  project_id integer REFERENCES project (id),
  tech_id integer REFERENCES tech (id),
  name varchar,
  age integer
);
