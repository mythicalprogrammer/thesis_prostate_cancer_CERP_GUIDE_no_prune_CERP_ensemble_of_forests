create_confusion_matrix <- function(forest_predictions, actual, num_partition) {
  pred <- factor(unlist(forest_predictions))
  levels(pred) <- c("D", "I") # HARDCODED
  #actual <- factor(prostate_data$state)
  levels(actual)
  file_path  <- str_c('results/CERP_GUIDE_confusion_matrix_num_part_',
                      num_partition,
                      '.txt')
  sink(file_path)
  print(confusionMatrix(pred, actual))
  sinkall()
}
