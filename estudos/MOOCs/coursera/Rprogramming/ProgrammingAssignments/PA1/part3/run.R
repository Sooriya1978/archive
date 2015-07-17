setwd("~/repos/coursera-Rprogramming/ProgrammingAssignments/PA1/part3/")
source('corr.R')

# test 1
cr <- corr("specdata", 150)
head(cr)
summary(cr)

# test 2
cr <- corr("specdata", 400)
head(cr)

# test 3
cr <- corr("specdata", 5000)
cr
summary(cr)

# Submit to Coursera
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
submit()
#submit(manual=TRUE)
