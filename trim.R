trim <- function(vector, fraction = .1) {
  ## this function removes the extreme values from a vector.  very useful for histograms and scatterplots

  if (FALSE %in% complete.cases(vector)) {print("Careful!  There are NAs; using 'na.rm = TRUE' to calculate quantile thresholds")}

  extremes <- quantile(vector, c(fraction/2, 1 - fraction/2), na.rm = TRUE)

  return(vector[vector >= extremes[1] & vector <= extremes[2]])
}
