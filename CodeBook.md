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

The original dataset leading to the summary consisted of 5 files:  
* labels: table of activities' semantical descriptions -> these have been merged into final data set in the "labels" column  
* features: table of measurements' semantical descriptions -> these are represented in each column names  
* Xtest and Xtrain : table showing the various measurement aggregates for each user x activity in the sample. These have been merged together into one dataset for the final summary average  
* Ytest and Ytrain : table referencing activities of each row in Xtest and Xtrain respectively. These have also been merged together in same order as Xtest and Xtrain

The data itself is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 





