#' A \code{randomForestSRC::plot.variable} object.
#' 
#' 
#' 
#' @seealso \code{mtcars} \code{plot.variable} \code{rfsrc} \code{\link{mtcars_rf}} 
#'  \code{\link{gg_partial}} \code{\link{plot.gg_partial}}
#' 
#' @examples
#' \dontrun{
#' ## mtcars data
#' ## Load the stored randomForestSRC object for mtcars
#' load(mtcars_rf, package="ggRandomForests)
#' 
#' # Save the "wt" and "hp" partial plot data
#' mtcars_prtl <- plot.variable(mtcars_rf, 
#'                              xvar.names = c("wt", "hp"), 
#'                              partial=TRUE, show.plots=FALSE)
#'                     
#' # Generate a ggRandomForests plot.                                   
#' gg_dta <- gg_partial(mtcars_prtl)
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
#' @name mtcars_prtl
NULL
