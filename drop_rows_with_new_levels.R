drop_rows_with_new_levels <- function(lm_object, newdata) {
  df <- newdata
  factor_cols <- names(lm_object$xlevels)
  old_data <- 
    for (x in factor_cols) {
      df <- df[df[,x] %in% lm1$model[,x],]
    }
  return(df)
}
