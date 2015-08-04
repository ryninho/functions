rotate <- function(v, n) {
  # v is the vector; n is the number of rotations
  l <- length(v)
  n <- n %% l # eliminates superfluous rotations
  if(n == 0)
    return(v)
  tmp <- v[(l - n + 1):l]  # save what will become the end
  v[(n + 1):l] <- v[1:(l - n)]  # save the beginning as the end
  v[1:n] <- tmp # now the end is used as the beginning
  v
}
