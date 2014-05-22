# This is the course assignment of Getting and Cleaning Data
# The course is part of Data Science program offered by Johns Hopkins 
# via Coursera online.
#
# Author: Joshua J
# Last Updated: May 14, 2014
# 
#
# The project instructions:    
# The data linked to from the course website represent data collected from the 
# accelerometers from the Samsung Galaxy S smartphone. A full description is available 
# at the site where the data was obtained:    
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# 
# Here are the data for the project:   
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# Assignment Requirements:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.            
# 5. Creates a second, independent tidy data set with the average of each variable for each 
#    activity and each subject. 
#
# Requirements Clarifications:
# 1. For the above requirement 3, in the course multiple student/TA discussions, this can be reasonably 
#    interpreted as: Replace row entries with activity names as provided in the data. 
#    reference: https://class.coursera.org/getdata-003/forum/thread?thread_id=55#post-205
# 2. For the above requirement 4, in the course multiple student/TA discussions, this can be reasonably 
#    interpreted as: as: Replace column labels with more easily understood versions as determined by us. 
#    reference: https://class.coursera.org/getdata-003/forum/thread?thread_id=55#post-205
# 3. For the above requirement 5, export tidy data for review: Export from R the tidy data set into a 
#    tab delimited text file named final_tidy_dataset.txt. The file location should be in the same file 
#    directory where run_analysis.R resides. Upload it to Coursera using the "Attach a 
#    file" button.
#
# Tidy Data Design Considerations:
# 
# 1. Data Handling - inclusions and exclusions
# 
#    Original data instruction and descriptions:
#       README.txt: It servers a overall data and files descriptions.
#       features_info.txt: Shows information about the variables used on the feature vector.
# 
#    Data inclusions:
#       train/X_train.txt: Training set.
#       train/y_train.txt: Training labels.
#       subject_train.txt
#       test/X_test.txt: Test set.
#       test/y_test.txt: Test labels.
#       subject_test.txt
#       features.txt: List of all features (561 of them).
#       activity_labels.txt: Links the class labels with their activity name.
#    
#    Data exclusions: 
#       For this assignment, data in the "Inertial Signals" folder will be safely ignored 
#       since data sets were extracted and processed into training and test datasets for 
#       the assignment.
#
# 2. Data Column/Variable Naming Convention:
#    Currently there is no officially suggested naming convention for dataset columns. 
#    For this assignment, the followings guidelines are used:
#      1). Keep the name easy to understand
#      2). Keep the name short
#      3). Use 'camel' style, capitalize every word starting from the second word. 
#         ex: tBodyAccMeanX 
#      
# Code Execution Note:
# 1. Load the script run_analysis.R into RStudio or R console, then execute it. 
# 2. The code download input zip file, unzip to the current R Working Directory,
#    So it requires Internet connection to execute the script. 
# 3. The code output the final tidy dataset to the current R Working Directory. 
#    The out file name is called final_tidy_dataset.txt
#


getwd()
#setwd("/Users/jjin/My_Projects/JohnsHDS/Getting_and_Cleaning_Data/The_Project")        

# the input data URL
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# set destination file name
destZipFileName <- "UCI_HAR_Dataset.zip"

# download the zip archive
download.file(fileUrl,destfile=destZipFileName,method="curl")

# unzip files
unzip(destZipFileName,files = NULL)

# read-in training and testing measurement data files
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
#str(train.x); dim(train.x)  # 7352 561 (V1, V2, ... V561)
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
#str(test.x); dim(test.x)    # 2947 561

# combine training and testing measurements data
ds1 <- rbind (train.x, test.x)
#dim(ds1)

# read-in features data
features <- read.table("./UCI HAR Dataset/features.txt")

# re-class the features from factor to character
features$V2 <- as.character(features$V2)
#str(features); dim(features)

# replace columns name from V1, V2, V3...V561 to proper names as described 
# in features data frame. 
colnames(ds1) <- features$V2
#str(ds1); dim(ds1)  # 10299 561 

# read-in training and testing activity data files
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
#str(train.y); dim(train.y)  # 7552 1
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
#str(test.y); dim(test.y)    # 2947 1

# combine training and testing activity data
ds2 <- rbind (train.y, test.y)
#$str(ds2); dim(ds2)
#unique(ds2)

# replace columns name from V1 to 'activityType'
colnames(ds2) <- "activityType"
#str(ds2); dim(ds2)  # 10299 1
#head(ds2)

# combine two subset of data (ds1 and ds2) 
untidy.dataset <- cbind(ds2,ds1)
#str(untidy.dataset); dim(untidy.dataset)  # 10299 562

# Extracts only the measurements on the mean and standard deviation for each measurement
feature.name.list <- names(untidy.dataset)
idx <- grep("mean|std",feature.name.list) # get index of those colunns with mean or std
data.filter <- feature.name.list[idx] 
#data.filter

# subset dataframe (untidy.dataset) 
tidy.processing <- subset(untidy.dataset, , select=c("activityType", data.filter))
#str(tidy.processing)
#head(tidy.processing)

# read-in training and test subject IDs from data files
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#str(train.subject); dim(train.subject)  # 7552 1
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#str(test.subject); dim(test.subject)    # 2947 1

# combine training and testing subject IDs 
subject.id <- rbind (train.subject, test.subject)
#str(subject.id); dim(subject.id)

colnames(subject.id) <- "subjectId"
#str(subject.id); dim(subject.id )  # 10299 1
#head(subject.id)

