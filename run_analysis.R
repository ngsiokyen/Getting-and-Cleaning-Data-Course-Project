## Downloading and unzipping dataset:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#...............................................................................................

## 1. Merging the training and the test sets to create one data set:
# Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merging all data in one set:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
mergedata <- rbind(merge_train, merge_test)
#...............................................................................................

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
# Reading column names:
colNames <- colnames(mergedata)

# Create vector for defining ID, mean and standard deviation:
meanandstd <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean\\(\\)" , colNames) | grepl("std\\(\\)" , colNames))

# Making subset from mergedata:
Result <- mergedata[ , meanandstd == TRUE]
#...............................................................................................

## 3. Using descriptive activity names to name the activities in the data set:
Result$activityId <- factor(Result$activityId, levels = activityLabels$activityId,  labels = activityLabels$activityType)
#...............................................................................................

## 4. Appropriately labels the data set with descriptive variable names:
names(Result)<-gsub("\\()", "", names(Result))
names(Result)<-gsub("^t", "time", names(Result))
names(Result)<-gsub("^f", "frequency", names(Result))
names(Result)<-gsub("Acc", "Accelerometer", names(Result))
names(Result)<-gsub("Gyro", "Gyroscope", names(Result))
names(Result)<-gsub("Mag", "Magnitude", names(Result))
names(Result)<-gsub("BodyBody", "Body", names(Result))
names(Result)<-gsub("-mean", "Mean", names(Result))
names(Result)<-gsub("-std", "Std", names(Result))
names(Result)
#................................................................................................

## 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
# Making second tidy data set
library(plyr)
TidyData <- aggregate(. ~subjectId + activityId, Result, mean)
TidyData<- TidyData[order(TidyData$subjectId, TidyData$activityId),]

# Writing second tidy data set in txt file
write.table(TidyData, "TidyData.txt", row.name=FALSE)

