Codebook for Getting and Cleaning Data assignment
=================================================

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
 13. Dump into an output file "tidyDataOutput.txt"

The column names for the resulting output
 1.  Subject ID
 2.	Activity Label
 3.	Short Description
 4.	tBodyAccelerationMeanX
 5.	tBodyAccelerationMeanY
 6.	tBodyAccelerationMeanZ
 7.	tBodyAccelerationStdDevX
 8.	tBodyAccelerationStdDevY
 9.	tBodyAccelerationStdDevZ
 10.	tGravityAccelerationMeanX
 11.	tGravityAccelerationMeanY
 12.	tGravityAccelerationMeanZ
 13.	tGravityAccelerationStdDevX
 14.	tGravityAccelerationStdDevY
 15.	tGravityAccelerationStdDevZ
 16.	tBodyAccelerationJerkMeanX
 17.	tBodyAccelerationJerkMeanY
 18.	tBodyAccelerationJerkMeanZ
 19.	tBodyAccelerationJerkStdDevX
 20.	tBodyAccelerationJerkStdDevY
 21.	tBodyAccelerationJerkStdDevZ
 22.	tBodyGyroMeanX
 23.	tBodyGyroMeanY
 24.	tBodyGyroMeanZ
 25.	tBodyGyroStdDevX
 26.	tBodyGyroStdDevY
 27.	tBodyGyroStdDevZ
 28.	tBodyGyroJerkMeanX
 29.	tBodyGyroJerkMeanY
 30.	tBodyGyroJerkMeanZ
 31.	tBodyGyroJerkStdDevX
 32.	tBodyGyroJerkStdDevY
 33.	tBodyGyroJerkStdDevZ
 34.	tBodyAccelerationMagnitudeMean
 35.	tBodyAccelerationMagnitudeStdDev
 36.	tGravityAccelerationMagnitudeMean
 37.	tGravityAccelerationMagnitudeStdDev
 38.	tBodyAccelerationJerkMagnitudeMean
 39.	tBodyAccelerationJerkMagnitudeStdDev
 40.	tBodyGyroMagnitudeMean
 41.	tBodyGyroMagnitudeStdDev
 42.	tBodyGyroJerkMagnitudeMean
 43.	tBodyGyroJerkMagnitudeStdDev
 44.	fBodyAccelerationMeanX
 45.	fBodyAccelerationMeanY
 46.	fBodyAccelerationMeanZ
 47.	fBodyAccelerationStdDevX
 48.	fBodyAccelerationStdDevY
 49.	fBodyAccelerationStdDevZ
 50.	fBodyAccelerationMeanFreqX
 51.	fBodyAccelerationMeanFreqY
 52.	fBodyAccelerationMeanFreqZ
 53.	fBodyAccelerationJerkMeanX
 54.	fBodyAccelerationJerkMeanY
 55.	fBodyAccelerationJerkMeanZ
 56.	fBodyAccelerationJerkStdDevX
 57.	fBodyAccelerationJerkStdDevY
 58.	fBodyAccelerationJerkStdDevZ
 59.	fBodyAccelerationJerkMeanFreqX
 60.	fBodyAccelerationJerkMeanFreqY
 61.	fBodyAccelerationJerkMeanFreqZ
 62.	fBodyGyroMeanX
 63.	fBodyGyroMeanY
 64.	fBodyGyroMeanZ
 65.	fBodyGyroStdDevX
 66.	fBodyGyroStdDevY
 67.	fBodyGyroStdDevZ
 68.	fBodyGyroMeanFreqX
 69.	fBodyGyroMeanFreqY
 70.	fBodyGyroMeanFreqZ
 71.	fBodyAccelerationMagnitudeMean
 72.	fBodyAccelerationMagnitudeStdDev
 73.	fBodyAccelerationMagnitudeMeanFreq
 74.	fBodyBodyAccelerationJerkMagnitudeMean
 75.	fBodyBodyAccelerationJerkMagnitudeStdDev
 76.	fBodyBodyAccelerationJerkMagnitudeMeanFreq
 77.	fBodyBodyGyroMagnitudeMean
 78.	fBodyBodyGyroMagnitudeStdDev
 79.	fBodyBodyGyroMagnitudeMeanFreq
 80.	fBodyBodyGyroJerkMagnitudeMean
 81.	fBodyBodyGyroJerkMagnitudeStdDev
 82.	fBodyBodyGyroJerkMagnitudeMeanFreq