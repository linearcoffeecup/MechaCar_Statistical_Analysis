# MechaCar_Statistical_Analysis

# Multilinear Analysis of MPG

## Discussion

The "linear model" function was used with the MechaCar database.  The dependent variable was taken to be miles per gallon (mpg).  The other columns were the indepedent variables:  vehicle length, vehicle weight, spoiler angle, ground clearance, and AWD.  The type of data in the independent data was checked and found to be either "numeric" or "integer";therefore, no data type conversion was needed.

### Parameters of the Multiple Linear Model Fit<br>

**TABLE 1**

Coefficient  |  Value
:------:|:-----------------------------------:
Intercept | -1.0E-2
vehicle_length | 6.3 (slope)
vehicle_weight | 1.2E-3 (slope)
spoiler_angle | 6.9E-2 (slope)
ground_clearance | 3.5 (slope)
AWD | -3.4

### Additional Parameters from the Summary Table<br>

**TABLE 2**
Coefficient  | Individual P-values
:-----------:|:--------------------------------------:
Intercept | 5.1E-8
vehicle_length | 2.6E-12
vehicle_weight | 0.08
spoiler_angle | 0.31
ground_clearance | 5.2E-8
AWD | 0.19

Number of Degrees of Freedom:  44 <br>
Adjusted R-squared:  0.68 <br>
p-value: 5.3E-11 <br>

From these reults:

*Which variables provide a non-random amount of variance to the mpg values in the dataset?*

* Regarding the individual p-values, the vehicle weight is less than 0.05 and is therefore statistically significant, i.e., not influenced by randomness.  The intercept is also statistically significant and as such is not influenced by randomness associated with the other independent variables: vehicle length, spoiler angle, or ground clearance.  Thus there is a statistical significance between the intercept and the vehicle weight.  Perhaps additional data for the other values could be gathered to determine if they may still influence the miles per gallon if they become statistically sigificant.

*Is the slope of the linear model considered to be zero? Why or why not?*

* The p-value in the summary table was found to be 5.3-11.  Based on this "multilinear p-value" (as opposed to the individual p-values) the null hypothesis can be rejected which means *the slopes are not zero*.

*Does this linear model precict mpg of MechaCar prototypes effectively? Why or why not?*

* The R-squared value is an indicator of how much variability in miles per gallon (dependent variable) is explained by the multiple linear model. The R-squared value of 0.68 indicates that the model can be used for predicting the *current dataset* performance.  However, 3 of 4 independent variables were not statistically significant, indicating that forcasting performance based on this dataset is not supported (i.e., the model has been "overfitted").

* The number of degrees of freedom is > 20 which is the recommendation not to exceed to avoid insignificant values appearing to be significant.  The number of degrees of freedom could be reduced also for re-analysis.

# Summary Statistics on Suspension Coils <br>

## Statistics of PSI

**TABLE 3**

<img width="344" alt="total_summary" src="https://user-images.githubusercontent.com/85037467/134826278-2223de8a-a0d2-421a-bd5e-00b2c30fc107.png">

## Statistics Grouped by Manufacturing Lot<BR>

**TABLE 4**
  
<img width="507" alt="lot_summary" src="https://user-images.githubusercontent.com/85037467/134826289-3d290887-2992-45a9-9fb6-5cba2b47d760.png">

### Discussion

The design specificaitons of the MechaCar supspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch (psi).  *Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually?*

The only lot which does not meet the design specification is Lot 3 with a variance of approximately 170.  The total suspension coil variance is approximately 62 psi which is below the 100 psi specification.


## One Sample T-Test Of All PSI Measurements

For this t-test, the MegaCar database was sampled randomly (with no filter on Manufacturing_Lot), and a population mean of 1500 PSI was used.  First, the applicabiity of the t-test was assessed.  According to the Module 15 the four conditions for a one-sample t-test are:

* Input data is numerical and continuous
* Sample data is selected randomly
* Input data is considered to be normally distributed
* Variance of input data should be very similar

Here normal distribution is assumed. However, variance of the sample population was checked against the variance of the population variance.  It was decided to use a sample size of 75 instead of 50 because variance was found to be approximately 56 which is reasonalbly close to the PSI population variance of 62 found previously.
  

**TABLE 5**
  MachaCardb$PSI  |       Values
