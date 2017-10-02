#' Detrend a vector (esp. of demand)
#' 
#' @param vec A numeric vector
#' @param freq The seasonal period of the vector (used to construct time series)
#' @return A numeric vector with the seasonality preserved but trend flattened
detrend_vec <- function(vec, freq = 7) {
  series <- ts(vec, frequency = freq)
  trend = stl(series, s.window = "periodic")$time.series[,2]
  detrend_ts = series - (trend - trend[1])
  return(as.numeric(detrend_ts))
}

detrend_demand <- function(df) {
  df$demand_flat <- detrend_vec(df$demand)
  return(df)
}

# Example useage:
# hw_fcst %>% arrange(zone_id, date) %>% group_by(zone_id) %>% do(detrend_demand(.))
