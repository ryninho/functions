sql <- function(sql){
  # Assumes db connection script is in the same directory

  source("dbconnection.R")
  options(show.error.messages = FALSE)
  if (class(try(readChar(sql, file.info(sql)$size)))!="try-error") sql = readChar(sql, file.info(sql)$size)
  options(show.error.messages = TRUE)
  result <- dbGetQuery2(con,sql)
  dbDisconnect(con)
  detach("package:RPostgreSQL", unload=TRUE)
  return(result)
}
