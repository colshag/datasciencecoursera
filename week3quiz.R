library(dplyr)

# Week 3 Quiz

# There will be an object called 'iris' in your workspace. 
# In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 
# Please round your answer to the nearest whole number.

library(datasets)
data(iris)

virginica <- filter(iris, Species == "virginica")
round(mean(virginica$Sepal.Length))


#Continuing with the 'iris' dataset from the previous 
#Question, what R code returns a vector of the means of 
#the variables 
#'Sepal.Length', 'Sepal.Width', 'Petal.Length', 
#and 'Petal.Width'?
apply(iris[,1:4],2,mean)


#Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)

#How can one calculate the average miles per gallon (mpg) 
#by number of cylinders in the car (cyl)? Select all that 
#apply.


