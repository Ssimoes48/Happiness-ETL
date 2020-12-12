## ELT Project- Happiness Index

![happy faces](Images/happy_faces.PNG)

## Table of contents
* [General Info](#general-info)
* [Extract](#extract)
* [Transform](#transform)
* [Load](#load)
* [Queries](#queries)
* [Run Data](#run-data)
* [Resources](#resources)
* [Contacts](#contacts)

## General Info
Are you looking for more information on your target customer market? Or maybe you are looking for a new place to move? We have the database for you! The **Happiness Database**. Our database compares the Happiness Index of a country and other Geopolitical factors.

What is the Happiness Index? It is a rating of a country’s happiness on a scale of 1 to 10- where 10 is the happiest and 1 is the lease happy. There are a series of questions that are asked, and the sum of the answers is equal to the countries Happiness Score. 

![World Flag](Images/World_Flag_map.PNG)

## Extract

Our data came from several sources. We pulled CSV files as well as web scraped data. The CSVs were from sources such as Kaggle. The web scraping was from a site about countries that include current government types.  There are 193 countries in the world, however, our main Happiness Index CSV file included 153 counties that were surveyed. All data sets had country name as a common field.

## Transform
We imported our data sets into `Jupyter Notebook` to manipulate and transform our datasets. We had to reformate and clean our CSV files so that they were readable, and the columns were consistent. We did this by renaming columns and comparing country names to ensure all data was callable in our `SQL` queries. We also removed null values in areas that would not have been meaningful.

### Countries Table

Our country csv was a list of country, continent a region. We renamed the columns to be consistent. 

![Country 1](Images/country_jn_1.PNG)

We also `merged` the Country names against a year of our Happiness Index to make sure the data included the same list of countries.

![Country 2](Images/country_jn_2.PNG)

![Country Merge](Images/country_jn_merge.PNG)

To export the data to our `PostgreSQL` we use the following code including ` df.to_sql( ) ` . Also, we used `if_exists=”append” ` so that we would not keep adding to our tables in SQL if the table had data in it already. 

![Country SQL](Images/country_sql_jn.PNG)

We saved this database to a csv to use as a master country list in our other data sets for consistency. 

![Country Save](Images/country_csv_save.PNG)

### Government Table

The government table came from Web Scraping as website that had a list of government types by country. We used the pandas code ` pd.read_html( ) ` to read the data in `jupyter notebook` . 

![Gov Scrape](Images/gov_scrape.PNG)

We then cleaned up the column names and `merged` the data with our countries table to make sure the list of countries matched. 

![Gov 1](Images/gov_jn_1.PNG)

To export to SQL, we used the below code :

![Gov SQL](Images/gov_sql_jn.PNG)

### Happiness Index

The Happiness CSVs we found consisted of 5 CSV files over 5 years of time. We decided not to `aggregate` the data in the csv so that could have a record of all 5 years of Happiness Score. 

![Clean Happiness](Images/clean_csv_jn.PNG)

Every year of data had different column names, so we had to rename all the CSV files before adding them together. 

![Clean Happiness 2017](Images/clean_csv_jn2017.PNG)

Once the columns were consistent, we used the `pandas` function ` pd.concat( ) ` to add the 5 CVS years of data into one master table. 

![Clean Happiness DB](Images/clean_csv_jn_final.PNG)

To export the data to `SQL` we used the following code:

![Clean Happiness SQL](Images/clean_csv_sql_jn.PNG)

### Population Table

For our population table, we used a CSV of population over many years including future population predictions. We only need the population of the countries in our data frame, so we remade the table using only 2019 populations. 

![Pop CSV](Images/pop_jn.PNG)

Then we cleaned the data further by renaming the columns to be consistent and clear. 

![Pop rename](Images/pop_rename.PNG)

To export to `SQL` we used the following code :

![Pop SQL](Images/pop_sql_jn.PNG)

### Schema

To organize our data sets we use an `Entity Relationship Diagram` (ERD) tool. We created sample tables and linked them together on their primary key which was Country Name. We then exported he schema into `PostgreSQL` to create our tables.

When creating our schema, we assigned data types to all the columns. These included types like `VARCHAR` if the data was a word or `DECIMAL` if the data was a large number which included a decimal. The ‘Year’ column was assigned as an `INT` since it was only a 4-diget basic number. 

![ERD](Images/ERD.png)


## Load

Within `PgAdmin` , we created tables based on our schema. Then we ran our ` df.to_sql( ) `  in `jupyter notebook` to import our clean database information into the new tables we made in `postgress` . We also assigned the restriction to certain fields NOT to pull the data if the column was `NULL` . 

### Countries Table

![Countries Table](Images/countries_table.PNG)

### Countries By Government Table

![Gov Table](Images/gov_table.PNG)

### Population Table

![Pop Table](Images/pop_table.PNG)

### Happiness Index Table

![Happiness Table](Images/happiness_table.PNG)

Our schema also included constraints to make sure the data connected between tables correctly and on the `PRIMARY KEY` and `FOREIGN KEY` . 

![Alter tables](Images/alter_table.PNG)

## Queries 

Once the data was there, we created specific queries to call datasets.

### Query 1 

Querying the Happiness Score of a country and that country’s government type. This could help show the correlation of a country’s happiness and their government type. To do this, we used an `INNER JOIN` on the happiness_index and countries_by_government tables. We joined them on ‘country’. Because our happiness_index includes 5 years of data, we used the `AVG` function to calculate the average Happiness Score per country so the table only each country 1 time. 

![Query 1](Images/happy_gov_table.PNG)

### Query 2 

Querying all of the data in all of the tables. This shows a nice summary by country of Happiness Index and Geopolitical data. To combine all of the tables, we had to do 3 `INNER JOINS` to connect all 4 tables. We also had to `GROUP BY` the country to make the data show only 1 time per country. We used `AVG` to calculate the average of numerical values to the 1 entry per county would be accurate regarding happiness index. We also used `ORDER BY` to sort our data by ‘region’. This helped to group the data in clear way for viewing.  

![Query 2](Images/all_table.PNG)

### Query 3

Our 3rd query is similar to our second accept that it uses a `WHERE` clause to only pull data for 1 country. This is the most helpful query if you want a summary of one particular country. 

![Query 3](Images/united_kingdom_table.PNG)

We felt these were important representations of our data set because they showed the relationship between a country’s happiness index and their geopolitical factors.

## Run Data

### How to recreate our database: 

* Clone repository to your desktop 

* Open `PgAdmin` and import `schema.sql` from ERD folder

* Run all of `schema`. 

* In terminal, make sure you are in your `PythonData` environment in your terminal. Your conda environment needs the following dependencies to run these notebooks: `sqlalchemy`, `pandas`, `psycopg2` . You can check this by running the code `conda list` in your terminal. 

* Open CSV files notebooks in `Jupyter notebook` located in Data_Cleaning folder

* User will have to create a file called ‘config.py’ and save it in the main folder of repository. User will need to create a value called `‘postgress_pwd = {password}”` whose value is equal to the users `postgress password` for `PgAdmin`  

* Run notebooks completely in `Jupyter Notebook`

* Once the tables are populated in `PgAdmin`, run the queries located in file called`query.sql` in ERD folder 

## Resources 

[Kaggle- Happiness Index](https://www.kaggle.com/unsdsn/world-happiness)

[Happiness Index Report](https://worldhappiness.report/ed/2019/#read)

[Government Types](https://www.mapsofworld.com/thematic-maps/types-of-governments.html)

[Kaggle- Country Codes](https://www.kaggle.com/statchaitya/country-to-continent)

[World Population](https://worldpopulationreview.com/)


## Contacts

[Ashley DaCosta](https://github.com/aledacosta93)

[Sai Prasanna Dasari](https://github.com/prasanna0913)

[Tim Samson](https://github.com/timsamson)

[Sara Simoes](https://github.com/Ssimoes48)
