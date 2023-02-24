library(utils)
library(dplyr)

#create data directory if it doesn't exists
if (!file.exists("./data")) {
    dir.create("./data")
}

#set constant variables
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "./data/getdata_projectfiles_UCI HAR Dataset.zip"
extfiles <- c("UCI HAR Dataset/test/subject_test.txt",
              "UCI HAR Dataset/test/X_test.txt",
              "UCI HAR Dataset/test/y_test.txt",
              "UCI HAR Dataset/train/subject_train.txt",
              "UCI HAR Dataset/train/X_train.txt",
              "UCI HAR Dataset/train/y_train.txt")
colrenames <- c(time_body_accelerometer_x_axis_mean = "V1",
    time_body_accelerometer_y_axis_mean = "V2",
    time_body_accelerometer_z_axis_mean = "V3",
    time_body_accelerometer_x_axis_standard_deviation = "V4",
    time_body_accelerometer_y_axis_standard_deviation = "V5",
    time_body_accelerometer_z_axis_standard_deviation = "V6",
    time_gravity_accelerometer_x_axis_mean = "V41",
    time_gravity_accelerometer_y_axis_mean = "V42",
    time_gravity_accelerometer_z_axis_mean = "V43",
    time_gravity_accelerometer_x_axis_standard_deviation = "V44",
    time_gravity_accelerometer_y_axis_standard_deviation = "V45",
    time_gravity_accelerometer_z_axis_standard_deviation = "V46",
    time_body_accelerometer_jerk_x_axis_mean = "V81",
    time_body_accelerometer_jerk_y_axis_mean = "V82",
    time_body_accelerometer_jerk_z_axis_mean = "V83",
    time_body_accelerometer_jerk_x_axis_standard_deviation = "V84",
    time_body_accelerometer_jerk_y_axis_standard_deviation = "V85",
    time_body_accelerometer_jerk_z_axis_standard_deviation = "V86",
    time_body_gyroscope_x_axis_mean = "V121",
    time_body_gyroscope_y_axis_mean = "V122",
    time_body_gyroscope_z_axis_mean = "V123",
    time_body_gyroscope_x_axis_standard_deviation = "V124",
    time_body_gyroscope_y_axis_standard_deviation = "V125",
    time_body_gyroscope_z_axis_standard_deviation = "V126",
    time_body_gyroscope_jerk_x_axis_mean = "V161",
    time_body_gyroscope_jerk_y_axis_mean = "V162",
    time_body_gyroscope_jerk_z_axis_mean = "V163",
    time_body_gyroscope_jerk_x_axis_standard_deviation = "V164",
    time_body_gyroscope_jerk_y_axis_standard_deviation = "V165",
    time_body_gyroscope_jerk_z_axis_standard_deviation = "V166",
    time_body_accelerometer_magnitude_mean = "V201",
    time_body_accelerometer_magnitude_standard_deviation = "V202",
    time_gravity_accelerometer_magnitude_mean = "V214",
    time_gravity_accelerometer_magnitude_standard_deviation = "V215",
    time_body_accelerometer_jerk_magnitude_mean = "V227",
    time_body_accelerometer_jerk_magnitude_standard_deviation = "V228",
    time_body_gyroscope_magnitude_mean = "V240",
    time_body_gyroscope_magnitude_standard_deviation = "V241",
    time_body_gyroscope_jerk_magnitude_mean = "V253",
    time_body_gyroscope_jerk_magnitude_standard_deviation = "V254",
    frequency_body_accelerometer_x_axis_mean = "V266",
    frequency_body_accelerometer_y_axis_mean = "V267",
    frequency_body_accelerometer_z_axis_mean = "V268",
    frequency_body_accelerometer_x_axis_standard_deviation = "V269",
    frequency_body_accelerometer_y_axis_standard_deviation = "V270",
    frequency_body_accelerometer_z_axis_standard_deviation = "V271",
    frequency_body_accelerometer_jerk_x_axis_mean = "V345",
    frequency_body_accelerometer_jerk_y_axis_mean = "V346",
    frequency_body_accelerometer_jerk_z_axis_mean = "V347",
    frequency_body_accelerometer_jerk_x_axis_standard_deviation = "V348",
    frequency_body_accelerometer_jerk_y_axis_standard_deviation = "V349",
    frequency_body_accelerometer_jerk_z_axis_standard_deviation = "V350",
    frequency_body_gyroscope_x_axis_mean = "V424",
    frequency_body_gyroscope_y_axis_mean = "V425",
    frequency_body_gyroscope_z_axis_mean = "V426",
    frequency_body_gyroscope_x_axis_standard_deviation = "V427",
    frequency_body_gyroscope_y_axis_standard_deviation = "V428",
    frequency_body_gyroscope_z_axis_standard_deviation = "V429",
    frequency_body_accelerometer_magnitude_mean = "V503",
    frequency_body_accelerometer_magnitude_standard_deviation = "V504",
    frequency_body_accelerometer_jerk_magnitude_mean = "V516",
    frequency_body_accelerometer_jerk_magnitude_standard_deviation = "V517",
    frequency_body_gyroscope_magnitude_mean = "V529",
    frequency_body_gyroscope_magnitude_standard_deviation = "V530",
    frequency_body_gyroscope_jerk_magnitude_mean = "V542",
    frequency_body_gyroscope_jerk_magnitude_standard_deviation = "V543")

