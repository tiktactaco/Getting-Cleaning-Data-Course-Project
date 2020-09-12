# Getting-Cleaning-Data-Course-Project
Coursera Course Project for the class "Getting and Cleaning Data"

##This repository contains the following files:

### cleandata.txt
A tidy dataset (one observation per row, one variable per column) containing the mean value of each measurement in the original dataset by activity and subject. This file is formatted with one space between each piece of data, and there is no header.

### Codebook.md 
An R markdown file explaining the variables in the clean data file and the data transformations performed on the raw data.

### run_analysis.R
An R script that ingests, cleans, and transforms the original data to output the cleandata.txt file.

## Methodology

### Import and Clean
The data was originally downloaded in a set of files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Upon downloading, the following files were loaded into R:
- activity_labels.txt
- X_train.txt
- X_test.txt
- y_train.txt
- y_test.txt
- subject_train.txt
- subject_test.txt
- features.txt

In order to clean the data, the x_train and x_test datasets were merged with rbind(), the same with the respective y and subject files. features.txt was used to provide feature names to the merged 'x' files. Then the mean() and std() features were extracted using select(). The y and subject files were appended to the resulting dataframe using cbind(). 

### Transform
Using the melt and dcast functions from the reshape2 package, the dataframe was grouped by subject and activity, and then averages were calculated for each of the remaining variables. The resulting dataframe contains one observation per row (one of each activity per subject).

Many thanks to David Hood's thoughtful post, which was a great help in working through this assignment:
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
