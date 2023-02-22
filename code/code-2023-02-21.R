library(lubridate)
library(tidyverse)

# lubridate allows transformations from character formats to dates/times specified by the order
# of the letters d, m, y (for dates) and (h, m, s) for times
mean(c(dmy("25/12/2023"),dmy("21/2/2023")))
min(c(dmy("25/12/2023"),dmy("21/2/2023")))

# extractor functions: 
year(today())
month(today())


# the save the values into a csv file
date <- lubridate::today()

?sprintf
sprintf("somename-%d%02d%02d.csv", year(today()), month(today()), day(today()))
