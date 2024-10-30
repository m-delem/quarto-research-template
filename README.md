# Quarto template (and workflow) for reproducible research

This repository contains a custom Quarto project template for reproducible scientific research and data analysis. Some of the structures in this template were inspired by [this research template by Aaron Gullickson](https://github.com/AaronGullickson/research-template). 

## Quick start guide

### Install Quarto (if you haven't already) and import the template

First install [Quarto](https://quarto.org/), which is an amazing open-source scientific and technical publishing system. It is very well integrated within [RStudio](https://posit.co/products/open-source/rstudio/), but can also be used seamlessly in [Visual Studio Code](https://code.visualstudio.com/) if you are already accustomed to the latter. From now on I'll assume you work on RStudio for convenience. 

To use this template (i.e., copy the folder on your computer), open the terminal (you can find one in a tab next to the console in RStudio), and type:

```
quarto use template m-delem/quarto-research-template
```

Then enter `Y` to trust the template, and specify the path of the folder you want to place your project into, e.g. `GitHub/my-project`. By default, the root is `~Users/Your-username/Documents/`.

### Setup the project

- Open the `open-this-file-first.RProj`: this will open the project in RStudio and set the current directory as the working directory immediately.

- This project is setup with a dedicated virtual environment using the [`renv` package](https://rstudio.github.io/renv/articles/renv.html) to make its packages independent from your computer (more details on this further below). To get this rolling, open the `scripts/_setup.R` script and run `renv::restore()`, which will prompt you to install everything that was recorded in the "lockfile" (the trace of the packages I added by default). Accept.

- Run the whole setup script. I added several packages by default:
    - `pacman` for easy package management
    - `here` to point links to the project working directory
    - `sessioninfo` to report session information
 
- All set! You could start on an R script on the spot, but I'd suggest you create your own copy of the notebook `notebooks/_notebook-template.qmd`, I prepared a minimal structure for a clean reproducible notebook that loads your setup scripts.

### Basic daily workflow

In the end, you only need to know a few operations for a good workflow:

- Open your project in RStudio with the `open-this-file-first.RProj` file.

- Open and run the `scripts/_setup.R` file, which will automatically:
    - Call `renv::restore()` to install missing packages recorded in the lockfile if need be.
    - Load your packages with the `pacman::p_load()` function.
    - (On the side, it also sets cosmetic options, a random seed and records package citations.)

- Add new packages in the `pacman::p_load()` function call in `scripts/_setup.R` as you work. Care to call `scripts/_setup.R` in all your other scripts with `source(here("scripts/_setup.R"))`. This is already in the `notebooks/_notebooks_template.qmd` for instance.

- At the end of the day, when you're done ***and everything is stable***, check your environment with `renv::status()`, and use `renv::snapshot()` to save the state of your packages if you changed some things.

> - If you use version control (and I suspect you do since you're here), commit your final modifications.

 - Repeat this little routine when you come back to the project.
   
Then you're good to go! You have everything set for a clean, reproducible, and well-organised project. If you share/submit/publish your results and link this repository (or upload it as a folder), any scientist who downloads and follows this workflow will be able to replicate your analyses in a heartbeat.

When your Quarto notebooks are clean, you might also want to **render** them to various formats: simply click the usual "Render" button at the top of your notebooks and they should render to HTML with my default options. Open and tweak the `_quarto.yml` to tailor these options to suit your needs (*starting with replacing my name with yours, for instance*). See the details of the rendering options further down below.

## In-depth description

### Structure of the project

- `open-this-file-first.RProj` is the first file to click on to open the project in RStudio.

- The `data/` folder contains three subfolders, `data-raw`, `data-processed` and `r-data-structures` to host the data at different stages of processing: 
    - The first is dedicated to raw data, that should never be modified in place.
    - The processed data in all its forms should be stored in the second subfolder. 
    - The third is dedicated to `.rds` files, a file format that can contain R-specific objects such as models or tibbles.

- The `scripts/` folder will contain all raw R scripts. I added by default:
    - A `_setup.R` script to host the common setup operations shared across scripts. This file should be loaded in all your other scripts and notebooks with `source(here("scripts/_setup.R"))`.
    - `_functions.R` is meant to host your user-defined functions to be used in other scripts. Likewise, you can load it everywhere afterwards with `source(here("scripts/_functions.R"))`

- The `notebooks/` folder will contain Quarto `.qmd` notebooks with both code and text, which can be used either as working tools to record the analytic process for future use, or even as complete reports and manuscripts for the final analyses and publications. A template with essential elements is included.

- The `bibliography/` folder contains `.bib` files to host references.

- Rendered notebooks (in HTML, Word or PDF format) are created automatically in the `_output/` folder (unless instructed otherwise).

- More down below on the `renv/` folder and `renv.lock` file.

> Don't hesitate to create additional directories for important file types, e.g., a main `figures/` folder, a `docs/` folder for external documents (PDF, Word, PPT, etc.), a `materials/` folder for experiement materials, etc. Another related tip: find a consistent and clear naming scheme for your folders, scripts, functions, and variables, and stick to it. This will make your life easier when you need to find something later on.

### Reproducible R environment with `renv`

For a good reproducible analysis in R, use the [`renv` package](https://rstudio.github.io/renv/articles/renv.html) with your project. The usual workflow is to initialise the `renv` environment with `renv::init()` as soon as you start working on the project. It will create a local environment for packages specifically for your project, and a `renv.lock` "lockfile" that contains a trace of the packages you used and their versions at the time you used them. Then you can use the native `renv::install("package")` function to install a package that was not in your environment or lockfile yet, or use the `pacman` package as an alternative, as I do in this template. When you're done and everything is stable, you can save the state of your environment (take a "snapshot" of it) in the lockfile with `renv::snapshot()`. This will update the lockfile with the current state of your packages. Then, when you share your project with someone else, they can use `renv::restore()` to install the packages you used in the exact same state you used them and reproduce the analyses. This is the core idea.

This template has already done a part of the job for you. The `renv` environment is already initialised, and the `renv.lock` file is already there. You just have to run `renv::restore()` to install the packages already in the lockfile, and this function is already written at the top of the `scripts/_setup.R` file (which you want to load everywhere).

### Rendering your notebooks

A main purpose of a Quarto project is to be able to render analysis results easily and nicely formatted in multiple output formats, while including dynamic code in it. The core file that dictates this behaviour in a Quarto project is the `_quarto.yml` file. In this template, I added a lot of default project options in the `_quarto.yml` for rendering documents:

- The output directory is `_outputs/`, this is where your HTML/Word/PDF will end up automatically
  
- A basic author information structure with my own info as an example

- A pointer to two bibliography files in the `bibliography/` folder. `references.bib` is usually tied to the Quarto Visual Mode "Insert Citation" command. The bibliography then follows the American Psychological Association norms using the `apa.csl` file.

- Some execution, table of contents and numbering options

- For the HTML format: 
    - The HTML files rendered are self-contained
    - They are rendered with a dark theme and a light theme as a toggle
    - The Montserrat font is imported from Google Fonts, and set to medium size
    - The figures have the "lightbox" option, which allows to "click-to-expand"
    - The code is folded by default to have a clearer page, but this can be overridden locally
    - A "Code" button is added at the top of the page with options to show/hide all code or see the complete source
    - Code annotations are set on hover
    - The TOC is placed on the right, and expands to one depth level max