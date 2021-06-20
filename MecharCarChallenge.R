library(dplyr)
library(jsonlite)
library(tidyverse)

# import csv
MechaCar <- read.csv(file="MechaCar_mpg.csv", check.names=F,stringsAsFactors = F)

#create linear model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar)

#summary function
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar))


# import csv
Suspension <- read.csv(file="Suspension_Coil.csv", check.names=F,stringsAsFactors = F)

#total summary dataframe
total_summary <- Suspension %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#lot summary
lot_summary <- Suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# t test
t.test(Suspension$PSI, mu=1500)
t.test(subset(Suspension, Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(Suspension, Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(Suspension, Manufacturing_Lot == "Lot3")$PSI, mu=1500)
