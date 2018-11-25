#' Distance Measures
#'
#' Compute Average entry-to-nearest-entry distance, Average
#' accession-to-nearest-entry distance and Average entry-to-entry distance
#' \insertCite{odong_quality_2013}{EvaluateCore} to evaluate a core set (CS)
#' selected from an entire collection (EC).
#'
#' This function is a wrapper around the \code{\link[corehunter]{evaluateCore}}
#' function of the \code{\link[corehunter]{corehunter}} package.
#'
#' @inheritParams snk.evaluate.core
#' @inheritParams chisquare.evaluate.core
#'
#' @return
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @seealso \code{\link[corehunter]{evaluateCore}}
#'
#' @importFrom corehunter evaluateCore
#' @importFrom corehunter phenotypes
#' @importFrom corehunter objective
#' @export
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
#' dist.evaluate.core(data = ec, names = "genotypes", quantitative = quant,
#'                    qualitative = qual, selected = core)
#'
#'
dist.evaluate.core <- function(data, names, quantitative, qualitative,
                               selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       qualitative = qualitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  traits <- c(quantitative, qualitative)
  # quantitative (RD); qualitative(NS)
  dtype <- c(rep("RD", length(quantitative)),
             rep("NS", length(qualitative)))

  dataf <- data[, c(names, traits)]
  rownames(dataf) <- dataf[, names]

  # Prep phenotype
  dataf <- corehunter::phenotypes(data = dataf[, c(quantitative, qualitative)],
                                  types = dtype)
  EN <- evaluateCore(core = selected, data = dataf,
                     objective = objective("EN", "GD"))
  AN <- evaluateCore(core = selected, data = dataf,
                     objective = objective("AN", "GD"))
  EE <- evaluateCore(core = selected, data = dataf,
                     objective = objective("EE", "GD"))

  outdf <- data.frame(`Average distance` = c("E-NE", "A-NE", "E-E"),
                     `Value` = c(EN, AN, EE))

  return(outdf)

}
