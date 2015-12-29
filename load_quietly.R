#' Load packages quietly.
#' 
#' Loads packages without the startup messages.
#' 
#' @param package_list A character vector of package names.
load_quietly <- function(package_list) {
  for (pkg in package_list) {
    suppressPackageStartupMessages(library(pkg,character.only=TRUE))
  }
}
