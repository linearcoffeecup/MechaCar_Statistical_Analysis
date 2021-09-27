library(tidyverse)

#Deliverable 1

f <- file.choose()
MechaCardb <- read_csv(f)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCardb)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCardb))

# Call:
#  lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
#       ground_clearance + AWD, data = MechaCardb)
#
# Residuals:
#  Min       1Q   Median       3Q      Max 
# -19.4701  -4.4994  -0.0692   5.4433  18.5849 
#
# Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
# (Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
#  vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
#  vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
# spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
# ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
#  AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
# ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
# Residual standard error: 8.774 on 44 degrees of freedom
# Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
# F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

#Deliverable 2

f <- file.choose()
SuspensionCoildb <- read_csv(f)
total_summary <- SuspensionCoildb %>% summarise(PSI_mean = mean(PSI), PSI_std = sd(PSI),
                                                PSI_var=var(PSI), PSI_median=median(PSI))
lot_summary <- SuspensionCoildb %>% group_by(Manufacturing_Lot) %>% summarise(PSI_mean = mean(PSI), PSI_std = sd(PSI),
                                                                              PSI_var=var(PSI), PSI_median=median(PSI))

# Deliverable 3

sampletable <- MechaCardb %>% sample_n(50)
var(sampletable$PSI)
# 98.29592

sampletable <- MechaCardb %>% sample_n(75)
var(sampletable$PSI)
# 55.75387

#A sample size of 75 is ok to use for a t-test because it's variance is in the ballpark of the population variance
# which was 62 from the previous exercise

t.test(log10(sampletable$PSI), mu=1500)

# One Sample t-test
#
# data:  log10(sampletable$PSI)
# t = -5931255, df = 74, p-value < 2.2e-16
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#  3.175181 3.176187
# sample estimates:
#  mean of x 
# 3.175684 
#

?t.test()

filter_lot1 <- subset(MechaCardb, Manufacturing_Lot == "Lot1")
t.test(filter_lot1$PSI, mu=1500)

# One Sample t-test
#
# data:  filter_lot1$PSI
# t = 0, df = 49, p-value = 1
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#  1499.719 1500.281
# sample estimates:
#  mean of x 
# 1500 
#
filter_lot2 <- subset(MechaCardb, Manufacturing_Lot == "Lot2")
t.test(filter_lot2$PSI, mu=1500)

# One Sample t-test
#
# data:  filter_lot2$PSI
# t = 0.51745, df = 49, p-value = 0.6072
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#  1499.423 1500.977
# sample estimates:
#  mean of x 
# 1500.2 
#
filter_lot3 <- subset(MechaCardb, Manufacturing_Lot == "Lot3")
t.test(filter_lot3$PSI, mu=1500)

# One Sample t-test
#
# data:  filter_lot3$PSI
# t = -2.0916, df = 49, p-value = 0.04168
# alternative hypothesis: true mean is not equal to 1500
# 95 percent confidence interval:
#  1492.431 1499.849
# sample estimates:
#  mean of x 
# 1496.14 


