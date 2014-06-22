### Peer assessed assignment to create tidy data

##run_analysis.R
##In this program, we will read data from the UCI HAR data set. This program assumes the data files are available 
##in the same folder structure as the original data set.
##Set up the URL's to read the test and train feature sets

urltestx <- "./UCI HAR Dataset/test/X_test.txt"
urltesty <- "./UCI HAR Dataset/test/y_test.txt"
urltrainx <- "./UCI HAR Dataset/train/X_train.txt"
urltrainy <- "./UCI HAR Dataset/train/y_train.txt"
urltestsub <- "./UCI HAR Dataset/test/subject_test.txt"
urltrainsub <- "./UCI HAR Dataset/train/subject_train.txt"
urlfeatures <- "./UCI HAR Dataset/features.txt"
urlactivityLabels <- "./UCI HAR Dataset/activity_labels.txt"
## read the test and train feature sets and labels
testx <-read.delim(urltestx,header=FALSE,sep="")
testy <-read.delim(urltesty,header=FALSE,sep="")
trainx <- read.delim(urltrainx,header=FALSE,sep="")
trainy <- read.delim(urltrainy,header=FALSE,sep="")
testsub <- read.delim(urltestsub,header=FALSE,sep="")
trainsub <- read.delim(urltrainsub,header=FALSE,sep="")
features <- read.delim(urlfeatures,header=FALSE,sep="",stringsAsFactors=FALSE)
activityLabels<- read.delim(urlactivityLabels,header=FALSE,sep="",stringsAsFactors=FALSE)


##Merge the training and test data sets
featureValues <- rbind(testx,trainx)
labelValues<-rbind(testy,trainy)
subjectIds <- rbind(testsub,trainsub)

##Assign names to the columns
names(labelValues) <- "ActivityLabel"
names(featureValues) <- features$V2
names(activityLabels)<-c("ActivityLabel","ActivityShortDescription")
names(subjectIds)<-"SubjectID"

##Join activityLabels to labelValues to get short description
labelValues <- join(x=labelValues,y=activityLabels,by="ActivityLabel")

##Identify the column variables having mean and standard deviation values
##find the features which have mean and std in their variable name
meansL <- grepl("mean",features$V2)
stdL <- grepl("std",features$V2)
colNames <- c(features$V2[meansL | stdL])
##Extract the columns with mean and std
selectedFeatureValues <- featureValues[, which(names(featureValues) %in% colNames)]

##Cleanup column names
##Remove non alpha numeric characters
varNames <- names(selectedFeatureValues)
varNames <- gsub("[^[:alnum:]///' ]", "", varNames)
##Expand abbreviations and capitalize words
varNames <- gsub("Acc", "Acceleration", varNames)
varNames <- gsub("Mag", "Magnitude", varNames)
varNames <- gsub("mean", "Mean", varNames)
varNames <- gsub("std", "StdDev", varNames)
##Replace the column names with the cleaned columnnames
names(selectedFeatureValues)<-varNames


##Now combine the subjectId's, and labels with the selected feature values
mergedDataSet <- cbind(subjectIds,labelValues,selectedFeatureValues)

##Load the plyr package
library("plyr")
##Now create the tidy data set by taking column wise mean for each observation of subject and Activity type
tidyData <- ddply(mergedDataSet,.(SubjectID,ActivityLabel,ActivityShortDescription),colwise(mean))

##Dump into an output file
write.table(tidyData,file="tidyDataOutput.txt",append=FALSE,sep=" ",eol="\n",row.names=FALSE)
