#' Class Coverage
#'
#' Compute the Class Coverage \insertCite{kim_powercore:_2007}{EvaluateCore} to
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
#' coverage.evaluate.core(data = ec, names = "genotypes",
#'                        qualitative = qual, selected = core)
#'
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

  coverage <- (sum(cdiff$CS_No.Classes/cdiff$EC_No.Classes)/length(qualitative)) * 100


  return(coverage)

}
