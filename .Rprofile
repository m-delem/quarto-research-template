source("renv/activate.R")

# Commands to run on RStudio project opening
setHook(
  hookName = "rstudio.sessionInit",
  value = function(newSession) {
    if (newSession) {
      # rstudioapi::executeCommand("newSourceColumn")
      # Sys.sleep(0.3)
      # rstudioapi::navigateToFile("R/my_favourite_file.R") 
      # rstudioapi::executeCommand("closeOtherSourceDocs")
      # rstudioapi::navigateToFile("README.md") 
      # rstudioapi::executeCommand("popoutDoc")
      # rstudioapi::executeCommand("activateFiles")
    }
  },
  action = "append"
)

.First <- function() {
  if (interactive()) {
    suppressMessages(suppressWarnings({
      if (!renv::status()$synchronized) renv::restore(prompt = FALSE)
      cat("\014")
    }))
    colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
    anew <- sample(c(
      "Let us cook.     ",
      "Born anew.       ",
      "A new beginning. ",
      "Fresh and clean. ",
      "Fresh, so fresh. "
    ), 1)
    welcome_message <- paste0(
      "{", colours[1],
      " |--------------------------------|\n",
      " | Here we go... ",
      "{", colours[2], " ", anew, "}|\n",
      " |--------------------------------|}\n"
    )
    print(glue::glue_col(welcome_message, .literal = TRUE))
  }
}

.Last <- function() {
  if (interactive()) {
    cat("\014")
    rstudioapi::executeCommand("closeAllSourceDocs")
    colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
    print(glue::glue_col(
      "\n\n",
      "{red ",
      "|---------------------------------------|\n",
      "|-> Session closed. ",
      "{", colours[1], " Until next time!} ",
      "{", colours[2], " o/} |\n",
      "|---------------------------------------|}\n"
    ))
    Sys.sleep(0.75)
  }
}
