#' Calculate the Bhattacharyya distance given the Bhattacharyya coefficient.
#' 
#' https://en.wikipedia.org/wiki/Bhattacharyya_distance
#' @param bc A Bhattacharyya coefficient.
#' @return The Bhattacharyya distance associated with \code{bc}.
#' @examples
#' bd(0.912)
#' bd(0.78)
bd <- function(bc) {
  return(-log(bc))
}
