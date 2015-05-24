# Download files using CRAN library "downloader".  Unzip and place in folder titled, "Project".
# Project is the working directory.

library(downloader)
setwd("~/Coursera/Project")
download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
         dest="dataset.zip", mode="wb")
unzip("dataset.zip", exdir="./")

# Read in UCI HAR Dataset using read.table function.  Add column names
# to activity and subject data.  Only take 2nd column of features data.

xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[2]
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                           col.names="subject")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                            col.names="subject")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt",
                     col.names="activityNum")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      col.names="activityNum")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Transpose features data from column to row to add column names to
# test and train data files.

names(xTest) <- t(features); names(xTrain) <- t(features)

# Combine activity, subject and meaurement files (test and train) using
# cbind and rbind to create larger data frame.

testData <- cbind(yTest, subjectTest, xTest)
trainData<- cbind(yTrain, subjectTrain, xTrain)
combinedData<- rbind(testData, trainData)

# Merge activity labels with data frame but first name activity label
# columns.

names(activityLabels) <- c("activityNum", "activity")
mergedData <- merge(activityLabels, combinedData,
                 by.x="activityNum", by.y="activityNum")

# Extract only the measurements related to mean and standard deviation
# from the data frame.  Use the grep function to  to search for
# the correct data frame columns.

columns <- sort(c(2, 3, grep("-mean", names(mergedData)),
                             grep("-std", names(mergedData))))
finalData <- mergedData[ , columns]

# Reshape data to get the mean of each measurement for each activity
# and each subject.  Use "reshape2" library.

library(reshape2)
finalData <- melt(finalData, id.vars=c("activity", "subject"))
meanReport <- dcast(finalData, activity + subject ~ variable, mean)

# Write reshaped data to txt file and view mean_report.

write.table(meanReport, "mean_report.txt", row.name=FALSE)
View(meanReport)
