#devtools::install_github("johnschwenck/bp")
library(bp)
library(ggplot2)
## Load bp_hypnos
data(bp_hypnos)

## Process bp_hypnos
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

dip_calc(hypnos_proc, subj = c(70435))

bp_scatter(hypnos_proc, subj = 70435)
