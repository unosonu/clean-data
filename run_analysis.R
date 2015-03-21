##PRE-REQUISITS
##Download the zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",dest="Dataset.zip",method="wget")
##Unzip the file 
unzip(zipfile="Dataset.zip",exdir="./")
##read all the data sets
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")

##STEPS
##1. Merge the training and the test sets to create on data set.
xFeatures <- rbind(xTrain,xTest)
names(xFeatures) <- features$V2
subject <- rbind(subjectTrain,subjectTest)
names(subject) <- c("subject")
labels <- rbind(yTrain,yTest)
names(labels) <- c("labels")
data <- cbind(xFeatures,subject,labels)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanSdFeaturesNos <- grep("mean\\(\\)|std\\(\\)", features[,2])
meanSdFeatures <- features$V2[meanSdFeaturesNos]
subdataFeatures <- c(as.character(meanSdFeatures),"subject","labels")
subdata <- data[,subdataFeatures]

##3. Uses descriptive activity names to name the activities in the data set.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
subdata[, c("labels")] <- activityLabels[subdata[, c("labels")], 2]

##4. Appropriately labels the data set with descriptive variable names.
names(subdata)<-gsub("^t", "Time", names(subdata))
names(subdata)<-gsub("^f", "Frequency", names(subdata))
names(subdata)<-gsub("Acc", "Accelerometer", names(subdata))
names(subdata)<-gsub("Gyro", "Gyroscope", names(subdata))
names(subdata)<-gsub("Mag", "Magnitude", names(subdata))
names(subdata)<-gsub("BodyBody", "Body", names(subdata))
names(subdata)<-gsub("-std", "-StdDev", names(subdata))
names(subdata)<-gsub("labels", "activity", names(subdata))

##5. From the data set in step 4, creates a second, independent 
##tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(. ~ subject + labels , subdata, mean)
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)




