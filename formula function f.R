# When you are working with several datasets and/or with many predictor variables
# you may want to assess the marginal value of groups or subgroups of these predictors.
# Using this formula function esp. along with names() can aid fast typing and easy reading


f <- function(y, x) {
  ## this function takes a character y and character vector of x's
  ## and produces a formula "y ~ x" for use in modeling functions
  as.formula(
    paste(
      y,
      " ~",
      paste(x,collapse = " + "))
  )
}