# Code Book
## Study Design
Using the data from the assignment: [Project Data in .zip format](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
I performed the following steps to the source data to tidy it up:

1. Cleaned the R environment
2. Initialized path variables to the data files
3. Initialized column variable names
4. Read in data text files
5. Renamed the columns of the read in files
6. Merged the traininf and test tables to create one data set (Assignment Part 1)
7. Extracted the columns we are interested in (columns with mean or std in the variable name) using grepl (Assignment Part 2)
8. Merged the activities table into the working data set by the activityID (Assignment Part 3)
9. Removed the redundant activityID column as we now have activityName
9. Reordered the columns to put the activityName column second
9. Turned the subjectID column into a factor variable
10. Renamed the columns to something more meaningful (Assignment Part 4)
11. Used the dplr R package, groups and summarizes the data by mean (Assignment Part 5)
12. Saved the file as `tidyData.txt` using tabs as delimiter
  1. tidyData.txt contains the average of each variable grouped by subjectID and activityName variables

Please refer to [run_analysis.R] (https://github.com/arcaynus/Getting_and_Cleaning_Data_Tidy_Data/blob/master/run_analysis.R) for extensive comments.

### tidyData.txt Identifiers
* `subjectID` id of the voluntary recipient 1:30                                          
* `activityName` the activity name that the corresponding mesurements were recorded

### tidyData.txt Measurements
Represents the means of the measurements in `data/train/X_train.txt` and `data/test/X_test.txt`
* `timeBodyAccelerometerMean-XAxis`                    
* `timeBodyAccelerometerMean-YAxis`                    
* `timeBodyAccelerometerMean-ZAxis`                    
* `timeBodyAccelerometerStd-XAxis`                     
* `timeBodyAccelerometerStd-YAxis`                     
* `timeBodyAccelerometerStd-ZAxis`                     
* `timeGravityAccelerometerMean-XAxis`                 
* `timeGravityAccelerometerMean-YAxis`                 
* `timeGravityAccelerometerMean-ZAxis`                 
* `timeGravityAccelerometerStd-XAxis`                  
* `timeGravityAccelerometerStd-YAxis`                  
* `timeGravityAccelerometerStd-ZAxis`                  
* `timeBodyAccelerometerJerkSignalMean-XAxis`          
* `timeBodyAccelerometerJerkSignalMean-YAxis`          
* `timeBodyAccelerometerJerkSignalMean-ZAxis`          
* `timeBodyAccelerometerJerkSignalStd-XAxis`           
* `timeBodyAccelerometerJerkSignalStd-YAxis`           
* `timeBodyAccelerometerJerkSignalStd-ZAxis`           
* `timeBodyGyroscopeMean-XAxis`                        
* `timeBodyGyroscopeMean-YAxis`                        
* `timeBodyGyroscopeMean-ZAxis`                        
* `timeBodyGyroscopeStd-XAxis`                         
* `timeBodyGyroscopeStd-YAxis`                         
* `timeBodyGyroscopeStd-ZAxis`                         
* `timeBodyGyroscopeJerkSignalMean-XAxis`              
* `timeBodyGyroscopeJerkSignalMean-YAxis`              
* `timeBodyGyroscopeJerkSignalMean-ZAxis`              
* `timeBodyGyroscopeJerkSignalStd-XAxis`               
* `timeBodyGyroscopeJerkSignalStd-YAxis`               
* `timeBodyGyroscopeJerkSignalStd-ZAxis`               
* `timeBodyAccelerometerMagMean`                       
* `timeBodyAccelerometerMagStd`                        
* `timeGravityAccelerometerMagMean`                    
* `timeGravityAccelerometerMagStd`                     
* `timeBodyAccelerometerJerkSignalMagMean`             
* `timeBodyAccelerometerJerkSignalMagStd`              
* `timeBodyGyroscopeMagMean`                           
* `timeBodyGyroscopeMagStd`                            
* `timeBodyGyroscopeJerkSignalMagMean`                 
* `timeBodyGyroscopeJerkSignalMagStd`                  
* `frequencyBodyAccelerometerMean-XAxis`               
* `frequencyBodyAccelerometerMean-YAxis`               
* `frequencyBodyAccelerometerMean-ZAxis`               
* `frequencyBodyAccelerometerStd-XAxis`                
* `frequencyBodyAccelerometerStd-YAxis`                
* `frequencyBodyAccelerometerStd-ZAxis`           
* `frequencyBodyAccelerometerMeanFreq-XAxis`           
* `frequencyBodyAccelerometerMeanFreq-YAxis`           
* `frequencyBodyAccelerometerMeanFreq-ZAxis`           
* `frequencyBodyAccelerometerJerkSignalMean-XAxis`     
* `frequencyBodyAccelerometerJerkSignalMean-YAxis`     
* `frequencyBodyAccelerometerJerkSignalMean-ZAxis`     
* `frequencyBodyAccelerometerJerkSignalStd-XAxis`      
* `frequencyBodyAccelerometerJerkSignalStd-YAxis`      
* `frequencyBodyAccelerometerJerkSignalStd-ZAxis`      
* `frequencyBodyAccelerometerJerkSignalMeanFreq-XAxis` 
* `frequencyBodyAccelerometerJerkSignalMeanFreq-YAxis` 
* `frequencyBodyAccelerometerJerkSignalMeanFreq-ZAxis` 
* `frequencyBodyGyroscopeMean-XAxis`                   
* `frequencyBodyGyroscopeMean-YAxis`                   
* `frequencyBodyGyroscopeMean-ZAxis`                   
* `frequencyBodyGyroscopeStd-XAxis`                    
* `frequencyBodyGyroscopeStd-YAxis`                    
* `frequencyBodyGyroscopeStd-ZAxis`                    
* `frequencyBodyGyroscopeMeanFreq-XAxis`               
* `frequencyBodyGyroscopeMeanFreq-YAxis`               
* `frequencyBodyGyroscopeMeanFreq-ZAxis`               
* `frequencyBodyAccelerometerMagMean`                  
* `frequencyBodyAccelerometerMagStd`                   
* `frequencyBodyAccelerometerMagMeanFreq`              
* `frequencyBodyBodyAccelerometerJerkSignalMagMean`    
* `frequencyBodyBodyAccelerometerJerkSignalMagStd`     
* `frequencyBodyBodyAccelerometerJerkSignalMagMeanFreq`
* `frequencyBodyBodyGyroscopeMagMean`                  
* `frequencyBodyBodyGyroscopeMagStd`                   
* `frequencyBodyBodyGyroscopeMagMeanFreq`              
* `frequencyBodyBodyGyroscopeJerkSignalMagMean`        
* `frequencyBodyBodyGyroscopeJerkSignalMagStd`         
* `frequencyBodyBodyGyroscopeJerkSignalMagMeanFreq`

## Data Text Files Used
* `data/features_info.txt`: Shows information about the variables used on the feature vector.
* `data/features.txt`: List of all features.
* `data/activity_labels.txt`: Links the class labels with their activity name.
* `data/train/X_train.txt`: Training set.
* `data/train/y_train.txt`: Training labels.
* `data/test/X_test.txt`: Test set.
* `data/test/y_test.txt`: Test labels.
* `data/train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Variable Units
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Variable Information in X_train.txt and X_test.txt
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Notes
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## Data License

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
