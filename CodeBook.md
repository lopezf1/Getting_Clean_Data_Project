CodeBook For Getting Clean Data Project
=======================================

+ Author: Fernando Lopez
+ email: <fl1293@att.com>, <lopezf1@sbcglobal.net>
+ Date: May 20, 2015

--------------------------------------------------

The daily living activities of 30 subjects were recorded using waist-mounted smartphone with embedded inertial sensors.  The recorded data was used to build the Human Activity Recognition (HAR) database, found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### HAR Files

Recorded data and other supportive files were read in by **run_analysis.R** and stored in the variables noted in the following table.

| R Variable | File Name | Description |
|--------|----------|-------------|
| x_test | X_test.txt | Test data.|
| y_test | y_test.txt | Test labels. |
| subject_test | subject_test.txt | Test subject identification (1-30).|        
| x_train | X_train.txt | Training data.|
| y_train | y_train.txt | Training labels.|
| subject_train | subject_train.txt| Training subject identification (1-30).|                   
| features      | features.txt    | Measurement variables.|
| activity_labels | activity_labels.txt| Activity names linked to labels.                   


### R Script Variables

This data was then combined and reshaped into the final data set titled, `mean_report`.  The following table describes each variable created and used in the transformation process.

| R Variable | Description |
|-----|-----|
| test_data | Combined test files for data, labels and subjects. |
| train_data | Combined training files for data, labels and subjects. |
| combined_data | Combined `test_data` and `train_data`. |
| merged_data | Merging of `activity_labels` and `combined_data`. |
| columns | Used to identify columns names specific to mean and standard deviation. |
| final_data | `merged_data` subset into mean and standard deviation measurements.  Also transformed to long-format data. |
| mean_report | `final_data` transformed to wide-format and the mean calculated for each measurement (column). |

### Tidy Data Set Variables

The following is a listing of each variable in the final data set `mean_report`.  The meaurement variable names were NOT modified because the initial HAR naming convention provided sufficient detail ('Acc' is accelerometer, 'Gyro' is gyroscope).  'XYZ' refers to measurements in the X, Y and Z direction.  The 't' and 'f' prefix in each measurement variable refers to time and frequency, respectively.  Each measurement variable has a an associated value of mean (mean()), standard deviation (std()) or (meanFreq()) that becomes a part of the variable name.  For example, `tBodyAcc-mean()-X` or `tGravityAcc-std()-Y`.

| Variable | Class | Units |
|--------    |-------|-----|
| activity| factor| "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"|
| subject | numeric | 1-30
| tBodyAcc-XYZ| numeric | seconds|
| tGravityAcc-XYZ| numeric | seconds|
|tBodyAccJerk-XYZ| numeric | seconds|
|tBodyGyro-XYZ| numeric | seconds|
|tBodyGyroJerk-XYZ      | numeric | seconds|
|tBodyAccMag| numeric | seconds|
|tGravityAccMag| numeric | seconds|
|tBodyAccJerkMag| numeric | seconds|
|tBodyGyroMag| numeric | seconds|
|tBodyGyroJerkMag| numeric | seconds|
|fBodyAcc-XYZ| numeric | Hertz|
|fBodyAccJerk-XYZ| numeric | Hertz |
|fBodyGyro-XYZ| numeric | Hertz |
|fBodyAccMag| numeric | Hertz |
|fBodyAccJerkMag| numeric | Hertz |
|fBodyGyroMag| numeric | Hertz |
|fBodyGyroJerkMag| numeric | Hertz |

Surprisingly, there are other variables in the final data set `mean_report` which were not described in the UCI HAR data set.  Those variable are:

- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()        
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()     
- fBodyBodyGyroJerkMag-meanFreq()

