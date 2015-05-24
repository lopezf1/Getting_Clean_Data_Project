CodeBook For Getting Clean Data Project
=======================================

+ Author: Fernando Lopez
+ email: <fl1293@att.com>, <lopezf1@sbcglobal.net>
+ Date: May 20, 2015

--------------------------------------------------

The daily living activities of 30 subjects were recorded using waist-mounted smartphone with embedded inertial sensors.  The recorded data was used to build the Human Activity Recognition (HAR) database, found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### HAR Files

HAR data and other supportive files were read in by **run_analysis.R** and stored in the variables noted in the following table.

R Variable | File Name | Description
|--------|----------|-------------|
xTest | X_test.txt | Test data.
yTest | y_test.txt | Test labels. 
subjectTest | subject_test.txt | Test subject identification (1-30).        
xTrain | X_train.txt | Training data.
yTrain | y_train.txt | Training labels.
subjectTrain | subject_train.txt| Training subject identification (1-30).                   
features      | features.txt    | Measurement variables.
activityLabels | activity_labels.txt| Activity names linked to labels.                   


### R Script Variables

This data was then combined and reshaped into the final data set titled, `meanReport`.  The following table describes each variable created and used in the transformation process.

R Variable | Description
|-----|-----|
testData | Combined test files for data, labels and subjects.
trainData | Combined training files for data, labels and subjects.
combinedData | Combined `testData` and `trainData`.
mergedData | Merging of `activityLabels` and `combinedData`.
columns | Used to identify columns names specific to mean and standard deviation.
finalData | `mergedData` subset into mean and standard deviation measurements.  Also transformed to long-format data.
meanReport | `finalData` transformed to wide-format and the mean calculated for each measurement (column).

### Tidy Data Set Variables

>The meaurement variable names in `meanReport` were NOT modified because the initial HAR naming convention was detailed and clear in meaning.

These definitions will help the reader understand the composition of each measurement variable.

|Component | Definition |
|----|----|
|Acc	|		Acceleration|
Gyro	|		Gyroscope
XYZ		|		X, Y and Z coordinates
t		|		Time
f		|		Frequency
Body | Linear body measurement
Gravity | Measurement due to gravity
Jerk | Jerk signal
Mag | Magnitude
mean()	|		Mean calculation
std()	|		Standard deviation calculation
meanFreq()	| Weighted average of frequency

For example, `tBodyAcc-mean()-X` is the mean of the time measurement for linear body acceleration in the x coordinate direction.

Below is a listing of a all variables found in the tidy data set called `meanReport`.

Variable | Class | Units 
|--------|-------|-----|
activity| factor| "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
subject | numeric | 1-30
tBodyAcc-XYZ| numeric | seconds
tGravityAcc-XYZ| numeric | seconds
tBodyAccJerk-XYZ| numeric | seconds
tBodyGyro-XYZ| numeric | seconds
tBodyGyroJerk-XYZ| numeric | seconds
tBodyAccMag| numeric | seconds
tGravityAccMag| numeric | seconds
tBodyAccJerkMag| numeric | seconds
tBodyGyroMag| numeric | seconds
tBodyGyroJerkMag| numeric | seconds
fBodyAcc-XYZ| numeric | Hertz
fBodyAccJerk-XYZ| numeric | Hertz 
fBodyGyro-XYZ| numeric | Hertz 
fBodyAccMag| numeric | Hertz 
fBodyAccJerkMag| numeric | Hertz 
fBodyGyroMag| numeric | Hertz 
fBodyGyroJerkMag| numeric | Hertz 

There are other variables in the final data set `meanReport` which were not well described in the UCI HAR file features_info.txt.  Those variable are:

- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()        
- fBodyBodyGyroMag-std()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()     
- fBodyBodyGyroJerkMag-meanFreq()

