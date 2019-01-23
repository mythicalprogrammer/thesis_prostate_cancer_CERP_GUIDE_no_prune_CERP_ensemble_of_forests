cross_validate_CERP_GUIDE <- function(num_partition,
                                      num_of_folds, prostate_data) {
  forest_predictions <- list()
  for (k in 1:num_of_folds) {
    # counter for majority vote
    # HARDCODED
    D_count <- 0
    I_count <- 0

    for (i in 1:num_partition) {
      # leftout is use to predict
      leftout <- prostate_data[k, ]
      ## try to predict with just one tree
      kth_ith_tree <-
        str_c("guide_output/kfold_", k, "_tree_", i, ".r")
      print(kth_ith_tree)
      text <- readLines(kth_ith_tree, encoding = "UTF-8")
      to_be_remove <- grep("^newdata <-*", text)

      # the guide generated r file reads training data
      # so we need to remove this
      text[to_be_remove] <- " "
      # newdata in the guide r file is the predict var
      newdata <- leftout
      # run the modified GUIDE auto generate R code
      eval(parse(text = text))
      if (pred == "D") {
        D_count <- D_count + 1
      } else if (pred == "I") {
        I_count <- I_count + 1
      }
    }

    # Majority Vote
    DF_vote <- data.frame(D = D_count, I = I_count)
    class_winner <- colnames(DF_vote)[apply(DF_vote, 1, which.max)]
    forest_predictions[[k]] <- class_winner
  }

  # back up the result since this took awhile to run
  file_path  <- str_c('results/LOOCV_CERP_GUIDE_results_num_part_',
                      num_partition, '.csv')
  write.csv(forest_predictions,
            file = file_path,
            row.names = FALSE)
}
