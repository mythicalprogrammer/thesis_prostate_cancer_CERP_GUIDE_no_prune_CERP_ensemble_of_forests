prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)
rand_seed <- 1964
num_partition <- 853
rand_seeds <- c(1964, 1985, 1986)
delete_generated_files()
# nonparallel Time difference of 44.88362 secs
# Parallel Time difference of 34.38888 secs
start_time <- Sys.time()
create_CERP_partition(num_partition, nrow(prostate_data), 1964)
end_time <- Sys.time()
end_time - start_time

# Nonparallel Time difference of 55.14364 secs
# Parallel I Time difference of 20.40521 secs
start_time <- Sys.time()
generate_guide_description_file(num_partition, nrow(prostate_data), rand_seed)
end_time <- Sys.time()
end_time - start_time

# parallel II 3.116235 mins
start_time <- Sys.time()
create_CERP_GUIDE_forest(num_partition, nrow(prostate_data), rand_seed)
end_time <- Sys.time()
end_time - start_time

# Nonparallel  11.54923 mins for 3 forests
# Parallel I
start_time <- Sys.time()
create_ensemble_of_GUIDE_forests(num_partition, nrow(prostate_data), rand_seeds)
end_time <- Sys.time()
end_time - start_time


# Nonparallel 9.454669 mins
# Parallel I  2.741934 mins
start_time <- Sys.time()
cross_validate_CERP_GUIDE(875, nrow(prostate_data), prostate_data)
end_time <- Sys.time()
end_time - start_time


# etc... creating a auto find optimal partition

num_part <- 875
file_path  <- str_c('results/LOOCV_CERP_GUIDE_results_num_part_',
                    num_part,
                    '.csv')
forest_predictions <-
  read.table(file_path, sep = ",", header = TRUE)
pred <- factor(unlist(forest_predictions))
levels(pred) <- c("D", "I") # HARDCODED
actual <- factor(prostate_data$state)
print(confusionMatrix(pred, actual))
cm <- confusionMatrix(pred, actual)
#levels(actual)
create_confusion_matrix(forest_predictions, prostate_data$state, num_part)


