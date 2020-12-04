CREATE TABLE Countries (
    country VARCHAR NOT NULL,
    continent VARCHAR NOT NULL,
    sub_region VARCHAR NOT NULL,
    CONSTRAINT pk_Countries PRIMARY KEY (
        country
     )
);

CREATE TABLE Population (
    country VARCHAR NOT NULL,
    population INT NOT NULL,
    area INT NOT NULL,
    population_growth_rate DECIMAL NOT NULL,
    world_percentage DECIMAL NOT NULL,
    CONSTRAINT pk_Population PRIMARY KEY (
        country
     )
);

CREATE TABLE Countries_By_Government (
    country VARCHAR NOT NULL,
    govt_type VARCHAR NOT NULL,
    head_of_state VARCHAR NOT NULL,
    head_of_government VARCHAR NOT NULL,
    CONSTRAINT pk_Countries_By_Government PRIMARY KEY (
        country
     )
);

CREATE TABLE Happiness_Index (
    happiness_rank VARCHAR NOT NULL,
    country VARCHAR NOT NULL,
    happiness_score DECIMAL NOT NULL,
    gdp_per_capita INT NOT NULL,
    social_support DECIMAL NOT NULL,
    healthy_life_expectancy DECIMAL NOT NULL,
    choice_freedom DECIMAL NOT NULL,
    generosity DECIMAL NOT NULL,
    perceptions_of_corruption DECIMAL NOT NULL,
    year INT NOT NULL,
    CONSTRAINT pk_Happiness_Index PRIMARY KEY (
        country, year
     )
);

--ALTER TABLE Countries ADD CONSTRAINT fk_Countries_country FOREIGN KEY("country")
--REFERENCES "Population" ("country");

--ALTER TABLE "Countries_By_Government" ADD CONSTRAINT "fk_Countries_By_Government_country" FOREIGN KEY("country")
--REFERENCES "Countries" ("country");

--ALTER TABLE "Happiness_Index" ADD CONSTRAINT "fk_Happiness_Index_country" FOREIGN KEY("country")
--REFERENCES "Countries" ("country");

