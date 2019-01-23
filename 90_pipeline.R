run_pipeline <- function(num_partition,
                         num_kfold,
                         data,
                         response,
                         rand_seed) {
  delete_generated_files()
  create_CERP_partition(num_partition, num_kfold, rand_seed)
  generate_guide_description_file(num_partition, num_kfold)
  create_CERP_GUIDE_forests(num_partition, num_kfold)
  cross_validate_CERP_GUIDE(num_partition, num_kfold, data)
  file_path  <- str_c('results/LOOCV_CERP_GUIDE_results_num_part_',
                      num_partition,
                      '.csv')
  forest_predictions <-
    read.table(file_path, sep = ",", header = TRUE)
  create_confusion_matrix(forest_predictions, response, num_partition)
}
