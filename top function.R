top <- function(v, n = length(unique(v)), desc = TRUE) {
  ## v is a vector; top(v) returns the frequency in %s
  ## n number of results to show, from the beginning,
  ## so use desc = FALSE to see the least common values
  
  # store all results
  result <- sort(
    round(
      table(as.vector(v), useNA = "ifany")/length(v),
      2), 
    decreasing = desc)
  
  # display only the number requested
  display <- result[1:min(length(unique(v)),n)]
  
  
  print(display)  
}

# older version:
#
# top <- function(v) {
#   ## v is a vector; top(v) returns the frequency in %s
#   
#   sort(round(table(as.vector(v), useNA = "ifany")/length(v),2))
#   
# }