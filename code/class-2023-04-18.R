ames_dogs$animals[[1]]$name

ames_shelter <- tibble(animals=ames_dogs$animals) %>% 
  mutate(
    names = animals %>% purrr::map_chr(.f = function(x) x$name),
    sex = animals %>% purrr::map_chr(.f = function(x) {
      x$gender
      }),
    age = animals %>% purrr::map_chr(.f = function(x) {
      x$age
    }),
    breeds = animals %>% purrr::map(.f = function(x) {
      x$breeds
    }),
    shelter_id = animals %>% purrr::map_chr(.f = function(x) {
      x$organization_id
    })
  )


ames_shelter$img_url <- ames_shelter$animals %>% purrr::map_chr(.f = function(x) {
  photo <- x$primary_photo_cropped$medium
  if(length(photo)==0) return("")
  photo
})