#download zip file
download.file(fileUrl, destfile = zipfile, method = "curl")

#unzip the download zip file extracting only the 6 needed files, getting rid
#of the folder structure in the zip file and putting the files in the data
#directory.
unzip(zipfile, files = extfiles, junkpaths = TRUE, exdir = "./data")

#Read Data Files
test_subject <- read.table("./data/subject_test.txt",
                           col.names = "subject")
test_activity <- read.table("./data/y_test.txt", col.names = "activity")
test_data <- read.table("./data/X_test.txt")

train_subject <- read.table("./data/subject_train.txt",
                            col.names = "subject")
train_activity <- read.table("./data/y_train.txt", col.names = "activity")
train_data <- read.table("./data/X_train.txt")

#Convert activity ID to descriptive names
test_activity[test_activity$activity == "1",] <- "Walking"
test_activity[test_activity$activity == "2",] <- "Walking Upstairs"
test_activity[test_activity$activity == "3",] <- "Walking Downstairs"
test_activity[test_activity$activity == "4",] <- "Sitting"
test_activity[test_activity$activity == "5",] <- "Standing"
test_activity[test_activity$activity == "6",] <- "Laying"

train_activity[train_activity$activity == "1",] <- "Walking"
train_activity[train_activity$activity == "2",] <- "Walking Upstairs"
train_activity[train_activity$activity == "3",] <- "Walking Downstairs"
train_activity[train_activity$activity == "4",] <- "Sitting"
train_activity[train_activity$activity == "5",] <- "Standing"
train_activity[train_activity$activity == "6",] <- "Laying"

#Select the mean and standard deviation columns
test_data <- select(test_data, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202,
                                 214, 215, 227, 228, 240, 241, 253, 254, 
                                 266:271, 345:350, 424:429, 503, 504, 516, 517,
                                 529, 530, 542, 543))
train_data <- select(train_data, c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202,
                                   214, 215, 227, 228, 240, 241, 253, 254, 
                                   266:271, 345:350, 424:429, 503, 504, 516, 517,
                                   529, 530, 542, 543))

#combine subject/participants, activity, mean/std data together.
test_data <- cbind(test_subject, test_activity, test_data)
train_data <- cbind(train_subject, train_activity, train_data)

#combine test_data and train_data together
study_data <- merge(test_data, train_data, all = TRUE)

#rename the generic column names (V#)
study_data <- rename(study_data, all_of(colrenames))

#cleanup/remove our test and train data frames
remove(test_subject, test_activity, test_data, train_subject, train_activity,
       train_data)

