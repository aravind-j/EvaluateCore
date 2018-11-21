#' Levene's Test
#'
#' Test for homogenity of variances of the entire collection (EC) and core set
#' (CS) for quantitative traits by Levene's test.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[car]{leveneTest}}
#'
#' @importFrom car leveneTest
#' @importFrom dplyr bind_rows
#' @export
#'
#' @examples
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
    formula <- as.formula(paste("`", quantitative[i], "` ~ `[Type]`", sep = ""))

    leveneout <- car::leveneTest(formula, data = dataf)

    outdf[[quantitative[i]]] <- data.frame(`Trait` = quantitative[i],
                                           `EC_CV` = sd(dataf[dataf$`[Type]` == "EC", quantitative[i]])/mean(dataf[dataf$`[Type]` == "EC", quantitative[i]]),
                                           `CS_CV` = sd(dataf[dataf$`[Type]` == "CS", quantitative[i]])/mean(dataf[dataf$`[Type]` == "CS", quantitative[i]]),
                                           `Levene_Fvalue` = leveneout["group", "F value"],
                                           `Levene_pvalue` = leveneout["group", "Pr(>F)"],
                                           stringsAsFactors = F)

    rm(leveneout, formula)
  }

  outdf <- dplyr::bind_rows(outdf)

  outdf$Levene_significance <- ifelse(outdf$Levene_pvalue <= 0.01, "**",
                                   ifelse(outdf$Levene_pvalue <= 0.05, "*", "ns"))

  # DescTools::LeveneTest(dataf[, quantitative[i]], dataf$`[Type]`)

  return(outdf)

}
