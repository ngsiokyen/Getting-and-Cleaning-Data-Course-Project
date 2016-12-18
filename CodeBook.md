#Code Book
Describes the variables and any work that was performed to clean up the data.

##Study Design
- Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip if it does not already exist in the working directory.
- Unzip the dataset.
- Read in the training and testing dataset and then merge them into one set by using cbind() and rbind().
- Extracts only the measurements on the mean and standard deviation for each measurement by using grepl() function and then subset it out.
- After that, using descriptive activity names to name the activities in the dataset by using factor().
- The variable names are also appropriately labelled with the descriptive variable names by using gsub().
- Lastly, a tidy dataset that consists of the average value of each variable for each activity and each subject was created by using aggregate().
- The final result is shown in the file TidyData.txt.

##Description of abbreviations of measurements
- leading t or f is based on time or frequency measurements.
- Body = related to body movement.
- Gravity = acceleration of gravity
- Acc = accelerometer measurement
- Gyro = gyroscopic measurements
- Jerk = sudden movement acceleration
- Mag = magnitude of movement
- mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.
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

##The set of variables that were estimated from these signals are:
- mean(): Mean value
- std(): Standard deviation
