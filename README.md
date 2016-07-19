=================================================================
## README for run_analysis.R
### Version 1.0
=================================================================

### Purpose of the script

This script does an analysis on the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

#### The script does the following things:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

==================================================================

### How this script works

#### Prerequisites:
1. Downloaded the acceleromoter data from the location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Set current working directory in R to the location of the zip file

3. Unzipped the data in current working directory. Inside this folder there will be a folder called "UCI HAR Dataset". Cut "UCI HAR Dataset" folder and put it into current working directory.

5. Inside R, make sure you have the package dplyr loaded. Otherwise use the following to download and load the package -
install.packages("dplyr")
library(dplyr)

6. Use the following command in R to run the code
source("run_analysis.R")

#### Script description:

1. Read test file X_test and features file
2. There are duplicate column names in features file so mutate is used to create unique column names
3. Assign column name from features file
4. Read train file and assign names from features
5. Read Subject and Activity files (subject_test and y_test) and rename columns to meaningful names
6. Combine the 3 data sets X_test, y_test, subject_test
7. Repeat steps 1 to 6 for for train files
8. Merge Train and Test sets to create one dataset
9. Read activity_labels file and use it to add activity names to merged dataset testtrain
10. Find columns with mean and standard deviation and create a set with only those in addition to Activity and Subject
11. Group by Activity and Subject. 
12. Take average of all variables for each Activity and Subject
13. Export tidy data set as  csv file



#### Output
* Script will output a file called "tidyData.csv" in current working directory.
* In R the output will be stored in an object called summaryAS
