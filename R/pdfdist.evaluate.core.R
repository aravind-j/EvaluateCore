#' Distance Between Probability Distributions
#'
#' Compute Kullback–Leibler, Kolmogorov-Smirnov and Anderson-Darling Distances
#' between the probability distributions of collection (EC) and core set (CS)
#' for quantitative traits.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[entropy]{KL.plugin}}, \code{\link[stats]{ks.test}},
#'   \code{\link[kSamples]{ad.test}}
#'
#' @importFrom entropy KL.plugin
#' @importFrom entropy discretize
#' @importFrom stats ks.test
#' @importFrom kSamples ad.test
#' @importFrom dplyr bind_rows
#' @export
#'
#' @examples
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
  nbinscs <- nclass.FD(dataf[dataf$`[Type]` == "CS", quantitative[i]])
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