:----------------:|:-------------------:
p-value.  | 2.2E-16
mean      | 3.17 (log10) -> 1479 PSI

## One Sample T-Test Of PSI Measurements By Manufacturing Lot

First, in comparing the manufacturing lot psi data statistics to the total population psi data statistics, it can readily be seen that the t-test does not apply for lot-comparison to total poplulation mean.  This is because the lot-variances (TABLE 4) are nowhere near the total population variance (TABLE 3).  The following **results were obtained  but should not be used for any statistical analysis** because the t-test pre-conditions are not met.
  
                                                                 
**TABLE 6**  |                         |    |**TABLE 7**             |           |     | **TABLE 8**                |                  |
:-----------:|:-----------------------:|:--:|:----------------------:|----------------:|:---:|:--------------------:|:----------------:|
**Lot1**     |  **Values**             |    | **Lot2**               |  **Values**     |.    | **Lot3**             |  **Values**      |
p-value      |  1                      |    | p-value                |  0.61           |     | p-value              |  0.04            | 
mean         |  1500                   |    | mean                   |  1500           |     | mean                 |  1496            |             


 # Study Design:  MechaCar Versus Competition
  
 ## Metrics
  
 The first consideration is the metrics to be included in the study.  When one looks at the mtcars database which comes with RStudio, it is seen that there are 11 variables.  Variables can be of different types:  numerical or categorical with their subtypes.  In this statistical study one metric will be city fuel efficiency (which is labeled cty in the mtcars database) which is of numerical type , and the other will be a safety rating which will be of categorical type.  There is also a need for a company column which will hold the names (or labels) of companies (ie MechaCar and competitors) which will also be of categorical type.
  
A look at the mtcars database shows that it does not have a safety rating metric, so this data will need to obtained and added.  Safety ratings should be otainable.
  
Rather than building onto the mtcars database, a separate dataframe can be made.  In addition to including the cty column and the safety_ratings column, a unique identifier column will also be added which will be the vehicle ID in the MechaCar database.  Therefore, vehicle IDs will also need to be obtained.  The new dataframe will be named statistical_df.  No null values will be allowed.  While fuel efficiency (cty) and safety (safety_rating) are to be tested against competition, inclusion of the unique vehicle ID helps with follow-up questions which may come up (e.g., from outliers or linear model fits).  The preparation of the database also includes checking the type of data.  The categorical data, safety_ratings, will have to have the factor() function applied if it is found to be of integer type.  *Thus the new statistical_df data frame will have columns: vehichle_id, company, cty, and safety_rating.*
  
 ## Tests
  
 The tests to be performed will be:  
  
  a) **one-sided t-test** where the t-test is defined as t.test(statistical_MechaCar, mu=mean(statistical_df$cty)) on the city fuel efficiency for only the MechaCars but tested against the population mean.  Here sattistical_MechaCar <- subset(statistical_df, company == "MechaCar") is used.  The four conditions for a one-sample t-test should be checked prior to performimg the test.  
  
The *null hypothesis* could be that the MechaCar city fuel efficiecy is predicted to have better efficiency with high statisitcal significance, and the *alternate hypothesis* could be that there is randomness seen in the data and so efficiency does not stand out for MechaCars compared to competitors.

b) **one-way ANOVA test** where for the aov() test the dependent variable will be cty and there will be two independent variables:  safety_rating and company.  The aov() test requires that the dependent variable be numeric and continuous (which it is) and the idependent variables be categorical (which they are).  In addition, an aov() test requires a data frame structure (which the statistical_df database was assumed to be generated with).  This test will explore the mean of the city fuel efficiency across MechaCar and competitor companies and the safety ratings of each car (recall that there is a one-to-one correspondence of safety rating and vihicle id).

The *null hypothesis* is that the MechaCars outperform competitors by having the highest (mean) city fuel efficiency *and* the highest (mean) safety rating.  The *alternative hypothesis* is that MechaCars do not statiscally outperform competitors for either fuel efficiency or safety rating or both.

## Vizualization

One side benefit of having one long column of companies (ie all companies in one column) is that it lends itself to be used in a box plot of safety rating versus dimensions city fuel efficiecy and companies.  This box plot would provide addtional statistical information as well as an easy visual presentation to see how MechaCars compare against competitors.
