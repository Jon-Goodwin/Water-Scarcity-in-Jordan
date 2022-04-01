library(pdftools)
library(tidyverse)
### Outline ###
  # PDF table will be split into 

### Read in PDF ###
PDF <- pdf_text("inputs/data/FR96.pdf")

### Convert to tibble ###
PDF <- tibble(table = PDF)

### Select page of table ###
PDF.1 <- PDF %>%
  slice(n = 32)

### Separating Rows ###
PDF.2 <- PDF.1 %>%
  separate_rows(table, sep  ="\\n", convert = F)

### Remove initial text ###
PDF.3 <- tail(PDF.2, -7)

### Formating Table ###
data <- PDF.3 %>% 
  filter(table != "_________________________________________________" ) %>% 
  mutate(table = str_trim(table)) %>% 
  separate(table, sep = "\\s+(?=\\d+)", 
           into = c("Characteristic", "Urban", "Rural", "Total"), fill = "right") %>% 
  filter(Characteristic != "") %>% 
  slice(-1) 

### Removing last blank line ###
n<- dim(data)[1]
data <- data[1:(n-1),]

### Saving as CSV ###
write.csv(x = data, file = "raw_data.csv")