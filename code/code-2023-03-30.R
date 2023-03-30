library(rvest)
library(readr)
url <- "https://www.nytimes.com/elections/2016/results/iowa"
html <- read_html(url)
html

tables <- html_table(html)
county_results <- tables[[2]]

# as.numeric(county_results$Clinton) # tons of NA
parse_number(county_results$Clinton)
