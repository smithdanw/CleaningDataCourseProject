library(plyr)
library(dplyr)

# process sub_folder_name
process_set <- function (base_folder, sub_folder_name, activity_labels, features){
  
  file_name <- paste("X_", sub_folder_name, ".txt", sep = "")
  test_set <- read.table(paste(base_folder, sub_folder_name, file_name, sep = "/"))
  
  file_name <- paste("y_", sub_folder_name, ".txt", sep = "")
  test_labels <- read.table(paste(base_folder, sub_folder_name, file_name, sep = "/"))
  
  file_name <- paste("subject_", sub_folder_name, ".txt", sep = "")
  subject <- read.table(paste(base_folder, sub_folder_name, file_name, sep = "/"))
  
  test_set = test_set[,features$V1]
  names(test_set) <- features$V2
  
  id_vec <- 1:nrow(test_set)
  
  test_set$id <- id_vec
  test_labels$id <- id_vec
  subject$id <- id_vec
  
  names(subject) <- c("subject_id")

  test_set$subject_id <- subject$subject_id
  activity_vec <- join(x = test_labels, y = activity_labels, by = "V1", type="left" )
  names(activity_vec) <- c("V1", "id", "activity")
  test_set$activity_name <- activity_vec$activity
  test_set$group <- rep(sub_folder_name, nrow(test_set))
  
  test_set
}

# process entire folder
process_data <- function(base_folder)
{
  activity_labels <- read.table(paste(base_folder, "activity_labels.txt", sep = "/"), stringsAsFactors = F)
  
  #clean up the names
  features <- read.table(paste(base_folder, "features.txt", sep = "/"))
  features <- mutate(features, V2 = tolower(V2))
  
  matches <-grep("^[^a].*(mean|std)", features$V2)
  matches <- data.frame(matches)
  names(matches) <- c("grep_result")
  matches <- mutate(matches, keep = T)
  features <- merge(x = features, by.x = "V1", y = matches, by.y = "grep_result", all.x =  T)
  features <- filter(features, !is.na(keep) & keep == T)
  features <- mutate(features, V2 = gsub("[(]|[)]", "", V2))
  features <- mutate(features, V2 = gsub("[-]", "_", V2))
  features <- mutate(features, V2 = sub("tbody", "t_body_", V2))
  features <- mutate(features, V2 = sub("fbody", "f_body_", V2))
  features <- mutate(features, V2 = sub("tgravity", "gravity_", V2))
  features <- mutate(features, V2 = sub("anglebody", "angle_body", V2))
  features <- mutate(features, V2 = sub("gravitymean", "gravity_mean", V2))
  features <- mutate(features, V2 = sub("accjer", "acc_jerk", V2))
  features <- mutate(features, V2 = sub("gyrojerk", "gyro_jerk", V2))
  features <- mutate(features, V2 = sub("accmag", "acc_mag", V2))
  features <- mutate(features, V2 = sub("accjerkmag", "acc_jerk_mag", V2))
  features <- mutate(features, V2 = sub("gyromag", "gyro_mag", V2))
  features <- mutate(features, V2 = sub("jerkmag", "jerk_mag", V2))
  features <- mutate(features, V2 = sub("anglex,", "angle_x_", V2))
  features <- mutate(features, V2 = sub("angley,", "angle_y_", V2))
  features <- mutate(features, V2 = sub("anglez,", "angle_z_", V2))
  features <- mutate(features, V2 = sub("accmean,", "acc_mean_", V2))
  features <- mutate(features, V2 = sub("jerkmean,", "jerk_mean_", V2))
  
  totals = 1
  
  for(directory in list.dirs(base_folder, recursive = FALSE)){
    if(directory != base_folder){
      folder_name <- sub(".*[/]", "", directory)
      temp <- process_set(base_folder, folder_name, activity_labels, features)

      #merge the indivual trials together
      if(is.numeric(totals)) {
        totals <- temp 
      } else
      {
        totals <- rbind.fill(totals, temp)
      }
    }
  }
 
  totals$id = NULL
  
  created_columns <- c("subject_id", "activity_name", "group")                        
 
  my_names <- names(totals)
  splits <- split(totals, list(totals$subject_id, totals$activity_name))
 
  num_splits <- length(splits)
  split_names <- names(splits)
 
  features_length <- nrow(features)
  column_count <- ncol(totals)
  totals <- totals[, c((column_count - 2):column_count, 1:(column_count - 3))]
  by_subject_by_activity <- ddply(totals, .(subject_id, activity_name), function(x) colMeans(x[,4:column_count]))
  
  by_subject_by_activity$group <- NULL
  
  env <- globalenv()
  env$har_totals <- totals
  env$by_subject_by_activity <- by_subject_by_activity
  write.table(by_subject_by_activity, file = "tidy.txt", row.names = F)
  write.table(names(by_subject_by_activity), file = "names.txt")
  totals
}