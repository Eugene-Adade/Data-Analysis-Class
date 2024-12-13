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
