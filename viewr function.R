viewr <- function(df, title = "viewr", cols = names(df)) {
  ## View a random sample of rows, in random order,
  ## for selected columns (by character name)
  ## Input 'df' is a data frame,
  ## input 'cols' is a chararacter vector
  ## Title is 2nd argument to match View format
  
  View(
    df[
      sample(1:nrow(df), min(1000,nrow(df))),
      cols],
    title
    )
  
}

# next step: add option to sort or not (e.g. by date)