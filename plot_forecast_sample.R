#' Plot actual vs forecasted demand by day and warehouse.
#' 
#' @param df_sample A data frame, preferably filtered by zone and warehouses.
#' @param df_sample_title A string appropriate for the title of the graph.
#' @return A ggplot2 object.
plot_forecast_sample <- function(df_sample, df_sample_title) {
  p <- ggplot(data = df_sample)
  p <- p + aes(x = hour_of_day, y = demand, group = NA)
  p <- p + geom_line()
  p <- p + geom_line(aes(x = hour_of_day, y = forecast, color = "red"))
  p <- p + facet_grid(date ~ warehouse)
  p <- p + ggtitle(df_sample_title)
  p <- p + theme(plot.title = element_text(lineheight=.8, face="bold"))
  p + theme(legend.position = "none")
  
}
