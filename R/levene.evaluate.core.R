#' Levene's Test
#'
#' Test for homogenity of variances of the entire collection (EC) and core set
#' (CS) for quantitative traits by Levene's test
#' \insertCite{levene_robust_1960}{EvaluateCore}.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return A data frame with the following columns \item{Trait}{The quantitative
#'   trait.} \item{EC_V}{The variance of the EC.} \item{CS_V}{The variance of
#'   the CS.} \item{EC_CV}{The coefficient of variance of the EC.}
#'   \item{CS_CV}{The coefficient of variance of the CS.}
#'   \item{Levene_Fvalue}{The test statistic.} \item{Levene_pvalue}{The p value
#'   for the test statistic.} \item{Levene_significance}{The significance of the
#'   test statistic (*: p \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.01; **: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.05; ns: p
#'   \ifelse{html}{\out{&gt;}}{\eqn{>}} 0.05).}
#'
#' @seealso \code{\link[car]{leveneTest}}
#'
#' @importFrom car leveneTest
#' @importFrom dplyr bind_rows
#' @importFrom stats formula
#' @importFrom stats sd
#' @importFrom stats var
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
#' levene.evaluate.core(data = ec, names = "genotypes",
#'                      quantitative = quant, selected = core)
#'
#'
levene.evaluate.core <- function(data, names, quantitative, selected){
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

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  outdf <- vector(mode = "list", length = length(quantitative))
  names(outdf) <- quantitative

  for (i in seq_along(quantitative)) {
    frmla <- stats::formula(paste("`", quantitative[i], "` ~ `[Type]`", sep = ""))

    leveneout <- car::leveneTest(frmla, data = dataf)

    outdf[[quantitative[i]]] <- data.frame(`Trait` = quantitative[i],
                                           `EC_V` = stats::var(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `CS_V` = stats::var(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `EC_CV` = stats::sd(dataf[dataf$`[Type]` == "EC", quantitative[i]])/mean(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `CS_CV` = stats::sd(dataf[dataf$`[Type]` == "CS", quantitative[i]])/mean(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `Levene_Fvalue` = leveneout["group", "F value"],
                                           `Levene_pvalue` = leveneout["group", "Pr(>F)"],
                                           stringsAsFactors = FALSE)

    rm(leveneout, frmla)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$Levene_significance <- ifelse(outdf$Levene_pvalue <= 0.01, "**",
                                   ifelse(outdf$Levene_pvalue <= 0.05, "*",
                                          "ns"))

  # DescTools::LeveneTest(dataf[, quantitative[i]], dataf$`[Type]`)

  return(outdf)

}
