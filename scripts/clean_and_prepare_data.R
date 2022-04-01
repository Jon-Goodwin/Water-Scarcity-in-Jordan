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