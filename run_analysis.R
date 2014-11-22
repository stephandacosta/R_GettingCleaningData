## load data
labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")

## merge test and train data
X <- rbind(Xtest, Xtrain)
Y <- rbind(Ytest, Ytrain)
## extract only means and std variables
mean_std <- grepl("mean|std",features$V2)
data <- X[,mean_std]
## rename columns using features table
names(data) <- features$V2[mean_std]
## add Y as column
data <- cbind(data, Y)
## merge labels
data <- merge(data, labels, by.x="V1", by.y="V1", all=TRUE)
## rename labels column
names(data)[names(data)=="V2"] <- "labels"

## new tidy data
###install/load plyr
if("plyr" %in% rownames(installed.packages()) == FALSE) {
    install.packages("plyr")
}
library(plyr)
### average each column of data frame
meansummary <- ddply(data, "labels", numcolwise(mean,na.rm = TRUE))


##export
write.table(meansummary, "meansummary.txt", row.name=FALSE)
