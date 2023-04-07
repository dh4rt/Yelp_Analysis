# Yelp_Analysis
Machine Learning group project

## Segment 1 Tasks
1. Selected Topic 
We selected Yelp Review data as a topic because it would allow for practice with Natural Language Processing as well as machine learning to answer the business questions. Yelp Review data is made publicly available by Yelp at their website. The data consists of several files, and we have chosen to work with two of the files: business and reviews.

2. Yelp.com/dataset (link)
The Yelp data is divided into several files.
The Business file contains individual records for more than ____ businesses. It consists of 14 columns.
- business_id (primary key, to match with review text from Review file)
- name
- address
- city
- state
- postal_code
- latitude
- longitude
- stars
- review_count
- is_open
- attributes
- categories (contains information of type of business. We will search this column for records containing "Restaurants")
- hours
* How will the Business file be cleaned and prepared for analysis?
    - Create separate file with business_id, latitude, longitude (for future possible use, mapping/visualization)
    - Drop columns stars, review_count, is_open, hours, attributes, latitude, longitude
    - Keep only '1' value in 'is_open' column
    - Out of necessity for file size and learning purposes, the file will be read in with nrows=20000 to start, so that we can work with manageable file sizes.

The Review file:
- Review_id
- user_id
- business_id 
- stars
- useful
- funny
- cool
- text
- date

* How will the Review file be cleaned and prepared for analysis?
    - Drop columns user_id, useful, funny, cool, date
    - Keep only '1' value in 'is_open' column
    - Out of necessity for file size (5.34GB) and learning purposes, the file will be read in with nrows=20000 to start, so that we can work with manageable file sizes.

3. The questions that the team plans to answer with the project
- Do # stars given in a review correlate to sentiment value of the text written in the review? We will analyze the text and assign sentiment value and then run regression model to find correlation value of sentiment and stars.
- Does length of text in a review correlate to sentiment value?
- Does length of text in a review correlate to stars given?
-
-If there is time, analyze text for bi-grams and find 50 most popular bi-grams (for example "baked potato" or "grilled chicken"). Then see if there is correlation of bi-grams to sentiment value and/or bi-grams to stars. The idea here is that if a restaurant owner can understand that mentions of certain dishes in their reviews result in higher ratings, then they can train their waitstaff to upsell and recommend those dishes.

## Creating a Database in pgAdmin

After cleaning the separate Business and Review files, the database tables were created in pgAdmin:
![image of pgAdmin Business table creation]()

![image of pgAdmin Review table creation]()

## Loading the data into the database

Cleaned files were saved as .csv files and then imported into the pgAdmin tables:
![image of pgAdmin Business table loaded with data]()

![image of pgAdmin Review table loaded with data]()

## Data in the two tables is joined

We extracted 20000 rows of reviews and 20000 rows of businesses. We joined the data on the business_id column and matched reviews with business data. This resulted in a dataframe with 23557 rows. We dropped the null values, and exported the merged file as .csv for our modeling. 

![image of pgAdmin merged file]()

## Running the models

As of April 6, none of the models appears fully ready to run with final data. Further refinement is necessary. So far, the three models we have tried with the merged data are the following:

(Look into this)Run a classification model to predict categorical "is the review rating high or not" 

Random Forest Classifier

Decision Tree

Support Vector Machines
