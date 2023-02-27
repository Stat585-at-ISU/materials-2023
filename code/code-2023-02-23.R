# code in class Feb 23 2023

short_code <- "PTOW"
call_code <- "PTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW"
call_code_2 <- "PTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOWx\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW\rPTOW"
# equivalent
str_split(call_code, pattern="\r")[[1]][1]
unlist(str_split(call_code, pattern="\r"))[1]

# or
res <- unique(str_split(call_code_2, pattern="\r")[[1]])
length(res) == 1 # TRUE or FALSE



clean_duplicates <- function(x) {
  result <- str_split(x, pattern="\r")[[1]]
  # count, how often the first string is repeated
  times <- length(result)
  # get just unique values in x
  result <- unique(result)

  if (length(result) != 1) {
    warning(paste("Not all elements are equal:", paste(result, collapse = ", ")))
    result <- result[1]
  }
    
  attr(result, "times") <- times
  return(result)
}

clean_duplicates(short_code) # should return "PTOW", times: 1
clean_duplicates(call_code) # should return "PTOW", times: 24
clean_duplicates(call_code_2) # should return "PTOW" with a warning, times 24

