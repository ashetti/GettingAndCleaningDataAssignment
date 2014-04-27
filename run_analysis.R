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
##Get logical vectors to identify the means and std features 
meansL <- grepl("mean",features$V2)
stdL <- grepl("std",features$V2)

##Merge the training and test data sets
featureValues <- rbind(testx,trainx)
labelValues<-rbind(testy,trainy)
subjectIds <- rbind(testsub,trainsub)

colNames <- c(features$V2[meansL | stdL])

##Assign names to the columns
names(labelValues) <- "ActivityLabel"
names(featureValues) <- features$V2
names(activityLabels)<-c("ActivityLabel","ActivityShortDescription")
names(subjectIds)<-"SubjectID"
##Join activityLabels to labelValues to get short description
labelValues <- join(x=labelValues,y=activityLabels,by="ActivityLabel")

##Select columns with mean and std
selectedFeatureValues <- featureValues[, which(names(featureValues) %in% colNames)]

##Now add the subject Ids and activity labels to the individual observations
mergedDataSet <- cbind(subjectIds,labelValues,selectedFeatureValues)

##Now create the tidy data set
fby1 <- factor(mergedDataSet$SubjectID)
fby2 <- factor(mergedDataSet$ActivityShortDescription)
tidyData <- aggregate(x=mergedDataSet,by=list(fby1,fby2),FUN=mean)

##Now write to a file TidySamsungData.txt
dump(list(tidyData),file="TidySamsungData.txt")
