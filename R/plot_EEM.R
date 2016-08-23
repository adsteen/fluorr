##' Plot processed or raw EEMs
##' @export

plot_EEM <- function(EEM, scale.max=NULL, plot.title="EEM plot",  contour=FALSE, save.plot=FALSE,  fn=NA, oldpar=par(), ht=4, wd=4, dpi=300, ...) {
  #browser()
  # check_EEM(EEM)
  
  p <- ggplot(EEM, aes(x=ex.nm, y=em.nm, fill=RFU)) + 
    geom_tile() + 
    coord_fixed()
  
  if(!is.nul(scale.max)) {
    #p <- p+
  }
  
  p
}