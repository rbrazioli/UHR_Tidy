==================================================================
Human Activity Recognition Using Smartphones Tidy Dataset
Version 1.0
==================================================================
Renato Brazioli - renato.brazioli@gmail.com, based on original work from
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
This work starts from the original data published in the frame of the Human Activity Recognition Using Smartphones activity, and trasform them into a **Tidy** Dataset, according to the following definition:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

According to _Wickham, Hadley. “Tidy Data.” Journal of Statistical Software 59.10 (2014): 23. Print._

Each observation consist of a row of 68 columns, the first two identifying the Subject performing the activity and the activity type itself, the following ones contains all the pairs (mean, standard deviation) avilable
in original data

# HAR Dataset
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


* a vector of 561 data items with time and frequency domain variables, See below for description of all 561 data items


See below for original README
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
