create table project (id serial PRIMARY KEY, title varchar);
create table volunteer (id serial PRIMARY KEY, name varchar, project_id int);

-- CREATE TABLE "project" (
-- 	"id" serial NOT NULL,
-- 	"title" varchar NOT NULL,
-- 	CONSTRAINT "project_pk" PRIMARY KEY ("id")
-- ) WITH (
--   OIDS=FALSE
-- );
--
-- CREATE TABLE "volunteer" (
-- 	"id" serial NOT NULL,
-- 	"project_id" int NOT NULL,
-- 	"name" varchar NOT NULL,
-- 	CONSTRAINT "volunteer_pk" PRIMARY KEY ("id")
-- ) WITH (
--   OIDS=FALSE
-- );
--
-- ALTER TABLE "volunteer" ADD CONSTRAINT "volunteer_fk0" FOREIGN KEY ("project_id") REFERENCES "project"("id");
