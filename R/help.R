###############################################################################
# Package documentation
###############################################################################
#' @title Creating and Plotting Data Objects for Understanding Random Forests
#' 
#' @description \code{ggRandomForests} is a utility package for \code{randomForestSRC}. 
#' The package is designed to simplify the graphical analysis and exploration 
#' of randomForests.
#' 
#' The \code{randomForestSRC} package provides a unified treatment of Breimans random 
#' forests (Breiman 2001) for a variety of data settings. Regression and 
#' classification forests are grown when the response is numeric or categorical 
#' (factor) while survival and competing risk forests (Ishwaran et al. 2008, 2012) 
#' are grown for right-censored survival data. Support for unsupervised and 
#' multivariate randomForests have also recently been added.
#' 
#' Many of the features of the \code{ggRandomForests} package are available 
#' within the \code{randomForestSRC} package. However, the ggRandomForests offers the 
#' following advantages:
#' \itemize{
#' \item Separation of data and figures: ggRandomForest contains functions that 
#' operate on either the raw randomForestSRC (rfsrc) forest object directly, or on 
#' the output from rfsrc posprocessing functions (i.e. \code{vimp.rfsrc}, 
#' \code{var.select.rfsrc}, \code{plot.variable.rfsrc}) to generate intermediate 
#' data.frame objects. These objects are then passed to corresponding plot functions 
#' using the S3 object model. Alternatively, a user can use these data object for 
#' additional external, custom plotting or analysis operations.
#' 
#' \item Each figure is self contained. This allows modification of individual plots
#' to meet the users specification. Figures can be grouped together using functions 
#' from the \code{gridExtra} package.
#' 
#' \item \code{ggplot2} figures: We chose to use the \code{ggplot2} package for our figures. 
#'  The plot functions all return either a single \code{ggplot2} object, or a \code{list} of 
#'  \code{ggplot2} objects. 
#'  The user can then use additional \code{ggplot2} functions to modify and customise the 
#'  figures to their liking. 
#' }
#'
#' The \code{ggRandomForests} package contains the following functions:
#' \itemize{
#' \item \code{\link{gg_rfsrc}}: randomForest[SRC] prediction
#' \item \code{\link{gg_error}}: randomForest[SRC] convergence rate based on the OOB error rate.
#' \item \code{\link{gg_roc}}: ROC curves for randomForest classification models.
#' \item \code{\link{gg_vimp}}: Variable Importance ranking for variable selection
#' \item \code{\link{gg_minimal_depth}}: Minimal Depth ranking for variable selection
#' \item \code{\link{gg_interaction}}: Minimal Depth interaction detection (under development)
#' \item \code{\link{gg_variable}}: Marginal variable dependence (including conditional dependence)
#' \item \code{\link{gg_partial}}: Partial variable dependence (including conditional partial 
#' dependence)
#' \item \code{\link{gg_survival}}: Random Forest survival plots including either Kaplan-Meier or
#'  Nelson-Aalon survival estimates  
#' }
#' 
#' All functions have an associated plotting function that returns \code{ggplot2} graphics, either 
#' individually or as a list, that can be further customised using standard \code{ggplot2} commands.
#'  
#' @references
#' Breiman, L. (2001). Random forests, Machine Learning, 45:5-32.
#' 
#' Ishwaran, H. and Kogalur, U.B. (2007). Random survival forests for R, 
#' Rnews, 7(2):25-31.
#' 
#' Ishwaran, H. and Kogalur, U.B. (2014). Random Forests for Survival, 
#' Regression and Classification (RF-SRC), R package version 1.5.
#' 
#' Ishwaran, H., U. B. Kogalur, E. Z. Gorodeski, A. J. Minn, and M. S. Lauer (2010). 
#' High-dimensional variable selection for survival data. J. Amer. Statist. Assoc. 
#' 105, 205-217.
#' 
#' Ishwaran, H. (2007). Variable importance in binary regression trees and forests. 
#' Electronic J. Statist., 1, 519-537.
#' 
#' Wickham, H. ggplot2: elegant graphics for data analysis. Springer New York, 2009.
#' 
#' @docType package
#' @name ggRandomForests-package
#' 
################
NULL
