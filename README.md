# Getting and Cleaning Data Course Project

There is one script called run_analysis that will get and clean the data.

This script will download a zip file from UCI Machine Learning Repository.  The zip file contains data collected from the accelerometers from the Samsung Galaxy S smartphone.

The zip file is then unziped and the test subject(subject_test.txt), test activity(y_test.txt), test data(X_test.txt), train subject(subject_train.txt), train activity(y_train.txt), and train_data(X_train.txt) are read.

The activity is converted from and an ID identifying the activity to the actual activity name in both the test and training data frames.

The test subject, test activity, and all the mean and standard deviation columns from test data are combined together into one test data set.

The train subject, train activity, and all the mean and standard deviation columns from train data are combined together into one train data set.

The complete study data set is then created by combining the test and train data sets together with meaningful column/variable names assigned.

Lastly the summary_by_subject_activity.txt file is created by averaging each variable for each activity and each subject.


