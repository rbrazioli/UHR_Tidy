# UHR_Tidy

## Course assignment for Coursera Data Science Specialization (3), Getting and Cleaning Data

Human Activity Recognition Using Smartphones Tidy Dataset

##Version 1.0

Renato Brazioli - renato.brazioli@gmail.com, based on original work from
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


This work starts from the original data published in the frame of the Human Activity Recognition Using Smartphones activity, and trasform them into a **Tidy** Dataset, according to the following definition:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

According to _Wickham, Hadley. “Tidy Data.” Journal of Statistical Software 59.10 (2014): 23. Print._

Each observation consist of a row of 68 columns, the first two identifying the Subject performing the activity and the activity type itself, the following ones contains all the pairs (mean, standard deviation) available
in original data.

==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

See 'CodeBook.md' for more details. 

## Script Description

### Script Strategy

* Read and tidy Train UHR source data (test and train sets) -> UHR_Tidy_DF
	 * read data in using "read.table", since the input file are not completeley clean, i.e. they use both single and double spaces as field delimiters inside each record
* map activity codes to activity labels
* change column names, accoding to CodeBook.txt, in order to have descriptive names
* join data in a single Dataframe
	 * Iterations are performed on the two sets of data, using a simple vector to drive them, and consolidating data in target dataframe  in order to have code there is more maintanable. Temporary Dataframes are generated, they could be elimited by refactoring the code, in order to reduce memory usage during elaboration, if needed
* Having a "Tidy" dataset, dplyr is then used to summarive (by average) data in the final dataset

## Notes

* The R script is conceived to be executed in an R session, either R or Studio, 
it doesn't export the produced datasets to disk, It's left to the executor's
choice.

* The R script runs correctly if the following assumptions are true:
	 * R package "dplyr" is installed
	 * UHR original dataset (see below for original README) is located in the same file system directory from the which the script is executed, in a directory named "UCI HAR Dataset"
 


# The dataset includes the following files:

- 'README.txt' - current file
- 'CodeBook.md' - description of the UHR Tidy dataset
- run_Analysis.r - R script to derive UHR Tidy dataset
 


# See below for original README

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
