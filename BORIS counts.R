# Load the BORIS output data from a CSV file
boris_data <- read.csv("Example BORIS output.csv")


source("BORIS aggregator.R")
# REQUIRES COLUMNS:
# video
# behavior
# duration
# focal_subject

# Aggregate into long format
aggregated_data_long = aggregate_boris_data_long(boris_data)

# Export data frame to CSV file
write.csv(aggregated_data_long, "aggregate_boris_data_long.csv", row.names = FALSE)  


# Aggregate into wide format
aggregated_data_wide = aggregate_boris_data_wide(boris_data)

# Export data frame to CSV file
write.csv(aggregated_data_wide, "aggregate_boris_data_wide.csv", row.names = FALSE)  
