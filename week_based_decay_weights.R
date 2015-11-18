#' Generate a vector of weights exponentially decayed by weeks' relative age
#' 
#' Set decay_weight_param to 0 for no decay.
#' @param weeks A vector of dates each indicating the start of a week.
#' @param decay_weight_param A number.
#' @return A vector of exponentially-decayed weights between 0 and 1.
#' @examples
#' week_based_decay_weights(c("2015-11-02", "2015-11-09", "2015-11-16"), 0.0)
#' week_based_decay_weights(c("2015-11-02", "2015-11-09", "2015-11-16"), 0.1)
#' week_based_decay_weights(c("2015-11-02", "2015-11-09", "2015-11-16"), 1.0)
week_based_decay_weights <- function(weeks, decay_weight_param = 0) {
  lags <- as.numeric(difftime(weeks, max(weeks), units = "weeks"))
  wts <- exp(decay_weight_param * lags)
  return(wts)
}
