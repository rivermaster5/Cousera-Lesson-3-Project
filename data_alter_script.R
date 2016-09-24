
#####################
### Importing Data  ---------------------------------------------

# Download Data
file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Import
temp <- tempfile()
download.file(file,temp)

fns <- unzip(temp, junkpaths = TRUE, exdir = tempdir())
fns <- fns[c(1:2, 14:16, 26:28)]
list2env(setNames(lapply(fns, read.table), basename(tools::file_path_sans_ext(fns))), globalenv())

#####################
### Consolidating Data  ---------------------------------------------

# Combine training and test sets to get full data set
X_set <- rbind(X_train, X_test)
X_set_names <- as.vector(features[,2])
colnames(X_set) <- X_set_names

# Get restricted set of data - mean and std columns only
X_set_names_restricted <- X_set_names[grepl('mean()', X_set_names, fixed = TRUE) | grepl('std()', X_set_names, fixed = TRUE)]
X_set_restricted <- X_set[,X_set_names_restricted]

# Combine training and test subject labels 
subject_set <- rbind(subject_train, subject_test)
colnames(subject_set) <- 'SubjectID'

# Combine training and test activity labels
y_set <- rbind(y_train, y_test)
y_set_label <- merge(x = y_set, y = activity_labels)
colnames(y_set_label) <- c('ActivityID', 'Activity')

# Combine all columns
pace_data <- cbind(subject_set, y_set_label, X_set_restricted)

#####################
### Average Data  ---------------------------------------------

# Create table of averages for each subject, activitylabel, and column
pace_summary <- aggregate(pace_data[,4:length(colnames(pace_data))], by = list(pace_data$SubjectID, pace_data$ActivityID, pace_data$Activity), mean)
colnames(pace_summary) <- colnames(pace_data)

# Order for Clarity
pace_summary <- pace_summary[order(pace_summary$SubjectID, pace_summary$ActivityID),]

# Remove all tables but pace_data and pace_summary
rm(list=setdiff(ls(), c("pace_data","pace_summary")))