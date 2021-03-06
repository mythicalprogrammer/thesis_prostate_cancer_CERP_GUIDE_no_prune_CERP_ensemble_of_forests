cross_validate_CERP_GUIDE <- function(num_partition,
                                      num_of_folds,
                                      prostate_data,
                                      rand_seed) {
  forest_predictions <- list()
  for (k in 1:num_of_folds) {
    forest_votes <- mclapply(1:num_partition, function(i) {
      # leftout is use to predict
      leftout <- prostate_data[k,]
      ## try to predict with just one tree
      kth_ith_tree <-
        str_c("guide_output/forests/rand_seed_",rand_seed,"/kfold_", k, "_tree_", i, ".R")
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
      return(pred)
    })

    # Majority Vote
    #print(length(grep("D", forest_votes)))
    #print(length(grep("I", forest_votes)))
    # HARDCODED
    D_votes <- length(grep("D", forest_votes))
    I_votes <- length(grep("I", forest_votes))
    if (D_votes > I_votes) {
      forest_predictions[[k]] <- "D"
    } else {
      forest_predictions[[k]] <- "I"
    }
  }

  # back up the result since this took awhile to run
  file_path  <- str_c('results/rand_seed_',rand_seed,'_LOOCV_CERP_GUIDE_results_num_part_',
                      num_partition,
                      '.csv')
  write.csv(forest_predictions,
            file = file_path,
            row.names = FALSE)
}
