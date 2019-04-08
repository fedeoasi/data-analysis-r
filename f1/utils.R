to_seconds <- function(string) {
  input <- as.character(string)
  if (!is.na(input)) {
    by_colon <- strsplit(input, split = ":")[[1]]
    min <- as.integer(by_colon[[1]])
    by_period <- strsplit(by_colon[[2]], split = "\\.")[[1]]
    sec <- as.integer(by_period[[1]])
    mil <- as.integer(by_period[[2]])
    60 * min + sec + mil / 1000
  } else {
    input
  }
}

