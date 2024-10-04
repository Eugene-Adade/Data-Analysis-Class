#check our current working directory
getwd()

#set the working directory to different folder
setwd('//wsl.localhost/Ubuntu/home/codeeugene/data_analysis/Data-Analysis-Class')

#find out inbuilt dataset
data()

#store dataset in a variable
iris
data_set = iris
data_set <- iris

#remove variable from environment section
rm(data_set)

#check structure of dataset
str(data_set)

#check the names of the columns 
colnames(data_set)

#mean of a column
data_set$Sepal.Length
mean(data_set$Sepal.Length)

#find minimum number
min(data_set$Sepal.Length)

#find maximum number
max(data_set$Sepal.Length)

#find mean for dataset
colMeans(data_set)
data_set[,1:4]
data_set[,c('Sepal.Length','Sepal.Width','Petal.Width')]
 
#store dataset in a variable
data_set1 <- data_set[,c('Sepal.Length','Sepal.Width','Petal.Width')]

colMeans(data_set1)

#creating a new column
data_set$size = ifelse(data_set$Sepal.Length > 5, 'large', 'small')
