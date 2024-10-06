#load library
library(tidyverse)

#read inline csv files
read_csv('c1,c2,c3
         1,a,T
         2,b,T
         3,c,F',
         show_col_types = F,
         col_names = F)

#inline files with meter header
read_csv('first meter line
         second meter line
         c1,c2,c3
         1,a,T
         2,b,T
         3,c,F', 
         show_col_types = F,
         col_names = T,
          skip = 2,
          comment = '#')
          