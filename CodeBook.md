#### As this starts with downloading the data from UCI Machine Learning Repository here is their description of the data:
>
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
>
#### Extract and transforms to create the summary_by_subject_actvity.txt
* Loaded the subject, activity, feature data sets for both test and train
    * subject_test.txt - test subject data set
    * y_test.txt - test activity data set
    * X_test.txt - test feature data set
    * subject_train.txt - train subject data set
    * y_train.txt - train activity data set
    * X_test.txt - train feature data set
* From all the data provided in the feature data set from UCI Machine Learning Repository only extracted the measurements in the data set that were a mean or standard deviation.
* Transformed the activity ID to the actual activity name.
    *  1 = Walking
    *  2 = Walking Upstairs
    *  3 = Walking Downstairs
    *  4 = Sitting
    *  5 = Standing
    *  6 = Laying
* Combined the subject, activity, mean and standard deviation measurements for the train data sets together.
* Combined the subject, activity, mean and standard deviation measurements for the test data sets together.
* Merged the train and test data sets created in 4 and 5 together.
* Using the new merged data set; Averaged each variable for each activity and each subject.

#### Data Dictionary
1. subject
2. activity
3. time_body_accelerometer_x_axis_mean
4. time_body_accelerometer_y_axis_mean
5. time_body_accelerometer_z_axis_mean
6. time_body_accelerometer_x_axis_standard_deviation
7. time_body_accelerometer_y_axis_standard_deviation
8. time_body_accelerometer_z_axis_standard_deviation
9. time_gravity_accelerometer_x_axis_mean
10. time_gravity_accelerometer_y_axis_mean
11. time_gravity_accelerometer_z_axis_mean
12. time_gravity_accelerometer_x_axis_standard_deviation
13. time_gravity_accelerometer_y_axis_standard_deviation
14. time_gravity_accelerometer_z_axis_standard_deviation
15. time_body_accelerometer_jerk_x_axis_mean
16. time_body_accelerometer_jerk_y_axis_mean
17. time_body_accelerometer_jerk_z_axis_mean
18. time_body_accelerometer_jerk_x_axis_standard_deviation
19. time_body_accelerometer_jerk_y_axis_standard_deviation
20. time_body_accelerometer_jerk_z_axis_standard_deviation
21. time_body_gyroscope_x_axis_mean
22. time_body_gyroscope_y_axis_mean
23. time_body_gyroscope_z_axis_mean
24. time_body_gyroscope_x_axis_standard_deviation
25. time_body_gyroscope_y_axis_standard_deviation
26. time_body_gyroscope_z_axis_standard_deviation
27. time_body_gyroscope_jerk_x_axis_mean
28. time_body_gyroscope_jerk_y_axis_mean
29. time_body_gyroscope_jerk_z_axis_mean
30. time_body_gyroscope_jerk_x_axis_standard_deviation
31. time_body_gyroscope_jerk_y_axis_standard_deviation
32. time_body_gyroscope_jerk_z_axis_standard_deviation
33. time_body_accelerometer_magnitude_mean
34. time_body_accelerometer_magnitude_standard_deviation
35. time_gravity_accelerometer_magnitude_mean
36. time_gravity_accelerometer_magnitude_standard_deviation
37. time_body_accelerometer_jerk_magnitude_mean
38. time_body_accelerometer_jerk_magnitude_standard_deviation
39. time_body_gyroscope_magnitude_mean
40. time_body_gyroscope_magnitude_standard_deviation
41. time_body_gyroscope_jerk_magnitude_mean
42. time_body_gyroscope_jerk_magnitude_standard_deviation
43. frequency_body_accelerometer_x_axis_mean
44. frequency_body_accelerometer_y_axis_mean
45. frequency_body_accelerometer_z_axis_mean
46. frequency_body_accelerometer_x_axis_standard_deviation
47. frequency_body_accelerometer_y_axis_standard_deviation
48. frequency_body_accelerometer_z_axis_standard_deviation
49. frequency_body_accelerometer_jerk_x_axis_mean
50. frequency_body_accelerometer_jerk_y_axis_mean
51. frequency_body_accelerometer_jerk_z_axis_mean
52. frequency_body_accelerometer_jerk_x_axis_standard_deviation
53. frequency_body_accelerometer_jerk_y_axis_standard_deviation
54. frequency_body_accelerometer_jerk_z_axis_standard_deviation
55. frequency_body_gyroscope_x_axis_mean
56. frequency_body_gyroscope_y_axis_mean
57. frequency_body_gyroscope_z_axis_mean
58. frequency_body_gyroscope_x_axis_standard_deviation
59. frequency_body_gyroscope_y_axis_standard_deviation
60. frequency_body_gyroscope_z_axis_standard_deviation
61. frequency_body_accelerometer_magnitude_mean
62. frequency_body_accelerometer_magnitude_standard_deviation
63. frequency_body_accelerometer_jerk_magnitude_mean
64. frequency_body_accelerometer_jerk_magnitude_standard_deviation
65. frequency_body_gyroscope_magnitude_mean
66. frequency_body_gyroscope_magnitude_standard_deviation
67. frequency_body_gyroscope_jerk_magnitude_mean
68. frequency_body_gyroscope_jerk_magnitude_standard_deviation
