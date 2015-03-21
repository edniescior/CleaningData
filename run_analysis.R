library(dplyr)

##
# Read in test and training data, attach the activity id
# and subject to the appropriate record and then 
# combine the test and training data sets.
#
mergeFiles <- function() {

    # read in the test data feature vector, activity ids and subjects
    xdat_test <- read.table("UCI HAR Dataset/test/X_test.txt")
    ydat_test <- read.table("UCI HAR Dataset/test/y_test.txt")
    subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    names(ydat_test) <- c("activityid")
    names(subj_test) <- c("subject")
    
    # bind the activity id and subject associated with each feature vector record
    dat_test <- cbind(xdat_test, ydat_test, subj_test)
    
    # read in the training data feature vector, activity ids and subjects
    xdat_train <- read.table("UCI HAR Dataset/train/X_train.txt")
    ydat_train <- read.table("UCI HAR Dataset/train/y_train.txt")
    subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    names(ydat_train) <- c("activityid")
    names(subj_train) <- c("subject")
    
    # bind the activity id and subject associated with each feature vector record
    dat_train <- cbind(xdat_train, ydat_train, subj_train)
    
    # cat the test and train datasets into a single whole
    rbind(dat_test, dat_train)
}

##
# Read in the feature list and return only rows for those
# features in which we are interested, i.e. means and standard deviations
#
getFeatureSet <- function(featuresList="UCI HAR Dataset/features.txt") {
    features <- read.table(featuresList)
     
    # Captures mean, Mean and std.
    f <- unlist(features[2]) # grep needs a vector
    featuresIdx <- grep("mean|std", x = f, ignore.case = TRUE)
    
    features[featuresIdx, ]
}

## 
# Read in the activity labels and change the names so we can merge it.
#
getLabels <- function(activityLabels="UCI HAR Dataset/activity_labels.txt") {
    labels <- read.table(activityLabels)
    names(labels) <- c("activityid", "activity")
    labels
}

main <- function() {
    # read in the data and concat to a single file
    dat <- mergeFiles()
    
    # fetch the features that we are interested in
    features <- getFeatureSet()
    featuresIdx <- unlist(features[1])
    featuresIdx <- c(featuresIdx, (length(dat) - 1), (length(dat))) # append the activity id and subject
    
    # subset on the features in which we are interested
    dat <- dat[ , featuresIdx]
    
    # set the names
    nms <- as.character(features[[2]])    
    names(dat) <- c(nms, "activityid", "subjectid")
    
    # append the activity labels
    labels <- getLabels()
    dat <- merge(dat, labels, by="activityid")
    dat <- select(dat, -activityid) # drop this - we no longer need it
    
    # calc the mean value for each subject and activity
    lab_dat <- dat %>% group_by(subjectid, activity) %>% summarise_each(funs(mean))
    
    # write it out
    write.table(lab_dat, file="UCIHAR_Tidy_Dataset.txt", sep=" ", row.names=FALSE, col.names=TRUE)
}

main()