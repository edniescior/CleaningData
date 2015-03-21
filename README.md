### Introduction

This is my submission for the Getting and Cleaning Data programming assignment. It includes a script to read in the Samsung accelerometer raw data set, combine training and test data sets into a single file and write it out as a text file in a 'tidy' format.

The Code Book that accompanies this file describes the transformations done on the raw file to produce the 'tidy' output data file and the decisions taken in doing so.

### Requirements

1. The R script -- run_analysis.R -- that processes the raw data is in your working directory.
2. The raw data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) that has been unzipped in your working directory.

### How To Run It

1. Run> source('run_analysis.R')

### What It Does

Running the script:

1. Reads in the test data and appends the appropriate activity and subject ids to each record.
2. Reads in the training data and appends the appropriate activity and subject ids to each record.
3. Combines the test and training data into a single set.
4. Reads in the feature set and filters out those that are not of interest.
5. Subsets the data set to include only those features in which we are interested.
6. Applies readable column names to the data set based on the features list.
7. Replaces the activity id with a more readable label, e.g. WALKING.
8. Calculates the mean for all features grouped by subject and activity.
9. Writes out the resulting data frame to a text file.

### What It Produces

1. A text file named 'UCIHAR_Tidy_Dataset.txt' in your working directory.

### How to Read in the Text File

The text file can be read in by running: read.table("UCIHAR_Tidy_Dataset.txt", header=TRUE, sep=" ")