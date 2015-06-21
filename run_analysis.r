#loading files in variables
feat<-read.table("features.txt")
act_lab<-read.table("activity_labels.txt")
subject_test<-read.table("./test/subject_test.txt")
subject_train<-read.table("./train/subject_train.txt")
data_test<-read.table("./test/X_test.txt")
data_train<-read.table("./train/X_train.txt")
act_test<-read.table("./test/Y_test.txt")
act_train<-read.table("./train/Y_train.txt")


#1 merging of train and test in one data set
test<-cbind(subject_test,act_test,data_test)
train<-cbind(subject_train,act_train,data_train)

all_data<-rbind(test,train)

#2 Extracting only the measurements on the mean and standard deviation for each measurement. 
# first finding all columns names containing mean() or std()
m<-regexpr("mean()",feat[,2],fixed=TRUE)
s<-regexpr("std()",feat[,2],fixed=TRUE)
ind<-feat[((m+s)!=-2),1]

#subject code and activity code are in the first columns, it must be taken in count
extracted<-all_data[,c(1,2,ind+2)] 


#3 adding descriptive activity names to name the activities in the data set using act_lab variable
act_extracted<-factor((extracted[,2]),levels=act_lab[,1],labels=act_lab[,2])
pre_tidy<-cbind(extracted,act_extracted)

#4 labelling data columns
colnames(pre_tidy)<-c("subject","activity_codes",as.character(feat[ind,2]),"activity_names")

#5  independent tidy data set with the average of each variable for each activity and each subject.
tidy <- aggregate(. ~ subject+activity_names, data=pre_tidy,FUN=mean)

write.table(tidy, "tidy.txt",row.name=FALSE)
