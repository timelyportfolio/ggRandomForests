####**********************************************************************
####**********************************************************************
####
####  ----------------------------------------------------------------
####  Written by:
####    John Ehrlinger, Ph.D.
####    Assistant Staff
####    Dept of Quantitative Health Sciences
####    Learner Research Institute
####    Cleveland Clinic Foundation
####
####    email:  john.ehrlinger@gmail.com
####    URL:    https://github.com/ehrlinger/ggRandomForests
####  ----------------------------------------------------------------
####
####**********************************************************************
####**********************************************************************
#'
#' randomForestSRC error rate data object
#' 
#' Extract the cumulative (OOB) randomForestSRC error rate as a function of 
#' number of trees.
#' 
#' @details The gg_error function simply returns the rfsrc$err.rate object as 
#' a data.frame, and assigns the class for connecting to the \code{\link{plot.gg_error}}
#' function. 
#' 
#' @param object randomForestSRC object.
#' @param ... optional arguments (not used).
#' 
#' @return gg_error data.frame with one column indicating the tree number, 
#' and the remaining columns from the rfsrc$err.rate return value. 
#' 
#' @export gg_error.ggRandomForests gg_error
#' 
#' @seealso \code{\link{plot.gg_error}} \code{rfsrc} \code{plot.rfsrc}
#' 
#' @references
#' Breiman L. (2001). Random forests, Machine Learning, 45:5-32.
#' 
#' Ishwaran H. and Kogalur U.B. (2007). Random survival forests for R, Rnews, 7(2):25-31.
#' 
#' Ishwaran H. and Kogalur U.B. (2013). Random Forests for Survival, Regression 
#' and Classification (RF-SRC), R package version 1.4.
#' 
#' @aliases gg_error gg_error.ggRandomForests
#' 
#' @examples
#' ## Examples from RFSRC package... 
#' ## ------------------------------------------------------------
#' ## classification example
#' ## ------------------------------------------------------------
#' ## You can build a randomForest
#' # iris_rf <- rfsrc(Species ~ ., data = iris)
#' # ... or load a cached randomForestSRC object
#' data(iris_rf, package="ggRandomForests")
#' 
#' # Get a data.frame containing error rates
#' gg_dta<- gg_error(iris_rf)
#' 
#' # Plot the gg_error object
#' plot(gg_dta)
#' 
#' ## ------------------------------------------------------------
#' ## Regression example
#' ## ------------------------------------------------------------
#' # airq_rf <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
#' # ... or load a cached randomForestSRC object
#' data(airq_rf, package="ggRandomForests")
#' 
#' # Get a data.frame containing error rates
#' gg_dta<- gg_error(airq_rf)
#' 
#' # Plot the gg_error object
#' plot(gg_dta)
#' 
#' ## ------------------------------------------------------------
#' ## Survival example
#' ## ------------------------------------------------------------
#' ## veteran data
#' ## randomized trial of two treatment regimens for lung cancer
#' # data(veteran, package = "randomForestSRC")
#' # veteran_rf <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
#' 
#' # Load a cached randomForestSRC object
#' data(veteran_rf, package="ggRandomForests")
#' 
#' gg_dta <- gg_error(veteran_rf)
#' plot(gg_dta)
#' 
#'
### error rate plot
gg_error.ggRandomForests <- function(object, ...) {
  ## Check that the input obect is of the correct type.
  if (inherits(object, "rfsrc") == FALSE){
    stop("This function only works for Forests grown with the randomForestSRC package.")
  }
  if (is.null(object$err.rate)) {
    stop("Performance values are not available for this forest.")
  }
  
  gg_dta <- data.frame(object$err.rate)
  if(is.null(dim(gg_dta))){
    gg_dta<- data.frame(error=cbind(gg_dta))
  }
  
  if("object.err.rate" %in% colnames(gg_dta))
    colnames(gg_dta)[which(colnames(gg_dta)=="object.err.rate")] <- "error"
  
  gg_dta$ntree <- 1:dim(gg_dta)[1]
  
  class(gg_dta) <- c("gg_error",class(gg_dta))
  invisible(gg_dta)
}

gg_error <- gg_error.ggRandomForests
