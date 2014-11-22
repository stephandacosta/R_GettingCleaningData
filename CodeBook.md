---
title: "CodeBook.md"
output: html_document
---

The "run_analyss.R" file generates a summary from data which full description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The resulting summary is a data frame with:  
* "labels" column representing the different activities measured  
* "V1" column is a numerical representation of the actiities  
* All other columns show the mean of various measures collected from the Human Activity Recognition database. Only the mean and standard deviation measures have been rendered for the purpose of this exercise.

```{r}
data <- read.data("meansummary.txt")
data$labels
# [1] LAYING             SITTING           
# [3] STANDING           WALKING           
# [5] WALKING_DOWNSTAIRS WALKING_UPSTAIRS  
# 6 Levels: LAYING SITTING STANDING ... WALKING_UPSTAIRS
names(data)
# [1] "labels"                         
#  [2] "V1"                             
#  [3] "tBodyAcc-mean()-X"              
#  [4] "tBodyAcc-mean()-Y"              
#  [5] "tBodyAcc-mean()-Z"              
#  [6] "tBodyAcc-std()-X"               
#  [7] "tBodyAcc-std()-Y"               
#  [8] "tBodyAcc-std()-Z"               
#  [9] "tGravityAcc-mean()-X"           
# [10] "tGravityAcc-mean()-Y"           
# [11] "tGravityAcc-mean()-Z"           
# [12] "tGravityAcc-std()-X"            
# [13] "tGravityAcc-std()-Y"            
# [14] "tGravityAcc-std()-Z"            
# [15] "tBodyAccJerk-mean()-X"          
# [16] "tBodyAccJerk-mean()-Y"          
# [17] "tBodyAccJerk-mean()-Z"          
# [18] "tBodyAccJerk-std()-X"           
# [19] "tBodyAccJerk-std()-Y"           
# [20] "tBodyAccJerk-std()-Z"           
# [21] "tBodyGyro-mean()-X"             
# [22] "tBodyGyro-mean()-Y"             
# [23] "tBodyGyro-mean()-Z"             
# [24] "tBodyGyro-std()-X"              
# [25] "tBodyGyro-std()-Y"              
# [26] "tBodyGyro-std()-Z"              
# [27] "tBodyGyroJerk-mean()-X"         
# [28] "tBodyGyroJerk-mean()-Y"         
# [29] "tBodyGyroJerk-mean()-Z"         
# [30] "tBodyGyroJerk-std()-X"          
# [31] "tBodyGyroJerk-std()-Y"          
# [32] "tBodyGyroJerk-std()-Z"          
# [33] "tBodyAccMag-mean()"             
# [34] "tBodyAccMag-std()"              
# [35] "tGravityAccMag-mean()"          
# [36] "tGravityAccMag-std()"           
# [37] "tBodyAccJerkMag-mean()"         
# [38] "tBodyAccJerkMag-std()"          
# [39] "tBodyGyroMag-mean()"            
# [40] "tBodyGyroMag-std()"             
# [41] "tBodyGyroJerkMag-mean()"        
# [42] "tBodyGyroJerkMag-std()"         
# [43] "fBodyAcc-mean()-X"              
# [44] "fBodyAcc-mean()-Y"              
# [45] "fBodyAcc-mean()-Z"              
# [46] "fBodyAcc-std()-X"               
# [47] "fBodyAcc-std()-Y"               
# [48] "fBodyAcc-std()-Z"               
# [49] "fBodyAcc-meanFreq()-X"          
# [50] "fBodyAcc-meanFreq()-Y"          
# [51] "fBodyAcc-meanFreq()-Z"          
# [52] "fBodyAccJerk-mean()-X"          
# [53] "fBodyAccJerk-mean()-Y"          
# [54] "fBodyAccJerk-mean()-Z"          
# [55] "fBodyAccJerk-std()-X"           
# [56] "fBodyAccJerk-std()-Y"           
# [57] "fBodyAccJerk-std()-Z"           
# [58] "fBodyAccJerk-meanFreq()-X"      
# [59] "fBodyAccJerk-meanFreq()-Y"      
# [60] "fBodyAccJerk-meanFreq()-Z"      
# [61] "fBodyGyro-mean()-X"             
# [62] "fBodyGyro-mean()-Y"             
# [63] "fBodyGyro-mean()-Z"             
# [64] "fBodyGyro-std()-X"              
# [65] "fBodyGyro-std()-Y"              
# [66] "fBodyGyro-std()-Z"              
# [67] "fBodyGyro-meanFreq()-X"         
# [68] "fBodyGyro-meanFreq()-Y"         
# [69] "fBodyGyro-meanFreq()-Z"         
# [70] "fBodyAccMag-mean()"             
# [71] "fBodyAccMag-std()"              
# [72] "fBodyAccMag-meanFreq()"         
# [73] "fBodyBodyAccJerkMag-mean()"     
# [74] "fBodyBodyAccJerkMag-std()"      
# [75] "fBodyBodyAccJerkMag-meanFreq()" 
# [76] "fBodyBodyGyroMag-mean()"        
# [77] "fBodyBodyGyroMag-std()"         
# [78] "fBodyBodyGyroMag-meanFreq()"    
# [79] "fBodyBodyGyroJerkMag-mean()"    
# [80] "fBodyBodyGyroJerkMag-std()"     
# [81] "fBodyBodyGyroJerkMag-meanFreq()"
```

The original dataset leading to the summary consisted of 5 files:  
* labels: table of activities' semantical descriptions -> these have been merged into final data set in the "labels" column 
```{r}
read.table("UCI HAR Dataset/activity_labels.txt")
#   V1                 V2
# 1  1            WALKING
# 2  2   WALKING_UPSTAIRS
# 3  3 WALKING_DOWNSTAIRS
# 4  4            SITTING
# 5  5           STANDING
# 6  6             LAYING
```

* features: table of measurements' semantical descriptions -> these are represented in each column names  
```{r}
features <- read.table("UCI HAR Dataset/features.txt")
dim(features)
# [1] 561   2
head(features)
#   V1                V2
# 1  1 tBodyAcc-mean()-X
# 2  2 tBodyAcc-mean()-Y
# 3  3 tBodyAcc-mean()-Z
# 4  4  tBodyAcc-std()-X
# 5  5  tBodyAcc-std()-Y
# 6  6  tBodyAcc-std()-Z
```

* Xtest and Xtrain : table showing the various measurement aggregates for each user x activity in the sample. These have been merged together into one dataset for the final summary average  
```{r}
dim (Xtest)
# [1] 2947  561
dim (Xtrain)
# [1] 7352  561
```

* Ytest and Ytrain : table referencing activities of each row in Xtest and Xtrain respectively. These have also been merged together in same order as Xtest and Xtrain

```{r}
dim(Ytest)
# [1] 2947    1
dim(Ytrain)
# [1] 7352    1
head (Ytest)
#   V1
# 1  5
# 2  5
# 3  5
# 4  5
# 5  5
# 6  5
```

The data itself is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 





