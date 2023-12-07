library(dplyr)
library(stringr)
data_cleaning_procedure <- function(linelist){
  # data_cleaning_procedure is defined for linelists from DHEC
  # written by Andrew Smith
  # 7Dec2023
  # parameters: linelist with columns "case_id","date_hospitalisation","gender","age","hospital"
  tmp <- filter(linelist, age > 50)
  tmp <- tmp[c("case_id","date_hospitalisation","gender","age","hospital")]
  tmp <- mutate(tmp,hospital = str_replace_all(hospital, " ",""))
  tmp <- mutate(tmp, hospital = tolower(hospital))
  tmp <- na.omit(tmp)
  return(tmp)
}