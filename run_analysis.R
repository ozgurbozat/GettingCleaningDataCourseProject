# Data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Merge the training and the test sets to create one data set.

features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")
subjecttrain <- read.table("./train/subject_train.txt")
ytrain <- read.table("./train/y_train.txt")
Xtrain <- read.table("./train/X_train.txt")
subjecttest <- read.table("./test/subject_test.txt")
ytest <- read.table("./test/y_test.txt")
Xtest <- read.table("./test/X_test.txt")

subjectvec <- rbind(subjecttrain,subjecttest)
yvec <- rbind(ytrain,ytest)
Xdata <- rbind(Xtrain, Xtest)
df1 <- cbind(subjectvec, yvec, Xdata)
colnames(df1) <- c("Subject","Activity",as.character(features[,2]))


# Extract only the measurements on the mean and standard deviation for each measurement. 

meanindices <- 2+grep("[Mm][Ee][Aa][Nn]",features$V2)
stdindices <- 2+grep("[Ss][Tt][Dd]",features$V2)
df2 <- df1[,c(1,2, sort(c(meanindices,stdindices)) )]


# Use descriptive activity names to name the activities in the data set

for(i in seq(1,6)){df2$Activity[df2$Activity %in% i] <- as.character(activitylabels$V2[i])}


# Appropriately label the data set with descriptive variable names. 

newnames <- names(df2)
newnames <- gsub("-","",newnames)
newnames <- gsub("Acc", "Accelerometer", newnames)
newnames <- gsub("Gyro", "Gyroscope", newnames)
newnames <- gsub("Mag", "Magnitude", newnames)
newnames <- gsub("[Mm]ean", "Mean", newnames)
newnames <- gsub("std", "StandartDeviation", newnames)
colnames(df2) <- newnames  


# From the data set above, create a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydf <- data.frame(matrix(NA, nrow = 180, ncol = 88))
splitdf2  <- split(df2, interaction(df2$Subject, df2$Activity ))
colMeans(splitdf2[[names(splitdf2)[1]]][,3:88])
for(n in seq(1,180)){
        tidydf[n, 1:2] <- splitdf2[[names(splitdf2)[n]]][1,1:2]
        tidydf[n, 3:88] <- colMeans(splitdf2[[names(splitdf2)[n]]][,3:88])
        }
        
names(tidydf) <- c(names(df2)[1:2], paste("MeanOf",names(df2)[3:88],sep=""))        
write.table(tidydf,file = "tidy_data_set.txt", row.name=FALSE)
tidydf

