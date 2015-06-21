

# Merge the training and test sets to create one data set


xtrn <- read.table("train/xtrn.txt")
ytrn <- read.table("train/ytrn.txt")
subject_train <- read.table("train/subject_train.txt")

xtst <- read.table("test/xtst.txt")
ytst <- read.table("test/ytst.txt")
subject_test <- read.table("test/subject_test.txt")

xdt <- rbind(xtrn, xtst)


ydt <- rbind(ytrn, ytst)


subject_data <- rbind(subject_train, subject_test)


# Extract only the measurements on the mean and standard deviation for each measurement


features <- read.table("features.txt")

# get only columns with mean() or std() 
m_s_feat <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xdt <- xdt[, m_s_feat]

# correct the column names
names(xdt) <- features[m_s_feat, 2]


# Name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
ydt[, 1] <- activities[ydt[, 1], 2]

# correct column name
names(ydt) <- "activity"


# Appropriately label the data set with descriptive variable names


# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_d <- cbind(xdt, ydt, subject_data)


# Create a second tidy data set with the average of each variable



# 66 <- 68 columns but last two (activity & subject)
avg_d <- ddply(all_d, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_d, "avg_d.txt", row.name=FALSE)