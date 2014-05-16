
##How to Use the Codebook##

This codebook is designed for the person who is interested in consuming the data. It does
not contain the information about the result of the study. 

The codebook has the following sections.

* The Data File section describes the data format.
* Source of Data File section contains information of the source data. 
* Data Transformation from Source to Target briefly indicated how data got transformed from source to the target.
* The Nature of The Data describes the background and the field of the data
* Variable Naming Convention denotes prefix, suffix and abbreviations. 
* Data Types and Data Definition provide definition of each data element.


##The Data File##

The data file is named final\_tidy\_dataset.txt. It was generated from a
data cleansing and transforming process in R. It is a tab delimited
ASCII file. It contains 180 observations and 81
features/variables/columns. 

Many software programs support this format, the easiest way to read the
file contents is to use Excel (or equivalent), or use R to read the file
in RStudio, such as read.table ("final\_tidy\_dataset.txt"). 

##Source of Data Files##

The original raw data file was packaged and available [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


##Data Transformation from Source to Target##

The following data transformation was done from the source data to the
target data (final\_tidy\_dataset.txt)

-   Merges the training and test data files to create one dataset.
-   Extracts only the measurements on the mean and standard deviation
    for each measurement. 
-   Uses descriptive activity names (see Variable Naming Notations
    section of this document) to name the activities in the data set
-   Appropriately labels the data set with descriptive activity names
    (see Variable Naming Notations section of this document)   


##The Nature of The Data##

In the following the words feature, variable, column, field mean the
same. The following general feature extraction and selections describe the
background information. 

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. 

There are two types of sensors: accelerometer (Acc) and gyroscope
(Gyr). Using its embedded accelerometer and gyroscope, measurements were
captured 3-axial (X, Y, and Z) linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. 

The features were selected from the accelerometer and gyroscope 3-axial
(X, Y, Z) for raw signals tAcc and tGyr. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and
gravity acceleration signals (tBodyAcc and tGravityAcc) using another
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk and tBodyGyroJerk)
on X, Y and Z. 

The magnitudes of these three-dimensional signals were calculated using
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency
domain signals). 

X, Y, and Z are used to denote 3-axial signals in the X, Y and Z
directions.

##Variable Naming Convention##

Prefix: t – denote that it is a time domain measurement
Prefix: f – denote that it is a frequency domain measurement
Suffix: X – The measurement is along X direction of 3-axial signals
Suffix: Y – The measurement is along Y direction of 3-axial signals
Suffix: Z – The measurement is along Z direction of 3-axial signals
Mean: Mean (or average value in a common sense)
Std: Standard deviation value
Acc: Acceleration signal
Jerk:  Jerk signal of body linear acceleration and angular velocity 
Gyro: gyroscope signal 
Gravity: Gravity measures 
Mag: Magnitudes measures
Freq: Frequency measures  

##Data Types##

All features with prefix f or t are in decimal numbers. SubjectId is a type of integer and activityType is a  type of character. 

##Data Definition##

