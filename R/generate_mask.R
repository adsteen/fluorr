##' Generates mask based on ex/em wavelengths of sample
##'
##' @return matrix with excitation on columns, emission on rows, 1 for combinations to keep, and NA for combinations to mask
##' @details sample must be a matrix (or DF?) with row/colnames corresponding to ex/em wavelengths. 
##' @export
##' @return An EEM data frame
##'
generate_mask <- function(EEM, mask.Raman=FALSE) {
  # browser()
  # Determine excitation and emission wavelengths
  ex <- unique(EEM$ex.nm)
  em <- unique(EEM$em.nm)
  # ex <- as.numeric(colnames(samp))
  # em <- as.numeric(rownames(samp))
  
  # Create a long-format mask (thus, mask_l)
  mask_l <- expand.grid(ex, em)
  names(mask_l) <- c("ex.nm", "em.nm")
  mask_l$keep <- 1 # keep is 1 or 0, indicates whether value will be kept (1) or masked (0)
  
  ## This set of criteria comes from McKnight Lab f4correction.m
  ## It masks 1st and 2nd order Rayleigh scattering
  mask_l$keep[mask_l$em <= mask_l$ex + 10] <- 0
  mask_l$keep[mask_l$em >= 2*mask_l$ex - 20] <- 0
  
  ## MY ADDITION: MASK RAYLEIGH SCATTERING
  ## The equation for Raman seems to be em_max = 1.2896*ex - 52.84
  ## I don't understand the physics behind this function
  #browser()
  ########
  if(mask.Raman) {
    mask_l$keep[abs(mask_l$em - (mask_l$ex*1.2896-52.84)) < 15] <- 0 # 15 seems to be an acceptable tolerance
  }
  ########
  EEM_masked <- merge(EEM, mask_l, by=c("ex.nm", "em.nm")) # include the masking data
  ##### USING MERGE IS INEFFICIENT!!!!
  
  EEM_masked$RFU <- EEM_masked$RFU * EEM_masked$keep
  
  EEM <- EEM_masked[ , c("ex.nm", "em.nm", "RFU")]
  
  # Convert to wide matrix with emission on rows and excitation on columns
  # mask <- acast(mask_l, em~ex, value.var="keep")
  # names(dimnames(mask)) <- c("em", "ex")
  
  EEM
}