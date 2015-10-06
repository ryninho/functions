# this is great for setting up a new server quickly for example

options(repos=structure(c(CRAN="http://cran.cnr.Berkeley.edu")))
# needed packages
for (pckg in c("forecast"
               , "sqldf"
               , "httr"
               , "RPostgreSQL"
               , "parallel"
               , "reshape"
               , "zoo"
               , "plyr"
               , "MASS"
               , "lme4"
               , "mvoutlier"
               , "lubridate"
               , "jsonlite"
               , "Hmisc"
               , "dplyr"
               , "rjson"
               , "pander"
               , "xtable"
               , "rredis"
               , "caroline"
               , "magrittr"
)
     ){
  if (!pckg %in% rownames(installed.packages())) {install.packages(pckg)}
}

#other packages
for (pckg in c("data.table"
               , "mgcv"
               , "reshape2"
               , "lattice"
               , "latticeExtra"
               , "gridExtra"
               , "fasttime"
               , "randomForest"
               , "sendmailR"
               , "ggplot2"
               , "scales"
               , "rPython"
               , "grid"
               , "Formula"
               , "splines"
               , "survival"
               , "glmnet"
)
     ){
  if (!pckg %in% rownames(installed.packages())) {install.packages(pckg)}
}
