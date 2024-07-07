
# renv --------------------------------------------------------------------

# Don't forget to use `renv` for a reproducible environment!
# install.packages("renv")
# library("renv")
# renv::init() was used to create the renv.lock file in this template
# Now each time you open the project, you can restore the environment with:
renv::restore()


# Packages ----------------------------------------------------------------

# pacman allows to check/install/load packages with a single call
# if (!require("pacman")) install.packages("pacman") # already in renv.lock
library("pacman")

# package names
pacman::p_load(
  here,      # easy file paths
  see,       # theme_modern and okabeito palette
  report,    # reporting various info 
  labelled,  # labelled data
  tidyverse  # modern R ecosystem
)


# Custom functions shared across scripts ----------------------------------
source(here("scripts/_functions.R"))


# Global cosmetic theme ---------------------------------------------------

theme_set(theme_modern(base_size = 14)) # from see in easystats

# setting my favourite palettes as ggplot2 defaults
options( 
  ggplot2.discrete.colour   = scale_colour_okabeito,
  ggplot2.discrete.fill     = scale_fill_okabeito,
  ggplot2.continuous.colour = scale_colour_viridis_c,
  ggplot2.continuous.fill   = scale_fill_viridis_c
)


# Fixing a seed for reproducibility ────────────────────────────────────────
set.seed(14051998)

# Adding all packages' citations to a .bib --------------------------------
knitr::write_bib(c(.packages()), file = here("bibliography/packages.bib"))
