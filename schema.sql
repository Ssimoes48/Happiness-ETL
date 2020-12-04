CREATE TABLE Countries (
    Country VARCHAR NOT NULL,
    Continent VARCHAR NOT NULL,
    Sub_Region VARCHAR NOT NULL,
    CONSTRAINT pk_Countries PRIMARY KEY (
        Country
     )
);

CREATE TABLE Population (
    Country VARCHAR NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL,
    Population_Growth_Rate DECIMAL NOT NULL,
    World_Percentage DECIMAL NOT NULL,
    CONSTRAINT pk_Population PRIMARY KEY (
        Country
     )
);

CREATE TABLE Countries_By_Government (
    Country VARCHAR NOT NULL,
    Govt_Type VARCHAR NOT NULL,
    Head_of_State VARCHAR NOT NULL,
    Head_of_Government VARCHAR NOT NULL,
    CONSTRAINT pk_Countries_By_Government PRIMARY KEY (
        Country
     )
);

CREATE TABLE Happiness_Index (
    Happiness_Rank VARCHAR NOT NULL,
    Country VARCHAR NOT NULL,
    Happiness_Score DECIMAL NOT NULL,
    Gdp_per_Capita INT NOT NULL,
    Social_Support DECIMAL NOT NULL,
    Healthy_Life_Expectancy DECIMAL NOT NULL,
    Choice_Freedom DECIMAL NOT NULL,
    Generosity DECIMAL NOT NULL,
    Perceptions_of_Corruption DECIMAL NOT NULL,
    Year INT NOT NULL,
    CONSTRAINT pk_Happiness_Index PRIMARY KEY (
        Country, Year
     )
);

ALTER TABLE Countries ADD CONSTRAINT fk_Countries_Country FOREIGN KEY("Country")
REFERENCES "Population" ("Country");

ALTER TABLE "Countries_By_Government" ADD CONSTRAINT "fk_Countries_By_Government_Country" FOREIGN KEY("Country")
REFERENCES "Countries" ("Country");

ALTER TABLE "Happiness_Index" ADD CONSTRAINT "fk_Happiness_Index_Country" FOREIGN KEY("Country")
REFERENCES "Countries" ("Country");

