#' Variable Rate of Coefficient of Variation
#'
#' Compute the Variable Rate of Coefficient of Variation (VR) to compare
#' quantitative traits of the entire collection (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @export
#'
#' @examples
#'
vr.evaluate.core <- function(data, names, quantitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  vdiff <- levene.evaluate.core(data, names, quantitative,
                                selected)

  VR <- (sum(vdiff$CS_CV/vdiff$EC_CV)/length(quantitative)) * 100

  return(VR)

}
