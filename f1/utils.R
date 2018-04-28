## @knitr to_seconds
to_seconds <- function(string) {
  if (!is.na(string)) {
    by_colon <- strsplit(string, split = ":")[[1]]
    min <- as.integer(by_colon[[1]])
    by_period <- strsplit(by_colon[[2]], split = "\\.")[[1]]
    sec <- as.integer(by_period[[1]])
    mil <- as.integer(by_period[[2]])
    60 * min + sec + mil / 1000
  } else {
    string
  }
}
