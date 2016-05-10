#' Save your workspace to an S3 bucket.
#' 
#' @param prefix A string with which to begin the name of the workspace file.
#' @param bucket_name A string naming the S3 bucket.
#' @param save_from_local A boolean. Overrides the default behavior, which is 
#' to save only from a Linux server.
#' @return Nothing is returned.
#' @example workspace_to_s3("test-workspace", "my-workspace-logs")

workspace_to_s3 <- function(prefix, bucket_name, save_from_local = FALSE) {
  library(aws.s3)
  library(magrittr)

  aws_key <- Sys.getenv("WORKSPACE_AWS_ACCESS_KEY_ID")
  aws_secret <- Sys.getenv("WORKSPACE_AWS_SECRET_ACCESS_KEY")
  
  if(c(aws_key, aws_secret) %>% equals("") %>% any) {
    stop("Missing AWS access key or secret")
  }
  
  if(Sys.info()[1] == "Linux" | save_from_local) {

    Sys.setenv("AWS_ACCESS_KEY_ID" = aws_key,
      "AWS_SECRET_ACCESS_KEY" = aws_secret
    )

    log_timestamp <- Sys.time() %>%
      as.character() %>% gsub(':','.',.) %>% gsub(' ','_',.)
    workspace_name <- paste0(prefix, '_', log_timestamp, '.RData')

    s3save(list = ls(all.names = TRUE, pos = 1L),
           bucket = bucket_name,
           object = workspace_name
    )
  }
}
