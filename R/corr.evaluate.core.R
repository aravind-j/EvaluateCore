#' Phenotypic Correlations
#'
#' Compute phenotypic correlations between traits to compare entire collection
#' (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#' @inheritParams chisquare.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats]{cor}}, \code{\link[ggcorrplot]{ggcorrplot}}
#'
#' @import ggcorrplot
#' @import ggplot2
#' @importFrom vegan mantel
#' @export
#'
#' @examples
#'
corr.evaluate.core <- function(data, names, quantitative, qualitative,
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

  dataf <- data[, c(names, quantitative, qualitative)]

  datafcore <- dataf[dataf[,names] %in% selected,]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  dataf[, qualitative] <- lapply(dataf[, qualitative],
                                 function(x) as.numeric(as.factor(x)))

  # EC corr
  #########
  eccorr <- cor(dataf[dataf$`[Type]` == "EC", c(quantitative, qualitative)])
  ecpmat <- ggcorrplot::cor_pmat(dataf[dataf$`[Type]` == "EC", c(quantitative, qualitative)])

  eccorrdf <- formatC(round(eccorr, 2), digits = 2, format = "f")
  eccorrdf[] <- paste0(eccorrdf,
                        ifelse(ecpmat < .01, "**",
                               ifelse(ecpmat < .05, "*", "")),
                        sep = "")

 # CS corr
  #########
  cscorr <- cor(dataf[dataf$`[Type]` == "CS", c(quantitative, qualitative)])
  cspmat <- ggcorrplot::cor_pmat(dataf[dataf$`[Type]` == "CS", c(quantitative, qualitative)])

  cscorrdf <- formatC(round(cscorr, 2), digits = 2, format = "f")
  cscorrdf[] <- paste0(cscorrdf,
                       ifelse(cspmat < .01, "**",
                              ifelse(cspmat < .05, "*", "")),
                       sep = "")

  # Combine
  #########
  corrdf <- eccorrdf
  corrdf[upper.tri(cscorrdf)] <- cscorrdf[upper.tri(cscorrdf)]
  diag(corrdf) <- NA

  corrdf <- data.frame(corrdf, stringsAsFactors = FALSE)


  corr <- eccorr
  corr[upper.tri(corr)] <- cscorr[upper.tri(cscorr)]
  diag(corr) <- NA

  pmat <- ecpmat
  pmat[upper.tri(pmat)] <- cspmat[upper.tri(cspmat)]
  diag(pmat) <- NA


  corrg <- ggcorrplot(corr, hc.order = FALSE, type = "full",
                      outline.color = "white", p.mat = pmat,
                      ggtheme = theme_bw, show.diag = TRUE,
                      lab = TRUE, legend.title = "Corr")
  corrg <- corrg +
    ggtitle("Below diagonal:EC\nAbove diagonal:CS")

  corrg <- corrg +
    theme(axis.text = element_text(colour = "black"))

 # lower tri - EC below diagonal
 # upper tri - CS above diagonal

  # Mantel test
  ##############

  mcorr <- vegan::mantel(eccorr, cscorr)

  outlist <- list(`Correlation Matrix` = corrdf,
                  `Correologram` = corrg,
                  `Mantel Correlation` = data.frame(r = mcorr$statistic,
                                                    p.value = mcorr$signif,
                                                    significance = ifelse(mcorr$signif <= 0.01, "**",
                                                                          ifelse(mcorr$signif <= 0.05, "*", "ns"))))


  return(outlist)

}
