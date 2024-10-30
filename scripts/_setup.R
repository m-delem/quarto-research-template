
# Renv --------------------------------------------------------------------

# Don't forget to use `renv` for a reproducible environment!
# see https://rstudio.github.io/renv/articles/renv.html for more details

# install.packages("renv")  # if you don't have it yet
# library("renv")           # same as above

# renv::init() has already been used to create the renv.lock file (the file that
# contains the exact details of the packages you used) in this template, so now 
# the project only needs to be restored each time you start working. You will
# be asked to install the packages that I added down below upon running this 
# script, but you can change this to suit your needs.
renv::restore()


# Packages ----------------------------------------------------------------

# pacman allows to check/install/load packages with a single call
if (!requireNamespace("pacman")) install.packages("pacman")

# packages to load (and install if needed)
pacman::p_load(
  here,        # easy file paths
  sessioninfo # reporting various info 
)


# Fixing a seed for reproducibility
set.seed(123)
