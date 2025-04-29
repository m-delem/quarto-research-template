# This file contains explicit calls to packages that we want to make sure are
# recorded in the lockfile by renv. This is useful in certain situation, for 
# instance when a package is suggested by another package but not imported 
# (like crayon in glue, which is the one I added by default).
library(crayon)
library(glue)