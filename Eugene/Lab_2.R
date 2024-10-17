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

#inline files with meter header
read_csv('first meter line
         second meter line
         c1,c2,c3
         1,a,F
         2,b,F
         3,c,F', 
         show_col_types = T,
         col_names = F,
         skip = 3,
         comment = '#')

#import mpg_mini data
df <- read_csv(file = "./data/data/mpg_mini.csv")

getwd()          
setwd('//wsl.localhost/Ubuntu/home/codeeugene/data_analysis/Data-Analysis-Class')

#read text files
df2 <- read_delim(file = "./data/data/mpg.txt",
                  skip = 3,
                  col_names = T,
                  delim = " ",
                  skip_empty_rows = T)
?read_delim()

#load tidyverse
library(tidyverse)

#read text file chronic_kidney_disease_full
df3 <- read_delim(file = "./Eugene/chronic_kidney_disease_full.txt",
                  skip = 109,
                  col_names = T,
                  delim = ",")
getwd()

setwd(\\wsl.localhost/Ubuntu/home/codeeugene/data_analysis/Data-Analysis-Class/data/data)

#read text file chronic_kidney_disease_full
df3 <- read_delim(file = "./Eugene/chronic_kidney_disease_full.txt",
                  skip = 109,
                  col_names = T,
                  delim = ",")

#load tidyverse
library(tidyverse)

#read text file chronic_kidney_disease_full
df3 <- read_delim(file = "./chronic_kidney_disease_full.arff (1).txt",
                  skip = 109,
                  col_names = T,
                  delim = ",")
getwd()

setwd()

#load tidyverse library
library(tidyverse)

#import dataset chronic_kidney_disease_full.arff
df3 <- read_delim(file = "./chronic_kidney_disease_full.arff.txt",
                  col_names = F, 
                  skip = 145,
                  delim = ",")
#import dataset chronic_kidney_disease_full.arff
df3 <- read_delim(file = "./chronic_kidney_disease_full.arff (1).txt",
                  col_names = F, 
                  skip = 145,
                  delim = ",")
df4 <- read_csv(file = "./chronic_kidney_disease_full.arff (1).txt",
                  col_names = F, 
                  skip = 145)

#correct way to import chronic_kidney_disease_data_full.arff (1)
main_data <- read_delim(file = "./chronic_kidney_disease_full.arff (1).txt",
                        col_names = F,
                        delim = ",",
                        na = c("?","NA"),
                        skip = 145)

#renaming columns 
colnames(main_data) <- c("age", "blood pressure", "spesific gravity", "albumin",
                         "sugar", "red blood cells", "pus cell", "pus cell clumps",
                         "bacteria", "blood glucose random", "blood urea", "serum creatine",
                         "sodium", "potassium", "hemoglobin", "pack cell volume", "white blood cell count",
                         "red blood cell count", "hypertension", "diabetes melitus", "coronary artery disease",
                         "appetite", "pedal edema", "anemia", "class")

#creating a copy of the main dataset
df1 <- main_data

#clean variable names
library(janitor)
clean_names(main_data)
main_data <-  main_data %>% clean_names()
colnames(main_data)
colnames(df1)

#selecting variables
main_data %>% select(age, blood_pressure)
df1 %>% select(age, `blood pressure`)

#display unique values in categorical columns
cat_col <- names(main_data)[sapply(main_data, function(x) is.character(x))]

for (col in cat_col) {
  cat(paste(col, "has", unique(main_data[col]), "values\n"))
}

num <- 1:5
for (x in num) {
  print(x)
}

#correct values in the diabetes column
main_data <- main_data %>% mutate(
  new_diabetes_mellitus = case_when(
    diabetes_melitus == " yes" ~ "yes",
    diabetes_melitus == "\tno" ~ "no",
    diabetes_melitus == "\tyes" ~ "yes",
    diabetes_melitus == "" ~ NA,
    .default = diabetes_melitus
))
library(tidyverse)
x <- select(main_data, diabetes_melitus, new_diabetes_mellitus)
filter(x, diabetes_melitus %in% c(" yes", "\tno", "\tyes", ""))
main_data %>% select(diabetes_melitus, new_diabetes_mellitus) %>% 
  filter(diabetes_melitus %in% c(" yes", "\tno", "\tyes", ""))


#Assignment 2
#load library tidyverse
library(tidyverse)

#list all unique values of the variable columns
cat_col <- names(main_data)[sapply(main_data, function(x) is.character(x))]
for (col in cat_col) {
  cat(paste(col, "has", unique(main_data[col]), "values\n"))
}

#correcting values in pack_cell_volume
main_data <- main_data %>% mutate(
  new_pack_cell_volume = case_when(
    pack_cell_volume == "\t?" ~ "NA",
    pack_cell_volume == "\t43" ~ "43",
    .default = pack_cell_volume
  )
                                  )
#select and filter pack_cell_volume and new_pack_cell_volume
main_data %>% select(pack_cell_volume, new_pack_cell_volume) %>% 
  filter(pack_cell_volume %in% c("\t?", "\t43"))

#correcting values in white_blood_cell_count
main_data <- main_data %>% mutate(
  new_white_blood_cell_count = case_when(
    white_blood_cell_count == "\t6200" ~ "6200",
    white_blood_cell_count == "\t8400" ~ "8400",
    white_blood_cell_count == "\t?" ~ "NA",
    .default = white_blood_cell_count
  )
)
#selecting and filtering white_blood_cell count and new_white_blood_cell_count
main_data %>% select(white_blood_cell_count, new_white_blood_cell_count) %>% 
  filter(white_blood_cell_count %in% c("\t6200", "\t8400", "\t?"))

#correcting values in red_blood_cell_count
main_data <- main_data %>% mutate(
  new_red_blood_cell_count = case_when(
    red_blood_cell_count == "\t?" ~ "NA",
    .default = red_blood_cell_count
  )
)

#selecting and filtering red_blood_cell_count and new_red_blood_cell_count
main_data %>% select(red_blood_cell_count, new_red_blood_cell_count) %>% 
  filter(red_blood_cell_count %in% c("\t?"))

#correcting values in coronary_artery_disease
main_data <- main_data %>% mutate(
  new_coronary_artery_disease = case_when(
    coronary_artery_disease == "\tno" ~ "no",
    .default = coronary_artery_disease
  )
)

#selecting and filtering coronary_artery_disease and new_coronary_artery_disease
main_data %>% select(coronary_artery_disease, new_coronary_artery_disease) %>% 
  filter(coronary_artery_disease %in% c("\tno"))

#correcting values in appetite
main_data <- main_data %>% mutate(
  new_appetite = case_when(
    appetite == "no" ~ "NA",
    .default = appetite
  )
)

#selecting and filtering appetite and new_appetite
main_data %>% select(appetite, new_appetite) %>% 
  filter(appetite %in% c("no"))

#correcting values in pedal_edema
main_data <- main_data %>% mutate(
  new_pedal_edema = case_when(
    pedal_edema == "good" ~ "NA",
    .default = pedal_edema
  )
)

#selecting and filtering pedal_edema
main_data %>% select(pedal_edema, new_pedal_edema) %>% 
  filter(pedal_edema %in% c("good"))

#correcting values in class
main_data <- main_data %>% mutate(
  new_class = case_when(
    class == "ckd\t" ~ "ckd",
    class == "ckd," ~ "ckd",
    class == "no,notckd" ~ "notckd",
    .default = class
  )
)

#selecting and filtering class
main_data %>% select(class, new_class) %>% 
  filter(class %in% c("ckd\t", "ckd,", "no,notckd"))

#end of Assignment 2

