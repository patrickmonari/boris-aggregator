# Load required packages
library(dplyr)
library(tidyr)

# Define function to aggregate data in long format
aggregate_boris_data_long <- function(boris_data) {
  
  # Aggregate data to calculate duration of each behavior for each focal subject and video
  duration <- aggregate(duration ~ video + behavior + focal_subject, data = boris_data, sum)
  
  # Count the number of occurrences of each behavior for each focal subject and video
  count <- boris_data %>% count(video, behavior, focal_subject)
  
  # Merge the duration and count data frames using left_join() function
  merged_data <- left_join(count, duration, by = c("video", "behavior", "focal_subject"))
  
  # Return merged data frame
  return(merged_data)
}

# Define function to convert data from long to wide format
aggregate_boris_data_wide <- function(boris_data) {
  
  # Aggregate data to calculate duration of each behavior for each focal subject and video
  duration <- aggregate(duration ~ video + behavior + focal_subject, data = boris_data, sum)
  
  # Count the number of occurrences of each behavior for each focal subject and video
  count <- boris_data %>% count(video, behavior, focal_subject)
  
  # Merge the duration and count data frames using left_join() function
  merged_data <- left_join(count, duration, by = c("video", "behavior", "focal_subject"))
  
  # Convert the data from long to wide format using pivot_wider() function
  aggregated_data_wide <- merged_data %>%
    pivot_wider(names_from = c(behavior, focal_subject), names_sep = ".", values_from = c(n, duration))
  
  # Return wide-format data frame
  return(aggregated_data_wide)
}

























