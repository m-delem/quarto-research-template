# pacman allows to check/install/load packages with a single call
if (!requireNamespace("pacman")) install.packages("pacman")

# packages to load (and install if needed)
pacman::p_load(
  here,        # easy file paths
  sessioninfo # reporting various info 
)

# Fixing a seed for reproducibility
set.seed(123)