- subjectId: Subject ID, there are 30 values that represent 30 people  
- activityType: Activity types, example: walking, sitting                
- tBodyAccMeanX: Mean signal on body acceleration on X 
- tBodyAccMeanY: Mean signal on body acceleration on Y
- tBodyAccMeanZ: Mean signal on body acceleration on Z
- tBodyAccStdX: Standard deviation of  acceleration on X
- tBodyAccStdY: Standard deviation of  acceleration on Y
- tBodyAccStdZ: Standard deviation of  acceleration on Z 
- tGravityAccMeanX: Mean signal of gravity acceleration on X
- tGravityAccMeanY: Mean signal of gravity acceleration on Y            
- tGravityAccMeanZ: Mean signal of gravity acceleration on X
- tGravityAccStdX: Standard deviation of gravity acceleration on X       
- tGravityAccStdY: Standard deviation of gravity acceleration on Y
- tGravityAccStdZ: Standard deviation of gravity acceleration on Z        
- tBodyAccJerkMeanX: Mean signal on body Jerk acceleration on X
- tBodyAccJerkMeanY: Mean signal on body Jerk acceleration on Y           
- tBodyAccJerkMeanZ: Mean signal on body Jerk acceleration on Z
- tBodyAccJerkStdX: Standard deviation of body Jerk acceleration on X     
- tBodyAccJerkStdY: Standard deviation of body Jerk acceleration on Y
- tBodyAccJerkStdZ: Standard deviation of body Jerk acceleration on Z    
- tBodyGyroMeanX: Mean signal of Gyroscope on X
- tBodyGyroMeanY: Mean signal of Gyroscope on Y     
- tBodyGyroMeanZ: Mean signal of Gyroscope on Z
- tBodyGyroStdX: Standard deviation of Gyroscope on X
- tBodyGyroStdY: Standard deviation of Gyroscope on Y
- tBodyGyroStdZ: Standard deviation of Gyroscope on Z              
- tBodyGyroJerkMeanX: Mean of gyroscope of body jerk on X
- tBodyGyroJerkMeanY: Mean of gyroscope of body jerk on Y
- tBodyGyroJerkMeanZ: Mean of gyroscope of body jerk on Z
- tBodyGyroJerkStdX: Standard deviation of gyroscope of body jerk on X
- tBodyGyroJerkStdY: Standard deviation of gyroscope of body jerk on Y
- tBodyGyroJerkStdZ: Standard deviation of gyroscope of body jerk on Y    
- tBodyAccMagMean: Mean of the magnitude of body acceleration
- tBodyAccMagStd: Standard deviation of magnitude of body acceleration   
- tGravityAccMagStd: Std. of gravity of the magnitude of acceleration   
- tBodyAccJerkMagMean: Mean of acceleration of body jerk 
- tBodyAccJerkMagStd: Std of acceleration of body jerk magnitude 
- tBodyGyroMagMean: Mean of magnitude of gyroscope measure
- tBodyGyroMagStd: Standard deviation of magnitude of gyroscope
- tBodyGyroJerkMagMean: Mean of magnitude measured from gyroscope
- tBodyGyroJerkMagStd : Std of magnitude measured from gyroscope     
- fBodyAccMeanX: Mean of body acceleration on X in frequency
- fBodyAccMeanY: Mean of body acceleration on Y in frequency      
- fBodyAccMeanZ: Mean of body acceleration on Z in frequency      
- fBodyAccStdX: Std of body acceleration on X in frequency        
- fBodyAccStdY: Std of body acceleration on Y in frequency        
- fBodyAccStdZ: Std of body acceleration on Z in frequency               
- fBodyAccMeanFreqX: Mean of body acceleration on X in frequency
- fBodyAccMeanFreqY: Mean of body acceleration on Y in frequency          
- fBodyAccMeanFreqZ: Mean of body acceleration on Z in frequency
- fBodyAccJerkMeanX: Mean of body jerk acceleration on X in frequency     
- fBodyAccJerkMeanY: Mean of body jerk acceleration on Y in frequency     
- fBodyAccJerkMeanZ: Mean of body jerk acceleration on Z in frequency     
- fBodyAccJerkStdX: Std of body jerk acceleration on X in frequency       
- fBodyAccJerkStdY: Std of body jerk acceleration on Y in frequency       
- fBodyAccJerkStdZ: Std of body jerk acceleration on Z in frequency
- fBodyAccJerkMeanFreqX: Mean frequency of body jerk acceleration on X   
- fBodyAccJerkMeanFreqY: Mean frequency of body jerk acceleration on Y   
- fBodyAccJerkMeanFreqZ: Mean frequency of body jerk acceleration on Z    
- fBodyGyroMeanX: Mean of gyroscope measure in frequency on X
- fBodyGyroMeanY: Mean of gyroscope measure in frequency on Y            
- fBodyGyroMeanZ: Mean of gyroscope measure in frequency on Z
- fBodyGyroStdX: Standard deviation gyroscope measure in frequency on X  
- fBodyGyroStdY: Standard deviation gyroscope measure in frequency on Y
- fBodyGyroStdZ: Standard deviation gyroscope measure in frequency on Z
- fBodyGyroMeanFreqX: Mean frequency of gyroscope measure on X
- fBodyGyroMeanFreqY: Mean frequency of gyroscope measure on Y
- fBodyGyroMeanFreqZ: Mean frequency of gyroscope measure on Z
- fBodyAccMagMean: Mean magnitude of acceleration in frequency            
- fBodyAccMagStd: Std magnitude of acceleration in frequency
- fBodyAccMagMeanFreq: Mean Frequency of magnitude of acceleration 
- fBodyBodyAccJerkMagMean: Mean magnitude of acceleration body jerk
- fBodyBodyAccJerkMagStd: Std magnitude of acceleration body jerk 
- fBodyBodyAccJerkMagMeanFreq: Mean magnitude of jerk acceleration
- fBodyBodyGyroMagMean: Mean magnitude of measure form gyroscope
- fBodyBodyGyroMagStd:Std magnitude of measure form gyroscope 
- fBodyBodyGyroMagMeanFreq: Mean frequency magnitude from gyroscope 
- fBodyBodyGyroJerkMagMean: Mean magnitude of jerk from gyroscope
- fBodyBodyGyroJerkMagStd: Std of magnitude of jerk from gyroscope
- fBodyBodyGyroJerkMagMeanFreq: Mean frequency magnitude of jerk


##Reference##

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012
