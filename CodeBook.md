---
title: "code book - Getting and cleaning data course project"
author: "Atul Anand"
date: "Saturday 21 March 2015"
output: html_document
---

##Introduction

The course project requires to download and clean the data for further analysis. The data used for this purpose was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Description of the files used for the process
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt'
- 'test/subject_test.txt'

##Step 1 : Merge the training and the test sets to create on data set.
Following is done in performing the above step.

- Data is downloaded and unzipped.
- The training and test files were read as data tables and the corresponding rows for the files are appended.
- The data is labeled according to features data set read from features.txt. Also the subjects and labels are added to the same data table using cbind.

##Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement.
This is achieved by finding the columns with the names including keywords mean and std. A subset of data is taken for further processing with only such column names along with subject and labels column.

##Step 3 : Uses descriptive activity names to name the activities in the data set.
This step puts the names for activity labels instead of the activiy numbers from the activity_labels.txt file.

##Step 4 : Appropriately labels the data set with descriptive variable names.
This step replaces short names with descriptive names with the help of regular expressions.
The following have been changed:

- The "t" is changed to be read as "time".
- The "f" is changed to be read as "frequency".
- The "acc" is changed to be read as "accelerometer".
- The "gyro" is changed to be read as "gyroscope".
- The "mag" is changed to be read as "magnitude".
- The "bodybody" is changed to be read as "body".
- The "std" is changed to be read as "stdDev" for standard deviation.
- Also the column with name "labels" is changed to "activity" to be more appropriate.

##Step 5 : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Here another data set is created by aggregating the columns of the subdata in pervious step according to the subject and activity. This data is written to the "tidyData.txt" file as the result of the run_analysis.R code file.




