
week_based_decay_weights <- function(dates, decay_weight_param) {
  lags <- as.numeric(difftime(dates, max(dates), units = "weeks"))
  wts <- exp(decay_weight_param * lags)
  return(wts)
}
