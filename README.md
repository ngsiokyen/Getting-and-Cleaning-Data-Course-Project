# Getting-and-Cleaning-Data-Course-Project
The purpose of this project is to prepare tidy data that can be used for later analysis.

##Submission Files:

###CodeBook.md:
- Describes the variables, the data, and any transformations or work that was performed to clean up the data.

###run_analysis.R:
- Download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip if it does not already exist in the working directory.
- Unzip the dataset.
- Read in the training and testing dataset and then merge them into one set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- After that, using descriptive activity names to name the activities in the dataset.
- The variable names are also appropriately labelled with the descriptive variable names.
- Lastly, a tidy dataset that consists of the average value of each variable for each activity and each subject was created.
- The final result is shown in the file TidyData.txt.

###TidyData.txt:
- Tidy dataset consists of the average value of each variable for each activity and each subject.
