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