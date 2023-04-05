-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kgW3m9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "review" (
    "review_id" VARCHAR   NOT NULL,
    "user_id" VARCHAR   NOT NULL,
    "business_id" VARCHAR   NOT NULL,
    "stars" INTERGER   NOT NULL,
    "text" VARCHAR   NOT NULL,
    CONSTRAINT "pk_review" PRIMARY KEY (
        "business_id"
     )
);

CREATE TABLE "business" (
    "business_id" VARCHAR   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "postal_code" VARCHAR   NOT NULL,
    "latitude" VARCHAR   NOT NULL,
    "categories" VARCHAR   NOT NULL,
    CONSTRAINT "pk_business" PRIMARY KEY (
        "business_id"
     )
);

ALTER TABLE "business" ADD CONSTRAINT "fk_business_business_id" FOREIGN KEY("business_id")
REFERENCES "review" ("business_id");

