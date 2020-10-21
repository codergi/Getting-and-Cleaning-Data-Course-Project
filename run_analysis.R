library(data.table)
library(dplyr)
library(plyr)
library(matrixStats)

#create the file path for the test sets
dirTest <- ("./UCI HAR Dataset/test/")
fileTest <- list.files(dirTest)
fileTest <- grep("(.*)_test+", fileTest, value = TRUE)
filePath_Test <- paste(dirTest, fileTest, sep = "")

#create the file path for the training sets
dirTrain <- ("./UCI HAR Dataset/train/")
fileTrain <- list.files(dirTest)
fileTrain <- grep("(.*)_train+", fileTest, value = TRUE)
filePath_Train <- paste(dirTest, fileTest, sep = "")

sample_test <- read.csv(filePath_Test[1], header = FALSE) #read the column of the test samples
x_test <- read.csv(filePath_Test[2], header = FALSE, sep = "") #Read the column for the value of the Test set
x_test_mean <- rowMeans(x_test) #get mean of each observation of the test set
x_test_sd <- rowSds(as.matrix(x_test)) #get standard deviation of each observation of the test set
y_test <- read.csv(filePath_Test[3], header = FALSE) #read the activity of the test set
test <- data.frame(sample_test, x_test_mean, x_test_sd, y_test) #combine all test data
colnames(test) <- c("Test.Sample", "Test.Mean", "Test.Standard.Deviation", "Test.Activity") #labeling columns of the test data

sample_train <- read.csv(filePath_Train[1], header = FALSE) #read the column of the training samples
x_train <- read.csv(filePath_Train[2], header = FALSE, sep = "") #Read the column for the value of the Training set
x_train_mean <- rowMeans(x_train) #get mean of each observation of the training set
x_train_sd <- rowSds(as.matrix(x_train)) #get standard deviation of each observation of the training set
y_train <- read.csv(filePath_Train[3], header = FALSE) #read the data for the activity of the training set
train <- cbind(sample_train, x_train_mean, x_train_mean, y_train) #combine all training data
colnames(train) <- c("Training.Sample", "Training.Mean", "Training.Standard.Deviation", "Training.Activity") #labeling columns of the training data

data <- data.frame(test, train)

#Naming the activities of the test and training according to the activity labels
data[which(data[,4] == 1, arr.ind=TRUE), 4] = "Walking"
data[which(data[,4] == 2, arr.ind=TRUE), 4] = "Walking Upstairs"
data[which(data[,4] == 3, arr.ind=TRUE), 4] = "Walking Downstairs"
data[which(data[,4] == 4, arr.ind=TRUE), 4] = "Sitting"
data[which(data[,4] == 5, arr.ind=TRUE), 4] = "Standing"
data[which(data[,4] == 6, arr.ind=TRUE), 4] = "Laying"
data[which(data[,8] == 1, arr.ind=TRUE), 8] = "Walking"
data[which(data[,8] == 2, arr.ind=TRUE), 8] = "Walking Upstairs"
data[which(data[,8] == 3, arr.ind=TRUE), 8] = "Walking Downstairs"
data[which(data[,8] == 4, arr.ind=TRUE), 8] = "Sitting"
data[which(data[,8] == 5, arr.ind=TRUE), 8] = "Standing"
data[which(data[,8] == 6, arr.ind=TRUE), 8] = "Laying"

#Grouping the observations by the sample and activity
Training.Mean <- data %>%
        group_by(Training.Sample, Training.Activity) %>%
        summarise_at(vars("Training.Mean"), mean) #getting the mean for the training set group by sample and activity
Test.Mean <- data %>%
        group_by(Test.Sample, Test.Activity) %>%
        summarise_at(vars("Test.Mean"), mean) #getting the mean for the test set group by sample and activity


data_group <- data.frame(Test.Mean, Training.Mean)

#Create the files
write.table(data, file = "Data.csv") #Data with the mean and standard deviation of each observation
write.table(data_group, file = "Data_group.csv") #Data with the mean of the observation grouped by sample and activity




