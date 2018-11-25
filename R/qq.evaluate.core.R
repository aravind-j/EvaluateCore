#' Quantile-Quantile Plots
#'
#' Plot Quantile-Quantile (QQ) plots
#' \insertCite{wilk_probability_1968}{EvaluateCore} to graphically compare the
#' probability distributions of quantitative traits between entire collection
#' (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[stats:qqnorm]{qqplot}}
#'
#' @import ggplot2
#' @importFrom stats qqplot
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
#' qq.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core)
#'
#'
qq.evaluate.core <- function(data, names, quantitative, selected){
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

  outlist <- vector(mode = "list", length = length(quantitative))
  names(outlist) <- quantitative

  for (i in seq_along(quantitative)) {
    # Create the quantile-quantile data table
    qqdf <- qqplot(x = dataf[dataf$`[Type]` == "CS", quantitative[i]],
                   y = dataf[dataf$`[Type]` == "EC", quantitative[i]],
                   plot.it = FALSE)
    qqdf <- as.data.frame(qqdf)

    # Set the x and y limits
    xylim <- range(c(qqdf$x, qqdf$y))

    # Generate the QQ plot
    outlist[[i]] <- ggplot(qqdf, aes( x = x, y = y)) +
      geom_point() +
      geom_abline(intercept = 0, slope = 1) +
      coord_fixed(ratio = 1, xlim = xylim, ylim = xylim) +
      xlab("Core Set") +
      ylab("Entire Collection") +
      ggtitle(quantitative[i]) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"))

    rm(xylim, qqdf)
  }


  return(outlist)

}
