# CodeBook_Getting_and_Cleanig_Data_Course_Project

The data comes from the experiments that have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


Main script "run_analysis.R" assumes that current working directory involves the file 

- features.txt (Table of dimensions 2x561 giving the names of the variables(features) )
- activity_labels.txt (Table of dimensions 2x6 giving the names of the activities)

the directory named "train" with the files

- X_train.txt (Data with 7352 observation of 561 features for the training set)
- y_train.txt (Vector of length 7352 with activity labels for the training set)
- subject_train.txt (Vector of length 7352 with subject labels for the training set)

and the directory named "test" with the files

- X_test.txt (Data with 2947 observation of 561 features for the test set)
- y_test.txt (Vector of length 2947 with activity labels for the test set)
- subject_test.txt (Vector of length 2947 with subject labels for the test set) 

Merged data will involve 10299 observation (7352 from the training set, 2947 from the test set) of 563 variables. First two variables are the labels for the subjects and the activites. The rest of the variables are the feature names coming from the "features.txt". 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

After merging the training set and test set, only the measurements on the mean and standard deviation for each measurement is extracted. This is done by using the *grep* function with the pattern arguments: "[Mm][Ee][Aa][Nn]" and "[Ss][Tt][Dd]".

Activity indices are transformed to descriptive activity names which are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Variable names are transformed to make them *descriptive*. Following pattern transformations are applied 

- "-" -> ""
- "Acc" -> "Accelerometer"
- "Gyro" -> "Gyroscope"
- "Mag" -> "Magnitude"
- "[Mm]ean" -> "Mean"
- "std" -> "StandartDeviation".


Finally, independent tidy data set with the average of each variable for each activity and each subject is created.

     


