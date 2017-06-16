#!/usr/bin/env Rscript

#
# load needed packages (assumption: packages are installed)
#
library(dplyr)

#
# Script Strategy
#
# Read and tidy Train UHR source data (test and train sets) -> UHR_Tidy_DF
#   1) read data in using "read.table", since the input file are not completeley 
#      clean, i.e. they use both single and double spaces as field delimiters 
#      inside each record
#   2) map activity codes to activity labels
#   3) change column names, accoding to CodeBook.txt, in order to have
#     descriptive names
#   4) join data in a single Dataframe
#
#   Iterations are performed on the two sets of data, using a simple vector to
#   drive them, and consolidating data in target dataframe  in order to have
#   code there is more maintanable.
#   Temporary Dataframes re generated, they could be elimited by refactoring the
#   code, in order to reduce memory usage during elaboration, if needed


# see https://stackoverflow.com/questions/16979858/reading-text-file-with-multiple-space-as-delimiter-in-r

#
# define subset of columns, from source, to be selected. Original column name
# is included, as comment, for reference and review purpose
#
  Tidy_UHR_Source_Columns <- c(
    1, # tBodyAcc-mean()-X
    2, # tBodyAcc-mean()-Y
    3, # tBodyAcc-mean()-Z
    4, # tBodyAcc-std()-X
    5, # tBodyAcc-std()-Y
    6, # tBodyAcc-std()-Z
    41, # tGravityAcc-mean()-X
    42, # tGravityAcc-mean()-Y
    43, # tGravityAcc-mean()-Z
    44, # tGravityAcc-std()-X
    45, # tGravityAcc-std()-Y
    46, # tGravityAcc-std()-Z
    81, # tBodyAccJerk-mean()-X
    82, # tBodyAccJerk-mean()-Y
    83, # tBodyAccJerk-mean()-Z
    84, # tBodyAccJerk-std()-X
    85, # tBodyAccJerk-std()-Y
    86, # tBodyAccJerk-std()-Z
    121, # tBodyGyro-mean()-X
    122, # tBodyGyro-mean()-Y
    123, # tBodyGyro-mean()-Z
    124, # tBodyGyro-std()-X
    125, # tBodyGyro-std()-Y
    126, # tBodyGyro-std()-Z
    161, # tBodyGyroJerk-mean()-X
    162, # tBodyGyroJerk-mean()-Y
    163, # tBodyGyroJerk-mean()-Z
    164, # tBodyGyroJerk-std()-X
    165, # tBodyGyroJerk-std()-Y
    166, # tBodyGyroJerk-std()-Z
    201, # tBodyAccMag-mean()
    202, # tBodyAccMag-std()
    214, # tGravityAccMag-mean()
    215, # tGravityAccMag-std()
    227, # tBodyAccJerkMag-mean()
    228, # tBodyAccJerkMag-std()
    240, # tBodyGyroMag-mean()
    241, # tBodyGyroMag-std()
    253, # tBodyGyroJerkMag-mean()
    254, # tBodyGyroJerkMag-std()
    266, # fBodyAcc-mean()-X
    267, # fBodyAcc-mean()-Y
    268, # fBodyAcc-mean()-Z
    269, # fBodyAcc-std()-X
    270, # fBodyAcc-std()-Y
    271, # fBodyAcc-std()-Z
    345, # fBodyAccJerk-mean()-X
    346, # fBodyAccJerk-mean()-Y
    347, # fBodyAccJerk-mean()-Z
    348, # fBodyAccJerk-std()-X
    349, # fBodyAccJerk-std()-Y
    350, # fBodyAccJerk-std()-Z
    424, # fBodyGyro-mean()-X
    425, # fBodyGyro-mean()-Y
    426, # fBodyGyro-mean()-Z
    427, # fBodyGyro-std()-X
    428, # fBodyGyro-std()-Y
    429, # fBodyGyro-std()-Z
    503, # fBodyAccMag-mean()
    504, # fBodyAccMag-std()
    516, # fBodyBodyAccJerkMag-mean()
    517, # fBodyBodyAccJerkMag-std()
    529, # fBodyBodyGyroMag-mean()
    530, # fBodyBodyGyroMag-std()
    542, # fBodyBodyGyroJerkMag-mean()
    543 # fBodyBodyGyroJerkMag-std()
  )
