# Download files using CRAN library "downloader".  Unzip and place in folder titled, "Project".
# Project is the working directory.

library(downloader)
setwd("~/Coursera/Project")
download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
         dest="dataset.zip", mode="wb")
unzip("dataset.zip", exdir="./")

# Read in UCI HAR Dataset using read.table function.  Add column names
# to activity and subject data.  Only take 2nd column of features data.

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[2]
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names="subject")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names="subject")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names="activityNum")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names="activityNum")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Transpose features data from column to row to add column names to
# test and train data files.

names(x_test) <- t(features); names(x_train) <- t(features)

# Combine activity, subject and meaurement files (test and train) using
# cbind and rbind to create larger data frame.

test_data <- cbind(y_test, subject_test, x_test)
train_data<- cbind(y_train, subject_train, x_train)
combined_data<- rbind(test_data, train_data)

# Merge activity labels with data frame but first name activity label
# columns.

names(activity_labels) <- c("activityNum", "activity")
merged_data <- merge(activity_labels, combined_data,
                 by.x="activityNum", by.y="activityNum")

# Extract only the measurements related to mean and standard deviation
# from the data frame.  Use the grep function to  to search for
# the correct data frame columns.

columns <- sort(c(2, 3, grep("-mean", names(merged_data)),
                             grep("-std", names(merged_data))))
final_data <- merged_data[ , columns]

# Reshape data to get the mean of each measurement for each activity
# and each subject.  Use "reshape2" library.

library(reshape2)
final_data <- melt(final_data, id.vars=c("activity", "subject"))
mean_report <- dcast(final_data, activity + subject ~ variable, mean)

# Write reshaped data to txt file and view mean_report.

write.table(mean_report, "UCI_HAR_mean_report.txt", row.name=FALSE)
View(mean_report)
