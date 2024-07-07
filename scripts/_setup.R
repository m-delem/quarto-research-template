# don't forget to use `renv` for a reproducible environment!
# install.packages("renv")
# library("renv")
# renv::init() was used to create the renv.lock file in this template
# Now each time you open the project, you can restore the environment with:
renv::restore()

# librarian allows to check/install/load packages with a single call
if (!require("librarian")) install.packages("librarian")
library(librarian)
shelf(
  here,      # setting the root directory
  see,       # theme_modern and okabeito
  report,    # reporting various info
  labelled,  # labelled data
  tidyverse  # modern R ecosystem
)

source(here("scripts/_functions.R")) # custom functions shared across scripts

# ─── Global cosmetic theme ───────────
theme_set(theme_modern(base_size = 14)) # from see in easystats

# setting my favourite palettes as ggplot2 defaults
options( 
  ggplot2.discrete.colour   = scale_colour_okabeito,
  ggplot2.discrete.fill     = scale_fill_okabeito,
  ggplot2.continuous.colour = scale_colour_viridis_c,
  ggplot2.continuous.fill   = scale_fill_viridis_c
)

# ─── Fixing a seed for reproducibility ───
set.seed(14051998)

# ─── Adding all packages' citations to a .bib ───
knitr::write_bib(c(.packages()), file = here("bibliography/packages.bib"))
