# function to source all files in a directory
# 
source_all <- function(path = "/", pattern = NULL) {
  files <- list.files(path, pattern, full.names = TRUE, recursive = TRUE)
  # the assignment to "silence" prevents the output from being printed
  silence <- lapply(files, function(x) source(file = x, verbose = FALSE))
}