ensemble_forest_majority_votes <-
  function(part_num, rand_seeds) {
    forest_ensemble_result <- NULL
    # TODO parallelize this
    for (seed in rand_seeds) {
      file_path  <-
        str_c(
          'results/rand_seed_',
          seed,
          '_LOOCV_CERP_GUIDE_results_num_part_',
          part_num,
          '.csv'
        )
      if (is.null(forest_ensemble_result)) {
        forest_ensemble_result <- t(read_csv(file_path))
      } else {
        forest_ensemble_result <-
          cbind(t(read_csv(file_path)), forest_ensemble_result)
      }
    }
    majority_votes <- c()
    i <- 1
    for (row_num in 1:nrow(forest_ensemble_result)) {
      cur_row <- forest_ensemble_result[row_num, ]
      majority_votes[i] <-
        names(sort(table(cur_row), decreasing = TRUE)[1])
      i <- i + 1
    }
    file_path  <-
      str_c('results/ensemble_forests_results_num_part_',
            part_num,
            '.csv')
    write.csv(majority_votes,
              file = file_path,
              row.names = FALSE)
  }
