
#' @title Check Object Class
#'
#' @description
#'
#' @param x Object to be tested.
#'
#' @param valid_classes \code{character}. Valid classes to check for.
#'
#' @param specific \code{lgl}. Only match specific class?
#'
#' @inheritParams check
#'
#'
#' @export
#'
#'
check_class <- function(x,
                        valid_classes,
                        specific = FALSE,
                        cs_level = 1,
                        msg = NULL,
                        handler = "stop") {

  assertthat::assert_that(is.character(valid_classes))
  assertthat::assert_that(is.logical(specific))

  check_class_msg <- msg %||%
    glue::glue(
      "x is not of valid classes; ",
      glue::glue_collapse(valid_classes, sep = ", ")
    )

  check(
    has_class(
      x,
      valid_classes = valid_classes,
      specific = specific
    ),
    cs_level = cs_level + 1,
    msg = check_class_msg,
    handler = handler
  )

}

#' @noRd
has_class <- function(x, valid_classes, specific) {

  cl <- class(x) %in% valid_classes

  if(specific) return(cl[1])
  else return(any(cl))

}
