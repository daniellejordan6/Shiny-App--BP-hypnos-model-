# Install necessary packages
# install.packages(c("devtools", "shiny"))

# Load libraries
library(devtools)
library(shiny)
library(bp)
library(ggplot2)

# Install and load bp package
# devtools::install_github("johnschwenck/bp")
library(bp)

# Load bp_hypnos
data(bp_hypnos)

# Process bp_hypnos
hypnos_proc <- process_data(bp_hypnos, 
                            sbp = 'syst', 
                            dbp = 'diast', 
                            date_time = 'date.time', 
                            hr = 'hr', 
                            pp = 'PP', 
                            map = 'MaP', 
                            rpp = 'Rpp', 
                            id = 'id', 
                            visit = 'Visit', 
                            wake = 'wake')
#> 2 values exceeded the DUL or DLL thresholds and were coerced to NA

# Calculate dip
dip_calc(hypnos_proc, subj = c(70435))

# Create scatter plot
bp_scatter_plot <- bp_scatter(hypnos_proc, subj = 70435)

# Define server function
shinyServer(function(input, output) {
  
  # Render scatter plot
  output$bpScatterPlot <- renderPlot({
    bp_scatter_plot
  })
})
