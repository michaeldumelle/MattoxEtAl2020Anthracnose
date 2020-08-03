#loading the required packages
library(tidyverse)
library(car)
#reading in the anthracnose data
ant <- read.csv("C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/6_6_meeting_materials/ant.csv")
#subsetting by 2015, the year we are going to do the power transformation
ant_15 <- ant %>% filter(year == 1)
#doing a yeo johnson transformation

#looking at large range of  powers
yeo <- boxCox(ant_15$audpc ~ 1, family="yjPower", lambda = seq(-10, 10, .01), plotit = TRUE, interp = T)
data.frame(lambda = yeo$x, loglik = yeo$y) %>% arrange(desc(loglik))
#zooming in
yeo2 <- boxCox(ant_15$audpc ~ 1, family="yjPower", lambda = seq(-2, 2, .01), plotit = TRUE, interp = T)
data.frame(lambda = yeo2$x, loglik = yeo2$y) %>% arrange(desc(loglik))
#zooming in - such little difference between any  of the values here that we can pick any
#choose cube root because it is easy to understand and interpret
yeo3 <- boxCox(ant_15$audpc ~ 1, family="yjPower", lambda = seq(0.3, 0.45, .01), plotit = TRUE, interp = T)
data.frame(lambda = yeo3$x, loglik = yeo3$y) %>% arrange(desc(loglik))



peak_2015 <- ant <- read.csv("C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/peak_disease_2015.csv")
yeo <- boxCox(peak_2015$Peak ~ 1, family="yjPower", lambda = seq(-3, 3, .01), plotit = TRUE, interp = T)

