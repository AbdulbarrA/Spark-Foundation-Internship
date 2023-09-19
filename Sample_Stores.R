## Loading data
library(readr)
install.packages("tidyverse")
library(tidyverse)
samples_stores_ <- read_csv("samples stores ..csv")
head(samples_stores_)
str(samples_stores_)
head(stores$Sub.Category)

# Analysis
head(stores)
summary(samples_stores_)
  ?aggregate
  stores <- data.frame(samples_stores_)
  aggregate(Profit~Sub.Category, data = stores, sum) %>% 
    arrange()
 aggregate(Profit~Category,date = stores, sum)
    
 stores %>% 
   drop_na() %>% 
   group_by(Sub.Category) %>% 
   summarise(Total_Profit = sum(Profit),
             Total_Discount = sum(Discount))  
 # Relationship analysis
 #Indicating whether profit is incresed due to the amont of
 #discount given to a particular product
  Profit.Discount.lm <- lm(Profit~Discount, data= stores) 
summary( Profit.Discount.lm)
cor(x= stores$Sales, y=stores$Profit)

stores %>% 
ggplot(aes(x = Discount, y= Profit)) + geom_point()
###From the visualization, it is presumably that the lower the discount the higher the profit earned.

#From the visualization above it is concluded that discounts above 0.3 indicates lower profit gained
stores %>% 
  drop_na() %>% 
  filter(Discount > 0.3) %>% 
  group_by(Sub.Category) %>% 
  summarise(Total_Profit = sum(Profit),
            Total_Discount = sum(Discount))