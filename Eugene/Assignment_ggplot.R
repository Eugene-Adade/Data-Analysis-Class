#loading libraries
library(tidyverse)


#inbuilt dataset iris
iris

#selecting column sepal.length
iris$Sepal.Length

#plotting the distribution of sepal.length
iris %>% ggplot(aes(x = Sepal.Length))+
  geom_histogram(color = "black",
                 fill = "red") +
  labs(title = "Distribution of sepal.length")
