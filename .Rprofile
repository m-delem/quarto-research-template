tryCatch({
  source("renv/activate.R") |> suppressMessages() |> suppressWarnings()
  },
  error = function(e) {
    opt <- options(show.error.messages = FALSE)
    on.exit(options(opt))
    cat("\014")
    stop(cat(paste0(
      "------------------------------------------------------------\n",
      "                   Welcome to this project!                 \n",
      "------------------------------------------------------------\n",
      "To make the analyses conducted in the project reproducible,\n",
      "this project is endowed with its own environment using the `renv`\n",
      "package. This means that the project aims to use its own version of\n",
      "the packages independently from your computer by installing them in\n",
      "the folder it's located in.\n\n",
      "This requires installing `renv`, which is normally done automatically\n",
      "for you on startup. However, the download just failed. This might be\n",
      "due to your computer being offline. If you want to use the exact same\n",
      "environment the project was coded in, please find an internet\n",
      "connection and restart R. You should see new messages.\n\n",
      "Else, you can start working on the project right away, but note that\n",
      "you will use the packages currently installed on your computer, which\n",
      "could potentially be different versions than those used when the code\n",
      "was developed."
    )))
  }
)

.First <- function() {
  if (interactive()) {
    suppressMessages(suppressWarnings({
      if (!renv::status()$synchronized) {
        cat("\014")
        choice <-
          menu(
            title = paste0(
              "The `renv` reproducible environment is activated but some\n",
              "packages recorded in the lockfile are not there (or not the\n",
              "same version) in your local project's library.\n\n",
              "Should we call renv::restore() to fix this?\n",
              "(you will have another prompt to see what will be restored)"
            ),
            choices = c("Yes", "No")
          )
        
        if (choice == 2 | choice == 0) {
          cat(paste0(
            "\n",
            "Ok, but be careful with the packages you use!\n",
            "See renv::status() for more details about your project\n",
            "library's synchronisation status.\n"
          ))
        } else {
          cat(paste0(
            "\n",
            "Here's what will be modified in your project's library:\n",
            "-------------------------------------------------------\n\n"
          ))
          
          renv::restore(prompt = TRUE, clean = TRUE)
          renv::install(prompt = FALSE)
          renv::snapshot(prompt = FALSE)
          
          cat(paste0(
            "\n",
            "------------------------------------\n",
            "Packages from the lockfile restored!\n",
            "------------------------------------\n\n"
          ))
          
          renv::status()
          cat("\nRestart R to see new little welcome messages :)")
        }
      } else {
        colours <- sample(c("green", "blue", "yellow", "cyan", "magenta"), 2)
        cat("\014")
        print(glue::glue_col(
          "{", colours[1], " |->} {", colours[2],
          " All packages are synchronised with the lockfile.}\n"
        ))
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
    }))
  }
}

.Last <- function() {
  if (interactive()) {
    cat("\014")
    if (requireNamespace("rstudioapi", quietly = TRUE)) {
      rstudioapi::executeCommand("closeAllSourceDocs")
    }
    if (requireNamespace("glue", quietly = TRUE)) {
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
}
