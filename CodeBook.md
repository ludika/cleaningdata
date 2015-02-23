## Getting and Cleaning Data Course Project

### Source Data

A full description of the data used in this project can be found at The UCI Machine Learning Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Raw Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.

### Transformation details

The raw data sets are processed with run_analysis.R script to create a tidy data set.
There are 5 steps:
* Merge training and test sets to create one data set.
Test (X_test, y_test, subject_test) and training data (X_train, y_train, subject_train) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).
* Extract only the measurements on the mean and standard deviation for each measurement.
From the new data set is extracted a new data set with only the values of estimated averages (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") for each measurement.
* Use descriptive activity names to name the activities in the data set
Labels in activity column are changed in descriptive activity names as assigned by original collectors (activity_labels.txt).
* Appropriately labels the data set with descriptive variable names
Labels of the first two columns are changed: the first column is labelled as "subjectID" and the second column as "activity".
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.
From the new data set is created a final tidy data set where numeric variables are averaged for each activity and each subject. The result is saved as "tidydata.txt", a 180x68 data table, where the first column contains subject IDs, the second column contains activity names and then the averages for each of the 66 attributes.

