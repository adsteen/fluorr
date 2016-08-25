##' Read Raman scattering file
##' @description Reads Raman scattering data file
##' @param fn Filename
##' @param wavelength Name of the wavelength 
##' @source 

read_raman <- function(fn, wavelength="nm", response="CPS", low.cutoff=370, ...) {
  #browser()
  
  # Read file
  R <- read.delim(fn, skip=1, ...)
  
  # Rename R to standard format
  names(R)[names(R)==wavelength] <- "wavelength"
  names(R)[names(R)==response] <- "response"
  
  
  # Trim Raman scan from low.cutoff (default 370) to scan end
  if(min(R$wavelength) < low.cutoff) {
    R <- R[-which(R$wavelength < low.cutoff), ]
  }
  
  #class(R) <- "Raman"
  R
  
}