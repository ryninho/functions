#' Drop rows in dataframe with factor levels unaccounted for in a linear model.
#' 
#' @param newdata A data frame of new values to score with the linear model.
#' @param lm_object A linear model.
#' @return The data frame of new values stripped of rows with brand new factors.
#' @examples
#' drop_rows_with_new_levels(tail(OrchardSprays), 
#'                           lm(decrease ~ treatment, 
#'                              data = head(OrchardSprays)
#'                           )
#' )
drop_rows_with_new_levels <- function(newdata, lm_object) {
  df <- newdata
  factor_cols <- names(lm_object$xlevels)
  old_data <-
    for (x in factor_cols) {
      df <- df[df[,x] %in% lm_object$model[,x],]
    }
  return(df)
}
