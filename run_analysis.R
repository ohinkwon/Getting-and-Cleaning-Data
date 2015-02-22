## Getting and Cleaning Data : Course Project
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Download & unzip the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/harus.zip")
unzip(zipfile = "./data/harus.zip", exdir="./data")
dir_ref <- file.path("./data/UCI HAR Dataset")


## Read data files
# Feature files
dataFeaturesTest <- read.table(file.path(dir_ref, "test", "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(dir_ref, "train", "X_train.txt"),header = FALSE)

# Activity files
dataActivityTest <- read.table(file.path(dir_ref, "test", "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(dir_ref, "train", "Y_train.txt"),header = FALSE)

# Subject files
dataSubjectTest <- read.table(file.path(dir_ref, "test", "subject_test.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(dir_ref, "train", "subject_train.txt"),header = FALSE)


## Merges the training and the test sets to create one data set.
# rbind
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)

# column names
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
features <- read.table(file.path(dir_ref, "features.txt"), head=FALSE)
names(dataFeatures) <- features$V2

# cbind
data <- cbind(dataSubject, dataActivity, dataFeatures)


## Extracts only the measurements on the mean and standard deviation for each measurement.
subFeatures <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selectedNames <- c(as.character(subFeatures), "subject", "activity")
data <- subset(data, select=selectedNames)


## Uses descriptive activity names to name the activities in the data set.
activityLabels <- read.table(file.path(dir_ref, "activity_labels.txt"), header = FALSE)
names(activityLabels) <- c("activity", "descriptive_activity")
data <- merge(data, activityLabels, by="activity")
data <- data[,c(2:69)]
names(data) <- gsub("descriptive_activity", "activity", names(data))


## Appropriately labels the data set with descriptive variable names.
names(data) <- gsub ("^t", "time", names(data))
names(data) <- gsub ("^f", "frequency", names(data))
names(data) <- gsub ("Acc", "Accelerometer", names(data))
names(data) <- gsub ("Gyro", "Gyroscope", names(data))
names(data) <- gsub ("Mag", "Magnitude", names(data))
names(data) <- gsub ("BodyBody", "Body", names(data))


## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidy_data = ddply(data, c("subject","activity"), numcolwise(mean))
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)

