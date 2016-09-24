# Cousera-Lesson-3-Project
Project Assignment for Cousera: Data Scientist's Toolbox: Getting and Cleaning Data

This assignment challenges the student to import, clean, and transform the data provided by accelerometers from the Samsung Galaxy S smartphone.

The script takes the original data set and accomplishes the following:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The original data set can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Method
The summaries below describe how the raw data is transformed in the script 'data_alter_script.r'

# Process to Create 'Pace_Data' file
1.  The original data was split into testing and training sets.  The script restores the data to its original full form
2.  Subject Identifications and Activity Labels are added to the metrics
3.  Metrics describing mean and standard deviation of a variable are kept; all other metrics are removed

# Process to Create 'Pace_Summary' file
1.  The mean of each metric is taken for each subject and activity combination
