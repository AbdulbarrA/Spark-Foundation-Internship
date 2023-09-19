# Importing dataset
iris <- read_csv("iris.csv")
View(iris)
# Exploring dataset
str(iris)
head(iris)
glimpse(iris)

# Analysis
iris %>% 
  count(Species)  
#--- There are 3 species of iris  represented in the data set
-Iris-setosa        
- Iris-versicolor    
- Iris-virginica 

#Statistical analysis
summary(iris)

## Finding out the correlation between variables such as the 
## length of sepal determine the petal length.
(1)iris %>%
  ggplot(aes(x= SepalLengthCm, y= PetalLengthCm, color = Species))+ geom_point() +geom_smooth()
 
(2)iris %>%
  ggplot(aes(x= SepalLengthCm, y= PetalWidthCm, color = Species))+ geom_point() +geom_smooth()

(3) iris %>% 
   ggplot(aes(x= SepalLengthCm, y= SepalWidthCm))+ geom_point() +geom_smooth()

(4) iris %>% 
  ggplot(aes(x= PetalLengthCm, y= PetalWidthCm,color = Species))+ geom_point() +geom_smooth()

# Linear regression between variables
(1) SepalLengthCm.PetalLengthCm.lm <- lm(SepalLengthCm ~ PetalLengthCm, data= iris)
summary(SepalLengthCm.PetalLengthCm.lm)

(2)SepalLengthCm.PetalWidthCm.lm <- lm(SepalLengthCm ~ PetalWidthCm, data= iris)
summary(SepalLengthCm.PetalWidthCm.lm)

(3)SepalLengthCm.SepalWidthCm.lm <- lm(SepalLengthCm ~ SepalWidthCm, data= iris)
summary(SepalLengthCm.SepalWidthCm.lm)

(4)PetalLengthCm.PetalWidthCm.lm <- lm(PetalLengthCm ~ PetalWidthCm, data= iris)
summary(PetalLengthCm.PetalWidthCm.lm)
