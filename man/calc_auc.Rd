% Generated by roxygen2 (4.0.2): do not edit by hand
\name{calc_auc}
\alias{calc_auc}
\title{Internal calculator for the Area Under the ROC Curve}
\usage{
calc_auc(x)
}
\arguments{
\item{x}{output from \code{\link{calc_roc}} (or \code{\link{gg_roc}})}
}
\value{
AUC. 50\% is random guessing, higher is better.
}
\description{
Internal calculator for the Area Under the ROC Curve
}
\details{
calc_auc uses the trapezoidal rule to calculate the area under
the ROC curve.

 This is a helper function for the \code{\link{gg_roc}} functions, and not intended
for use by the end user.
}
\examples{
\dontrun{
##
## Taken from the gg_roc example
iris.obj <- rfsrc(Species ~ ., data = iris)
roc <- ggRandomForests:::calc_roc.rfsrc(iris.obj, iris.obj$yvar, which.outcome=2, oob=TRUE)
ggRandomForests:::calc_auc(roc)
}
}
\seealso{
\code{\link{calc_roc}} \code{\link{gg_roc}} \code{\link{plot.gg_roc}}
}

