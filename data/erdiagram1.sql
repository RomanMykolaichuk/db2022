CREATE TABLE "smartphone" (
  "id" serial PRIMARY KEY,
  "model_id" integer,
  "color" varchar(255)
);

CREATE TABLE "feature" (
  "id" serial PRIMARY KEY,
  "title" varchar(255)
);

CREATE TABLE "user" (
  "id" serial PRIMARY KEY,
  "name" varchar(255)
);

CREATE TABLE "brand" (
  "id" serial,
  "title" varchar(255)
);

CREATE TABLE "model" (
  "id" serial,
  "brand_id" integer,
  "title" varchar(255)
);

CREATE TABLE "smartphone_user" (
  "user_id" integer,
  "smartphone_id" integer,
  "begin_date" date,
  "end_date" date,
  PRIMARY KEY ("user_id", "smartphone_id")
);

CREATE TABLE "smartphone_feature" (
  "smartphone_id" integer,
  "feature_id" integer,
  "value" varchar(255),
  PRIMARY KEY ("smartphone_id", "feature_id")
);

ALTER TABLE "smartphone_feature" ADD CONSTRAINT "smart_feature" FOREIGN KEY ("feature_id") REFERENCES "feature" ("id");

ALTER TABLE "smartphone_feature" ADD CONSTRAINT "smart_feature_smartphone" FOREIGN KEY ("smartphone_id") REFERENCES "smartphone" ("id");

ALTER TABLE "smartphone_user" ADD CONSTRAINT "smart_user" FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "smartphone_user" ADD CONSTRAINT "smart_smartphone" FOREIGN KEY ("smartphone_id") REFERENCES "smartphone" ("id");

ALTER TABLE "model" ADD CONSTRAINT "model_brand" FOREIGN KEY ("brand_id") REFERENCES "brand" ("id");

ALTER TABLE "smartphone" ADD CONSTRAINT "smartphone_model" FOREIGN KEY ("model_id") REFERENCES "model" ("id");

