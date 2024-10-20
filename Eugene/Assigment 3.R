#list all unique values of the numeric variable columns
cat_col <- names(main_data)[sapply(main_data, function(x) is.numeric(x))]
for (col in cat_col) {
  cat(paste(col, "has", unique(main_data[col]), "values\n"))
}
