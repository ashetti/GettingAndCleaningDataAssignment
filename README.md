#Peer assessed assignment to create tidy data

##run_analysis.R
In this program, we will read data from the UCI HAR data set. This program assumes the data files are available in the same folder structure as the original data set i.e. the folder "UCI HAR Dataset" in the 
working directory

The steps in this program are as follows:
1. Set up the URL's to read the test and train feature sets
2. Read the test and train feature sets and labels
3. Merge the training and test data sets
4. Assign names to the columns
5. Join activityLabels to labelValues to get short description
6. Identify the column variables having mean and standard deviation values
7. Extract the columns with mean and std
8. Cleanup column names - Remove non alpha numeric characters
9. Expand abbreviations and capitalize words
10. Replace the column names with the cleaned columnnames
11. Now combine the subjectId's, and labels with the selected feature values
12. Now create the tidy data set by taking column wise mean for each observation of subject and Activity type
13. Dump into an output file
