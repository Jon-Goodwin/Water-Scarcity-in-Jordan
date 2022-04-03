# Paper-4
### Analysis of Jordan Population and Family Health Survey(1997) ###

### Summary ###
Analysis of water availability based on Jordan Population and Family
Health Survey(1997) from DHS program, found [here](https://dhsprogram.com/publications/publication-fr96-dhs-final-reports.cfm)

Focused on table 2.7 found on page 32, containing information on water availability for urband and rural populations.

### Organization ###
[inputs/data](https://github.com/Jon-Goodwin/Paper-4/tree/main/inputs/data) folder contains the original PDF

[outputs/data](https://github.com/Jon-Goodwin/Paper-4/tree/main/outputs/data) contains the table converted to csv file format in R.

[outputs/paper](https://github.com/Jon-Goodwin/Paper-4/tree/main/outputs/paper) contains the paper.pdf and R markdown files, as well as the bibiliography file.

[scripts](https://github.com/Jon-Goodwin/Paper-4/tree/main/scripts) folder contains:

00-simulation.R the simulated dataset, 

01-grather_data.R where the PDF was read and converted to raw_data.csv,

clean_and_prepare_data.R where the raw_data was cleaned and converted to the final dataset to be used.

### Step 1 ###
Simulated a dataset based on table 2.7.

Read PDF from DHS into R and converted table on page 32 of
the Jordan Population and Family Health Survey into a raw_data file.


### Step 2 ###
Cleaned raw data file.
Tested cleaned data using Pointblank package.

### Step 3 ###
Compose paper with analysis.

### Libraries used ###
1.[tidyverse](https://style.tidyverse.org/documentation.html)

2.[pointblank](https://rich-iannone.github.io/pointblank/)

3.[pdftools](https://cran.r-project.org/web/packages/pdftools/index.html)

4.[knitr](https://www.rdocumentation.org/packages/knitr/versions/1.30)

5.[haven](https://www.rdocumentation.org/packages/haven/versions/2.4.3)

6.[reshape2](https://www.rdocumentation.org/packages/reshape2/versions/1.4.4)

7.[kableExtra](https://www.rdocumentation.org/packages/kableExtra/versions/1.3.4)