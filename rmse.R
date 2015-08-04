rmse <- function(pred, actual, na.rm = TRUE, digits = 1) {
  ## Root mean squared prediction error.
  ## Pred and actual are numeric vectors.

  round(
    sqrt(mean((pred - actual)^2, na.rm = na.rm)),
    digits = digits
  )

}
