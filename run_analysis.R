
###### Read test file X_test and features file
readtest<-read.table("UCI HAR Dataset/test/X_test.txt")
readfeatures<-read.table("UCI HAR Dataset/features.txt")

###### There are duplicate column names so mutate is used to create unique column names
readfeatures<-mutate(readfeatures,uniqueCol=paste0(readfeatures$V1,"_",readfeatures$V2))

###### Assign name from features to readtest
names(readtest)<-readfeatures$uniqueCol

###### Read train file and assign names from features
readtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
names(readtrain)<-readfeatures$uniqueCol

###### Read Subject and Activity files and rename columns
read_y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
names(read_y_test)<-c("Label")
read_subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(read_subject_test)<-c("Subject")

###### combine the 3 data sets X_test, y_test, subject_test
yxSubTest<-cbind(read_y_test,readtest,read_subject_test)

###### Repeat reading and combining for train files
read_y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
names(read_y_train)<-c("Label")
read_subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(read_subject_train)<-c("Subject")
yxSubTrain<-cbind(read_y_train,readtrain,read_subject_train)

###### Merge Train and Test sets to create one dataset
testtrain<-rbind(yxSubTrain,yxSubTest)

###### Read activity_labels file and use it to add activity names to merged dataset testtrain
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels)<-c("Label","Activity")
testtrain<-merge(testtrain,activity_labels)

###### Find columns with mean and standard deviation and create a set with only those in addition to Activity and Subject
meancols<-grep("mean",names(testtrain),value=TRUE)
stdcols<-grep("std",names(testtrain),value=TRUE)
meanstd<-c(meancols,stdcols,"Activity","Subject")
colNums <- match(meanstd,names(testtrain))
selectTestTrain<-select(testtrain,colNums)

###### Group by Activity and Subject. 
groupAS<-group_by (selectTestTrain,Activity,Subject)

###### Average of all variables for each Activity and Subject
summaryAS<-summarize_each(groupAS,funs(mean))

###### Export tidy data set as csv file
write.csv(summaryAS,"tidyData.csv",row.names=FALSE)

