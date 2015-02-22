# Getting-and-Cleaning-Data
Course Project

Instructions
============

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: <br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: <br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. <br>
1. Merges the training and the test sets to create one data set.<br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set<br>
4. Appropriately labels the data set with descriptive variable names. <br>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


About UCI HAR Dataset
=====================

From the "README.txt", the following files would be used to run this project:<br>
* UCI HAR Dataset/activity_labels.txt<br>
* UCI HAR Dataset/features.txt<br>
* UCI HAR Dataset/test/subject_test.txt<br>
* UCI HAR Dataset/test/X_test.txt<br>
* UCI HAR Dataset/test/y_test.txt<br>
* UCI HAR Dataset/train/subject_train.txt<br>
* UCI HAR Dataset/train/X_train.txt<br>
* UCI HAR Dataset/train/y_train.txt


The Performing Procedure
========================
#### 0. Preparing Data<br>
* Download & unzip the data<br>
* Read data files: feature files - activity files - subject files <br>

#### 1. Merges the training and the test sets to create one data set. <br>
* rbind - change column names - cbind <br>

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
* subset <br>

#### 3. Uses descriptive activity names to name the activities in the data set. <br>
* names - merge - gsub <br>

#### 4. Appropriately labels the data set with descriptive variable names. <br>
* names - gsub <br>

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>
* ddply - write.table <br>

#### Run the script "run_analysis.R"

