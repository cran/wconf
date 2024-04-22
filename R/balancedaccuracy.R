#' Starovoitov-Golub Sine-Accuracy Function for Imbalanced Classification Data
#'
#' This function calculates classification accuracy scores using the sine-based
#' formulas proposed by Starovoitov and Golub (2020). The advantage of the new
#' method consists in producing improved results when compared with the standard
#' balanced accuracy function, by taking into account the class distribution of
#' errors.
#'
#' @param m the caret confusion matrix object or simple matrix.
#'
#' @param print.scores print the accuracy metrics.
#'
#' @return a list containing 5 elements: 3 overall and 2 class accuracy scores
#'
#' @details The input object "m" should be a square matrix of at least size 2x2.
#'
#' @usage balancedaccuracy(m, print.scores = TRUE)
#'
#' @keywords balanced accuracy score metric sine
#'
#' @seealso [wconfusionmatrix()]
#'
#' @author Alexandru Monahov, <https://www.alexandrumonahov.eu.org/>
#'
#' @examples
#' m = matrix(c(70,0,0,10,10,0,5,3,2), ncol = 3, nrow=3)
#' balancedaccuracy(m, print.scores = TRUE)
#'
#' @export

balancedaccuracy <- function(m, print.scores = TRUE) {

  m = as.matrix(m)

  num_categ = length(m[,1]) # get number of categories

  md = matrix(diag(m), nrow = 1)
  md2 = md ^ 2

  offdiag <- function(x) x[col(x) != row(x)]
  mo = matrix(offdiag(m), nrow = length(m[,1]) - 1)
  mo2 = mo ^ 2

  mo = matrix(colSums(mo), nrow = 1)
  mo2 = matrix(colSums(mo2), nrow = 1)

  ACCmetrics = NULL

  #CosACC = 1/length(m[,1]) * as.numeric(rowSums(md/sqrt(md2 + mo2)))
  #ACCmetrics$CosACC = CosACC

  SinACC = 1 - 1/length(m[,1]) * as.numeric(rowSums(sqrt(mo2)/sqrt(md2 + mo2)))
  ACCmetrics$SinACC = SinACC
  ACCmetrics$SinACC_class = 1 - sqrt(mo2)/sqrt(md2 + mo2)

  BalACC = 1/length(m[,1]) * as.numeric(rowSums(md/(md + mo)))
  ACCmetrics$BalACC = BalACC
  ACCmetrics$BalACC_class = md/(md + mo)

  ACC = sum(md) / sum(m)
  ACCmetrics$ACC = ACC

  if (print.scores == TRUE){
    cat("Confusion matrix:", "\n")
    print(m)
    cat("\n", "Class accuracy metrics:", "\n")
    cat("SinAcc - Starovoitov-Golub Sine-Accuracy Metrics for Imbalanced Classification Data", "\n")
    print(1 - sqrt(mo2)/sqrt(md2 + mo2))
    cat("BalAcc - Balanced Accuracy Function", "\n")
    print(md/(md + mo))
    cat("ACC - Standard Accuracy Function", "\n")
    print(ACC)
    cat("\n", "Overall accuracy metrics:", "\n")
    cat("SinACC =", SinACC, "   BalACC =", BalACC, "   ACC =", ACC, "\n", "\n")
    }

  return(ACCmetrics)

}
