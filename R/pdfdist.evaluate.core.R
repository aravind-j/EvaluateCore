#' Distance Between Probability Distributions
#'
#' Compute Kullback-Leibler
#' \insertCite{kullback_information_1951}{EvaluateCore}, Kolmogorov-Smirnov
#' \insertCite{kolmogorov_sulla_1933,smirnov_table_1948}{EvaluateCore} and
#' Anderson-Darling distances
#' \insertCite{anderson_asymptotic_1952}{EvaluateCore} between the probability
#' distributions of collection (EC) and core set (CS) for quantitative traits.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return A data frame with the following columns. \item{Trait}{The
#'   quantitative trait.} \item{KL_Distance}{The Kullback-Leibler distance
#'   \insertCite{kullback_information_1951}{EvaluateCore} between EC and CS.}
#'   \item{KS_Distance}{The Kolmogorov-Smirnov distance
#'   \insertCite{kolmogorov_sulla_1933,smirnov_table_1948}{EvaluateCore} between
#'   EC and CS.} \item{KS_pvalue}{The p value of the Kolmogorov-Smirnov distance.}
#'   \item{AD_Distance}{Anderson-Darling distance
#'   \insertCite{anderson_asymptotic_1952}{EvaluateCore} between EC and CS.}
#'   \item{AD_pvalue}{The p value of the Anderson-Darling distance.}
#'   \item{KS_significance}{The significance of the Kolmogorov-Smirnov distance (*: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.01; **: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.05; ns: p
#'   \ifelse{html}{\out{&gt;}}{\eqn{>}} 0.05).}
#'   \item{AD_pvalue}{The significance of the Anderson-Darling distance (*: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.01; **: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.05; ns: p
#'   \ifelse{html}{\out{&gt;}}{\eqn{>}} 0.05).}
#'
#' @seealso \code{\link[entropy]{KL.plugin}}, \code{\link[stats]{ks.test}},
#'   \code{\link[kSamples]{ad.test}}
#'
#' @importFrom entropy KL.plugin
#' @importFrom entropy discretize
#' @importFrom stats ks.test
#' @importFrom kSamples ad.test
#' @importFrom grDevices nclass.FD
#' @importFrom dplyr bind_rows
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
#' pdfdist.evaluate.core(data = ec, names = "genotypes",
#'                       quantitative = quant, selected = core)
#'
#'
pdfdist.evaluate.core <- function(data, names, quantitative, selected){
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

  outdf <- vector(mode = "list", length = length(quantitative))
  names(outdf) <- quantitative

  for (i in seq_along(quantitative)) {

  # Kullback–Leibler distance
  nbinscs <- grDevices::nclass.FD(dataf[dataf$`[Type]` == "CS",
                                        quantitative[i]])
  rangeec <- range(dataf[dataf$`[Type]` == "EC", quantitative[i]])

  g1 <- entropy::discretize(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                            nbinscs, rangeec)
  g1[g1==0] <- 0.000000001 #Smoothing
  g2 <- entropy::discretize(dataf[dataf$`[Type]` == "CS", quantitative[i]],
                            nbinscs, rangeec)
  g2[g2==0] <- 0.000000001 #Smoothing

  kl <- entropy::KL.plugin(g1, g2)

  # Kolmogorov-Smirnov distance
  ks <- ks.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                dataf[dataf$`[Type]` == "CS", quantitative[i]],
                exact = FALSE)

  # Anderson-Darling distance
  ad <- kSamples::ad.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                          dataf[dataf$`[Type]` == "CS", quantitative[i]],
                          dist = TRUE)

  outdf[[i]] <- data.frame(Trait = quantitative[i],
                   `KL_Distance` = kl,
                   `KS_Distance` = ks$statistic,
                   `KS_pvalue` = ks$p.value,
                   `AD_Distance` = ad$ad["version 1:", "AD"],
                   `AD_pvalue` = ad$ad["version 1:", " asympt. P-value"],
                    stringsAsFactors = FALSE)

  rm(nbinscs, g1, g2, kl)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$KS_significance <- ifelse(outdf$KS_pvalue <= 0.01, "**",
                                   ifelse(outdf$KS_pvalue <= 0.05, "*", "ns"))
  outdf$AD_significance <- ifelse(outdf$AD_pvalue <= 0.01, "**",
                                  ifelse(outdf$AD_pvalue <= 0.05, "*", "ns"))

  return(outdf)

}
