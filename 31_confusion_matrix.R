create_confusion_matrix <- function(forest_predictions, actual, num_partition) {
  pred <- factor(unlist(forest_predictions))
  levels(pred) <- c("D", "I") # HARDCODED
  file_path  <- str_c('results/CERP_GUIDE_confusion_matrix_num_part_',
                      num_partition,
                      '.txt')
  cm <- confusionMatrix(pred, actual)
  sink(file_path)
  print(cm)
  sinkall()

  return(cm$overall["Accuracy"])
}
