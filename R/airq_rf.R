#' Air quality randomForestSRC object.
#' 
#' A cached \code{randomForestSRC::rfsrc} object for the New York Air Quality Measurements. This is 
#' a randomForestSRC regression forest.
#'  
#' @details For ggRandomForests examples and tests, as well as streamlining the 
#' R CMD CHECK for package release, we cache the computationally expensive operations
#' from the randomForestSRC package. 
#' 
#' We build a regression randomForest (\code{\link{airq_rf}}) with the 
#' \code{airquality} measurements data. The data were from New York, from 
#' May to September 1973. The data was obtained from the New York State 
#' Department of Conservation (ozone data) and the National Weather Service 
#' (meteorological data).
#' 
#' @seealso \code{airquality} \code{rfsrc} \code{\link{airq_vs}} \code{\link{airq_interaction}} 
#' \code{\link{airq_prtl}} \code{\link{gg_rfsrc}} \code{\link{plot.gg_rfsrc}} \code{\link{gg_error}}
#' \code{\link{plot.gg_error}}
#' 
#' @examples
#' \dontrun{
#' ## The data was built with the following command
#' airq_rf <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
#' 
#' # Plot predicted values for the training data
#' gg_dta <- gg_rfsrc(airq_rf)
#' plot(gg_dta)
#' 
#' # Plot error rate for the forest 
#' gg_dta <- gg_error(airq_rf)
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
#' @format A randomForestSRC::rfsrc object for regression
#' @name airq_rf
NULL
