context("check")

test_that("check returns error if ... evaluates to FALSE", {

  expect_error(
    check(
      isTRUE(FALSE),
      cs_level = 0
    ),
    regexp = "Check failed in check\\(isTRUE\\(FALSE\\)"
  )

  expect_error(
    check(
      2 < 1,
      cs_level = 0
    ),
    regexp = "2 not less than 1"
  )

})

test_that("check returns invisibly if .. evaluates to TRUE", {

  expect_invisible(
    check(
      2  == 2,
      cs_level = 0
    )
  )

  res <- check(
    2  == 2,
    cs_level = 0
  )

  expect_identical(
    res,
    TRUE
  )

})

test_that("check aborts if handler is not correctly specified", {

  expect_error(
    check(
      2 > 3,
      handler = "error"
    ),
    regexp = "`handler`"
  )

  expect_error(
    check(
      2 > 3,
      handler = "some handler"
    ),
    regexp = "`handler`"
  )

})

test_that("check argument handler correctly switches handler", {

  match <- "2 not greater than 3."

  expect_error(
    check(
      2 > 3,
      handler = "stop",
      cs_level = 0
    ),
    regexp = match
  )

  expect_warning(
    check(
      2 > 3,
      handler = "warning",
      cs_level = 0
    ),
    regexp = match
  )

})

test_that("check handles multiple expressions", {

  expect_error(
    check(
      2 < 3,
      is.numeric("b"),
      cs_level = 0
    ),
    regexp = '"b" is not a numeric or integer vector.'
  )

  # if multiple failed checks prints on first error

  expect_error(
    check(
      3 < 2,
      is.numeric("b"),
      cs_level = 0
    ),
    regexp = "3 not less than 2."
  )

})

test_that("check argument include_call works correctly", {

  expect_error(
    check(
      3 < 2,
      cs_level = 0,
      include_call = FALSE
    ),
    regexp = "^3 not less than 2.$"
  )

})
