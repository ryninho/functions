# Detrend a vector (converts to/from time series)

detrend_vec <- function(vec, frequency = 7) {
  series <- ts(vec, frequency = frequency)
  trend = stl(series, s.window = "periodic")$time.series[,2]
  detrend_ts = series - (trend - trend[1])
  return(as.numeric(detrend_ts))
}
