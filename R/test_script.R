# THis is a test 

# library(ggplot2)

# Read the Raman file
fn <- "~/Dropbox (Personal)/Drew/Students/BarrettAbigail/data/Fluoromax-4/DfltEx (01)_Graph.dat"
raman <- read_raman(fn)

ggplot(raman, aes(x=wavelength, y=MicroAmps)) +
  geom_line()
# Uhh, well, I don't really know what to make of that...

# Read UV files: UV blank UV short integration time, UV long integration time
UV_blank <- read_UV()
