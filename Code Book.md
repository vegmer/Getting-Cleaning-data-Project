# Getting & Cleaning Data (Oct. 2016). Code Book.

## 1. Raw data.
Raw data was taken from this URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Tip: You don't need to manually download it, the "run_analysis.R" script includes code to import this data into your working directory.

Within the compressed folder where all the data sets of interest are, several files were used in this project:
- **train/X_train.txt**. This is the data set containing 7352 observations of 30 participants doing 6 activities (561 variables recorded) during the "training" phase of the experiment.
- **train/y_train.txt**. Data set indicating, with a number, which activity was being performed in each one of those 7352 observations.
- **activity_labels.txt**. File indicating what activity corresponds with what number in "y_train.txt".
- **Train/subject_train.txt**. Data set indicating which subject was being recorded in each one of those 7352 observations.
- **Test/X_test.txt**. This is the data set containing 2947 observations of 30 participants doing 6 activities (561 variables recorded) during the "test" phase of the experiment.
- **Test/y_test.txt**.  Data set indicating, with a number, which activity was being performed in each one of those 2947 observations.
- **Test/subject_test.txt**. Data set indicating which subject was being recorded in each one of those 2947 observations.
- **features.txt**. File explaining how the 561 variables in X_train.txt and X_test.txt are coded. It gives a descriptive name of each variable.


## 2. Tidy data set
- **tidyDataset**. 
Each  one of the rows of this dataset represents the average by subject and activity on each one of the variables of interest.
Columns:
The first three columns indicate the subject and activity. The other 79 variables are either the MEAN or the STANDARD DEVIATION of different parameters recorded by the accelerometer. 

## 3. How this data set is obtained
The R script **"run_analysis.R"** can be inspected and run in order to obtain these data sets from the raw data.
  - The compressed file provided by the authors is imported into the working directory.
  - The files that contain information of interest (i.e. Features labels, activity labels, subject labels, data set themselves) are imported and assigned to objects.
  - Each observation in the "Training" and "Test" datasets is assigned the subject that is being recorded, the activity he/she was performing and the phase of the experiment.
  - The "Training" and "Test" datasets are merged.
  - Of all the 561 features recorded by the authors, only those that refer to the mean or the standard deviation of a feature are selected.
  - Activity codes are turned into the actual descriptive names of the activities
  - Each one of the variables in this data set (Dataset1) is given a descriptive name of what feature is being recorded.
  - The average for each variable is calculated by subject and activity.
  