# add subject id column to the data frame (tidy.processing)
tidy.processing <- cbind(subject.id, tidy.processing)
#str(tidy.processing)
#head(tidy.processing)

##------------------------------------
## relabeling column names
##------------------------------------
names(tidy.processing) <- gsub("-", "", names(tidy.processing))  
names(tidy.processing) <- gsub("mean", "Mean", names(tidy.processing))  
names(tidy.processing) <- gsub("std", "Std", names(tidy.processing))  
names(tidy.processing) <- gsub("\\()", "", names(tidy.processing))  
names(tidy.processing)
#str(tidy.processing)

##----------------------------------------------------------------
## substitute the activity type numeric code with activity names
##----------------------------------------------------------------
# read-in features data
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
#str(activity.labels)
matching.pattern <- activity.labels$V1  # 1,2,3,4,5,6
replacing.text <- as.character(activity.labels$V2) # "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"

# function that does search and replace in a loop 
gsub2 <- function(pattern, replacement, x, ...) {
    for(i in 1:length(pattern))
        x <- gsub(pattern[i], replacement[i], x, ...)
    x
}

# The data frame activity.labels has patterns and replacements requirement defined. 
# example: 1 -> Walking, 2 -WALKING_UPSTAIRS, etc. Use the user definded function
# gsub2 above to carry out the value substitutions.
#
tidy.processing$activityType <- gsub2(matching.pattern, replacing.text, tidy.processing$activityType)
# str(tidy.processing);dim(tidy.processing)
#head(tidy.processing)

# assign the tidy.processing data frome to a short name, so that I can use SQLDF package. 
# I learned the hard way and figured out. 
tp <- tidy.processing   
#str(tp)

##----------------------------------------------------------------------------
## calculate the average of each variable for each activity and each subject.
##----------------------------------------------------------------------------
require(reshape2) # can be used for aggregations, it is very powerful. 

# melt the tp data frame for preparing aggregation
tp.melt = melt(tp, id = c("subjectId", "activityType"))
# str(tp.melt)
# dim(tp.melt) # 813621      4

# now, calculate the average of each of variables for each activity and each subject. 
# it is the same as select subjectId, activityType, avg(var1), avg(var2),...from tp group by subjectId, activityType.
final.tidy.dataset <- dcast(tp.melt, formula = subjectId + activityType  ~ variable, mean)
# str(tp.dcast)
# head(tp.dcast, 10)
# subjectId       activityType tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ tBodyAccStdX tBodyAccStdY tBodyAccStdZ
# 1          1             LAYING     0.2215982  -0.040513953    -0.1132036  -0.92805647 -0.836827406  -0.82606140
# 2          1            SITTING     0.2612376  -0.001308288    -0.1045442  -0.97722901 -0.922618642  -0.93958629
# 3          1           STANDING     0.2789176  -0.016137590    -0.1106018  -0.99575990 -0.973190056  -0.97977588
# 4          1            WALKING     0.2773308  -0.017383819    -0.1111481  -0.28374026  0.114461337  -0.26002790
# 5          1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662   0.03003534 -0.031935943  -0.23043421
# 6          1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020  -0.35470803 -0.002320265  -0.01947924
# 7          2             LAYING     0.2813734  -0.018158740    -0.1072456  -0.97405946 -0.980277399  -0.98423330
str(final.tidy.dataset)

##----------------------------------------------------------------------------
## data validation (not required, I would do it anywany)
##----------------------------------------------------------------------------
library(sqldf)
# sqldf("select * from iris limit 5")
# sqldf("select count(*) from tp")
# sqldf("select  subjectId, activityType, tBodyAccMeanX, tBodyAccMeanY, 
#       tBodyAccMeanZ 
#       from tp 
#       limit 100" ) 

validate.tidy.dataset.partial <- sqldf("select  subjectId, activityType, 
                                                avg(tBodyAccMeanX) as tBodyAccMeanX, 
                                                avg(tBodyAccMeanY) as tBodyAccMeanY, 
                                                avg(tBodyAccMeanZ) as tBodyAccMeanZ
                                        from tp group by subjectId, activityType 
                                        order by subjectId, activityType")
# str(validate.tidy.dataset.partial); dim(validate.tidy.dataset.partial)
# head(validate.tidy.dataset.partial)
# > head(validate.tidy.dataset.partial)
# subjectId       activityType tBodyAccMeanX tBodyAccMeanY tBodyAccMeanZ
# 1         1             LAYING     0.2215982  -0.040513953    -0.1132036
# 2         1            SITTING     0.2612376  -0.001308288    -0.1045442
# 3         1           STANDING     0.2789176  -0.016137590    -0.1106018
# 4         1            WALKING     0.2773308  -0.017383819    -0.1111481
# 5         1 WALKING_DOWNSTAIRS     0.2891883  -0.009918505    -0.1075662
# 6         1   WALKING_UPSTAIRS     0.2554617  -0.023953149    -0.0973020


##----------------------------------------------------------------------------
# Export tidy data for review:
#    Export from R the tidy data set into a tab delimited .txt file.
#    Upload it to Coursera using the "Attach a file" button.
##----------------------------------------------------------------------------
write.table(final.tidy.dataset, file="final_tidy_dataset.txt", sep="\t")

# read-in the final.tidy.dataset for a format vasual check.
# 
# my.final.ds <- read.table("./final_tidy_dataset.txt")
# str(my.final.ds)    # 180 obs. of  81 variables

