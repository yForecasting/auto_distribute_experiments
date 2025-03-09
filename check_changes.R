# Set working directory
setwd("C:/github/auto_distribute_experiments")

# Fetch latest changes
system("git fetch origin main")

# Check if the file has changed
changes <- system("git diff --name-only origin/main", intern = TRUE)

if ("distribute_exp_agenda.txt" %in% changes) {
  message("File has changed. Processing...")

  # Read last line
  lines <- readLines("distribute_exp_agenda.txt")
  script_to_run <- tail(lines, 1)

  message("Running script: ", script_to_run)

  # Execute R script
  system(paste("Rscript", script_to_run))
} else {
  message("No changes detected.")
}
