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
#' Internal Reciever Operator Characteristic calculator for randomForest objects
#' 
#' @details Given the randomForest or randomForestSRC prediction and the actual 
#' response value, calculate the specificity (1-False Positive Rate) and sensitivity 
#' (True Positive Rate) of a predictor.
#' 
#' This is a helper function for the \code{\link{gg_roc}} functions, and not intended 
#' for use by the end user.
#' 
#' @param rf \code{randomForestSRC::rfsrc} or \code{randomForestSRC::predict} object 
#' containing predicted response
#' @param dta True response variable
#' @param which.outcome If defined, only show ROC for this response. 
#' @param oob Use OOB estimates, the normal validation method (TRUE)
#'  
#' @aliases calc_roc.rfsrc calc_roc.randomForest calc_roc
#' 
#' @seealso \code{\link{calc_auc}} \code{\link{gg_roc}} \code{\link{plot.gg_roc}}
#' 
#' @importFrom parallel mclapply
#' 
#' @examples
#' \dontrun{
#' ##
#' ## Taken from the gg_roc example
#' iris.obj <- rfsrc(Species ~ ., data = iris)
#' gg_dta <- calc_roc.rfsrc(iris.obj, iris.obj$yvar, which.outcome=1, oob=TRUE)
#' }
#' 
calc_roc.rfsrc <- function(rf, dta, which.outcome="all", oob=TRUE){
  if(!is.factor(dta)) dta <- factor(dta)
  if(which.outcome!="all"){
    dta.roc <- data.frame(cbind(res=(dta == levels(dta)[which.outcome]), 
                                prd=rf$predicted[, which.outcome],
                                oob=rf$predicted.oob[, which.outcome]))
    if(oob)
      pct <- sort(unique(rf$predicted.oob[,which.outcome]))
    else
      pct <- sort(unique(rf$predicted[,which.outcome]))
  }else{
    stop("Must specify which.outcome for now.")
  }
  pct<- pct[-length(pct)]
  
  gg_dta <-mclapply(pct, function(crit){
    if(oob) 
      tbl <- xtabs(~res+(oob>crit), dta.roc)
    else
      tbl <- xtabs(~res+(prd>crit), dta.roc)
    
    spec<-tbl[2,2]/rowSums(tbl)[2]
    sens<-tbl[1,1]/rowSums(tbl)[1]
    cbind(sens=sens,spec=spec )
  })
  
  gg_dta <- do.call(rbind, gg_dta)
  gg_dta <- rbind(c(0,1), gg_dta, c(1,0))
  pct<- c("origin",pct,"limit")
  return(data.frame(gg_dta, row.names=pct))
  
}

calc_roc<- calc_roc.rfsrc
calc_roc.randomForest <- function(rf, dta, which.outcome=1){
  prd <- predict(rf, type="prob")
  dta.roc <- data.frame(cbind(res=(dta == levels(dta)[which.outcome]), 
                              prd=prd[,which.outcome]))
  
  pct <- sort(unique(prd[,which.outcome]))
  pct<- pct[-length(pct)]
  
  gg_dta <-mclapply(pct, function(crit){
    tbl <- xtabs(~res+(prd>crit), dta.roc)
    
    spec<-tbl[2,2]/rowSums(tbl)[2]
    sens<-tbl[1,1]/rowSums(tbl)[1]
    cbind(sens=sens, spec=spec)
  })
  gg_dta <- do.call(rbind, gg_dta)
  
  return(data.frame(gg_dta, row.names=pct))
}

#'
#' Internal calculator for the Area Under the ROC Curve
#' 
#' @details calc_auc uses the trapezoidal rule to calculate the area under
#' the ROC curve.
#' 
#'  This is a helper function for the \code{\link{gg_roc}} functions, and not intended 
#' for use by the end user.
#' @param x output from \code{\link{calc_roc}} (or \code{\link{gg_roc}}) 
#' 
#' @return AUC. 50\% is random guessing, higher is better.
#' 
#' @importFrom dplyr lead
#' 
#' @seealso \code{\link{calc_roc}} \code{\link{gg_roc}} \code{\link{plot.gg_roc}}
#' 
#' @examples
#' \dontrun{
#' ##
#' ## Taken from the gg_roc example
#' iris.obj <- rfsrc(Species ~ ., data = iris)
#' roc <- ggRandomForests:::calc_roc.rfsrc(iris.obj, iris.obj$yvar, which.outcome=2, oob=TRUE)
#' ggRandomForests:::calc_auc(roc)
#' }
#' 
calc_auc <- function(x){
  ## Use the trapeziod rule, basically calc
  ##
  ## auc = dx/2(f(x_{i+1}) - f(x_i))
  ##
  ## f(x) is sensitivity, x is 1-specificity
  
  # SInce we are leading vectors (x_{i+1} - x_{i}), we need to
  # ensure we are in decreasing order of specificity (x var = 1-spec)
  x <- x[order(x$spec, decreasing=TRUE),]
  
  auc <- (3*lead(x$sens) - x$sens)/2 * (x$spec - lead(x$spec))
  sum(auc, na.rm=TRUE)
}
