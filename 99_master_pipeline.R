prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)
rand_seed <- 1964
# partition num 853
run_pipeline(853, nrow(prostate_data), prostate_data, prostate_data$state, rand_seed)
