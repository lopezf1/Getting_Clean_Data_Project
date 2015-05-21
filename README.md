
README For Getting Clean Data Project
=====================================

+ Author: Fernando Lopez
+ email: <fl1293@att.com>, <lopezf1@sbcglobal.net>
+ Date: May 19, 2015

--------------------------------------------------

The script titled, **run_analysis.R**, takes a multivariate, time-series data set from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), merges all data into one data set, extracts measurements specific to the mean and standard deviation, and finally creates an independent tidy data set that has the mean of each variable for each activity and test subject.

**run_analysis.R** downloads and unzips the [complete raw data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and then uses read.table() to read in the following files:

- features.txt
- activity_labels.txt
- X_train.txt
- y_train.txt
- X_test.txt
- y_test.txt
- subject_test.txt
- subject_train.txt

These files are then merged using `cbind()` and `rbind()` to create one very large data set (10,299 observations of 563 variables).  To narrow the data down to just variables specific to mean and standard deviation, the `grep()` funtion is used.  The data set is then reshaped into long-format data using the `melt()` function with ID variables identified as 'activity' and 'subject'.  The resulting data is then cast into wide-format data using the `dcast()` function and the mean is calculated for each measurement (variable).  Here is the code for this last transformation.

    library(reshape2)
    dataset <- melt(dataset, id.vars=c("activity", "subject"))
    mean_report <- dcast(dataset, activity + subject ~ variable, mean)
    
The final tidy data set is written to a file titled, "UCI_HAR_mean_report.txt" using the `write.table()` function.