# README Getting and Cleaning Data - Course Project

Author: Matthias Gloel


The script run_analysis.R does the following:

- It downloads and extracts the data set given the link specified on the course page √

- It reads individually training data (feature vectors, class labels, subject ids) cbinding √

- It reads individually test data (feature vectors, class labels, subject ids) cbinding √

- Merges the training and the test sets to create one data set. rbinding --> wholedata √

- Extracts only the measurements on the mean and standard deviation for each measurement. grep √ 

- Uses descriptive activity names to name the activities in the data set, given the feature. revalue √

- Appropriately labels the data set with descriptive variable names. Given the features.txt file √

- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Using group by (subject id, activity, summarizing with mean for each column)
√

- Save tidy data set (tidy_data1.txt) and summarized data set (tidy_data2.txt). √
