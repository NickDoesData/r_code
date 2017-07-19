convert_numeric_date <- function(x){
  
  x <- as.Date(as.character(x),"%Y%m%d")
  return(x)
  
}