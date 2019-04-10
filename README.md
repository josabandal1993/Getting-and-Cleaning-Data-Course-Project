# Getting-and-Cleaning-Data-Course-Project
This Repository is intended for the Course Project of Getting and Cleaning Data Course offered in Coursera.

## Code Analysis
* The data used from this code were taken [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* The code "Course3Project.R" reads the tables for train dataset from text files subject_train.txt, y_train.txt, X_train.txt and combines them using the cbind function to create one train_dataset.
* The code also reads the table for test dataset from text files subject_test.txt, y_test.txt, X_test.txt and combines them using the cbind function to create one test_dataset.
* Then both train and test dataset will be merge to a one large dataset using rbind.
* Varialbe names of the dataset are change, using the names in features.txt
* The code then identifies then selects the variables that contain the means and standard deviations and saves then in another dataset
* To satisfy number 5, the code then aggregates the newly made dataset to create an independent dataset where it stores the mean of each variables of each activity for each participant using the function "aggregate()"
* Lastly the code will save the independent dataset to a txt file using make.table() with argument "row.names()=FALSE"
