### Code Book

A full description of the raw data is described here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones where the data was obtained. 

The raw data is also described in the README.txt file in the 'UCI HAR Dataset'. The features are further defined in the features_info.txt file in the same directory.

The tidy data contains the fields:

[1] subject id: the subject itentifier, an integer from 1 - 30 for each of the subjects in the study
[2] activity: a label for each of the six activities in the study: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS.

The 86 feature variables were chosen based on whether the feature names (taken from features.txt) contains the words 'mean' or 'std' for mean and standard deviation. This was NOT case-sensitive so any representation of those labels was accepted, e.g. Mean or mean. That was a decision based on not knowing anything about the study or statistics for that matter. I don't think it matters in the context of this submission so I decided to make it case insensitive.

The mean was calculated for each feature variable:

 [3] "tBodyAcc.mean...X"                    "tBodyAcc.mean...Y"                   
 [5] "tBodyAcc.mean...Z"                    "tBodyAcc.std...X"                    
 [7] "tBodyAcc.std...Y"                     "tBodyAcc.std...Z"                    
 [9] "tGravityAcc.mean...X"                 "tGravityAcc.mean...Y"                
[11] "tGravityAcc.mean...Z"                 "tGravityAcc.std...X"                 
[13] "tGravityAcc.std...Y"                  "tGravityAcc.std...Z"                 
[15] "tBodyAccJerk.mean...X"                "tBodyAccJerk.mean...Y"               
[17] "tBodyAccJerk.mean...Z"                "tBodyAccJerk.std...X"                
[19] "tBodyAccJerk.std...Y"                 "tBodyAccJerk.std...Z"                
[21] "tBodyGyro.mean...X"                   "tBodyGyro.mean...Y"                  
[23] "tBodyGyro.mean...Z"                   "tBodyGyro.std...X"                   
[25] "tBodyGyro.std...Y"                    "tBodyGyro.std...Z"                   
[27] "tBodyGyroJerk.mean...X"               "tBodyGyroJerk.mean...Y"              
[29] "tBodyGyroJerk.mean...Z"               "tBodyGyroJerk.std...X"               
[31] "tBodyGyroJerk.std...Y"                "tBodyGyroJerk.std...Z"               
[33] "tBodyAccMag.mean.."                   "tBodyAccMag.std.."                   
[35] "tGravityAccMag.mean.."                "tGravityAccMag.std.."                
[37] "tBodyAccJerkMag.mean.."               "tBodyAccJerkMag.std.."               
[39] "tBodyGyroMag.mean.."                  "tBodyGyroMag.std.."                  
[41] "tBodyGyroJerkMag.mean.."              "tBodyGyroJerkMag.std.."              
[43] "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                   
[45] "fBodyAcc.mean...Z"                    "fBodyAcc.std...X"                    
[47] "fBodyAcc.std...Y"                     "fBodyAcc.std...Z"                    
[49] "fBodyAcc.meanFreq...X"                "fBodyAcc.meanFreq...Y"               
[51] "fBodyAcc.meanFreq...Z"                "fBodyAccJerk.mean...X"               
[53] "fBodyAccJerk.mean...Y"                "fBodyAccJerk.mean...Z"               
[55] "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                
[57] "fBodyAccJerk.std...Z"                 "fBodyAccJerk.meanFreq...X"           
[59] "fBodyAccJerk.meanFreq...Y"            "fBodyAccJerk.meanFreq...Z"           
[61] "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                  
[63] "fBodyGyro.mean...Z"                   "fBodyGyro.std...X"                   
[65] "fBodyGyro.std...Y"                    "fBodyGyro.std...Z"                   
[67] "fBodyGyro.meanFreq...X"               "fBodyGyro.meanFreq...Y"              
[69] "fBodyGyro.meanFreq...Z"               "fBodyAccMag.mean.."                  
[71] "fBodyAccMag.std.."                    "fBodyAccMag.meanFreq.."              
[73] "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.std.."           
[75] "fBodyBodyAccJerkMag.meanFreq.."       "fBodyBodyGyroMag.mean.."             
[77] "fBodyBodyGyroMag.std.."               "fBodyBodyGyroMag.meanFreq.."         
[79] "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.std.."          
[81] "fBodyBodyGyroJerkMag.meanFreq.."      "angle.tBodyAccMean.gravity."         
[83] "angle.tBodyAccJerkMean..gravityMean." "angle.tBodyGyroMean.gravityMean."    
[85] "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean."                
[87] "angle.Y.gravityMean."                 "angle.Z.gravityMean."


### Study Design

1. Read in the test data and append the appropriate activity and subject ids to each record with cbind. Add names for the activity and subject ids so that we can refer to those columns by name later.
2. Do the exact same thing for the training data.
3. Rbind the test and training data into a single set.
4. Read in the feature set and filters out those that are not of interest by grepping on 'std' or 'mean' in case insensitive mode.
5. Subset the data set to include only those features in which we are interested.
6. Apply readable column names to the data set based on the features list.
7. Replace the activity id with a more readable label, e.g. WALKING, SITTING, etc.
8. Calculate the mean for all features grouped by subject and activity.
9. Write out the resulting data frame to a text file. Use a space as the separator as some of the names contain commas.
