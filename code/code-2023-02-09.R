x <- 1:10
y <- c(1, -1)

x * y

z <- c(1, -1, 0)
x * z


#####
data("mtcars")
str(mtcars)

?glimpse # in dplyr
?head

mtcars$mpg %>% str() # magrittr pipe (tidyverse)
str(mtcars$mpg)
mtcars$mpg |> str() # base pipe

model <- lm(mpg~., data=mtcars)
# What's in this object `model`?

class(model)
som <- summary(model)
str(som)

som$coefficients %>% str() # is a matrix of size 11 x 4

library(broom)
# glance, tidy, augment

glance(model)
tidy(model)
augment(model)
