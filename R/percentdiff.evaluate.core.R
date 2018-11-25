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
