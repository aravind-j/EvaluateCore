#' Box Plots
#'
#' Plot Box-and-Whisker plots
#' \insertCite{tukey_exploratory_1970,mcgill_variations_1978}{EvaluateCore} to
#' graphically compare the probability distributions of quantitative traits
#' between entire collection (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[graphics]{boxplot}}, \code{\link[ggplot2]{geom_boxplot}}
#'
#' @import ggplot2
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
#' box.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core)
#'
#'
box.evaluate.core <- function(data, names, quantitative, selected){
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

  quantitative2 <- paste("`", quantitative, "`", sep = "")

  for (i in seq_along(quantitative)) {

    # Generate the box plot
    outlist[[i]] <- ggplot(dataf, aes_string(y = quantitative2[i],
                                             x = "`[Type]`")) +
      geom_boxplot(fill = "lemonchiffon") +
      stat_summary(fun.y = mean, geom = "point",
                   shape = 18, size = 3, color = "red") +
      xlab("Collection") +
      ylab(quantitative[i]) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"))

  }

  return(outlist)

}
