# UHR Tidy  Dataset  (R name: UHR_Tidy_DF) 
## Identification data
* **Subject ID**, in range 1..30, a single volunteer performing an activity
* **ActivityType**, from the followimg set: (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying), stored as **Factor**
## Time Domain Signals
### Body acceleration
* BodyAcc_mean_X
* BodyAcc_mean_Y
* BodyAcc_mean_Z
* BodyAcc_std_X
* BodyAcc_std_Y
* BodyAcc_std_Z
### Gravity Acceleration
* GravityAcc_mean_X
* GravityAcc_mean_Y
* GravityAcc_mean_Z
* GravityAcc_std_X
* GravityAcc_std_Y
* GravityAcc std Z
### Body Acceleration Jerk
* BodyAccJerk_mean_X
* BodyAccJerk_mean_Y
* BodyAccJerk_mean_Z
* BodyAccJerk_std_X
* BodyAccJerk_std_Y
* BodyAccJerk_std_Z
### Body Gyroscopic
* BodyGyro_mean_X
* BodyGyro_mean_Y
* BodyGyro_mean_Z
* BodyGyro_std_X
* BodyGyro_std_Y
* BodyGyro_std_Z
### Body Gyroscopic Jerk
* BodyGyroJerk_mean_X
* BodyGyroJerk_mean_Y
* BodyGyroJerk_mean_Z
* BodyGyroJerk_std_X
* BodyGyroJerk_std_Y
* BodyGyroJerk_std_Z
### Body Acceleration Magnitude
* BodyAccMag_mean
* BodyAccMag_std
### Gravity Acceleration Magnitude
* GravityAccMag_mean
* GravityAccMag_std
### Body Acceleration Magnitude Jerk
* BodyAccJerkMag_mean
* BodyAccJerkMag_std
### Body Acceleration Mag
* BodyGyroMag_mean
* BodyGyroMag_std
### Body Gyroscopic Jerk Magnitude Jerk
* BodyGyroJerkMag_mean
* BodyGyroJerkMag_std
## Frequency Domanin Signals
### Body Acceleration
* BodyAcc_mean_X
* BodyAcc_mean_Y
* BodyAcc_mean_Z
* BodyAcc_std_X
* BodyAcc_std_Y
* BodyAcc_std_Z
### Body Acceleration Jerk
* BodyAccJerk_mean_X
* BodyAccJerk_mean_Y
* BodyAccJerk_mean_Z
* BodyAccJerk_std_X
* BodyAccJerk_std_Y
* BodyAccJerk_std_Z
### Body Gyroscope
* BodyGyro_mean_X
* BodyGyro_mean_Y
* BodyGyro_mean_Z
* BodyGyro_std_X
* BodyGyro_std_Y
* BodyGyro_std_Z
### Body Acceleration Magnitude
* BodyAccMag_mean
* BodyAccMag_std
* BodyBodyGyroMag_mean
* BodyBodyGyroMag_std
* BodyBodyGyroJerkMag_mean
* BodyBodyGyroJerkMag_std


# UHR Average Dataset (R name: UHR_Average_DF) 

The Dataset has similar structure of UHR Tidy Dataset, from which it is derived.

It contains averaged values for all variables, for each Activity and for each 
Subject.

Column names are derived from the source, exchanging the order of Activity and 
Subject, for grouping purposes, and adding the suffix "_avg" to all columns 
containing values.

## Identification data
* **ActivityType**, from the followimg set: (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying), stored as **Factor**
* **Subject ID**, in range 1..30, a single volunteer performing an activity
## Time Domain Signals
### Body acceleration
* BodyAcc_mean_X_avg
* BodyAcc_mean_Y_avg
* BodyAcc_mean_Z_avg
* BodyAcc_std_X_avg
* BodyAcc_std_Y_avg
* BodyAcc_std_Z_avg

(...) the following columns are renamed accordingly.

Unless otherwise specified, all data are normalized and bounded within [-1,1].

