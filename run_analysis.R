
#Reading the training dataset
train_x = read.table("UCIHARDataset/train/X_train.txt")
train_y = read.table("UCIHARDataset/train/y_train.txt")
train_sub = read.table("UCIHARDataset/train/subject_train.txt")
train = c("train") #Creating a category column for training dataset
train_data = cbind(train_sub,train_y,train_x)

#Reading the test dataset
test_x = read.table("UCIHARDataset/test/X_test.txt")
test_y = read.table("UCIHARDataset/test/y_test.txt")
test_sub = read.table("UCIHARDataset/test/subject_test.txt")
test = c("test") #Creating a category column for test dataset
test_data = cbind(test_sub,test_y,test_x)

#Merging train and test dataset
##Changing the column names for smooth merging
names(train_data)[1] <- "subject"
names(test_data)[1] <- "subject"
names(train_data)[2] <- "activity"
names(test_data)[2] <- "activity"

##Combine the test and train dataset using rbind since they contain same set of columns

dat = rbind(train_data,test_data) #This completes for number 1
#Number 1
print(dat)

features <- read.table("UCIHARDataset/features.txt", header=FALSE)
mean <- grep("*mean*",features[,2])
std <- grep("*std",features[,2])
loc <- sort(c(mean,std)) #Now we have the location of the features that contains mean and standard deviation

#This portion saves only the features with mean and standard deviation note that we added "3"
#in loc to compensate for the subject,dataset, activity variables; thus completes number 2
filtereddat <- dat[,c(1:2,loc+2)]
#Number 2
print(filtereddat)

#For the solution in number 3, we need to edit the values of activity variable to the of the descriptive activity
#names found in "activity_labels.txt"
activity <- read.table("UCIHARDataset/activity_labels.txt")
y = filtereddat["activity"]
y_temp = filtereddat["activity"]
ctr = 1
for(i in y){
  y_temp = activity[,2][i]
}
filtereddat["activity"] = y_temp #This completes our solution for number 3
#Number 3
print(filtereddat)

#For problem 4, we need to use the feature labels to rename the variables in "filtereddat"
varnames = features[loc,2]
names(filtereddat)[3:(length(varnames)+2)] <- as.character(varnames) #Thus this completes our solution for number 4
#number 4
print(filtereddat) #Tidy data set for numbers, 1-4

#For number five what I did was I get the average of each variable for each activity of each subject
aggregatedmean = filtereddat
#Aggregate the filtereddat by subject participant followed by
#their corresponding activity
aggregatedmean = aggregate(aggregatedmean[3:81], by=list(aggregatedmean$activity,aggregatedmean$subject),
                           FUN=mean, na.rm = TRUE)
names(aggregatedmean)[1] <- "subject"
names(aggregatedmean)[2] <- "activity"

#Number 5
print(aggregatedmean) #Tidy data set for number 5
#Note that the explicit direction was to save the new dataset with parameters row.names = FALSE
write.table(aggregatedmean, file = "newdataset.txt" ,row.names = FALSE)

