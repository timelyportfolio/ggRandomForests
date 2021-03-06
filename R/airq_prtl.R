#' A \code{randomForestSRC::plot.variable} object.
#' 
#' A cached object from \code{randomForestSRC::plot.variable} function for the 
#' New York Air Quality Measurements randomForestSRC regression forest \code{\link{airq_rf}}.
#'  
#' @details For ggRandomForests examples and tests, as well as streamlining the 
#' R CMD CHECK for package release, we cache the computationally expensive operations
#' from the randomForestSRC package. 
#' 
#' We build a regression randomForest (\code{\link{airq_rf}}) with the 
#' \code{airquality} measurements data, then run the \code{plot.variable} function to
#' generate the data for constructing partial dependence plots. 
#' 
#' This "data set" is a cache of the \code{plot.variable} function, with partial=TRUE for the
#' "Wind" variable. The data is then a risk adjusted variable dependence curve from the
#' \code{\link{airq_rf}} random forest model. 
#' 
#' The data were from 
#' New York, from May to September 1973. The data was obtained from the New York State 
#' Department of Conservation (ozone data) and the National Weather Service 
#' (meteorological data).
#' 
#' @seealso \code{airquality} \code{plot.variable} \code{rfsrc} \code{\link{airq_rf}} 
#'  \code{\link{gg_partial}} \code{\link{plot.gg_partial}}
#' 
#' @examples
#' \dontrun{
#' ## airq data
#' ## Load the stored randomForestSRC object for airq
#' load(air1_rf, package="ggRandomForests)
#' 
#' # Save the "Wind" partial plot data
#' airq_prtl <- plot.variable(airq_rf, xvar.names = "Wind",
#'                           partial=TRUE, show.plots=FALSE)
#'                     
#' # Generate a ggRandomForests plot.                                   
#' gg_dta <- gg_partial(airq_prtl)
#' plot(gg_dta)
#' }
#'                               
#' @references 
#' Chambers, J. M., Cleveland, W. S., Kleiner, B. and Tukey, P. A. 
#' (1983) Graphical Methods for Data Analysis. Belmont, CA: Wadsworth.
#' 
#' Ishwaran H. and Kogalur U.B. (2014). Random Forests for
#' Survival, Regression and Classification (RF-SRC), R package
#' version 1.5.4.
#' 
#' Ishwaran H. and Kogalur U.B. (2007). Random survival forests
#' for R. R News 7(2), 25-31.
#' 
#' Ishwaran H., Kogalur U.B., Blackstone E.H. and Lauer M.S.
#' (2008). Random survival forests. Ann. Appl. Statist. 2(3),
#' 841-860.
#' 
#' @docType data
#' @keywords datasets
#' @format \code{randomForestSRC::plot.variable} object for regression
#' @name airq_prtl
NULL
