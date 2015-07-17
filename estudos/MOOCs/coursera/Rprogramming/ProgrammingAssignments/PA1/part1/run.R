setwd('~/repos/coursera-Rprogramming/ProgrammingAssignments/PA1/part1')
source('pollutantmean.R')

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "sulfate", 1)

# Submission on Coursera:
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
submit()
