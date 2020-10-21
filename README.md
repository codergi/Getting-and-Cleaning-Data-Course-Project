Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the 
estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The functions used to create a tidy data from the raw data are the following:
- list.files() : list the files  
- grep() : find the specific file to open for the file path  
- paste() : combine characters to create file path  
- read.csv() : reading the raw data  
- rowMeans() : getting the means of the row  
- rowSds() : getting the standard deviation of the rows  
- data.frame() : creating a data frame  
- colnames() : setting the names for the columns  
- which() : Give the TRUE indices of a logical object  
- group_by : group the tidy data by sample and activity  
- summarise_at() : summarise the grouped tidy data  
- write.table() : create a file  

For creating the first tidy data, The first thing done was to get the mean and 
standard deviation of the observations for the test set and training set. After
obtaining the values, the names of the columns were changed then the two sets
were combined then the values for the activities were changed according to the 
activity labels creating the first tidy data (see "Data.csv"").

For creating the second tidy data which is getting the mean of the tidy data set
with the average of each variable for each activity and each subject, from the 
first generated data, the test set and training set were group by their 
respective sample and activity and from that, their means were computed. After 
it, the two sets were combined again creating the grouped tidy data 
(see "Data_group.csv"").

