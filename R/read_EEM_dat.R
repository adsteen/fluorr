##' Reads EEM dat files from Engel lab f4

read_EEM_dat <- function(fn, path="") {
  
  # Read the file
  EEM <- read.table(paste(path, fn, sep=""), 
                             sep="\t", skip=2,
                             stringsAsFactors=FALSE)
  #browser()
  
  # Read in the excitation wavelengths
  ex.vec <- as.vector(read.table(paste(path, fn, sep=""), 
                                 sep="\t", skip=0, nrows=1,
                                 stringsAsFactors=FALSE))
  ex.vec <- as.character(ex.vec[-1]) # The first element is 'wavelength'; need to have these as character so tehy can be legit column names
  
  # Set column names to be wavelength values
  colnames(EEM) <- c("em.nm", ex.vec)
  
  # Melt EEM data frame
  EEM_tidy <- gather(EEM, "ex.nm", "RFU", 2:ncol(EEM)) # This works
  
  EEM_tidy
}
