---
title: "README.md"
output: html_document
---

The following sequence describes the run_analysis.R script

### load data
```{r}
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
```

### merge test and train data
```{r}
X <- rbind(Xtest, Xtrain)
Y <- rbind(Ytest, Ytrain)
```

### extract only means and std variables
```{r}
mean_std <- grepl("mean|std",features$V2)
data <- X[,mean_std]
```

### rename columns using features table
```{r}
names(data) <- features$V2[mean_std]
```

### add activity representation using merged Y table
```{r}
data <- cbind(data, Y)
```

### merge labels into data set
```{r}
data <- merge(data, labels, by.x="V1", by.y="V1", all=TRUE)
```

### rename labels column
```{r}
names(data)[names(data)=="V2"] <- "labels"
```

### make new summary data frame
#### install/load plyr
```{r}
if("plyr" %in% rownames(installed.packages()) == FALSE) {
    install.packages("plyr")
}
library(plyr)
```
#### average each column of data frame
```{r}
meansummary <- ddply(data, "labels", numcolwise(mean,na.rm = TRUE))
```

###export
```{r}
write.table(meansummary, "meansummary.txt", row.name=FALSE)
```
