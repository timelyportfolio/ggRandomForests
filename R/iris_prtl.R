#' A \code{randomForestSRC::plot.variable} object.
#' 
#' A cached object from \code{randomForestSRC::plot.variable} function for the 
#' iris randomForestSRC classification forest \code{\link{iris_rf}}.
#'  
#' @details For ggRandomForests examples and tests, as well as streamlining the 
#' R CMD CHECK for package release, we cache the computationally expensive operations
#' from the randomForestSRC package. 
#' 
#' We build a regression randomForest (\code{\link{iris_rf}}) with the 
#' \code{iris} data, then run the \code{plot.variable} function to
#' generate the data for constructing partial dependence plots. 
#' 
#' 
#' 
#' This "data set" is a cache of the \code{randomForestSRC::plot.variable} function, with partial=TRUE for the
#' "Petal.Width" variable. The data is then a risk adjusted variable dependence curve from the
#' \code{\link{iris_rf}} random forest model. 
#' 
#' @seealso \code{iris} \code{randomForestSRC::plot.variable} \code{randomForestSRC::rfsrc} 
#' \code{\link{iris_rf}}
#' 
#' @examples
#' \dontrun{
#' ## veteran data
#' ## randomized trial of two treatment regimens for lung cancer
#' data(iris_rf, package = "ggRandomForests")
#' iris_prtl <- plot.variable(iris_rf, xvar.names = "Petal.Width",
#'                              partial=TRUE)
#'                              
#' plot(iris_prtl)
#' }
#'                               
#' @references 
#' Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. 
#' Wadsworth \& Brooks/Cole. (has iris3 as iris.)
#' 
#' Fisher, R. A. (1936) The use of multiple measurements in taxonomic problems. 
#' Annals of Eugenics, 7, Part II, 179-188.?
#' 
#' Anderson, Edgar (1935). The irises of the Gaspe Peninsula, Bulletin 
#' of the American Iris Society, 59, 2-5.
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
#' 
#' @docType data
#' @keywords datasets
#' @format \code{randomForestSRC::plot.variable} object for classification
#' @name iris_prtl
NULL
