library(package = "dplyr")

scenarioName <- "RES_5-Years_IRRI-OneRice_4_NA"

# Read in results
df <- readRDS(paste0(scenarioName, ".rds"))

# Extract the MEAN data frame
df_mean <- df$MEAN

# Get number of cycles
nCycles <- max(df_mean$Cycle)

# Plotting function
plot_results <- function(x, y, main, xlab, ylab, ylim = NULL, extra_plot_func = NULL) {
  plot(x, y, type = "l", main = main, xlab = xlab, ylab = ylab, col = "blue", lwd = 2, ylim = ylim)
  grid(nx = NA, ny = NULL, lty = 6, col = "gray90")
  if (!is.null(extra_plot_func)) extra_plot_func()
}

# Plot
png("Results.png", height = 1200, width = 450, res = 150) # Higher resolution
par(mfrow = c(3, 1), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Genetic Gain
plot_results(df_mean$Cycle, df_mean$meanG_Sg1,
             "Genetic gain", "Cycle", "Yield")

# Genetic Variance
plot_results(df_mean$Cycle, df_mean$varG_Sg1,
             "Genetic variance", "Cycle", "Variance")

# Selection Accuracy
plot_results(df_mean$Cycle, df_mean$Accu,
             "Selection accuracy", "Cycle", "Correlation")

dev.off()
