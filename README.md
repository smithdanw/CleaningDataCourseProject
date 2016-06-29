# Getting and Cleaning Data Course Project

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

# To run the code:
source the script
har_totals <- process_data(path_to_data) # for exampe  path to data might be "." if your'e in the dataset directory

# Dependencies
plyr
dplyr
