# Mid_term_project_regression / Analyzing house prices 

![photo](https://github.com/katoro-a/Mid_term_project_regression/blob/b83226f8325a50a070f6c673dce9134fe30c26b0/download.jpg)

## Objective
------------------------------------------------------------------- 
Use the regression data set to predict the price of homes in the area. The data set includes property prices from 2014-2015 of individual houses, zipcodes are provided as well as other stats about the houses themselves, layout, condition and the grade.
- data set is of seattle washington and the surrounding area  

![photo](https://github.com/katoro-a/Mid_term_project_regression/blob/a4fa5581d223507a8e6a513c87a1ad31ac919ace/Screen%20Shot%202021-12-04%20at%205.09.25%20PM.png)





# Used tools 
----------------------------------------------------
## Programs: 

  1. Jupiter - python  
  2. MYSQL workbench
  3. Tableau : https://public.tableau.com/shared/782BXWCK7?:display_count=n&:origin=viz_share_link

## Methods:
  1. Logistic Regression
  2. Histograms, box-whisker plots  
  3. KNN
  4. MPLRegressor
  5. Kappa Score 

  ## Libraries: 

  1. StandardScaler
  2. confusion_matrix
  3. cohen_kappa_score See if you should apply this to your model 
  4. statistics 
  5. matplotlib.pyplot
  6. seaborn
  7. statsmodels.api
  8. train_test_split
  9. numpy
  10. pandas 

## Workflow 
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
   - correlation matrix 
    - remove any columns with a value higher than .8
  - Train test split 
    - scatter plot   
  - Methods of testing the accuracy of the model 
    - mean absolute error 
    - mean squared error 
    - root mean squared error 
    - r^2
  - KNN
  - MLPRegressor 
  - Kappa Score 

  
# Results and conclusions 
    The model generated a linear regression score of 0.70, an r-squared of 0.7, and a KNN score of 0.77. Not sure that this model would accuratly predict values outside of the years given, since the market is based on outside factors like weather, supply and demand, how the economy is currenlty doing that year. 
    
![photo](https://github.com/katoro-a/Mid_term_project_regression/blob/0512e244d48627e39157e7b48138a8d56b259dc8/Screen%20Shot%202021-12-04%20at%205.22.29%20PM.png)    
    
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









