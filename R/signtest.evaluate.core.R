#' Sign Test
#'
#' Test difference between means and variances of entire collection (EC) and
#' core set (CS) for quantitative traits by Sign test
#' \insertCite{basigalup_development_1995,tai_core_2001}{EvaluateCore}.
#'
#' @param data The data as a data frame object. The data frame should possess
#'   one row per individual and columns with the individual names and multiple
#'   trait/character data.
#' @param names Name of column with the individual names as a character string
#' @param quantitative Name of columns with the quantitative traits as a
#'   character vector.
#' @param selected Character vector with the names of individuals selected in
#'   core collection and present in the \code{names} column.
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
#' pdfdist.evaluate.core(data = ec, names = "genotypes",
#'                       quantitative = quant, selected = core)
#'
#'
signtest.evaluate.core <- function(data, names, quantitative, selected){
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
  vdiff <- levene.evaluate.core(data, names, quantitative,
                                selected)

  mn1 <- sum(mdiff$CS_Mean > mdiff$EC_Mean)
  mn2 <- sum(mdiff$CS_Mean < mdiff$EC_Mean)
  mteststat <- ((mn1 - mn2)^2)/(mn1 + mn2)

  vn1 <- sum(vdiff$CS_CV > vdiff$EC_CV)
  vn2 <- sum(vdiff$CS_CV < vdiff$EC_CV)
  vteststat <- ((vn1 - vn2)^2)/(vn1 + vn2)

  mpvalue <- pchisq(mteststat, df = 1, lower.tail = FALSE)

  vpvalue <- pchisq(vteststat, df = 1, lower.tail = FALSE)

  outdf <- data.frame(Comparison = c("Mean", "Variance"),
                      ChiSq = c(mteststat, vteststat),
                      p.value = c(mpvalue, vpvalue),
                      stringsAsFactors = F, row.names = NULL)

  outdf$significance <- ifelse(outdf$p.value <= 0.01, "**",
         ifelse(outdf$p.value <= 0.05, "*", "ns"))

  return(outdf)

}
