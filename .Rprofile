source("renv/activate.R")

setHook(
  hookName = "rstudio.sessionInit",
  value = function(newSession) {
    if (newSession) {
      # Code to exectute when a new RStudio session is started
    }
  },
  action = "append"
)

# pacman is the GOAT of package management
{if (!requireNamespace("pacman")) install.packages("pacman")} |> 
  suppressMessages() |> 
  suppressWarnings()
