# Mid_term_project_regression 

![photo](https://github.com/katoro-a/Mid_term_project_regression/blob/b83226f8325a50a070f6c673dce9134fe30c26b0/download.jpg)

## Objective
------------------------------------------------------------------- 
- clean a housing data set set and create a regression model on the prices of the properties 
- data set is of seattle washington, and some of the surrounding area  
- time period covered is between 2014 

## Analyzing house prices 
2014-2015 price fluctuations 
- https://www.forbes.com/sites/billconerly/2014/02/19/how-bad-is-the-housing-market-a-forecast-update-for-2014-2015/?sh=7065d5616217 
- look for info on this years specifically to see why there were price fluctuations and outside factors that might be affecting the market 
  - note that januarys prices were lower due to bad weather('How Bad Is The Housing Market? A Forecast Update for 2014-2015')
    - this is reflected in the graphs displayed in Tableau 
-https://www.usatoday.com/story/money/business/2014/01/01/home-prices-2014-housing-starts/4181021/
  - housing market recovering in 2013 
  - rising mortgage interest rates in 2014  
  
 - https://en.wikipedia.org/wiki/Timeline_of_the_United_States_housing_bubble#2015
  - mid year : ** do some background reading on what these stats mean 

## Used tools 
----------------------------------------------------
Programs: 
1. Jupiter - python  
2. mysql
3. tableau  

Libraries: 
1. Normalizer
2. StandardScaler
3. confusion_matrix
4. cohen_kappa_score
5. math
6. statistics 
7. matplotlib.pyplot
8. seaborn
9. statsmodels.api
10. train_test_split
11. one hot encoder
12. numpy
13. pandas 

Workflow 
  - Gather the Data 
  - Explore the Data
  - Clean the Data 
    - check for duplicates
    - drop any columns that wont contribute to the model 
    - check the dtypes of the columns 
    - check for nans  
  - Histograms of all the columns 
    - check to see if you can convert the column to a standard normal distribution
    - chi2??
  - Boxplots
    - check to see if some of the outliers need to be cleaned 
    - apply a filter 
    - or calculate the iqr, then the upper and lower limits and filter out the uneeded data points 
   numerical data:  
      - scale the numerical data
  
  
  
  
# Results and conclusions 
    The accuracy of the model generated was .....
  
 -----------------------------------------------------------------------------------   
 The data set inclludes:

- **Id:** Unique identification number for the property.
- **date:** date the house was sold.
- **price:** price of the house.
- **waterfront:** house which has a view to a waterfront.
- **condition:** How good the condition is (overall). 1 indicates worn out property and 5 excellent.
- **grade:** Overall grade given to the housing unit, based on King County grading system. 1 poor ,13 excellent.
- **Sqft_above:** square footage of house apart from basement.
- **Sqft_living15:** Living room area in 2015(implies - some renovations). This might or might not have affected the lotsize area.
- **Sqft_lot15:** lotSize area in 2015(implies - some renovations).









