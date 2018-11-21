#' Interquartile Range
#'
#' Compute the Interquartile Range (IQR)
#' \insertCite{upton_general_1996}{EvaluateCore} to compare quantitative traits
#' of the entire collection (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats]{IQR}}
#'
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
iqr.evaluate.core <- function(data, names, quantitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  dataf <- data[, c(names, quantitative)]

  datafcore <- dataf[dataf[,names] %in% selected,]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)


  outdf <- data.frame(`Trait` = quantitative,
                      `EC_IQR` = unlist(lapply(dataf[dataf$`[Type]` == "EC", quantitative], IQR)),
                      `CS_IQR` = unlist(lapply(dataf[dataf$`[Type]` == "CS", quantitative], IQR)))
  return(outdf)
}
