-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/kgW3m9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "review" (
    "review_id" INTEGER   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "business_id" INTEGER   NOT NULL,
    "stars" VARCHAR   NOT NULL,
    "useful" VARCHAR   NOT NULL,
    "funny" VARCHAR   NOT NULL,
    "cool" VARCHAR   NOT NULL,
    "text" VARCHAR   NOT NULL,
    "date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_review" PRIMARY KEY (
        "business_id"
     )
);

CREATE TABLE "business" (
    "business_id" INTEGER   NOT NULL,
    "name" INTEGER   NOT NULL,
    "address" INTEGER   NOT NULL,
    "city" INTEGER   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "postal_code" INTERGER   NOT NULL,
    "latitude" VARCHAR   NOT NULL,
    "stars" VARCHAR   NOT NULL,
    "review_count" INTERGER   NOT NULL,
    "is_open" INTERGER   NOT NULL,
    "attributes" VARHCAR   NOT NULL,
    "categories" VARCHAR   NOT NULL,
    "hours" VARCHAR   NOT NULL,
    CONSTRAINT "pk_business" PRIMARY KEY (
        "business_id"
     )
);

ALTER TABLE "business" ADD CONSTRAINT "fk_business_business_id" FOREIGN KEY("business_id")
REFERENCES "review" ("business_id");

