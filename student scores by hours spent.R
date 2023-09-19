update.packages()
install.packages("dplyr")
install.packages("readr")
install.packages("tidyr")
install.packages("magrittr")
install.packages("ggplot2")
### Loading the packages
library(dplyr)
library(readr)
library(tidyr)
library(magrittr)
library(ggplot2)
### Uploading document
library(readr)
scores <- read_csv("scores.csv")

### Analysis
View(scores)
str(scores)
glimpse(scores)
head(scores)
summary(scores)

#Correlation between Hours and Scores of student 
 cor(scores$Hours,scores$Scores) #0.9761907 (Meaning, there is a positive correlation between both variables)
 
 # Using lm function to carry out regression or analysis of covariance
Hours.Scores.lm <- lm(Hours ~ Scores, data = scores)
summary(Hours.Scores.lm)

#--- From these results, we can say that there is a significant positive relationship 
# between Hours and Scores(p value < 2.2e-16 with a 0.097480-unit(+/-0.01)) increase in 
# Scores for every unit increase in hours spent.

scores %>% 
  ggplot(aes(x= Scores, y=Hours))+ geom_point(color = "blue") + geom_smooth()
# Presenting the data using rmarkdown
install.packages("rmarkdown")
library(rmarkdown)

