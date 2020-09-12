# Load the dplyr and reshape2 libraries
library(dplyr)
library(reshape2)

#Load the dataset from files into R
x_train <- read.table("./UCIHAR/X_train.txt")
x_test <- read.table("./UCIHAR/X_test.txt")
y_train <- read.table("./UCIHAR/y_train.txt")
y_test <- read.table("./UCIHAR/y_test.txt")
subject_test <- read.table("./UCIHAR/subject_test.txt")
subject_train <- read.table("./UCIHAR/subject_train.txt")
headers <- read.table("./UCIHAR/features.txt")
activity_labels <- read.table("./UCIHAR/activity_labels.txt")

#Combine the test and train portions of each dataset
df <- rbind(x_train, x_test)
activity <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#Add the feature names from the dataset to the dataframe
names(df) <- headers$V2

#Filter dataframe to only features with mean or std
df <- select(df, contains('std') | contains('mean'))

# Add columns for subject and activity to the dataframe
# Rename new columns clearly
df <- cbind(df, subject)
df <- rename(df, 'subject' = 'V1')
df <- cbind(df, activity)
df <- rename(df, 'activity' = 'V1')

# Create descriptive feature for activity
df$activity <- activity_labels$V2[df$activity]

# Melt
melted <- melt(df, id = c('subject', 'activity'))

# Cast
cleandata <- dcast(melted, subject + activity ~ variable, mean)

# Write tidy data to file
write.table(cleandata, "cleandata.txt")