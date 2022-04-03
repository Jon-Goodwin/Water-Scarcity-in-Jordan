library(tidyverse)

### Simulating Data based on table percentages ###
set.seed(1)
n = 1000
p = c(97.1,0,1.1,0,0,0.3,1.0,0.3,0.1)
sample_urban <- sample(c("Piped into residence", "Public tap","Well in residence",
"Public well","Spring","Rainwater",
"Tanker truck","Bottled water", "Other"), n, replace=TRUE, prob=p)
time_urban <- sample(c("<15 minutes",">15 minutes"), n, replace = T, prob= c(99.9,0.1))
Time_to_water_source_urban <- as.data.frame(time_urban)
head(Time_to_water_source)
Water_source_urban <- as.data.frame(sample_urban)
Water_source_urban <- Water_source_urban %>%
  rename("Water source, Urban" = sample_urban)
Time_to_water_source_urban <- Time_to_water_source_urban %>%
  rename("Time to Water Source, Urban" = time_urban)

### Simulating Data for Rural people from table ###
k = 1000
q = c(81.4,0.3,3.7,0.4,2.3,0.6,10.6,0.1,0.5)
sample_rural <- sample(c("Piped into residence", "Public tap","Well in residence",
                         "Public well","Spring","Rainwater",
                         "Tanker truck","Bottled water", "Other"), k, replace=TRUE, prob=q)
time_rural <- sample(c("<15 minutes",">15 minutes"), k, replace = T, prob= c(97.5,2.5))
Time_to_water_source_rural <- as.data.frame(time_rural)
Water_source_rural <- as.data.frame(sample_rural)
Water_source_rural <- Water_source_rural %>%
  rename("Water Source, Rural" = sample_rural)
Time_to_water_source_rural <- Time_to_water_source_rural %>%
  rename("Time to Water Source, Rural" = time_rural)

### Combining Dataframes into Simulated Dataset ###

Water_source <- cbind(Water_source_urban,Water_source_rural)
Time_to_source <- cbind(Time_to_water_source_urban,Time_to_water_source_rural)
df <- cbind(Water_source,Time_to_source)
head(df)