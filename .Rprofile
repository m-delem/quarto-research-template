source("renv/activate.R")

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
    cat("\014")
    suppressMessages(suppressWarnings({
      if (!requireNamespace("pacman")) install.packages("pacman")
      pacman::p_load(crayon, glue)
    }))
    colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
    anew <- sample(c(
      "The rebirth of R.", 
      "Let us cook.     ",
      "Born anew.       ",
      "A new beginning. ",
      "Again, and again.",
      "Fresh and clean. ",
      "Fresh, so fresh. "
    ), 1)
    sup <- sample(c(
      "All good?",
      "Doing well?",
      "How's it going?",
      "Doing fine?",
      "Doing good?",
      "Good stuff?",
      "Any news?",
      "Any issues?",
      "Found anything?"
    ), 1)
    welcome_message <- paste0(
      "{", colours[1],
      " |-------------------------------------|\n",
      " | Here we go again...",
      # "{", colours[3], " \\o/}",
      "{", colours[2], " ", anew, "}|\n",
      " |-------------------------------------|\n",
      " |->} ", "{", colours[2], " What's up `renv`? ", sup, "}\n"
    )
    print(glue_col(welcome_message, .literal = TRUE))
    renv::status()
  }
}

.Last <- function() {
  if (interactive()) {
    cat("\014")
    rstudioapi::executeCommand("closeAllSourceDocs")
    colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
    print(glue_col(
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