#Data frame with average/mean for each column by subject and activity
sum_by_sub_act <- study_data %>% group_by(subject, activity) %>%
    summarize(time_body_accelerometer_x_axis_mean = 
                  mean(time_body_accelerometer_x_axis_mean),
        time_body_accelerometer_y_axis_mean = 
            mean(time_body_accelerometer_y_axis_mean),
        time_body_accelerometer_z_axis_mean = 
            mean(time_body_accelerometer_z_axis_mean),
        time_body_accelerometer_x_axis_standard_deviation = 
            mean(time_body_accelerometer_x_axis_standard_deviation),
        time_body_accelerometer_y_axis_standard_deviation = 
            mean(time_body_accelerometer_y_axis_standard_deviation),
        time_body_accelerometer_z_axis_standard_deviation = 
            mean(time_body_accelerometer_z_axis_standard_deviation),
        time_gravity_accelerometer_x_axis_mean = 
            mean(time_gravity_accelerometer_x_axis_mean),
        time_gravity_accelerometer_y_axis_mean = 
            mean(time_gravity_accelerometer_y_axis_mean),
        time_gravity_accelerometer_z_axis_mean = 
            mean(time_gravity_accelerometer_z_axis_mean),
        time_gravity_accelerometer_x_axis_standard_deviation = 
            mean(time_gravity_accelerometer_x_axis_standard_deviation),
        time_gravity_accelerometer_y_axis_standard_deviation = 
            mean(time_gravity_accelerometer_y_axis_standard_deviation),
        time_gravity_accelerometer_z_axis_standard_deviation = 
            mean(time_gravity_accelerometer_z_axis_standard_deviation),
        time_body_accelerometer_jerk_x_axis_mean = 
            mean(time_body_accelerometer_jerk_x_axis_mean),
        time_body_accelerometer_jerk_y_axis_mean = 
            mean(time_body_accelerometer_jerk_y_axis_mean),
        time_body_accelerometer_jerk_z_axis_mean = 
            mean(time_body_accelerometer_jerk_z_axis_mean),
        time_body_accelerometer_jerk_x_axis_standard_deviation = 
            mean(time_body_accelerometer_jerk_x_axis_standard_deviation),
        time_body_accelerometer_jerk_y_axis_standard_deviation = 
            mean(time_body_accelerometer_jerk_y_axis_standard_deviation),
        time_body_accelerometer_jerk_z_axis_standard_deviation = 
            mean(time_body_accelerometer_jerk_z_axis_standard_deviation),
        time_body_gyroscope_x_axis_mean = 
            mean(time_body_gyroscope_x_axis_mean),
        time_body_gyroscope_y_axis_mean = 
            mean(time_body_gyroscope_y_axis_mean),
        time_body_gyroscope_z_axis_mean = 
            mean(time_body_gyroscope_z_axis_mean),
        time_body_gyroscope_x_axis_standard_deviation = 
            mean(time_body_gyroscope_x_axis_standard_deviation),
        time_body_gyroscope_y_axis_standard_deviation = 
            mean(time_body_gyroscope_y_axis_standard_deviation),
        time_body_gyroscope_z_axis_standard_deviation = 
            mean(time_body_gyroscope_z_axis_standard_deviation),
        time_body_gyroscope_jerk_x_axis_mean = 
            mean(time_body_gyroscope_jerk_x_axis_mean),
        time_body_gyroscope_jerk_y_axis_mean = 
            mean(time_body_gyroscope_jerk_y_axis_mean),
        time_body_gyroscope_jerk_z_axis_mean = 
            mean(time_body_gyroscope_jerk_z_axis_mean),
        time_body_gyroscope_jerk_x_axis_standard_deviation = 
            mean(time_body_gyroscope_jerk_x_axis_standard_deviation),
        time_body_gyroscope_jerk_y_axis_standard_deviation = 
            mean(time_body_gyroscope_jerk_y_axis_standard_deviation),
        time_body_gyroscope_jerk_z_axis_standard_deviation = 
            mean(time_body_gyroscope_jerk_z_axis_standard_deviation),
        time_body_accelerometer_magnitude_mean = 
            mean(time_body_accelerometer_magnitude_mean),
        time_body_accelerometer_magnitude_standard_deviation = 
            mean(time_body_accelerometer_magnitude_standard_deviation),
        time_gravity_accelerometer_magnitude_mean = 
            mean(time_gravity_accelerometer_magnitude_mean),
        time_gravity_accelerometer_magnitude_standard_deviation = 
            mean(time_gravity_accelerometer_magnitude_standard_deviation),
        time_body_accelerometer_jerk_magnitude_mean = 
            mean(time_body_accelerometer_jerk_magnitude_mean),
        time_body_accelerometer_jerk_magnitude_standard_deviation = 
            mean(time_body_accelerometer_jerk_magnitude_standard_deviation),
        time_body_gyroscope_magnitude_mean = 
            mean(time_body_gyroscope_magnitude_mean),
        time_body_gyroscope_magnitude_standard_deviation = 
            mean(time_body_gyroscope_magnitude_standard_deviation),
        time_body_gyroscope_jerk_magnitude_mean = 
            mean(time_body_gyroscope_jerk_magnitude_mean),
        time_body_gyroscope_jerk_magnitude_standard_deviation = 
            mean(time_body_gyroscope_jerk_magnitude_standard_deviation),
        frequency_body_accelerometer_x_axis_mean = 
            mean(frequency_body_accelerometer_x_axis_mean),
        frequency_body_accelerometer_y_axis_mean = 
            mean(frequency_body_accelerometer_y_axis_mean),
        frequency_body_accelerometer_z_axis_mean = 
            mean(frequency_body_accelerometer_z_axis_mean),
        frequency_body_accelerometer_x_axis_standard_deviation = 
            mean(frequency_body_accelerometer_x_axis_standard_deviation),
        frequency_body_accelerometer_y_axis_standard_deviation = 
            mean(frequency_body_accelerometer_y_axis_standard_deviation),
        frequency_body_accelerometer_z_axis_standard_deviation = 
            mean(frequency_body_accelerometer_z_axis_standard_deviation),
        frequency_body_accelerometer_jerk_x_axis_mean = 
            mean(frequency_body_accelerometer_jerk_x_axis_mean),
        frequency_body_accelerometer_jerk_y_axis_mean = 
            mean(frequency_body_accelerometer_jerk_y_axis_mean),
        frequency_body_accelerometer_jerk_z_axis_mean = 
            mean(frequency_body_accelerometer_jerk_z_axis_mean),
        frequency_body_accelerometer_jerk_x_axis_standard_deviation = 
            mean(frequency_body_accelerometer_jerk_x_axis_standard_deviation),
        frequency_body_accelerometer_jerk_y_axis_standard_deviation = 
            mean(frequency_body_accelerometer_jerk_y_axis_standard_deviation),
        frequency_body_accelerometer_jerk_z_axis_standard_deviation = 
            mean(frequency_body_accelerometer_jerk_z_axis_standard_deviation),
        frequency_body_gyroscope_x_axis_mean = 
            mean(frequency_body_gyroscope_x_axis_mean),
        frequency_body_gyroscope_y_axis_mean = 
            mean(frequency_body_gyroscope_y_axis_mean),
        frequency_body_gyroscope_z_axis_mean = 
            mean(frequency_body_gyroscope_z_axis_mean),
        frequency_body_gyroscope_x_axis_standard_deviation = 
            mean(frequency_body_gyroscope_x_axis_standard_deviation),
        frequency_body_gyroscope_y_axis_standard_deviation = 
            mean(frequency_body_gyroscope_y_axis_standard_deviation),
        frequency_body_gyroscope_z_axis_standard_deviation = 
            mean(frequency_body_gyroscope_z_axis_standard_deviation),
        frequency_body_accelerometer_magnitude_mean = 
            mean(frequency_body_accelerometer_magnitude_mean),
        frequency_body_accelerometer_magnitude_standard_deviation = 
            mean(frequency_body_accelerometer_magnitude_standard_deviation),
        frequency_body_accelerometer_jerk_magnitude_mean = 
            mean(frequency_body_accelerometer_jerk_magnitude_mean),
        frequency_body_accelerometer_jerk_magnitude_standard_deviation = 
           mean(frequency_body_accelerometer_jerk_magnitude_standard_deviation),
        frequency_body_gyroscope_magnitude_mean = 
            mean(frequency_body_gyroscope_magnitude_mean),
        frequency_body_gyroscope_magnitude_standard_deviation = 
            mean(frequency_body_gyroscope_magnitude_standard_deviation),
        frequency_body_gyroscope_jerk_magnitude_mean = 
            mean(frequency_body_gyroscope_jerk_magnitude_mean),
        frequency_body_gyroscope_jerk_magnitude_standard_deviation = 
            mean(frequency_body_gyroscope_jerk_magnitude_standard_deviation))

#produce text file from sum_by_sub_act data frame
write.table(sum_by_sub_act, file = "./data/summary_by_subject_actvity.txt",
            row.names = FALSE)
