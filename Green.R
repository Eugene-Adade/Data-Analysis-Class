#list inbuilt datasets 
data(iris)

#storing dataset in a variable
Data_Set <- iris

#check structure of dataset
str(Data_Set)

#check names of columns
colnames(Data_Set)

#mean of a particular column
mean(Data_Set$Sepal.Length)

#checking maximum number in a column
max(Data_Set$Sepal.Length)

#mean for dataset
colMeans(Data_Set)

#selecting rows and columns
Data_Set[,1:4]

#find mean of dataset
colMeans(Data_Set[,1:4])
mean(Data_Set)

#creating a new column
#creating a new column
Data_Set$size = ifelse(Data_Set$Sepal.Length > 5, 'Large', 'Small')
