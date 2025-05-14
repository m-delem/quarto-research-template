tryCatch({
  source("renv/activate.R") |> suppressMessages() |> suppressWarnings()
},
error = function(e) {
  opt <- options(show.error.messages = FALSE)
  on.exit(options(opt))
  cat("\014")
  stop(cat(paste0(
    "-------------------------------------------------------------------------",
    "\n",
    "                         Welcome to this project!                        ",
    "\n",
    "-------------------------------------------------------------------------",
    "\n",
    "To make the analyses conducted in the project reproducible,\n",
    "this project is endowed with its own environment using the `renv`\n",
    "package. This means that the project aims to use its own version of\n",
    "the packages independently from your computer by installing them in\n",
    "the folder it's located in.",
    "\n\n",
    "This requires installing and activating `renv`, which is normally done\n",
    "automatically for you on startup. However, these operations just failed.",
    "\n",
    "This might be due to your computer being offline.\n",
    "If you want to use the exact same environment the project was coded in,\n",
    "please find an internet connection and restart R. If your internet\n",
    "connection is ok, this might be an unexpected bug. You can try to run\n",
    "source('renv/activate.R') manually to see if it works, and try\n",
    "to run renv::activate() if it doesn't.",
    "\n\n",
    "In any case, if things are fixed you should see new messages on\n",
    "R startup.\n\n",
    "Else, you can start working on the project right away, but note that\n",
    "you will use the packages currently installed on your computer. These\n",
    "could potentially be different versions than those used when the code\n",
    "was developed, meaning the functions might behave differently from what ",
    "\n",
    "was initially intended."
  )))
})

.First <- function() {
  if (interactive()) {
    if (!suppressMessages(suppressWarnings(renv::status()$synchronized))) {
      cat("\014")
      # If the library is not synchronised, print a message and offer to
      # fix things automatically -----------------------------------------------
      cat(paste0(
        "The `renv` reproducible environment is activated but some\n",
        "packages are not synchronised between the recorded list of \n",
        "packages (the lockfile) and your local project's library.\n",
        "Here's what's going on (using renv::status()):\n",
        "----------------------------------------------\n\n"
      ))
      renv::status() |> suppressMessages() |> suppressWarnings()
      switch(
        utils::menu(
          title = paste0(
            "\n",
            "--------------------------------------------------------\n",
            "... No need to go to the help page, we can fix this with\n",
            "a sequence of operations that should cover all possibilities:",
            "\n\n",
            "1. Remove unused packages from the local library\n",
            "2. Restore the packages recorded in the lockfile\n",
            "3. Install the packages in the scripts that aren't recorded\n",
            "4. Record the new state of all the packages in the lockfile.\n",
            "Theoretically, this should be enough to synchronise everything.",
            "\n\n",
            "Should we run this sequence of operations?"
          ),
          choices = c("Yes", "No")
        ),
        # If they accept, give a summary and another prompt --------------------
        {
          cat(paste0(
            "\n",
            "1. Remove unused packages from the library (renv::clean()):\n",
            "-----------------------------------------------------------\n",
            "\n"
          ))
          renv::clean(prompt = FALSE)
          
          cat(paste0(
            "\n",
            "2. Restore the packages from the lockfile (renv::restore()):\n",
            "------------------------------------------------------------\n",
            "\n"
          ))
          renv::restore(prompt = FALSE, clean = TRUE)
          
          cat(paste0(
            "\n",
            "3. Install the packages that aren't recorded (renv::install()):",
            "\n",
            "---------------------------------------------------------------",
            "\n\n"
          ))
          renv::install(prompt = FALSE)
          
          cat(paste0(
            "\n",
            "4. Record all the packages in the lockfile (renv::snapshot()):",
            "\n",
            "--------------------------------------------------------------",
            "\n\n"
          ))
          renv::snapshot(prompt = FALSE)
          
          # Set auto snapshot to ease the mental burden of keeping track of
          # all package changes
          options(renv.config.auto.snapshot = TRUE)
          
          cat(paste0(
            "\n",
            "Is everything sychronised? (renv::status()):\n",
            "--------------------------------------------\n",
            "\n"
          ))
          renv::status() |> suppressMessages() |> suppressWarnings()
          
          cat(paste0(
            "\n",
            "|-> If everything's fixed, you can restart R to see new ",
            "welcome messages :)\n"
          ))
        },
        # If they decline, print a little warning and exit ---------------------
        cat(paste0(
          "\n",
          "Ok, but be careful with the packages you use!\n",
          "See renv::status() for more details about your project\n",
          "library's synchronisation status.\n\n"
        ))
      )
    } else {
      # Set auto snapshot to ease the mental burden of keeping track of
      # all package changes
      options(renv.config.auto.snapshot = TRUE)
      
      cat("\014")
      anew <- sample(c(
        "Let us cook.     ",
        "Born anew.       ",
        "A new beginning. ",
        "Fresh and clean. ",
        "Fresh, so fresh. "
      ), 1)
      cat(paste0(
        "--------------------------------------------------------\n",
        "|-> All installed packages are recorded and vice versa.\n",
        "|   Reproducible project environment, ready for action!\n",
        "--------------------------------------------------------\n",
        " Here we go... ", anew, "\n"
      ))
    }
  }
}

.Last <- function() {
  if (interactive()) {
    cat("\014")
    cat(paste0(
      "\n\n",
      "|---------------------------------------|\n",
      "|-> Session closed. Until next time! o/ |\n",
      "|---------------------------------------|"
    ))
    Sys.sleep(0.75)
  }
}
