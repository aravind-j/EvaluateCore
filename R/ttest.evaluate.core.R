#' Student's t Test
#'
#' Test difference between means of entire collection (EC) and core set (CS) for
#' quantitative traits by Student's t test
#' \insertCite{student_probable_1908}{EvaluateCore}.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats]{t.test}}
#'
#' @importFrom stats t.test
#' @importFrom dplyr bind_rows
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
ttest.evaluate.core <- function(data, names, quantitative, selected){
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

    tout <- t.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                  dataf[dataf$`[Type]` == "CS", quantitative[i]])

    outdf[[quantitative[i]]] <- data.frame(`Trait` = quantitative[i],
                                           `EC_Min` = min(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_Max` = max(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_Mean` = mean(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `EC_SE` = sd(dataf[dataf$`[Type]` == "EC", quantitative[i]])/sqrt(length(dataf[dataf$`[Type]` == "EC", quantitative[i]])),
                                           `CS_Min` = min(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_Max` = max(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_Mean` = mean(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `CS_SE` = sd(dataf[dataf$`[Type]` == "CS", quantitative[i]])/sqrt(length(dataf[dataf$`[Type]` == "CS", quantitative[i]])),
                                           `ttest_pvalue` = tout$p.value,
                                           stringsAsFactors = F)

    rm(tout)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$ttest_significance <- ifelse(outdf$ttest_pvalue <= 0.01, "**",
                                   ifelse(outdf$ttest_pvalue <= 0.05, "*", "ns"))

  return(outdf)

}
