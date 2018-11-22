#' Chi-squared Test for Homogenity
#'
#' Compare the distribution frequencies of qualitative traits between entire
#' collection (EC) and core set (CS) by Chi-squared test for homogenity
#' \insertCite{pearson_x._1900,snedecor_chi-square_1933}{EvaluateCore}.
#'
#' @inheritParams snk.evaluate.core
#' @param qualitative Name of columns with the qualitative traits as a character
#'   vector.
#'
#' @return
#'
#' @seealso \code{\link[stats]{chisq.test}}
#'
#' @importFrom dplyr bind_rows
#' @importFrom stats chisq.test
#' @importFrom stats pchisq
#'
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
chisquare.evaluate.core <- function(data, names, qualitative, selected){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       qualitative = qualitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  dataf <- data[, c(names, qualitative)]

  datafcore <- dataf[dataf[,names] %in% selected,]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  outdf <- vector(mode = "list", length = length(qualitative))
  names(outdf) <- qualitative

  for (i in seq_along(qualitative)) {

    chiout <- stats::chisq.test(dataf$`[Type]`, dataf[, qualitative[i]],
                         simulate.p.value = TRUE, B = 10000)
    ECclasses <- as.data.frame(table((dataf[dataf$`[Type]` == "EC", qualitative[i]])))
    CSclasses <- as.data.frame(table((dataf[dataf$`[Type]` == "CS", qualitative[i]])))
    ECclasses$classfreq <- paste(ECclasses$Var1, "(", ECclasses$Freq, ")",
                                 sep = "")
    CSclasses$classfreq <- paste(CSclasses$Var1, "(", CSclasses$Freq, ")",
                                 sep = "")
    outdf[[qualitative[i]]] <- data.frame(`Trait` = qualitative[i],
                                          `EC_No.Classes` = length(levels(droplevels(dataf[dataf$`[Type]` == "EC", qualitative[i]]))),
                                          `EC_Classes` = paste(ECclasses$classfreq, collapse = "; "),
                                          `CS_No.Classes` = length(levels(droplevels(dataf[dataf$`[Type]` == "CS", qualitative[i]]))),
                                          `CS_Classes` = paste(CSclasses$classfreq, collapse = "; "),
                                          `chisq_statistic` = chiout$statistic,
                                          `chisq_pvalue` = chiout$p.value,
                                           stringsAsFactors = F)
    rm(chiout, ECclasses, CSclasses)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$chisq_significance <- ifelse(outdf$chisq_pvalue <= 0.01, "**",
                                      ifelse(outdf$chisq_pvalue <= 0.05, "*", "ns"))



  return(outdf)

}
