#' Coincidence Rate of Range
#'
#' Compute the Coincidence Rate of Range (CR)
#' \insertCite{diwan_methods_1995,hu_methods_2000}{EvaluateCore} to compare
#' quantitative traits of the entire collection (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats]{wilcox.test}}
#'
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
cr.evaluate.core <- function(data, names, quantitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  mdiff <- snk.evaluate.core(data, names, quantitative,
                    selected)

  CR <- (sum((mdiff$CS_Max - mdiff$CS_Min)/(mdiff$EC_Max - mdiff$EC_Min))/length(quantitative)) * 100

  return(CR)

}
