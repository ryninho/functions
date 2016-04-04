# want function that takes data in long format with values and sums over two factor variables
marimekko <- function(df, width_var, fill_var, fill_cols = NA) {
  
}

library(reshape) # TODO: replace with tidyr
library(plyr) # TODO: replace with dplyr
library(ggplot2)

df <- data.frame(segment = c("A", "B", "C",
                             "D"), segpct = c(40, 30, 20, 10), Alpha = c(60,
                                                                         40, 30, 25), Beta = c(25, 30, 30, 25),
                 Gamma = c(10, 20, 20, 25), Delta = c(5,
                                                      10, 20, 25))

## Calculate cumulative width on x-axes, starting point of each column and erase segpct variable.

df$xmax <- cumsum(df$segpct)
df$xmin <- df$xmax - df$segpct
df$segpct <- NULL
## Data looks like this before the long-format conversion:

dfm <- melt(df, id = c("segment", "xmin", "xmax"))
## Now we need to determine how the columns are stacked and where to position the text labels.

## Calculate ymin and ymax:
  
dfm1_new <- dfm %>% 
  group_by(segment) %>%
  mutate(ymax = cumsum(value),
         ymin = ymax - value
         ) %>% arrange(segment, -value, variable)

  dfm1 <- ddply(dfm, .(segment), transform, ymax = cumsum(value))
dfm1 <- ddply(dfm1, .(segment), transform,
              ymin = ymax - value)
## Positioning of text:
   
  dfm1$xtext <- with(dfm1, xmin + (xmax - xmin)/2)
dfm1$ytext <- with(dfm1, ymin + (ymax - ymin)/2)
## Finally, we are ready to start the plotting process:
  
  p <- ggplot(dfm1, aes(ymin = ymin, ymax = ymax,
                        xmin = xmin, xmax = xmax, fill = variable))
  ## Use grey border to distinguish between the segments:
  
  p1 <- p + geom_rect(colour = I("grey"))
  ## The explanation of different fill colours will be included in the text label of Segment A using the ifelse function.

p2 <- p1 + geom_text(aes(x = xtext, y = ytext,
                         label = ifelse(segment == "A", paste(variable,
                                                              " - ", value, "%", sep = ""), paste(value,
                                                                                                  "%", sep = ""))), size = 3.5)
## The maximum y-axes value is 100 (as in 100%), and to add the segment description above each column I manually specify the text position.

p3 <- p2 + geom_text(aes(x = xtext, y = 103,
                         label = paste("Seg ", segment)), size = 4)
## Some last-minute changes to the default formatting: remove axis labels, legend and gridlines.

p3 + theme_bw() + labs(x = NULL, y = NULL,
                       fill = NULL) 
#+ opts(legend.position = "none",
#                                             panel.grid.major = theme_line(colour = NA),
#                                             panel.grid.minor = theme_line(colour = NA))
## Or, if the default palette is not to one’s liking it is very easy to use a ColorBrewer palette instead:
  
  last_plot() + scale_fill_brewer(palette = "Set2")
  
  ####
  
  # 
  # ggMMplot <- function(var1, var2){
  #   require(ggplot2)
  #   levVar1 <- length(levels(var1))
  #   levVar2 <- length(levels(var2))
  #   
  #   jointTable <- prop.table(table(var1, var2))
  #   plotData <- as.data.frame(jointTable)
  #   plotData$marginVar1 <- prop.table(table(var1))
  #   plotData$var2Height <- plotData$Freq / plotData$marginVar1
  #   plotData$var1Center <- c(0, cumsum(plotData$marginVar1)[1:levVar1 -1]) +
  #     plotData$marginVar1 / 2
  #   
  #   ggplot(plotData, aes(var1Center, var2Height)) +
  #     geom_bar(stat = "identity", aes(width = marginVar1, fill = var2), col = "Black") +
  #     geom_text(aes(label = as.character(var1), x = var1Center, y = 1.05)) 
  # }
  # 
  # 
  # ggMMplot(diamonds$cut, diamonds$clarity)
  # 

  