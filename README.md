# My personal Quarto template

This is a custom Quarto project directory template that gathers my favourite extensions, options, tips, tricks, tweaks and cool feats that I used in my personal projects thus far. 

Some structures in this template were inspired by [this research template by Aaron Gullickson](https://github.com/AaronGullickson/research-template).

> For a good reproducible analysis in R, don't forget to use the `renv` package with your project with `renv::init()` as soon as you start it. It will create a local environment for packages specifically for your project, and a `renv.lock` "lockfile" that contains a trace of the packages you used and their versions at the time you used them.
> The useful functions are:
> - `renv::install("package")` installs a package that was not in your environment or lockfile yet.
> - `renv::status()` checks the status of your local packages and your lockfile.
> - `renv::snapshot()` saves the current state of your packages in the lockfile.
> - `renv::clean()` removes all the packages not used from the lockfile.
> - `renv::restore()` restores the packages in the lockfile: this is typically what you want to do if you just cloned a repo that already has a lockfile but that you never used locally (like that of a collaborator).
> Then we're good to go! We can load our packages everywhere with `library()`.

The heart of a Quarto project is the `_quarto.yml` file, which contains all the project options:

- No errors, warnings or messages are rendered
- A table of contents is created and sections are numbered
- Two bibliography files are ready in `bibliography/`, `references.bib` which is usually tied to the Quarto Visual Mode "Insert Citation" command, and `packages.bib`, which is created by the R function `knitr::write_bib` and makes it more convenient to cite the packages we use. The bibliography then uses the American Psychological Association norms through the `apa.csl` file.

It also sets everything up for rendering in three formats, with format-specific options:

- HTML: 
    - The HTML files rendered are self-contained
    - They are rendered with a dark theme and a light theme as a toggle
    - A custom CSS adds a point to the section numbering
    - The Montserrat font is imported from Google Fonts, and set to medium size
    - The figures have the "lightbox" option, which allows to "click-to-expand"
    - The code is folded by default to have a clearer page, but this can be overridden locally
    - Code annotations are set on hover
    - The TOC is placed on the right, and expands to two depth levels max

- Word (.docx):
    - The rendering uses a template I designed by hand
    - The code is not displayed

- Elsevier PDF:
    - This format is imported from `quarto-journals`, see <https://github.com/quarto-journals/elsevier>
    - The rendering to this format uses the `elsarticle.cls` and `elsarticle-harv.bst`
    - The code is not displayed
    - A short $\LaTeX$ snippet allows to add a new page after the abstract, TOC, or both.

The customised stuff (the little CSS, the Word template and the Elsevier format files) are stored in the `_extensions/` folder.

The rendering outputs (the files in the three formats) are stored in the `_output/` folder.

I'm kinda reinventing the wheel with this template because a lot of what I built here is already included in the Quarto Manuscript project type, but building this template has helped me to understand the ins and outs of many aspects of Quarto, and now I'm comfortable with the structure of my projects, however complex.
