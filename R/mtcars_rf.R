#' mtcars \code{randomForestSRC::rfsrc} for regression
#' 
#' The data was extracted from the 1974 Motor Trend US magazine, and 
#' comprises fuel consumption and 10 aspects of automobile design and 
#' performance for 32 automobiles (1973-74 models).
#' 
#' \itemize{
#' \item mpg	 Miles/(US) gallon
#' \item cyl	 Number of cylinders
#' \item disp	 Displacement (cu.in.)
#' \item hp	 Gross horsepower
#' \item drat	 Rear axle ratio
#' \item wt	 Weight (lb/1000)
#' \item qsec	 1/4 mile time
#' \item vs	 V/S
#' \item am	 Transmission (0 = automatic, 1 = manual)
#' \item gear	 Number of forward gears
#' \item carb	 Number of carburetors
#' }
#' 
#' @examples
#' \dontrun{
#' ## motor trend cars
#' mtcars_rf <- rfsrc(mpg ~ ., data = mtcars)
#' 
#' plot.gg_rfsrc(mtcars_rf)
#' plot.gg_error(mtcars_rf)
#' 
#' }
#' 
#' @references 
#' Henderson and Velleman (1981), Building multiple regression models interactively. 
#' Biometrics, 37, 391-411.
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
#' @format A \code{randomForestSRC::rfsrc} object for regression
#' @name mtcars_rf
NULL
