prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)
rand_seed <- 1964
rand_seed <- 1985
# partition num 801
run_pipeline(801, nrow(prostate_data), prostate_data, prostate_data$state, rand_seed)
# partition num 853
run_pipeline(853, nrow(prostate_data), prostate_data, prostate_data$state, rand_seed)
# partition num 401
run_pipeline(401, 20, prostate_data, prostate_data$state, rand_seed)
# partition num 101
run_pipeline(101, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 609
run_pipeline(609, nrow(prostate_data), prostate_data, prostate_data$state, rand_seed)

# partition num 401
run_pipeline(401, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 501
run_pipeline(501, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 701
run_pipeline(701, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 455
run_pipeline(455, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 475
run_pipeline(475, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 465
run_pipeline(465, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 469
run_pipeline(469, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 467
run_pipeline(467, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 463
run_pipeline(463, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 801
run_pipeline(801, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 901
run_pipeline(901, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1001
run_pipeline(1001, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1101
run_pipeline(1101, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1201
run_pipeline(1201, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 851
run_pipeline(851, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 825
run_pipeline(825, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 845
run_pipeline(845, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 875
run_pipeline(875, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 865
run_pipeline(865, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 855
run_pipeline(855, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 853
run_pipeline(853, 20, prostate_data, prostate_data$state, rand_seed)

# ----

# partition num 835
run_pipeline(835, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 829
run_pipeline(829, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 831
run_pipeline(831, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 833
run_pipeline(833, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 921
run_pipeline(921, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 71
run_pipeline(71, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 81
run_pipeline(81, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 91
run_pipeline(91, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 101
run_pipeline(101, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 201
run_pipeline(201, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 301
run_pipeline(301, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 861
run_pipeline(861, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 871
run_pipeline(871, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 881
run_pipeline(881, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 891
run_pipeline(891, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 911
run_pipeline(911, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 931
run_pipeline(931, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 941
run_pipeline(941, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 951
run_pipeline(951, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 961
run_pipeline(961, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 971
run_pipeline(971, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 981
run_pipeline(981, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 991
run_pipeline(991, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1051
run_pipeline(1051, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1025
run_pipeline(1025, 20, prostate_data, prostate_data$state, rand_seed)

# partition num 1075
run_pipeline(1075, 20, prostate_data, prostate_data$state, rand_seed)
