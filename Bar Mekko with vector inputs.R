## This script implements a bar mekko (variable width column chart) as per
## http://learnr.wordpress.com/2009/03/29/ggplot2-variable-width-column-chart/
##
## I will make updates to this eventually to improve the labels and colors!

library(ggplot2)

# Bar Mekko function with vector inputs

bm <- function(labels, width, height) {
  # This function creates a bar mekko with the specified
  # labels, width and height (vectors of equal length)
    
  df <- data.frame(
    x = labels,
    width = width,
    height = height
  )
  
  
  # Calculate some additional variables to make plotting easier, and to center the text labels.
  
  df$w <- cumsum(df$width)
  df$wm <- df$w - df$width
  df$wt <- with(df, wm + (w - wm)/2)

  # Plotting
  
  p <- ggplot(df, aes(ymin = 0))
  p1 <- p + geom_rect(aes(xmin = wm, xmax = w,ymax = height, fill = x))
  
  # Add text labels
  
  p2 <- p1 + geom_text(aes(x = wt, y = height * 0.5, label = x))
  
  # Final formatting: apply theme + remove legend, and axis labels:
  
  # [ER note: replaced 'opts' with 'theme' as per deprecation notice]
  p2 + theme_bw() + theme(legend.position = "none") + labs(x = NULL, y = NULL)
  
}


# test values
# x <- c("Alpha", "Beta", "Gamma","Delta")
# w <- c(25, 50, 75, 100)
# h <- c(100,75, 50, 25)
# 
# bm(x, w, h)
