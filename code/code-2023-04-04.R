library(tidyverse)
library(rvest)
# multiple pieces in a state are connected with a hyphen: e.g. new-jersey
state <- "minnesota"
url <- sprintf("https://www.nytimes.com/elections/2016/results/%s",state)
html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)
tables %>% purrr::map(glimpse)

state_results <- tables[[2]] %>% mutate(
  Trump  = parse_number(Trump),
  Clinton = parse_number(Clinton)
)
state_results

state_results <- state_results %>% mutate(
  perc_dem <- Clinton/(Trump+Clinton)*100,
  perc_rep <- Trump/(Trump+Clinton)*100
)



url <- "https://www.nytimes.com/interactive/2020/11/03/us/elections/results-iowa.html"

html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)
tables %>% purrr::map(glimpse)
state_results <- tables[[2]]
state_results <- state_results %>% 
  filter(Margin != "View all Collapse") %>%
  separate_wider_delim(Margin, delim=" ", names=c("Winner", "Number_Margin"),
                       too_many="debug") #%>%View()

state_results <- tables[[2]] %>% mutate(
  Trump  = parse_number(Trump),
  Clinton = parse_number(Clinton)
)
state_results


html <- "https://www.baseball-reference.com/players/"
doc <- read_html(html)

hrefs <- doc %>% html_elements("strong a") 

hrefs %>% html_text()
hrefs %>% html_attr(name="href")

?html_elements


doc <- read_html("https://www.costco.com/WarehouseListByStateDisplayView")

costco <- session("https://www.costco.com/WarehouseListByStateDisplayView")
# RSelenium package might get us further

