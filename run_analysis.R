##run_analysis.R

##Set up the URL's to read the test and train feature sets

urltestx <- "./UCI HAR Dataset/test/X_test.txt"
urltesty <- "./UCI HAR Dataset/test/y_test.txt"
urltrainx <- "./UCI HAR Dataset/train/X_train.txt"
urltrainy <- "./UCI HAR Dataset/train/y_train.txt"
urltestsub <- "./UCI HAR Dataset/test/subject_test.txt"
urltrainsub <- "./UCI HAR Dataset/train/subject_train.txt"
urlfeatures <- "./UCI HAR Dataset/features.txt"
## read the test and train feature sets and labels
testx <-read.delim(urltestx,header=FALSE,sep="")
testy <-read.delim(urltesty,header=FALSE,sep="")
trainx <- read.delim(urltrainx,header=FALSE,sep="")
trainy <- read.delim(urltrainy,header=FALSE,sep="")
testsub <- read.delim(urltestsub,header=FALSE,sep="")
trainsub <- read.delim(urltrainsub,header=FALSE,sep="")
features <- read.delim(urlfeatures,header=FALSE,sep="",stringsAsFactors=FALSE)

##Get logical vectors to identify the means and std features 
meansL <- grepl("mean",features$V2)
stdL <- grepl("std",features$V2)
##Merge the training and test data sets
featureValues <- rbind(testx,trainx)
labels<-rbind(testy,trainy)
colNames <- c(features$V2[meansL | stdL])
