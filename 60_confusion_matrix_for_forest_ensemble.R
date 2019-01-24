create_confusion_matrix_forest_ensemble <-
  function(predictions,
           actual,
           num_partition,
           file_name = '') {
    pred <- factor(unlist(predictions))
    levels(pred) <- levels(actual)
    file_path  <-
      str_c('results/',
            file_name,
            '_num_part_',
            num_partition,
            '.txt')
    cm <- confusionMatrix(pred, actual)
    sink(file_path)
      print(cm)
    sinkall()

    return(cm$overall["Accuracy"])
  }
