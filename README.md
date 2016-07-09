# Getting and Cleaning Data Course Project

## Files in this repo:
* README.md
* run_analysis.R
* CodeBook.md

## run_analysis.R
This is an R script which loads the UCI HAR dataset and:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis.R contains 2 functions: process_data & process_set
process_data takes a working directory where the UCI HAR Dataset exists

process_set is called from process_data and takes: 
working directory of HAR Dataset
sub folder name (e.g. test)
activity_labels data frame
features data frame

The values from the subject, X & y files are read and merged into a single data frame and returned. The resulting
value is also stored in the globalenv as har_totals. The averages for all columns grouped by subject and activity 
are calculated and stored in by_subject_by_activity. 

## To run the code:
source the script

Execute: har_totals <- process_data(path_to_data) # for exampe  path to data might be "." if your'e in the dataset directory
by_subject_by_activity is another variable that is added to the global environment and contains the by subject, by activity
averages

## Dependencies
plyr
dplyr
