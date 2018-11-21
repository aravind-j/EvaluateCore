#' Wilcoxon Rank Sum Test
#'
#' Compare the medians of quantitative traits between entire collection (EC) and
#' core set (CS) by Wilcoxon rank sum test or Mann-Whitney-Wilcoxon test or Mann-Whitney
#' U test.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats]{wilcox.test}}
#'
#' @importFrom stats wilcox.test
#' @importFrom dplyr bind_rows
#' @export
#'
#' @examples
#'
wilcox.evaluate.core <- function(data, names, quantitative, selected){
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
    wilcoxout <- wilcox.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                             dataf[dataf$`[Type]` == "CS", quantitative[i]],
                             alternative = "two.sided")

    outdf[[quantitative[i]]] <- data.frame(`Trait` = quantitative[i],
                                           `EC_Med` = median(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `CS_Med` = median(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `Wilcox_pvalue` = wilcoxout$p.value,
                                           stringsAsFactors = F)

    rm(wilcoxout)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$Wilcox_significance <- ifelse(outdf$Wilcox_pvalue <= 0.01, "**",
                                   ifelse(outdf$Wilcox_pvalue <= 0.05, "*", "ns"))

  return(outdf)

}
