# Getting and Cleaning Data Project
## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[Description of SmartPhone Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here is the data for the project:

[Project Data in .zip format](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Assignment Details
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Dependencies
Uses the [dplr R package](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html)

## Running the Script
1. [Download the repo](https://github.com/arcaynus/Getting_and_Cleaning_Data_Tidy_Data/archive/master.zip)
2. Run the `run_analysis.R` file using source

## run_analysus.R Process
1. Cleans the R environment
2. Initializes path variables to the data files
3. Initializes column variable names
4. Reads in data text files
5. Renames the columns of the read in files
6. Merges the traininf and test tables to create one data set (Assignment Part 1)
7. Extracts the columns we are interested in using grepl (Assignment Part 2)
8. Merges the activities table into the working data set by the activityID (Assignment Part 3)
9. Removed the redundant activityID column as we now have activityName
9. Reorders the columns to put the activityName column second
9. Turns the subjectID column into a factor variable
10. Renames the columns to something more meaningful (Assignment Part 4)
11. Using the dplr R package, groups and summarizes the data by mean (Assignment Part 5)
12. Saves the file as 'tidyData.txt' using tabs as delimiter

