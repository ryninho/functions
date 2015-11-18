#' Calculate the Bhattacharyya coefficient of a pair of discrete distributions.
#' 
#' https://en.wikipedia.org/wiki/Bhattacharyya_distance
#' @param p,q Vectors of probabilities.
#' @return The Bhattacharyya coefficient of \code{p} and \code{q}.
#' @examples
#' bc(c(.5, .25, .25), c(1, 0, 0))
#' bc(c(.2, .6, .2), c(.4, .2, .4))
bc <- function(p, q) {
  p[is.na(p)] <- 0
  q[is.na(q)] <- 0
  
  return(sum(sqrt(p*q)))
}
