# Getting & Cleaning Data (Oct. 2016)

This is a repository containing my Final Project for the Coursera class "Getting and Cleaning Data" by John Hopkins University.

Nature of the raw data used in this project:
--------------------------------------------
The project consisted on getting and cleaning data from the data set collected and presented by:
  >Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
  A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
  21th European Symposium on Artificial Neural Networks, Computational 
  Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The description of the methods given by the authors is as follows:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

> For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Contents of this repository:
-----------------------------
- **README.md** file (this one)
- **Code Book.md**. This file explains what is included in the raw and the tidy data sets.
- **tidyDataset.txt**. This is the second data set (a transformation of Dataset1.rdat following the instructions in the assignment prompt).
- **run_analysis.R**. This is the code to import and transform raw data, turn it into Dataset1 and Dataset2 and saving it into your working directory.
