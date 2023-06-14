test_that("has_col() work", {
    expect_equal(has_col(mtcars, "mpg"), TRUE)
    expect_equal(has_col(mtcars, "mmm"), FALSE)
})
