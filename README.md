# MechaCar_Statistical_Analysis

# Multilinear Analysis of MPG

## Discussion

The "linear model" function was used with the MechaCar database.  The dependent variable was taken to be miles per gallon (mpg).  The other columns were the indepedent variables:  vehicle length, vehicle weight, spoiler angle, ground clearance, and AWD.  The type of data in the independent data was checked and found to be either "numeric" or "integer";therefore, no data type conversion was needed.

### Parameters of the Multiple Linear Model Fit

Coefficient  |  Value
:------:|:-----------------------------------:
Intercept | -1.0E-2
vehicle_length | 6.3 (slope)
vehicle_weight | 1.2E-3 (slope)
spoiler_angle | 6.9E-2 (slope)
ground_clearance | 3.5 (slope)
AWD | -3.4

### Additional Parameters from the Summary Table

Coefficient  | Individual P-values
:-----------:|:--------------------------------------:
Intercept | 5.1E-8
vehicle_length | 2.6E-12
vehicle_weight | 0.08
spoiler_angle | 0.31
ground_clearance | 5.2E-8
AWD | 0.19

Number of Degrees of Freedom:  44
Adjusted R-squared:  0.68
p-value: 5.3E-11

From these reults:

* Regarding the individual p-values, the vehicle weight is less than 0.05 and is therefore statistically significant, i.e., not influenced by randomness.  The intercept is also statistically significant and as such is not influenced by randomness associated with the other independent variables: vehicle length, spoiler angle, or ground clearance.  Thus there is a statistical significance between the intercept and the vehicle weight.  Perhaps additional data for the other values could be gathered to determine if they may still influence the miles per gallon if they become statistically sigificant.

* The p-value in the summary table was found to be 5.3-11.  Based on this "multilinear p-value" (as opposed to the individual p-values) the null hypothesis can be rejected which means *the slopes are not zero*.

* The R-squared value is an indicator of how much variability in miles per gallon (dependent variable) is explained by the multiple linear model. The R-squared value of 0.68 indicates that the model can be used for predicting the *current dataset* performance.  However, 3 of 4 independent variables were not statistically significant, indicating that forcasting performance based on this dataset is not supported (i.e., the model has been "overfitted").

* The number of degrees of freedom is > 20 which is the recommendation not to exceed to avoid insignificant values appearing to be significant.  The number of degrees of freedom could be reduced also for re-analysis.

