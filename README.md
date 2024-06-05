# My personal Quarto template

This is a custom Quarto project directory template that gathers my favourite tips, tricks, tweaks and cool feats that I used in my personal projects thus far. 



Then the heart of all of this is the `_quarto.yml` file, which contains all the project options:

- No errors, warnings or messages are rendered
- A table of contents is created and sections are numbered
- Alignment and ratio of figures are defined, along with several caption positioning options
- Two bibliography files are ready in `bib-files/`, `references.bib` which is usually tied to the Quarto Visual Mode "Insert Citation" command, and `packages.bib`, which is created by the R function `knitr::write_bib` and makes it more convenient to cite the packages we use.
- The bibliography uses the American Psychological Association norms through the `apa.csl` file.

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