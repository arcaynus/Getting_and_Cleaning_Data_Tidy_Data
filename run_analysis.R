# Author: Andre Morales
# File: run_analysis.R
# Purpose:  1. Reads in the data in the Data Directory needed for the assignment
#               a. Data/test/y_test.txt
#               b. Data/test/X_test.txt
#               c. Data/test/subject_test.txt *Note* had to open this in
#                                               notepad++, textpad gives
#                                               chinese characters
#               d. Data/train/y_train.txt
#               e. Data/train/X_train.txt
#               f. Data/train/subject_train.txt *Note* had to open this in
#                                               notepad++, textpad gives
#                                               chinese characters
#               g. Data/features.txt
#               h. Data/activity_labels.txt
#
#           2. Merge the training and the test sets to create one data set.
#           3. Extract only the measurements on the mean and standard deviation for each measurement. 
#           4. Use descriptive activity names to name the activities in the data set
#           5. Appropriately label the data set with descriptive activity names. 
#           6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Websites visited to get this working:
#   https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
#   https://class.coursera.org/getdata-035/forum/list?forum_id=10009
#   http://www.jstatsoft.org/article/view/v059i10
#   https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html
#   http://www.endmemo.com/program/R/gsub.php
#   https://regex101.com/#javascript
#   http://www.cookbook-r.com/Manipulating_data/Renaming_columns_in_a_data_frame/
#   http://stackoverflow.com/questions/6286313/remove-an-entire-column-from-a-data-frame-in-r
#   https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html



# Clear environment *Note* This is Really helpful if why writing code you change
#                           variable names constantly during refactorting which
#                           can cause your environment variable list to increase \
#                           and make debugging difficult
paste0("Cleaning Workspace\n")
rm(list=ls()) # Learned this from Lynda.com R Programming Class

# Creating variables for file names
paste0("Setting up Path Variables to the Data\n")
files.testY = "Data/test/y_test.txt"
files.testX = "Data/test/X_test.txt"
files.testSubject = "Data/test/subject_test.txt"
files.trainY = "Data/train/y_train.txt"
files.trainX = "Data/train/X_train.txt"
files.trainSubject = "Data/train/subject_train.txt"
files.features = "Data/features.txt"
files.activityNames = "Data/activity_labels.txt"

# Column Names
paste0("Setting up new Column Name Variables for the Data\n")
names.activities = c("activityID", "activityName")
names.subject = c("subjectID") # For both test and train
names.features = c("featureID", "featureName")

#######################
# Reading in the Data #
#######################
paste0("Reading in the Data...\n")

## test data
testTable.y = read.table(files.testY, header = FALSE)
testTable.x = read.table(files.testX, header = FALSE)
testTable.subject = read.table(files.testSubject, header = FALSE)

## training data

trainTable.y = read.table(files.trainY, header = FALSE)
trainTable.x = read.table(files.trainX, header = FALSE)
trainTable.subject = read.table(files.trainSubject, header = FALSE)

## features and activities
featuresTable = read.table(files.features, header = FALSE)
activitiesTable = read.table(files.activityNames, header=FALSE)
paste0("Finished reading in the Data\n")

############################################
# Rename the columns in the read in tables #
# this makes it eaiser to merge since they #
# are currently V1, V2, etc...             #
############################################
paste0("Renaming columns of read in tables")

## Features
colnames(featuresTable) <- names.features
## Activities
colnames(activitiesTable) <- names.activities
### Turn the 
## Test X
colnames(testTable.x) <- featuresTable$featureName #There are 561 variables
## Test Y (There is only one column)
colnames(testTable.y) <- c("activityID") # names the same as ID column in the activities table
## Test Subject (There is only one column)
colnames(testTable.subject) <- c("subjectID")
## Train X 
colnames(trainTable.x) <- featuresTable$featureName #There are 561 variables
## Train Y (There is only one column)
colnames(trainTable.y) <-c("activityID") 
## Train Subject (There is only one column)
colnames(trainTable.subject) <- c("subjectID")

