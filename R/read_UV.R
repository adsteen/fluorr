##' Reads UV csv files and resamples to 

read_UV <- function(fn, wavelength="Wavelength..nm.", response="Absorbance", resample=TRUE, skip=2, ...) {
  # THIS IS A MARKER PUT HERE 10:41 THURSDAY 8-25
  # browser()
  #UV <- read.csv(fn)
  UV <- read_csv(fn, skip = 2)
  names(UV)[names(UV)==wavelength] <- "wavelength"
  names(UV)[names(UV)==response] <- "abs"
  
  if(resample) {
  #   ###### RESAMPLING
  #   # In the future I should spline the UV then resample to (arbitrary) desired wavelengths
  #   # For now I'll just resample to integer wavelengths
  #   
  #   # Define a domain over which to resample - here it is just integers
  #   domain <- seq(from=min(UV$wavelength), to=max(UV$wavelength), by=1) # This will run into trouble if the values are not integers
  #   
  #   
  #   resample_indices <- which(UV$wavelength %in% domain)
  #   UV_resamp <- UV[resample_indices , c("wavelength", "abs")]
  #   UV_resamp
    warning("I'm sorry, Dave, I'm afraid I can't resample.")
  } 
  UV
  
}