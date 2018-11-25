#' Percentage Difference of Means and Variances
#'
#' Compute the percentage of significant differences between the entire
#' collection (EC) and core set (CS) as Mean difference percentage (MD) and
#' Variance difference percentage (VD)
#' \insertCite{hu_methods_2000}{EvaluateCore}.
#'
#' @inheritParams snk.evaluate.core
#' @param alpha Type I error probability (Significance level) of difference.
#'
#' @return
#'
#' @seealso \code{\link[EvaluateCore]{snk.evaluate.core}},
#'   \code{\link[EvaluateCore]{snk.evaluate.core}}
#'
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' ####################################
#' # Use data from R package ccChooser
#' ####################################
#'
#' library(ccChooser)
#' data("dactylis_CC")
#' data("dactylis_EC")
#'
#' ec <- cbind(genotypes = rownames(dactylis_EC), dactylis_EC[, -1])
#' ec$genotypes <- as.character(ec$genotypes)
#' rownames(ec) <- NULL
#' ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
#'                                     function(x) cut(x, breaks = 4))
#' ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
#'                                     function(x) factor(as.numeric(x)))
#' head(ec)
#'
#' core <- rownames(dactylis_CC)
#'
#' quant <- c("X2", "X3", "X4", "X5", "X8")
#' qual <- c("X1", "X6", "X7")
#'
#' ####################################
#' # EvaluateCore
#' ####################################
#'
#' percentdiff.evaluate.core(data = ec, names = "genotypes",
#'                           quantitative = quant, selected = core)
#'
#'
percentdiff.evaluate.core <- function(data, names, quantitative,
                              selected, alpha = 0.05){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  # Check alpha value
  if (!(0 < alpha && alpha < 1)) {
    stop('"alpha" should be between 0 and 1 (0 < alpha < 1)')
  }

  mdiff <- snk.evaluate.core(data, names, quantitative,
                             selected)
  vdiff <- levene.evaluate.core(data, names, quantitative,
                                selected)

  outdf <- data.frame(MDPercent = (sum(mdiff$SNK_pvalue <= alpha)/ length(quantitative) * 100),
                      VDPercent = (sum(vdiff$Levene_pvalue <= alpha)/ length(quantitative) * 100))

  return(outdf)

}
