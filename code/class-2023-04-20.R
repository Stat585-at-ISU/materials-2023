url <- "https://bit.ly/stat585-passwords"
passwords <- readLines(url)
length(passwords)

library(tidyverse)
library(stringr)

str_detect(passwords, "password") %>% sum()

passwords[str_detect(passwords, "password")]
str_subset(passwords, "password")

######## Your turn
# How many of the passwords have at least one space?

str_detect(passwords, " ") %>% sum()
str_subset(passwords, " ")

# What is the most common character in a password?
nchar(passwords[1:5])

chars <- passwords %>% str_split(pattern="") %>% unlist()
sort(table(chars), decreasing=TRUE)[1:10]
dt <- sort(table(chars), decreasing=TRUE)

which(names(dt)=="_")
which(names(dt)==".")
# What proportion of the passwords have ., ?, and ! characters?
# Hint: Use "\\" before the character to escape "special" characters - we'll talk about those next.

str_detect(passwords, ".") %>% sum()
str_detect(passwords, "?") %>% sum()
str_detect(passwords, "!") %>% sum()

str_detect(passwords, "\\.") %>% sum()
str_detect(passwords, "\\?") %>% sum()

str_detect(passwords, " ") %>% sum()

str_detect(passwords, "\\s") %>% sum()


url <- "https://en.wikipedia.org/wiki/Emu_War"
page_html <- readLines(url)

# img src=\"/static/images/footer/wikimedia-button.png\"
page_html %>% str_extract_all("img src=\\S*\\s") %>%
  str_remove("img src=\\\"") %>%
  str_remove("\\\" $")

page_html %>% str_extract("img src=\\\"(\\S*)\\\"\\s", group=1) # use group to extract?
