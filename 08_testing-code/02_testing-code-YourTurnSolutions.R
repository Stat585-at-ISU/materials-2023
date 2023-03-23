# --- Your Turn 1: Slide 12 ----------------------------------------------------
## Your Turn

# - Function specifications:
#   - name: `sign_root`
# - Parameters n and value, both numeric
#   - Function should error if `n` or `value` is not numeric
# - Function should return a number
#   - with the same sign as `value`
#   - with magnitude equal to the `n`th root of `value`.
#
# 1. Write the tests for this function
#
# 2. Write the function and upload to https://gist.github.com/
#
# 3. Use your tests on your neighbor's function - do they pass?

library(testthat)

sign_root <- function(value = 1, n = 1) {
  stopifnot(is.numeric(value))
  stopifnot(is.numeric(n))

  return(sign(value)*abs(value)^(1/n))
}

expect_error(sign_root(value = "a"))
expect_error(sign_root(n = "a"))

expect_equal(sign(sign_root(1, 2)), sign(1))
expect_equal(sign(sign_root(-1, 2)), sign(-1))
expect_equal(sign_root(3, 2), sqrt(3))
expect_equal(sign_root(-3, 2), -sqrt(3))
