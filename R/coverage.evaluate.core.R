#' Class Coverage
#'
#' Compute the Class Coverage \insertCite{kim_powercore_2007}{EvaluateCore} to
#' compare the distribution frequencies of qualitative traits between entire
#' collection (EC) and core set (CS).
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return
#'
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
coverage.evaluate.core <- function(data, names, qualitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       qualitative = qualitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  cdiff <- chisquare.evaluate.core(data, names, qualitative,
                                   selected)

  coverage <- (sum(cdiff$CS_No.Classes/cdiff$EC_No.Classes)/length(quantitative)) * 100


  return(coverage)

}
