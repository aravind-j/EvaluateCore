#' Student-Newman-Keuls Test
#'
#' Test difference between means of entire collection (EC) and core set (CS) for
#' quantitative traits by Newman-Keuls or Student-Newman-Keuls test
#' \insertCite{newman_distribution_1939,keuls_use_1952}{EvaluateCore}.
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
#' @return A data frame with the following components. \item{Trait}{The
#'   quantitative trait.} \item{EC_Min}{The minimum value of the trait in EC.}
#'   \item{EC_Max}{The maximum value of the trait in EC.} \item{EC_Mean}{The
#'   mean value of the trait in EC.} \item{EC_SE}{The standard error of the
#'   trait in EC.} \item{CS_Min}{The minimum value of the trait in CS.}
#'   \item{CS_Max}{The maximum value of the trait in CS.} \item{CS_Mean}{The
#'   mean value of the trait in CS.} \item{CS_SE}{The standard error of the
#'   trait in CS.} \item{SNK_pvalue}{The p value of the Student-Newman-Keuls
#'   test for equality of means of EC and CS.} \item{SNK_significance}{The
#'   significance of the Student-Newman-Keuls test for equality of means of EC
#'   and CS.}
#'
#' @seealso \code{\link[agricolae]{SNK.test}}
#'
#' @importFrom agricolae SNK.test
#' @importFrom dplyr bind_rows
#' @importFrom stats formula
#' @importFrom stats aov
#' @importFrom stats sd
#' @importFrom Rdpack reprompt
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
#' snk.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core)
#'
#'
snk.evaluate.core <- function(data, names, quantitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                      quantitative = quantitative,
                      selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  dataf <- data[, c(names, quantitative)]

  datafcore <- dataf[dataf[, names] %in% selected, ]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  outdf <- vector(mode = "list", length = length(quantitative))
  names(outdf) <- quantitative

  for (i in seq_along(quantitative)) {
    frmla <- stats::formula(paste("`", quantitative[i], "` ~ `[Type]`",
                                       sep = ""))
    model <- stats::aov(frmla, data = dataf)
    snkout <- agricolae::SNK.test(model, "[Type]", group = FALSE,
                                  console = FALSE)
    snkpvalue <- snkout$comparison$pvalue

    # out <- mutoss::snk(frmla, data = dataf,
    #                    alpha=0.05, MSE=NULL, df = NULL, silent = FALSE)
    # out <- t.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
    #               dataf[dataf$`[Type]` == "CS", quantitative[i]])

    outdf[[quantitative[i]]] <- data.frame(`Trait` = quantitative[i],
                                           `EC_Min` = min(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_Max` = max(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_Mean` = mean(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_SE` = stats::sd(dataf[dataf$`[Type]` == "EC", quantitative[i]]) / sqrt(length(dataf[dataf$`[Type]` == "EC", quantitative[i]])),
                                           `CS_Min` = min(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_Max` = max(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_Mean` = mean(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_SE` = stats::sd(dataf[dataf$`[Type]` == "CS", quantitative[i]]) / sqrt(length(dataf[dataf$`[Type]` == "CS", quantitative[i]])),
                                           `SNK_pvalue` = snkpvalue,
                                           stringsAsFactors = FALSE)

    rm(snkout, snkpvalue, frmla, model)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$SNK_significance <- ifelse(outdf$SNK_pvalue <= 0.01, "**",
                                   ifelse(outdf$SNK_pvalue <= 0.05, "*", "ns"))

  return(outdf)

}
