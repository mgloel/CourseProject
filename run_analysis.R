# Getting and Cleaning Data - Course Project - run_analysis
# Author: Matthias Gloel
#
# You should create one R script called run_analysis.R that does the following. 

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# load necessary libraries, make sure they are installed
library(dplyr)

# Download zipfile from website and extract


fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL, destfile="Dataset.zip", method = 'curl')
unzip('Dataset.zip')

# Read in individual data files *.txt files
setwd('./UCI HAR Dataset/')
activity_labels <- read.table('activity_labels.txt', sep='\t')
features <- read.table('features.txt')
features <- as.vector(features[,2])

# read test data
setwd('./test')
test_set <- read.table('X_test.txt')
test_labels <- read.table('y_test.txt')
subject_id <- read.table('subject_test.txt')
testdata <- cbind(subject_id, test_labels, test_set)

# read train data
setwd('../train')
train_set <- read.table('X_train.txt')
train_labels <- read.table('y_train.txt')
subject_id <- read.table('subject_train.txt')
traindata <- cbind(subject_id, train_labels, train_set)

# Merge data rbinding
col_names <- c(c('subject_id', 'activity_label'), features)
wholedata <- rbind(testdata, traindata)
names(wholedata) <- col_names
# change duplicate column names
names(wholedata)<-make.names(names(wholedata),unique=TRUE) 

# Create a second independent data set

bySubjectLabel <- group_by(wholedata,subject_id,activity_label)
meanSubjectLabel <- summarise_each(bySubjectLabel,funs(mean))

# Save both tidy data sets in folder with script
setwd('../../')
write.table(wholedata,'tidy_data1.txt', row.names=FALSE)
write.table(meanSubjectLabel,'tidy_data2.txt', row.names=FALSE)
