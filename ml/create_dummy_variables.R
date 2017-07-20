create_dummies <- function(df, dummy_col, drop_original=FALSE){
  
  require(caret)
  require(stringr)
  require(tidyverse)
  
  df <- as.tibble(df)
  fx <- str_c('~ ', dummy_col)
  
  dummy <- dummyVars(fx, data=df, fullRank = FALSE)
  dummy <- as.tibble(predict(dummy, newdata = df))
  
  df <- bind_cols(df, dummy)
  
  if (drop_original == TRUE){
    df[[dummy_col]] <- NULL
  }
  
  df <- as.tibble(df)
  
  return(df)
  
}