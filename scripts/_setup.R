# install.packages("librarian") # to install/load packages with a single call
library(librarian)

shelf(
  here,
  see,
  report,
  labelled,
  tidyverse
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
