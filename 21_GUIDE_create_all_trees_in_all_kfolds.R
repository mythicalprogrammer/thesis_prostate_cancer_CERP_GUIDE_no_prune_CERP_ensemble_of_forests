# create_CERP_GUIDE_forests <- function(num_partition, num_of_folds) {
#   for (k in 1:num_of_folds) {
#     for (j in 1:num_partition) {
#       #TODO: HARDCODED below input file
#       text <- readLines("prostatecancer_no_prune.input", encoding = "UTF-8")
#       text[4]  <- str_c('"guide_output/kfold_', k, '_tree_', j, '.out"')
#       text[10] <- str_c('"guide_data/kfold_', k, '_part_', j, '.dsc"')
#       text[20] <- str_c('"guide_output/kfold_', k, '_tree_', j, '.R"')
#       write(text, file = "prostate.tmp_input")
#       system("./guide < prostate.tmp_input")
#     }
#   }
# }

create_CERP_GUIDE_forests <- function(num_partition, num_of_folds) {
  #for (k in 1:num_of_folds) {
  #  for (j in 1:num_partition) {
  k <- 1:num_of_folds
  j <- 1:num_partition
  kandj <- expand.grid(k = k, j = j)
  nr <- nrow(kandj)
  mclapply(1:nr, function(iter) {
    k <- kandj[iter,]$k
    j <- kandj[iter,]$j
    #TODO: HARDCODED below input file
      text <- readLines("prostatecancer_no_prune.input", encoding = "UTF-8")
      text[4]  <- str_c('"guide_output/kfold_', k, '_tree_', j, '.out"')
      text[10] <- str_c('"guide_data/kfold_', k, '_part_', j, '.dsc"')
      text[20] <- str_c('"guide_output/kfold_', k, '_tree_', j, '.R"')
      tmp_input_file <- str_c("tmp_input/prostate.tmp_input_", k, '_tree_', j)
      write(text, file = tmp_input_file)
      sys_command <- str_c("./guide < ", tmp_input_file)
      system(sys_command)
  }, mc.silent = TRUE)
}

