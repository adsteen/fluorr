# THis is a test 

# library(ggplot2)
# library(tidyr)

# Read the Raman file
fn <- "~/Dropbox (Personal)/Drew/Students/BarrettAbigail/data/Fluoromax-4/DfltEx (01)_Graph.dat"
raman <- read_raman(fn)

ggplot(raman, aes(x=wavelength, y=MicroAmps)) +
  geom_line()
# Uhh, well, I don't really know what to make of that...

# Read UV files: UV blank UV short integration time, UV long integration time
# UV_blank <- read_UV("abby_data/") # Not sure which files are the UV spectra

# fl blank
fl_blank <- read_EEM_dat("abby_data/Blank (01)_Graph_S1_R1.dat")
p_blank <- plot_EEM(fl_blank)
print(p_blank)

# Not sure which sample this is
unk_1 <- read_EEM_dat("abby_data/Sample (01)_Graph_S1_R1.dat")
p_unk_1 <- plot_EEM(unk_1)
print(p_unk_1)
