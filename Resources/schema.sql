-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8TAgSU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "countries" (
    "country" VARCHAR   NOT NULL,
    "continent" VARCHAR,
    "region" VARCHAR,
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "population" (
    "country" VARCHAR   NOT NULL,
    "population" DECIMAL,
    "area" INT,
    "population_growth_rate" DECIMAL,
    "world_percentage" DECIMAL,
    CONSTRAINT "pk_population" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "countries_by_government" (
    "country" VARCHAR   NOT NULL,
    "govt_type" VARCHAR,
    "head_of_state" VARCHAR,
    "head_of_government" VARCHAR,
    CONSTRAINT "pk_countries_by_government" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "happiness_index" (
    "happiness_rank" VARCHAR   NOT NULL,
    "country" VARCHAR   NOT NULL,
    "happiness_score" DECIMAL   NOT NULL,
    "gdp_per_capita" DECIMAL   NOT NULL,
    "social_support" DECIMAL   NOT NULL,
    "healthy_life_expectancy" DECIMAL   NOT NULL,
    "choice_freedom" DECIMAL   NOT NULL,
    "generosity" DECIMAL   NOT NULL,
    "perceptions_of_corruption" DECIMAL   NOT NULL,
    "year" INT   NOT NULL,
    CONSTRAINT "pk_happiness_index" PRIMARY KEY (
        "country","year"
     )
);

ALTER TABLE "population" ADD CONSTRAINT "fk_population_country" FOREIGN KEY("country")
REFERENCES "countries" ("country");

ALTER TABLE "countries_by_government" ADD CONSTRAINT "fk_countries_by_government_country" FOREIGN KEY("country")
REFERENCES "countries" ("country");

ALTER TABLE "happiness_index" ADD CONSTRAINT "fk_happiness_index_country" FOREIGN KEY("country")
REFERENCES "countries" ("country");

