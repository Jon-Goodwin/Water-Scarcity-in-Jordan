#### Preamble ####]
# Purpose: To convert PDF Table to CSV to be read
# Author: Jonathan Goodwin
# Data: 28 March 2022
# Contact: jon.goodwin@mail.utoronto.ca

library(pointblank)
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- readr::read_csv("outputs/data/raw_data.csv"
                     )
### Removing index column ###
data <- raw_data[-1]

### Shrinking Raw Data to just the parts I'm interested in, water source
### and time to water source

data <-data[5:18,]

### Condense rows 12-14 ###
data <- data[-c(12,13),]
data[12,1] = "Percent of population <15 minutes from water source"

### Eliminate row 11, redundant ###
data <- data[-11,]

### Pointblank tests ###
    ### Plan for testing ###
        #all values in Chacteristic column should be character
        #all values in Urban should be numeric between 0 and 100
        #all values in Rural should be numeric between 0 and 100
        #all values in Total should be numeric between 0 and 100
agent <-
  create_agent(tbl = data) %>%
  col_is_character(column = Characteristic) %>%
  col_is_numeric(column = Urban) %>%
  col_is_numeric(column = Rural) %>%
  col_is_numeric(column = Total) %>%
  col_vals_in_set(column = Urban, c(0,100))%>%
  col_vals_in_set(column = Rural, c(0,100))%>%
  col_vals_in_set(column = Total, c(0,100))%>%
  interrogate()
agent

### Write cleaned and tested file to CSV ###
write.csv(x=data, file = "cleaned_data.csv")