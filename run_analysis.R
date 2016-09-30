########################################################
# COURSERA. GETTING AND CLEANING DATA. SEPT/OCT 2016 ###
# FINAL PROJECT.                                     ###
# MERCEDES VEGA VILLAR                               ###
########################################################

# INSTALL NECESSARY PACKAGES
install.packages("dplyr")
library(dplyr)


# IMPORT DATASET INTO WORKING DIRECTORY
mainDir <- getwd()
subDir <- "Get&Clean_Project"

if(file.exists(subDir)){
  setwd(file.path(mainDir, subDir))
  } else {
    dir.create(file.path(mainDir, subDir))
    setwd(file.path(mainDir, subDir))
  }

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "AccelerometerProject.zip"
download.file(url, destfile)

unzip("AccelerometerProject.zip")



### CREATING OBJECT WITH "FEATURES" LABELS (names of every variable)
features <- read.table("UCI HAR Dataset/features.txt")

### RAW "TRAIN" DATA
  #Dataset1: "training" phase of the experiment. 7352 observations of 30 participants doing 6 activities (561 variables recorded)
  TRAIN <- read.table("UCI HAR Dataset/train/X_train.txt") 
  #Activity index 
  ActivTRAIN <- read.table("UCI HAR Dataset/train/y_train.txt") 
  #Subject index
  SubTRAIN <- read.table("UCI HAR Dataset/train/subject_train.txt") 
  TRAINidx <- cbind(rep("Training", dim(TRAIN)[1]), SubTRAIN, ActivTRAIN)
  colnames(TRAINidx) <- c("Phase", "Subject", "Activity")
  TRAIN <- cbind(TRAINidx, TRAIN) 
  
### RAW "TEST" DATA
  #Dataset2: "test" phase of the experiment. 2947 observations of 30 participants doing 6 activities (561 variables recorded)
  TEST <- read.table("UCI HAR Dataset/test/X_test.txt") 
  #Activity index 
  ActivTEST <- read.table("UCI HAR Dataset/test/y_test.txt") 
  #Subject index
  SubTEST <- read.table("UCI HAR Dataset/test/subject_test.txt") 
  TESTidx <- cbind(rep("Test", dim(TEST)[1]), SubTEST, ActivTEST)
  colnames(TESTidx) <- c("Phase", "Subject", "Activity")
  TEST <- cbind(TESTidx, TEST) 
  
  

### STEP 1. MERGING THE TRAINING AND TEST SETS TO CREATE ONE DATA SET
  #Bind by row the training and then the test data
  DAT<- rbind(TRAIN, TEST) #This is the joint dataset


  
### STEP 2. EXTRACT FEATURES REFERRING TO THE MEAN AND SD FOR EACH MEASUREMENT
  #The object "features" indicates what each measurement it. We'll look for those that say "mean" and "std"
  meanIdx <- grep("mean", features$V2)
  stdIdx <- grep("std", features$V2)
  featureIdx <- sort(c(meanIdx, stdIdx)) #Features (variables) to select
  
  splitNames <- strsplit(names(DAT), "V")
  
  justNumber <- function(x){x[2]}
  Vnumbers <- sapply(splitNames[-c(1:3)], justNumber)
  colnames(DAT) <- c(names(TESTidx), Vnumbers)
  
  DATmeanStd <- DAT[,c(1:3, which(colnames(DAT)%in% featureIdx))]
  
  
### STEP 3. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
  # The code for actitivites is as follows: 1.WALKING; 2.WALKING_UPSTAIRS; 3.WALKING_DOWNSTAIRS; 4.SITTING; 5.STANDING; 6.LAYING
  DATmeanStd$Activity <- factor(DATmeanStd$Activity, levels=c(1:6), labels=c("Walk", "Walk upstairs", "Walk downstairs", "Sit", "Stand", "Lay"))
  #Save this first tidy data set in your working directory as a .txt file
  Dataset1 <- DATmeanStd
  write.table(Dataset1, file="Dataset1.txt", row.name=F)

### STEP 4. LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
  #Go back to the features object and using featureIdx select the labels of the desired variables:
  labels <- as.character(features[featureIdx,2])
  colnames(DATmeanStd) <- c(names(TESTidx), labels)
  
  
### STEP 5. GENERATE A SECOND DATA SET WITH THE AVERAGE BY ACTIVITY AND SUBJECT
  x <- DATmeanStd[,-1]
  Dataset2 <- x %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(mean(., na.rm=T)))
  
  #Save this second data set in your working directory as a .txt file
  write.table(Dataset2, file="Dataset2.txt", row.name=F)
  
  
