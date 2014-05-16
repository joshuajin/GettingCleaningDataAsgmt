##How to Execute the Script##

####Script Name####

run\_analysis.R

####Dependencies####

1. Availability of the input data [file URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
2. During the script execution, Internet connection is required for the scrip to download the input data file.  
3. The run_analysis.R is in R, it requires R software installation. In addition,it requires R packages (sqldf, reshape2) to be installed.

####Script Execution Flows####
From a high level view, the script execution goes through the following tasks:

1. Download input file and unzip them to the current R Working Directory.
2. Merge data from different input files based on the requirements
3. Select features/columns/variables required 
4. Re-label columns based on the Naming Convention specified in this document.
5. Compute means based on the requirement. 
6. Output the tidy data to a file (tab delimited). 

####Script Execution####

From R console or RStudio, open the script run_analysis.R and execute it. 

Note: The script outputs a tab delimited text file final\_tidy\_dataset.txt to the R Working Directory along with a new folder that contains downloaded input data files which the scrip requires.   

Note:  

##The Assignment Instructions##
This is the course assignment of Getting and Cleaning Data.The course is part of Data Science program offered by Johns Hopkins via Coursera online.
    
The data linked to from the course website represent data collected from the 
accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the [data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) was obtained. Here are the [data source files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the assignment.   


####Requirements####
Creating one R script called run_analysis.R that does the following.
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

####Requirements Clarifications####
1. For the above requirement number 3, from  multiple student/TA discussions, this can be reasonably 
   interpreted as: Replace row entries with activity names as provided in the data. [Here is the reference.](https://class.coursera.org/getdata-003/forum/thread?thread_id=55#post-205)
2. For the above requirement number 4, from  multiple student/TA discussions, this can be reasonably 
   interpreted as: as: Replace column labels with more easily understood versions as determined by us. [Here is the reference.](https://class.coursera.org/getdata-003/forum/thread?thread_id=55#post-205)
3. For the above requirement number 5, export tidy data for review: Export from R the tidy data set into a  tab delimited text file named final\_tidy\_dataset.txt. The file location should be in the same file directory where run\_analysis.R resides. Upload it to Coursera using the "Attach a 
   file" button.

##Tidy Data Design Considerations##

####Data Handling Documentation Files####

The README.txt file (is part of original data folder) servers a overall data and files descriptions.
The file features\_info.txt contains information about the variables used on the feature vector.
 
####Data Inclusions####
* train/X_train.txt: Training set
* train/y_train.txt: Training labels
* subject_train.txt
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.
* subject_test.txt
* features.txt: List of all features (561 of them).
* activity_labels.txt: Links the class labels with their activity name.
   
####Data Exclusions 

* For this assignment, data in the "Inertial Signals" folder will be safely ignored since data sets were extracted and processed into training and test datasets for the assignment.

##Data Column/Variable Naming Convention##
  Currently there is no officially suggested naming convention for dataset columns. For this assignment, the followings guidelines are used:

1. Keep the name easy to understand
2. Keep the name short
3. Use 'camel' style, capitalize every word starting from the second word. ex: tBodyAccMeanX 


##Other Information##

CodeBook.md contains information about the nature of the data processed, data types, and data definitions.   
