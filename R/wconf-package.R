#' @keywords internal
#' @details
#'   weightmatrix - configures and visualizes a weight matrix
#'
#'   wconfusionmatrix - calculates the weighted confusion matrix from a caret
#'   ConfusionMatrix object or a simple matrix, according to one of several
#'   weighting schemas and optionally prints the weighted accuracy score.
#'
#' @examples
#' # Generate sample data
#' m = matrix(c(70,0,0,10,10,0,5,3,2), ncol = 3, nrow=3)
#' # Experiment with several weighting schemes to find optimal solution
#' weightmatrix(n=4, weight.type="arithmetic", plot.weights = TRUE)
#' weightmatrix(n=4, weight.type="geometric", geometric.multiplier = 0.6)
#' weightmatrix(n=4, weight.type="geometric", geometric.multiplier = 2)
#' # Compute the weighted confusion matrix
#' wconfusionmatrix(m, weight.type = "arithmetic", print.weighted.accuracy = TRUE)
#'
#' @author Alexandru Monahov
#' @references Kuhn, M. (2008). Building Perspective Models in R Using the caret
#' Package. Journal of Statistical Software, 28(5), 1-26.
#'
#' Monahov, A. (2021). Model Evaluation with Weighted Threshold Optimization
#' (and the "mewto" R package), Machine Learning eJournal, SSRN.
#'
#' Van de Velden, M. et al. (2023). A general framework for implementing
#' distances for categorical variables. arXiv.
#'
#' @source Copyright Alexandru Monahov, 2023. You may use, modify and redistribute
#'  this code, provided that you give credit to the author and make any derivative
#'  work available to the public for free.
#'
#' @importFrom graphics abline
#' @importFrom graphics axis
#' @importFrom stats dnorm
#'
"_PACKAGE"
