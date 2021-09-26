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

From these reults:

* The vehicle weight is less than 0.05 and is therefore statistically significant:  not influence by random variables.  The intercept is also statistically significant and as such is not influenced by randomness associated with the vehicle length, spoiler angle, or ground clearance.  Thus there is a statistical significance between the intercept and the vehicle weight.  Perhaps additional data for the other values could be gathered to determine if they may still influence the miles per gallon.

* The R-squared value...

* The number of degrees of freedom is > 20 which is the recommendation not to exceed to avoid insignificant values appearing to be significant.  The number of degrees of freedom could be reduced also for re-analysis.

