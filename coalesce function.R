# Returns the first non-null value from arguments given.
# Thanks to mrip on stackoverflow.  Copied from:
# http://stackoverflow.com/questions/19253820/how-to-implement-coalesce-efficiently-in-r

coalesce <- function(...) {
  Reduce(function(x,y) {
    i<-which(is.na(x))
    x[i]<-y[i]
    x},
    list(...))
}