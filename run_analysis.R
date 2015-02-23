## 1. Merges the training and the test sets to create one data set

# Clean up workspace
rm(list=ls())

# Set working directory
wd<-file.path(getwd())

# Read in labels and features from files
genPath <- file.path(getwd(), "UCI HAR Dataset")
setwd(genPath)
labels<-read.table("activity_labels.txt", sep="")
features<-read.table("features.txt", sep="")

# Read in raw test data from files
setwd(wd)
testPath <- file.path(getwd(), "UCI HAR Dataset/test")
setwd(testPath)
x_test<-read.table("X_test.txt", sep="")
y_test<-read.table("y_test.txt", sep="")
sub_test<-read.table("subject_test.txt", sep=",")

# Assign column names to the data imported above
names(y_test)="labels"
names(sub_test)="subjectID"
names(x_test)=features[,2]

# Create the tidy test data set
data_test<-cbind(sub_test, y_test, x_test)

# Read in raw training data from files
setwd(wd)
trainPath <- file.path(getwd(), "UCI HAR Dataset/train")
setwd(trainPath)
x_train<- read.table("X_train.txt", sep="")
y_train<-read.table("y_train.txt", sep="")
sub_train<-read.table("subject_train.txt", sep=",")

# Assign column names to the data imported above
names(y_train)="labels"
names(sub_train)="subjectID"
names(x_train)=features[,2]

# Create the tidy training data set
data_train<-cbind(sub_train, y_train, x_train)

# Create the merged tidy data set
dataset <- rbind(data_train, data_test)

# 3.Uses descriptive activity names to name the activities in the data set

names(dataset)[1]="subjectID"
names(dataset)[2]="activity"

# 4.Appropriately labels the data set with descriptive variable names

dataset[,2] = labels[dataset[, 2], 2]

# 2.Extracts only the measurements on the mean and standard deviation 
# for each measurement. 

header <- colnames(dataset)
mean_stdev <- grepl("mean\\(\\)|std\\(\\)", header)
subdata <- cbind(dataset[,1:2],dataset[mean_stdev])

## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

# Drop the first two columns and create a new dataset with the variables
drops <- c("subjectID","activity")
subvar<-subdata[,!(names(subdata) %in% drops)]

# Create the tidy data set with the averages
tidydata_ave<-aggregate(subvar, list(subdata$subjectID, subdata$activity), mean)
names(tidydata_ave)[1]="subjectID"
names(tidydata_ave)[2]="activity"

# Write a txt file in the working directory
setwd(wd)
write.table(tidydata_ave, file = "tidydata.txt",row.name = FALSE)
