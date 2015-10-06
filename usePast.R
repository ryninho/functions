usePast <- function(query, past_date) {
## this is useful for running a SQL query as if it were a previous date ##
## ... works well if you have a script that takes a date as a           ##
## command line input and runs SQL queries as part of the process       ##
  gsub("current_date", paste0("DATE '", past_date, "'"), query)
}
