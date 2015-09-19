#### 1. Read
Read 6 data sets (3 train and 3 test):
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt

#### 2. Combine

Combines it in one data set with R commands **cbind** and **rbind**.

#### 3. Label features

Feature in *subject_train.txt* and *subject_test.txt* labeled with "subject".

Feature in *y_train.txt* and *y_test.txt* labeled with "activity".

Features in *X_train.txt* and *X_test.txt* labeled with feature names read from UCI HAR Dataset/features.txt.

#### 4. Select features

Select features by its name:
* activity
* subject
* feature's name contains "mean()"
* feature's name contains "std()"

#### 5. Factor levels rename

Renames factor 1,2,3,4,5,6 to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Renames map read from UCI HAR Dataset/activity_labels.txt.

#### 6. Average data

Creates data set **averageData** with the average of each variable for each activity and each subject.

#### 7. Write

Writes data to result.txt.
