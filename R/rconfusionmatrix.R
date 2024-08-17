#' Redistributed confusion matrix
#'
#' This function calculates the redistributed confusion matrix from a caret
#' ConfusionMatrix object or a simple matrix and optionally prints the
#' redistributed standard accuracy score. The redistributed confusion matrix
#' can serve to place significance on observations close to the diagonal by
#' applying a custom weighting scheme which transfers a proportion of the
#' non-diagonal observations to the diagonal.
#'
#' @param m the caret confusion matrix object or simple matrix.
#'
#' @param custom.weights the vector of custom weights to be applied, which
#' should be equal to "n", but can be larger, with excess values, as well as
#' the first element, being ignored. The first element is ignored because it
#' represents weighting applied to the diagonal. As, in the case of
#' redistribution, a proportion of the non-diagonal observations is shifted
#' towards the diagonal, the weighting applied to the diagonal depends on the
#' weights assigned to the non-diagonal elements, and is thus not configurable
#' by the user.
#'
#' @param print.weighted.accuracy print the standard accuracy metric for the
#' redistributed matrix, which represents the sum of the correctly classified
#' observations (or the diagonal elements of the matrix) divided by the
#' total number of observations (or the sum of all observations).
#'
#' @return an nxn weighted confusion matrix
#'
#' @details The number of categories "n" should be greater or equal to 2.
#'
#' @usage rconfusionmatrix(m, custom.weights = NA,
#'                         print.weighted.accuracy = FALSE)
#'
#' @keywords redistributed confusion matrix accuracy score
#'
#' @seealso [weightmatrix()] for the weight matrix used in computations,
#'   [wconfusionmatrix()] for the computation of weighted confusion matrices,
#'   [balancedaccuracy()] for accuracy metrics designed for imbalanced data.
#'
#' @author Alexandru Monahov, <https://www.alexandrumonahov.eu.org/>
#'
#' @examples
#' m = matrix(c(70,0,0,10,10,0,5,3,2), ncol = 3, nrow=3)
#' rconfusionmatrix(m, custom.weights = c(0,0.5,0.25),
#'                  print.weighted.accuracy = TRUE)
#'
#' @export

rconfusionmatrix <- function(m, custom.weights = NA, print.weighted.accuracy = FALSE) {

  if (is.matrix(m) == FALSE) {m = as.matrix(m)}
  n = length(m[,1])

  # Custom weights
  wt = custom.weights
  mat = (abs(outer(seq(0, (n-1), 1), seq(0, (n-1), 1), `-`)))+1
  for (i in 1:n) {
    mat[mat==i] = wt[i]
  }
  addtodiag = colSums(m*mat)
  subtract_mat = m * mat

  m2 = m - subtract_mat

  diag(m2) <- diag(m2) + addtodiag

  if (print.weighted.accuracy == TRUE) {
    waccuracy = sum(diag(m2))/sum(m2)
    cat("Redistributed standard accuracy = ", sum(diag(m2))/sum(m2), "\n", "\n")
  }
  return(m2)


}
