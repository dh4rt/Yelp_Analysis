# Yelp_Analysis
Machine Learning group project
* Data Analyst - David Hart
* Data Analyst - Elizabeth Bolin

## Overall Project Objectives
The Yelp app allows for customers to write text-based reviews and leave star-ratings for their experiences at businesses. Our objective is to harness the sentiment in the text of the review by comparing it to the star-rating, and to create positive and negative wordclouds which would give at a glance an idea of the reasons for the positive or negative review. We want to provide a visualization of the reasons why customers love or dislike a business.  

The Yelp dataset, available free from Yelp, grabbed our attention as a source for our project as both of us were interested to continue practicing with Natural Language Processing as well as machine learning to answer business questions.

## The dataset  [Yelp.com/dataset](Yelp.com/dataset)

The data consists of several files, and we have chosen to work with two of the files: business and reviews.

### The Business file consists of 14 columns.

- business_id: ID of the business
- name
- address
- city
- state
- postal_code
- latitude
- longitude
- stars: average rating of the business
- review_count: number of reviews the business received
- is_open: '0' for closed and '1' for open
- attributes: various special characteristics of a business
- categories: contains information of type of business
- hours


#### Cleaning the Business Data for analysis
    - Keep only '1' value in 'is_open' column
    - Drop columns stars, review_count, is_open, hours, attributes, latitude, longitude
      * later we decide to keep latitude and longitude for business data visualization 
    - Out of necessity for file size and learning purposes, the file will be read in with nrows=20000 to start, so that we can work with manageable file sizes.
      * further exploration with reading in the original .json data allowed for reading in 100,000 records

### The Review file:

- Review_id
- user_id
- business_id 
- stars
- useful
- funny
- cool
- text
- date

#### Cleaning the Review Data for analysis
    - Drop columns user_id, useful, funny, cool, date
    - Out of necessity for file size (5.34GB) and learning purposes, the file will be read in with nrows=20000 to start, so that we can work with manageable file sizes. 
      * later we find that we can successfully read in 100000 records

The original questions that the team plans to answer with the project

- Do # stars given in a review correlate to sentiment value of the text written in the review? We will analyze the text and assign sentiment value and then run regression model to find correlation value of sentiment and stars.
- Does length of text in a review correlate to sentiment value?
- Does length of text in a review correlate to stars given?

-If there is time, analyze text for bi-grams and find 50 most popular bi-grams (for example "baked potato" or "grilled chicken"). Then see if there is correlation of bi-grams to sentiment value and/or bi-grams to stars. The idea here is that if a restaurant owner can understand that mentions of certain dishes in their reviews result in higher ratings, then they can train their waitstaff to upsell and recommend those dishes.


Revised business questions (4/13/23)
- Does sentiment value of review text align with the star-rating as given by reviewers?
- Can we tease out the words associated with positive or negative reviews for a particular business?
- Which machine learning models will be best at predicting review positivity or negativity given the text of the review?

## Creating a Database and loading the data in pgAdmin

After cleaning the separate Business and Review files, the database tables were created in pgAdmin:
![image of pgAdmin Business table creation](https://github.com/dh4rt/Yelp_Analysis/blob/main/Business_Table_pgAdmin.png)

![image of pgAdmin Review table creation](https://github.com/dh4rt/Yelp_Analysis/blob/main/Review_Table_pgAdmin.png)

## Data in the two tables is joined

At first, we extracted 20000 rows of reviews and 20000 rows of businesses. We joined the data on the business_id column and matched reviews with business data. This resulted in a dataframe with 23557 rows. We dropped the null values, and exported the merged file as **joined_data_23557.csv** for our modeling. 

![image of pgAdmin merged file](https://github.com/dh4rt/Yelp_Analysis/blob/main/merged_table_pgAdmin.png)

Revised table creation (4/13/23)

This week we decided to try our Yelp Review data analysis visualizations using a smaller subset of the records. We wanted to get the most records available on our dataset, so we searched for the mode (most frequently appearing) postal_code value. The result was 93101: Santa Barbara. 

Next, in pgAdmin, we queried the joined_dataset: 

```SQL
SELECT *
INTO santa_barbara
FROM joined_data
WHERE postal_code = '93101';

SELECT *
FROM santa_barbara;
```
![image of Santa Barbara records SQL](https://github.com/dh4rt/Yelp_Analysis/blob/main/santa_barbara_sql.png)

Finally, we exported the Santa Barbara subset into **Santa_Barbara_Yelps.csv**

## Running the models

### Pre-processing the data
In order to run the review text through the model, we had to clean up the text. Regular expressions aided in making the text uniform:

![image of preprocessing](https://github.com/dh4rt/Yelp_Analysis/blob/main/Preprocess_code.png)

Before the pre-processed text could be run through the models, it had to be vectorized (made numeric):

![image of vectorize code](https://github.com/dh4rt/Yelp_Analysis/blob/main/Vectorize_text.png)

Update 4/13/23: Lots of pair-coding took place this week, with David taking extra time to build the code to run Naive Bayes model. 

### Support Vector Machine

![image of SVM code](https://github.com/dh4rt/Yelp_Analysis/blob/main/Machine_Learning_SVM.png)

Confusion Matrix:

![image of confusion matrix](https://github.com/dh4rt/Yelp_Analysis/blob/main/ML_SVM_confusion_matrix.png)

Classification Report:

![image of classification code](https://github.com/dh4rt/Yelp_Analysis/blob/main/ML_SVM_classification_code.png)

![image of classification report](https://github.com/dh4rt/Yelp_Analysis/blob/main/ML_SVM_classification_report.png)

**The SVM Classifier results in accuracy of 87% and f-1 score of 93% for positive reviews, and scored 0.0 for negative reviews.**

**_Therefore, we will continue working on machine learning models by resampling our heavily imbalanced data using SMOTE._**

Findings: 
* We learned that models can take as input either text or numeric data. Some models prefer numeric over text. 
* We learned that some models take matrix information as input, and that matrix can be either sparse or dense. Some models prefer a dense matrix, such as Naive Bayes. 
* We learned that in order to transform text into numeric data, it must be vectorized. 

Update 4/6/23: none of the models appears fully ready to run with final data. Further refinement is necessary. So far, the three models we have tried with the merged data are the following:

  1. Random Forest Classifier

  2. Decision Tree

  3. Support Vector Machines

  4. Consider running a classification model to predict categorical "is the review rating high or not" like Naive Bayes

## Visualizations

One model that we ran also has a heatmap plot for the confusion matrix: 

![image of heatmap]()

We also are interested in how wordclouds are created, and have read numerous articles on different ways to code and format wordclouds. Again, we ran into roadblocks on the text input for the wordclouds, and found that we had to pay close attention to the type of data input for text, ie. array, string, object, etc.

![image of regular wordcloud]()

We also experimented with building a wordcloud based on frequency of words in the text. In order to do this, we had to run a tfIDF model to obtain frequency values for each word. Then we used the frequencies as input for the wordcloud.

![image of frequency wordcloud]()