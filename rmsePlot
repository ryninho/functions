rmsePlot <- function(train_pred, train_actual, test_pred, test_actual, ...) {
  ## Creates overlaid plots of prediction accuracy for test and training sets.
  ## Inputs are vectors of test/training set predictions and observed values.
  ## "..." passes arguments to plot() e.g. main = "<title>".

  plot(x = train_pred,
       y = train_actual,
       col = "blue",
       cex = 0.5,
       ylab = "Actual",
       xlab = "Predicted",
       ...
  )
  points(x = test_pred,
         y = test_actual,
         col = "red",
         cex = 0.5
  )

  # plot ranges for placement of text annotation
  pred_range <- range(test_pred, train_pred)
  actual_range <- range(test_actual, train_actual)

  text(x = pred_range[1],
       y = actual_range[2],
       labels = paste0("RMSE (train): ", rmse(train_pred, train_actual)),
       col = "blue",
       adj = c(0,2)
  )

  text(x = pred_range[1],
       y = actual_range[2],
       labels = paste0("RMSE (test):  ", rmse(test_pred, test_actual)),
       col = "red",
       adj = c(0,0.5)
  )

}
