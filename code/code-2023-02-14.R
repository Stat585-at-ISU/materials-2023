#
library(repurrrsive)
# install.packages("repurrrsive")
got_chars

is.list(got_chars)
as.data.frame(got_chars)
length(got_chars)

length(got_chars[[1]])
length(got_chars[[2]])
length(got_chars[[30]])

library(purrr)
# base R:  lapply
lapply(got_chars, FUN = function(x) { length(x)})
lapply(got_chars, FUN = length)
purrr::map(got_chars, .f = length)

sapply(got_chars, FUN = length)

purrr::map_int(got_chars, .f = length)

######
# dataframe: name & alive (or died)

dframe <- purrr::map_df(got_chars, .f = function(x) {
  data.frame(name= x$name, alive=x$alive, died =x$died)
})

names <- purrr::map_chr(got_chars, .f = function(x) x$name)
died <- purrr::map_chr(got_chars, .f = function(x) x$died)
data.frame(names, died) %>% View()

