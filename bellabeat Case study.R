#01- load required libraries
library(tidyverse)
library(lubridate)

#02- import all the CSV Files into R
calories_Per_hour <- read.csv(".../calories_Per_hour.csv")
intensities_per_hour <- read.csv(".../intensities_per_hour.csv")
Sleep_records <- read.csv(".../Sleep_records.csv")
steps_per_hour <- read.csv(".../steps_per_hour.csv")



#03- change hours and days to be date and time in all the tables
calories_Per_hour$Hour <- as.factor(calories_Per_hour$Hour)
calories_Per_hour$Hour <- as.POSIXct(calories_Per_hour$Hour, format= "%m/%d/%Y %H:%M")
calories_Per_hour$Day <- as.factor(calories_Per_hour$Day)
calories_Per_hour$Day <- as.POSIXct(calories_Per_hour$Day, format= "%d/%m/%Y")

intensities_per_hour$Hour <- as.factor(intensities_per_hour$Hour)
intensities_per_hour$Hour <- as.POSIXct(intensities_per_hour$Hour, format= "%m/%d/%Y %H:%M")
intensities_per_hour$Day <- as.factor(intensities_per_hour$Day)
intensities_per_hour$Day <- as.POSIXct(intensities_per_hour$Day, format= "%d/%m/%Y")

Sleep_records$Day <- as.factor(Sleep_records$Day)
Sleep_records$Day <- as.POSIXct(Sleep_records$Day, format= "%d/%m/%Y")

steps_per_hour$Hour <- as.factor(steps_per_hour$Hour)
steps_per_hour$Hour <- as.POSIXct(steps_per_hour$Hour, format= "%m/%d/%Y %H:%M")
steps_per_hour$Day <- as.factor(steps_per_hour$Day)
steps_per_hour$Day <- as.POSIXct(steps_per_hour$Day, format= "%d/%m/%Y")

#04- Join calories_Per_hour, intensities_per_hour & steps_per_hour

data_per_hour1 <- merge(calories_Per_hour, steps_per_hour)
data_per_hour <- merge(data_per_hour1, intensities_per_hour)


#05- add week_day to the files
data_per_hour$day_of_week <- format(as.Date(data_per_hour$Day), "%A")
Sleep_records$day_of_week <- format(as.Date(Sleep_records$Day), "%A")


#06- Export the edited CSV files to be prepare for the visualization step

write.csv(data_per_hour, file =".../data_per_hour.csv")
write.csv(Sleep_records, file =".../Sleep_records.csv")