#############################################
# Assignment Part 1: Merge the training     #
# and the test sets to create one data set. #
#############################################
paste0("Assignment Part 1: Merges the training and the test sets to create one
       data set\n")
# First we will column bind the test subject, y and x tables
mergedTable.test <- cbind(testTable.subject, testTable.y, testTable.x)
# Second we will column bind the training subject, y, and x tables
mergedTable.training <- cbind(trainTable.subject, trainTable.y, trainTable.x)
# Third we will row bind the two intermediary tables 
mergedTable.both <- rbind(mergedTable.test, mergedTable.training)
# Fourth, I am removing duplicate column names as mentioned in the forums:
# https://class.coursera.org/getdata-035/forum/thread?thread_id=86
mergedTable.both <- mergedTable.both[, !duplicated(colnames(mergedTable.both))]

#############################################
# Assignment Part 2: Extracts only the      #
# measurements on the mean and standard     #
# deviation for each measurement.           #
#############################################
# We only want colums with mean or std in the column name
# I basically looked through the features_info.txt file and determined 
# that the columns had either mean or std characters in its name
paste0("Assignment Part 2: Extracts only the measurements on the mean and 
       standard deviation for each measurement.\n")

# First find the column names of the merged table
mergedTable.colNames <- colnames(mergedTable.both)

# Second get the indicies of the columns we want
## Notes: .* will match any character so .*std.* will match std with anything 
##       before and after.
##       we still want to keep the subject and activity id I think because we use
##       it in Part 3 though instructions are vague at best 
mergedTable.validColumns <- grepl("(.*std.*)|(.*mean.*)|(^subjectID$)|(^activityID$)", mergedTable.colNames)

# Third now that we have a vector of bools that tell us the columns we want
# we can subset based on the vector
tidy.merged <- mergedTable.both[mergedTable.validColumns == TRUE]

################################################
# Assignment Part 3: Uses descriptive activity # 
# names to name the activities in the data set #
################################################
paste0("Assignment Part 3: Uses descriptive activity names to name the 
       activities in the data set.\n")
# Merge the tidy table with the activities table by the activityID
tidy.withActivities <- merge(tidy.merged, activitiesTable, by = "activityID", 
                             sort = TRUE)
# drop the redundant activityID column since we now have the factors
tidy.withActivities <- tidy.withActivities[,-1]

# Move the activity name to after subject id then the rest in the same order
tidy.withActivities <- tidy.withActivities[, c(1,81, 2:80)]

# Change Subject ID to a factor
tidy.withActivities$subjectID <- as.factor(tidy.withActivities$subjectID)

###############################################
# Assignment Part 4: Appropriately labels the #
# data set with descriptive variable names    # 
###############################################
paste0("Assignment Part 4: Uses descriptive activity names to name the 
       activities in the data set.\n")
# First Get the new column names
# tidy.colNames <- colnames(tidy.withActivities)

# Second start replacing characters in the variable names to what makes
# sense based on features_info.txt and README.txt
names(tidy.withActivities) <- gsub("-", "", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("^t", "time", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("Acc", "Accelerometer", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("mean", "Mean", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("()", "", names(tidy.withActivities))
# added the - at the end for axis due to it was easier for me to read
names(tidy.withActivities) <- gsub("X$", "-XAxis", names(tidy.withActivities)) 
# added the - at the end for axis due to it was easier for me to read
names(tidy.withActivities) <- gsub("Y$", "-YAxis", names(tidy.withActivities))
# added the - at the end for axis due to it was easier for me to read
names(tidy.withActivities) <- gsub("Z$", "-ZAxis", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("std", "Std", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("Gyro", "Gyroscope", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("\\()", "", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("Jerk", "JerkSignal", names(tidy.withActivities))
names(tidy.withActivities) <- gsub("^f", "frequency", names(tidy.withActivities))

####################################################
# Assignment Part 5: From the data set in step 4,  #
# creates a second, independent tidy data set with #
# the average of each variable for each activity   #
# and each subject.                                # 
####################################################
# This suggestion was posted on forums: https://class.coursera.org/getdata-035/forum/thread?thread_id=162
library(dplyr)
tidy.average <- group_by(tidy.withActivities, subjectID, activityName)
tidy.summary <- summarize_each(tidy.average, funs(mean))
# Export the file as a text file
write.table(tidy.summary, "tidyData.txt", row.names = FALSE, quote = FALSE, sep = "\t")