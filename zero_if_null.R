# zero_if_null(c(0, NA))
# zero_if_null(c(0, 1))
zero_if_null <- function(v) {
  ifelse(is.na(v), 
         0, 
         v
  )
}
