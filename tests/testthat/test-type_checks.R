test_that("check_integerish", {

  # Testing a double
  testthat::expect_true(check_is_integerish(1))
  # Testing multiple values
  testthat::expect_true(check_is_integerish(c(2,3)))
  # Testing a true integer
  testthat::expect_true(check_is_integerish(1L))
  # Testing allow NULL
  testthat::expect_true(check_is_integerish(NULL, allow_null = TRUE))
  # Testing allow NA
  testthat::expect_true(check_is_integerish(c(1, NA), allow_na = TRUE))

  # Testing that values is returned invisible
  testthat::expect_invisible(check_is_integerish(1))

  # Testing correct error type
  testthat::expect_error(check_is_integerish(1.1), class = 'checkr_error')
  testthat::expect_error(check_is_integerish(NULL), class = "checkr_error")
  # Also when the class is changed
  testthat::expect_error(check_is_integerish(1.1, .class = "test_class"), class = 'test_class')

  # Testing correct error messages
  value <- 1.1
  testthat::expect_snapshot(check_is_integerish(value), error = TRUE)

  value <- "hej"
  testthat::expect_snapshot(check_is_integerish(value), error = TRUE)

  # Testing correct error messages when wrapped in a function
  test <- function(hej = 1.1){
    check_is_integerish(
      hej
      , .x_name = rlang::caller_arg(hej)
    )
  }

  testthat::expect_snapshot(test(), error = TRUE)
  testthat::expect_snapshot(test(hej = value), error = TRUE)
})


testthat::test_that("check is numeric",{
  # Testing a double
  testthat::expect_true(check_is_numeric(1))
  # Testing multiple values
  testthat::expect_true(check_is_numeric(c(2,3)))
  # Testing a true integer
  testthat::expect_true(check_is_numeric(1L))
  # Testing allow NULL
  testthat::expect_true(check_is_numeric(NULL, allow_null = TRUE))
  # Testing allow NA
  testthat::expect_true(check_is_numeric(c(1, NA), allow_na = TRUE))

  # Testing that values is returned invisible
  testthat::expect_invisible(check_is_numeric(1))

  # Testing correct error type
  testthat::expect_error(check_is_numeric("hej"), class = 'checkr_error')
  testthat::expect_error(check_is_numeric(NULL), class = "checkr_error")

  # Also when the class is changed
  testthat::expect_error(check_is_numeric("hej", .class = "test_class"), class = 'test_class')

  # Testing correct error messages
  value <- "hej"
  testthat::expect_snapshot(check_is_numeric(value), error = TRUE)

  # Testing correct error messages when wrapped in a function
  test <- function(hej = "hej"){
    check_is_numeric(
      hej
      , .x_name = rlang::caller_arg(hej)
    )
  }

  testthat::expect_snapshot(test(), error = TRUE)
  testthat::expect_snapshot(test(hej = value), error = TRUE)
})
