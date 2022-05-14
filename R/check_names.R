
#' @importFrom rlang is_named
check_names <- function(x,
                        names,
                        cs_level = 1,
                        msg = NULL,
                        handler = "stop") {

check(is_named(x), msg = "x must be named")

}
