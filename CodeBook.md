==================================================================
## run_analysis.R - CodeBook
### Version 1.0
==================================================================

#### Steps to run the script:

1. Download the acceleromoter data from the location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Set your current working directory in R to the location of the zip file

3. Download and save the R script, "run_analysis.R" in current working directory for R

4. Unzip the data in current working directory. It should create a folder called with a long name like - "getdata%2Fprojectfiles%2FUCI HAR Dataset"
	*Inside this folder there will be a folder called "UCI HAR Dataset".
	*Cut "UCI HAR Dataset" folder and put it into current working directory

5. Inside R, make sure you have the package dplyr loaded. Otherwise use the following to download and load the package -
	*install.packages("dplyr")
	*library(dplyr)

6. Use the following command in R to run the code
	*source("run_analysis.R")

	It will output a file called "tidyData.csv" in current working directory.
	In R the output will be stored in a data frame called summaryAS

=======================================================================

### Output description
* Activity column contains the 6 activities - Laying, Sitting, Standing, Walking, Walking Downstairs and Walking Upstairs
* Subject - number from 1 to 30 indicating the 30 test subjects.
* Rest of the columns provide mean of various accelerometer measurements
