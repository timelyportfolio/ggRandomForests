#' \code{randomForestSRC::rfsrc} forest for Veteran's Administration Lung Cancer Trial 
#' 
#' @description A \code{randomForestSRC::rfsrc} survival forest for the randomized trial of two
#' treatment regimens for lung cancer. This is a standard survival analysis data set.
#' 
#' \itemize{
#' \item trt   treatment: 1=standard 2=test
#' \item celltype	 cell-type: 1=squamous, 2=smallcell, 3=adeno, 4=large
#' \item time	 survival time
#' \item status	 censoring status
#' \item karno	 Karnofsky performance score (100=good)
#' \item diagtime	 months from diagnosis to randomisation
#' \item age	 age in years
#' \item prior	 prior therapy 0=no, 1=yes
#' }
#' 
#' @examples
#' \dontrun{
#' ## veteran data
#' ## randomized trial of two treatment regimens for lung cancer
#' data(veteran, package = "randomForestSRC")
#' veteran_rf <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
#' 
#' plot.gg_rfsrc(veteran_rf)
#' plot.gg_error(veteran_rf)
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
#' @format A rfsrc object for survival
#' @name veteran_rf
NULL
