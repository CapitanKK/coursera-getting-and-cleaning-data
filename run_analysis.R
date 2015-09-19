library("plyr")

# read data

trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")

# 1. Merges the training and the test sets to create one data set.

allData <- rbind(cbind(trainSubjects, trainSet, trainLabels),
                 cbind(testSubjects, testSet, testLabels))

# remove waste data
rm(trainSubjects, testSubjects, testLabels, testSet, trainLabels, trainSet)

# 4. Appropriately labels the data set with descriptive variable names.

features <- read.table("UCI HAR Dataset/features.txt",
                           colClasses = c("integer", "character"))
columnNames <- c("subject", features[, 2], "activity")
names(allData) <- columnNames

# remove waste data
rm(features)

# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement.

allData <- allData[, grepl("mean()", columnNames, fixed = T) | 
                           grepl("std()", columnNames, fixed = T) |
                           columnNames == "activity" |
                           columnNames == "subject"]

# remove waste data
rm(columnNames)

# 3. Uses descriptive activity names to name the activities in the data set

labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                     stringsAsFactors = F)
allData$activity <- mapvalues(allData$activity, 
                              from = labels[,1], 
                              to = labels[,2])

# remove waste data
rm(labels)

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

averageData <- aggregate(. ~ subject + activity, allData, mean)

# write data

write.table(averageData, file = "result.txt", row.names = F)