# Required Packages for Social Media User Segmentation Project
# Run this script once to install all necessary packages

# List of required packages
packages <- c(
  "tidyverse",      # Data manipulation and visualization (includes ggplot2, dplyr, etc.)
  "cluster",        # Clustering algorithms and silhouette analysis
  "ggplot2",        # Advanced plotting (included in tidyverse but listed explicitly)
  "GGally",         # Correlation matrices and pairwise plots
  "NbClust",        # Determining optimal number of clusters
  "factoextra",     # Enhanced visualization for clustering results
  "caret",          # Data preprocessing and machine learning
  "rmarkdown",      # For rendering R Markdown documents
  "knitr"           # For knitting R Markdown
)

# Function to install packages if not already installed
install_if_missing <- function(package) {
  if (!require(package, character.only = TRUE, quietly = TRUE)) {
    cat(paste("Installing", package, "...\n"))
    install.packages(package, dependencies = TRUE)
  } else {
    cat(paste(package, "is already installed.\n"))
  }
}

# Install all packages
cat("Checking and installing required packages...\n\n")
sapply(packages, install_if_missing)

cat("\n✓ All required packages are installed!\n")
cat("\nYou can now run the analysis by opening PART_I_DM.Rmd in RStudio.\n")

# Optional: Load all packages to verify installation
cat("\nVerifying package installation by loading them...\n")
success <- sapply(packages, function(pkg) {
  require(pkg, character.only = TRUE, quietly = TRUE)
})

if (all(success)) {
  cat("\n✓ All packages loaded successfully!\n")
  cat("\nR Version:", R.version.string, "\n")
} else {
  failed <- packages[!success]
  cat("\n✗ The following packages failed to load:\n")
  print(failed)
  cat("\nPlease try installing them manually using:\n")
  cat("install.packages(c('", paste(failed, collapse = "', '"), "'))\n", sep = "")
}