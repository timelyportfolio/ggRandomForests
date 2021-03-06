####**********************************************************************
####**********************************************************************
####
####  ----------------------------------------------------------------
####  Written by:
####  ----------------------------------------------------------------
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
#' Plot a \code{\link{gg_error}} object
#' 
#' A plot of the cumulative OOB error rates of the random forest as a 
#' function of number of trees.
#' 
#' @param x gg_error object created from a randomForestSRC object
#' @param ... extra arguments
#' 
#' @return ggplot graph
#' 
#' @export plot.gg_error
#' 
#' @details The gg_error plot is used to track the convergence of the 
#' randomForest. This figure is a reproduction of the error plot
#' from the \code{randomForestSRC::plot.rfsrc} function.
#' 
#' @seealso \code{\link{gg_error}} \code{randomForestSRC::rfsrc} \code{randomForestSRC::plot.rfsrc}
#' 
#' @references
#' Breiman L. (2001). Random forests, Machine Learning, 45:5-32.
#' 
#' Ishwaran H. and Kogalur U.B. (2007). Random survival forests for R, Rnews, 
#' 7(2):25-31.
#' 
#' Ishwaran H. and Kogalur U.B. (2013). Random Forests for Survival, Regression 
#' and Classification (RF-SRC), R package version 1.4.
#' 
#' @examples
#' \dontrun{
#' #' ## Examples from RFSRC package... 
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
#'}
#' @importFrom ggplot2 ggplot geom_line theme aes_string labs 
#' @importFrom tidyr gather
### error rate plot

plot.gg_error <- function(x, ...){
  gg_dta <- x
  
  # Initialize variables for gather statement... to silence R CMD CHECK
  set <- error <- ntree <- NA
  
  if(inherits(gg_dta, "rfsrc")) gg_dta <- gg_error(gg_dta)
  
  if(!inherits(gg_dta, "gg_error")) stop("Incorrect object type: Expects a gg_error object")
  
  if(dim(gg_dta)[2] > 2){
    gg_dta <- gg_dta %>% gather(set, error,-ntree)
    gg_plt <- ggplot(gg_dta, aes_string(x="ntree",y="error", col="set"))
  }else{
    # We expect the object to have the following columns
    gg_plt <- ggplot(gg_dta, aes_string(x="ntree",y="error"))
  }
  gg_plt <- gg_plt +
    geom_line() +
    labs(x = "Number of Trees",
         y = "OOB Error Rate")
  
  if(length(unique(gg_dta$variable)) == 1){
    gg_plt <- gg_plt + theme(legend.position="none")
  }
  return(gg_plt)
}
