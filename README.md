# My personal Quarto template

This is a custom Quarto project directory template that gathers my favourite extensions, options, tips, tricks, tweaks and cool feats that I used in my personal projects thus far. To use this template, open the terminal (you can also find one in a tab next to the console in RStudio), and type:

```
quarto use template m-delem/my-quarto-template
```

Then enter `Y` to trust the template, and specify the path of the folder you want to place your project into, e.g. `GitHub/my-project`. By default, the root is `~Users/Your-username/Documents/`.

## Structure

Some of the structures in this template were inspired by [this research template by Aaron Gullickson](https://github.com/AaronGullickson/research-template). 
- `open-this-file-first.RProj` is the first file to click on to open the project in RStudio.
- The `data/` folder contains three subfolders, `data_raw`, `data_transformed` and `r-data-structures` to host the data at different stages of processing. The first is dedicated to raw data, that should never be modified in place; instead, the processed data in all its forms should be stored in the second subfolder. The third is dedicated to `.rds` files, a file format that can contain R-specific objects such as models or tibbles.
- The `scripts/` folder will contain all raw R scripts.
    - It comes by default with a `_setup.R` file to host the common setup operations shared across scripts. This file should be loaded in all your other scripts and notebooks with `source(here("scripts/_setup.R"))`[^1].
    - `_functions.R` is meant to host your user-defined functions to be used in other scripts, and is loaded automatically by `_setup.R`.
    - The `_chunks.qmd` notebook is very situational, but can be used to host big Quarto chunks that are re-used multiple times for the same purposes. For instance, you might want to display the same chunk with different options depending on the output format (e.g., HTML or PDF). You can do so without cluttering your notebook with copies of the same code by placing the original chunk in `_chunks.qmd` with a label, loading `scripts/_chunks.qmd` silently with `{{< include ../scripts/_chunks.qmd >}}`, and referencing the chunk twice with `ref-label:`, along with different options. This is a neat trick I learned from [mcanouil](https://github.com/mcanouil) in an obscure GitHub issues thread that I can't even find anymore.
- The `notebooks/` folder contains Quarto `.qmd` notebooks with both code and text, which can be used either as working tools to record the analytic process for future use, or as complete reports for the final analyses and publications. Two examples with a basic structure are included.
- The `bibliography/` folder contains `.bib` files to host references.
- The template comes with a `figures/` folder for visual outputs.
- Rendered notebooks (in HTML, Word or PDF format) are created automatically in the `_output/` folder (unless instructed otherwise).
- The `_extensions/` and `utils/` folders contain utility files for rendering.
- More down below on the `renv/` folder and `renv.lock` file.

## Reproducible R environment with `renv`

For a good reproducible analysis in R, use the [`renv` package](https://rstudio.github.io/renv/articles/renv.html) with your project. The usual workflow is to initialise the `renv` environment with `renv::init()` as soon as you start working on the project. It will create a local environment for packages specifically for your project, and a `renv.lock` "lockfile" that contains a trace of the packages you used and their versions at the time you used them. Then you can use `renv::install("package")` to install a package that was not in your environment or lockfile yet. When you're done and everything is stable, you can save the state of your environment (take a "snapshot" of it) in the lockfile with `renv::snapshot()`. This will update the lockfile with the current state of your packages. Then, when you share your project with someone else, they can use `renv::restore()` to install the packages you used in the exact same state you used them and reproduce the analyses. This is the core idea.

***BUT WE CAN MAKE LIFE EASIER FOR OURSELVES!***

This template has already done a part of the job for you. The `renv` environment is already initialised, and the `renv.lock` file is already there. You just have to run `renv::restore()` to install the packages already in the lockfile, and this function is already written in the `scripts/_setup.R` file for you (which you want to load everywhere).

***BESIDES!***

This template uses the `pacman` package to manage packages. In a single function, it conveniently checks, installs and loads all the packages you need. You will also find this already written in the `scripts/_setup.R` file with some useful packages. Sweet!

## Workflow

In the end, you only need to know a few operations for a good workflow:
- Open your project in RStudio with the `open-this-file-first.RProj` file.
- Use `renv::status()` to check the status of your local packages and your lockfile.
- Open and run the `scripts/_setup.R` file, which will:
     - Call `renv::restore()` to install missing packages recorded in the lockfile if need be.
    - Load your packages with the `pacman::p_load()` function.
 - Add new packages in the `pacman::p_load()` function call in `scripts/_setup.R` as you work. Care to call `scripts/_setup.R` in all your other scripts with `source(here("scripts/_setup.R"))`[^1]. This is already in the notebooks templates for instance.
 - At the end of the day, when you're done *and everything is stable*, check your environment with `renv::status()`, and use `renv::snapshot()` to save the state of your environment if you changed some things.
 - As a bonus, use `renv::clean()` to remove all the packages not used from the lockfile.
> - If you use version control (and I suspect you do since you're here), commit your final modifications. 
 - Repeat this little routine when you come back to the project.
   
 Then we're good to go! We have everything set for a clean, reproducible, and well-organised project. If we share/submit/publish our results, we could simply (*clean up a bit and*) put this project folder in an archive, upload it to a secure scientific repository such as the [Open Science Framework](https://osf.io/), and any scientist who downloads and follows this workflow will be able to replicate our analyses in a heartbeat.

[^1]: The `here()` function from the eponymous package allows to specify that the working directory (WD) is the root project directory. This solves the issue of Quarto (.qmd) files automatically setting their current directory as the WD, which is problematic, for instance for those in the `notebooks/` folder.

## Rendering your notebooks

A main purpose of a Quarto project is to be able to render analysis results easily and nicely formatted in multiple output formats, while including dynamic code in it. The core file that dictates this behaviour in a Quarto project is the `_quarto.yml` file. In this template, I added a lot of default project options in the `_quarto.yml` for rendering documents:

- Some global execution options
- A pointer to two bibliography files in the `bibliography/` folder. `references.bib` is usually tied to the Quarto Visual Mode "Insert Citation" command, and `packages.bib` is created by the R function `knitr::write_bib` (already written for you in `_setup.R` to update continuously the package list) and makes it more convenient to cite the packages we use. The bibliography then follows the American Psychological Association norms using the `apa.csl` file.
- Some format specific options. For the HTML format: 
    - The HTML files rendered are self-contained
    - They are rendered with a dark theme and a light theme as a toggle
    - A custom CSS (`utils/html/custom.css`) adds a point to the section numbering
    - The Montserrat font is imported from Google Fonts, and set to medium size
    - The figures have the "lightbox" option, which allows to "click-to-expand"
    - The code is folded by default to have a clearer page, but this can be overridden locally
    - Code annotations are set on hover
    - The TOC is placed on the right, and expands to two depth levels max
- For the Word format (.docx):
    - The rendering uses a template I designed by hand (in `utils/docx/custom-reference-doc.docx`)
    - The code is not displayed
- For the Elsevier PDF format:
    - This format comes from an extension imported from `quarto-journals`, see <https://github.com/quarto-journals/elsevier>
    - The rendering to this format uses the `elsarticle.cls` and `elsarticle-harv.bst`
    - The code is not displayed
    - A short $\LaTeX$ snippet allows to add a new page after the abstract, TOC, or both. Mind that TOC is deactivated by default in the options.
      
I'm kinda reinventing the wheel with this template because a lot of what I built here is already included in the [Quarto Manuscript](https://quarto.org/docs/manuscripts/) project type. Still, building this template has helped me to understand the ins and outs of many aspects of Quarto, to understand every little detail in my files and folders, and now I'm comfortable with the structure of my projects, however complex.
