## Getting and Cleaning Data Course Project

### Goal

The aim of this project is to demonstrate the ability to collect and clean a tidy data set that can be used for subsequent analysis. A full description of the data used in this project can be found at The UCI Machine Learning Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project Summary

In this project, you find:
* run_analysis.R : the R-code run on the data set
* tidydata.txt : the clean data extracted from the original data using run_analysis.R
* CodeBook.md : the CodeBook reference to the variables in tidydata.txt
* README.md : the analysis of the code in run_analysis.R

The R script called run_analysis.R does the following instructions: 
* Merges the training and the test sets to create one data set. 
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set 
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to work on this course project:
1-Download the data source and put into a folder on your local drive named UCI HAR Dataset.

2-Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

3-Run source("run_analysis.R"), then it will generate a new file tidydata.txt in your working directory.

### Dependencies

It depends on reshape2 and data.table.

### Making Modifications to This Script

Once you have obtained and unzipped the source files, you will need to make one modification to the R file before you can process the data.
Note that on line 26 of run_analysis.R, you will set the path of the working directory to relect the location of the source files in your own directory.

### Additional Information

You can find additional information about the variables, data and transformations in the CodeBook.MD file.