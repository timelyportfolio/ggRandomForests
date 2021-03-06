#' A \code{randomForestSRC::plot.variable} object.
#' 
#' A cached object from \code{randomForestSRC::plot.variable} function for the 
#' veteran data \code{randomForestSRC::rfsrc} survival forest \code{\link{veteran_rf}}.
#'  
#' @details For ggRandomForests examples and tests, as well as streamlining the 
#' R CMD CHECK for package release, we cache the computationally expensive operations
#' from the randomForestSRC package. 
#' 
#' This "data set" is a cache of the \code{randomForestSRC::plot.variable} function, with 
#' partial=TRUE for the "age" variable. The data is then a risk adjusted variable dependence 
#' curve from the \code{\link{veteran_rf}} random forest model. 
#' 
#' We build a survival randomForest (\code{\link{veteran_rf}}) with the 
#' \code{veteran} data set, then run the \code{plot.variable} function to
#' generate the data for constructing partial dependence plots. 
#' 
#' @seealso \code{veteran} \code{plot.variable} \code{rfsrc} \code{\link{veteran_rf}}
#' 
#' @examples
#' \dontrun{
#' ## veteran data
#' ## randomized trial of two treatment regimens for lung cancer
#' data(veteran, package = "randomForestSRC")
#' veteran_rf <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
#' veteran_prtl <- plot.variable(veteran_rf, surv.type = "surv", 
#'                               partial = TRUE, time=30, xvar.names = "age", 
#'                               show.plots=FALSE)
#' gg_dta <- gg_partial(veteran_prtl)                              
#' plot(gg_dta)
#' }
#'                               
#' @references 
#' Kalbfleisch J. and Prentice R, (1980) The Statistical Analysis of Failure 
#' Time Data. New York: Wiley.
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
#' @format \code{randomForestSRC::plot.variable} object for survival
#' @name veteran_prtl
NULL
