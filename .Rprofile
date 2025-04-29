source("renv/activate.R")

.First <- function() {
  if (interactive()) {
    colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
    
    suppressMessages(suppressWarnings({
      if (!renv::status()$synchronized) {
        renv::restore(prompt = FALSE)
        cat("\014")
        print(glue::glue_col(
          "{", colours[1], " |-> ",
          "{", colours[2], " Some packages recorded in the lockfile were }\n",
          "|   {", colours[2], " not synchronised and have been restored.}\n",
          "|   {", colours[2], " Run `{red renv::status()}` to see if there ",
          "are any}\n",
          "|   {", colours[2], " other issues.}}\n"
        ))
      } else {
        cat("\014")
        print(glue::glue_col(
          "{", colours[1], " |->} {", colours[2], 
          " All packages are synchronised with the lockfile.}\n"
        ))
      }
    }))
    
    anew <- sample(c(
      "Let us cook.     ",
      "Born anew.       ",
      "A new beginning. ",
      "Fresh and clean. ",
      "Fresh, so fresh. "
    ), 1)
    welcome_message <- paste0(
      "{", colours[1],
      " ----------------------------------------------------\n",
      " Here we go... ",
      "{", colours[2], " ", anew, "}}\n"
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
