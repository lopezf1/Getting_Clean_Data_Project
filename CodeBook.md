CodeBook For Getting Clean Data Project
=======================================

+ Author: Fernando Lopez
+ email: <fl1293@att.com>, <lopezf1@sbcglobal.net>
+ Date: May 20, 2015

--------------------------------------------------

The daily living activities of 30 subjects were recorded using waist-mounted smartphone with embedded inertial sensors.  The recorded data was used to build the Human Activity Recognition (HAR) database, found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### HAR Files

Recorded data and other supportive files were read in by **run_analysis.R** and stored in the variables noted in the following table.

| Variable | File Name | Description |
|--------|----------|-------------|
| x_test | X_test.txt | Test data.|
| y_test | y_test.txt | Test labels. |
| subject_test | subject_test.txt | Test subject identification (1-30).|        
| x_train | X_train.txt | Training data.|
| y_train | y_train.txt | Training labels.|
| subject_train | subject_train.txt| Training subject identification (1-30).|                   
| features      | features.txt    | Measurement variables.|
| activity_labels | activity_labels.txt| Activity names linked to labels.                   


### Code Variables

This data was then combined and reshaped into the final data set titled, `mean_report`.  The following table describes each variable created and used in the transformation process.

| Variable | Description |
|-----|-----|
| test_data | Combined test files for data, labels and subjects. |
| train_data | Combined training files for data, labels and subjects. |
| combined_data | Combined `test_data` and `train_data`. |
| dataset | Merging of `activity_labels` and `combined_data`. |
| columns | Used to identify columns names specific to mean and standard deviation. |
| dataset_final | Data frame transformed to long-format. |
| mean_report | Data frame transformed to wide-format and the mean calculated for each measurement (column). |

### Measurement Variables

The following is a listing of each variable in the final data set `mean_report`.  'XYZ' refers to measurements in the X, Y and Z direction.  The 't' and 'f' prefix in each variable refers to time (in seconds) and frequency (in Hz), respectively.  Each variable has a corresponding value of mean (mean()), standard deviation (std()) and in some cases the weighted avergage of the frequency components (meanFreq()).

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

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