#
# define Column Names for Tidy Dataset, according to CodeBook
#  
  Tidy_UHR_Column_Names <- c(
    "Subject",
    "ActivityClass",
    "Time_BodyAcc_mean_X",
    "Time_BodyAcc_mean_Y",
    "Time_BodyAcc_mean_Z",
    "Time_BodyAcc_std_X",
    "Time_BodyAcc_std_Y",
    "Time_BodyAcc_std_Z",
    "Time_GravityAcc_mean_X",
    "Time_GravityAcc_mean_Y",
    "Time_GravityAcc_mean_Z",
    "Time_GravityAcc_std_X",
    "Time_GravityAcc_std_Y",
    "Time_GravityAcc_std_Z",
    "Time_BodyAccJerk_mean_X",
    "Time_BodyAccJerk_mean_Y",
    "Time_BodyAccJerk_mean_Z",
    "Time_BodyAccJerk_std_X",
    "Time_BodyAccJerk_std_Y",
    "Time_BodyAccJerk_std_Z",
    "Time_BodyGyro_mean_X",
    "Time_BodyGyro_mean_Y",
    "Time_BodyGyro_mean_Z",
    "Time_BodyGyro_std_X",
    "Time_BodyGyro_std_Y",
    "Time_BodyGyro_std_Z",
    "Time_BodyGyroJerk_mean_X",
    "Time_BodyGyroJerk_mean_Y",
    "Time_BodyGyroJerk_mean_Z",
    "Time_BodyGyroJerk_std_X",
    "Time_BodyGyroJerk_std_Y",
    "Time_BodyGyroJerk_std_Z",
    "Time_BodyAccMag_mean",
    "Time_BodyAccMag_std",
    "Time_GravityAccMag_mean",
    "Time_GravityAccMag_std",
    "Time_BodyAccJerkMag_mean",
    "Time_BodyAccJerkMag_std",
    "Time_BodyGyroMag_mean",
    "Time_BodyGyroMag_std",
    "Time_BodyGyroJerkMag_mean",
    "Time_BodyGyroJerkMag_std",
    "Freq_BodyAcc_mean_X",
    "Freq_BodyAcc_mean_Y",
    "Freq_BodyAcc_mean_Z",
    "Freq_BodyAcc_std_X",
    "Freq_BodyAcc_std_Y",
    "Freq_BodyAcc_std_Z",
    "Freq_BodyAccJerk_mean_X",
    "Freq_BodyAccJerk_mean_Y",
    "Freq_BodyAccJerk_mean_Z",
    "Freq_BodyAccJerk_std_X",
    "Freq_BodyAccJerk_std_Y",
    "Freq_odyAccJerk_std_Z",
    "Freq_BodyGyro_mean_X",
    "Freq_BodyGyro_mean_Y",
    "Freq_BodyGyro_mean_Z",
    "Freq_BodyGyro_std_X",
    "Freq_BodyGyro_std_Y",
    "Freq_BodyGyro_std_Z",
    "Freq_BodyAccMag_mean",
    "Freq_BodyAccMag_std",
    "Freq_BodyBodyAccJerkMag_mean",
    "Freq_BodyBodyAccJerkMag_std",
    "Freq_BodyBodyGyroMag_mean",
    "Freq_BodyBodyGyroMag_std",
    "Freq_BodyBodyGyroJerkMag_mean",
    "Freq_BodyBodyGyroJerkMag_std"
  )
  
Activity_Columns <- c("ID") # use descriptive column names
Activity_Labels_Columns <- c("ID", "Label") # use descriptive column names
Subject_Columns <- c("ID") # use descriptive column names

#
# create empty dataframe with properly named columns
#

UHR_Tidy_DF <- read.table(text = "", col.names = Tidy_UHR_Column_Names)

#
# data will be read with path relative to current working directory
#

UHR_Data_Source_Root <- paste0(getwd(), .Platform$file.sep, "UCI HAR Dataset")

#
# get Activity Labels text
#
activity_labels_filename <- 
  paste0(UHR_Data_Source_Root, .Platform$file.sep, "activity_labels.txt")
activity_label <- 
    read.table(
      activity_labels_filename, 
      col.names = Activity_Labels_Columns)

# iterate on different data sets and combine them in target Dataframe

data_sets <- c("test", "train" )

for (src in data_sets) {
  
  print(paste("Reading set", src))
  
#
# generate specific  source filenames
#
  subject_filename <- paste0(UHR_Data_Source_Root, .Platform$file.sep, src, .Platform$file.sep, "subject_", src, ".txt")
  activity_filename <- paste0(UHR_Data_Source_Root, .Platform$file.sep, src, .Platform$file.sep, "y_", src, ".txt")
  data_filename <- paste0(UHR_Data_Source_Root, .Platform$file.sep, src, .Platform$file.sep, "X_", src, ".txt")

#  
# get data in separate dataframes 
# 
  subject_src <- read.table(subject_filename, col.names = Subject_Columns)
  activity_src <- read.table(activity_filename, col.names = Activity_Columns)
  data_src <- read.table(data_filename)

#
# decode activities' codes into explict labels
#  
  activity_src$ID <- activity_label$Label[match(activity_src$ID, activity_label$ID)]

#
# select relevant columns from source data
#
  data_selection_src <- data_src[, Tidy_UHR_Source_Columns]
  
#
# create temporary set Dataframe, with properly named columns
#
  set_df <- data.frame(subject_src, activity_src, data_selection_src)
  names(set_df) <- names(UHR_Tidy_DF)
  
  print(paste(src, "data set: ",nrow(set_df)))
  
#
# append data to Tidy Dataframe
# 
  UHR_Tidy_DF <- rbind(UHR_Tidy_DF, set_df)
  
} # scan and build the UHR Tidtìy Dataframe

#
# UHR Tidy dataset is ready
#
print(paste(src, "UHR Tidy data set: ",nrow(UHR_Tidy_DF)))

#
# Since the dataset is now tidy, we can summarize it usign dplyr pipes!
# Summarise by average (using mean), against Activty and Subject
#

UHR_Average_DF <- UHR_Tidy_DF %>% 
                      group_by(ActivityClass, Subject) %>% 
                      summarise_all(mean)

#
# update column names according to CodeBook
#

colnames(UHR_Average_DF) <- 
    c(colnames(UHR_Average_DF[1:2]), 
      paste0(colnames(UHR_Average_DF[3:ncol(UHR_Average_DF)]), "_avg"))

print(paste(src, "UHR Tidy Averag dataset: ",nrow(UHR_Average_DF)))
  
print("Done")

