# please see https://jacobbien.github.io/litr-project/index.html
remotes::install_github("jacobbien/litr-project", subdir = "litr")

library(litr)
?litr

rmarkdown::draft("create-rhello.Rmd", template = "make-an-r-package", package = "litr")
