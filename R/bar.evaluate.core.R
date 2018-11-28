#' Bar Plots
#'
#' Plot Bar plots to graphically compare the frequency distributions of
#' qualitative traits between entire collection (EC) and core set (CS).
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return A list with the \code{ggplot} objects of relative frequency bar plots
#'   of CS and EC for each trait specified as \code{qualitative}.
#'
#'
#' @seealso \code{\link[graphics]{barplot}}, \code{\link[ggplot2]{geom_bar}}
#'
#' @import ggplot2
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
#' bar.evaluate.core(data = ec, names = "genotypes",
#'                   qualitative = qual, selected = core)
#'
#'
bar.evaluate.core <- function(data, names, qualitative, selected){
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

  outlist <- vector(mode = "list", length = length(qualitative))
  names(outlist) <- qualitative

  qualitative2 <- paste("`", qualitative, "`", sep = "")

  for (i in seq_along(qualitative)) {

    # Generate the bar plot
    outlist[[i]] <- ggplot(dataf, aes_string(qualitative2[i])) +
      geom_bar(aes(y = ..prop.., group = 1),
               fill = "gray80", colour = "black") +
      ylab("Relative frequncy") +
      xlab(qualitative[i]) +
      facet_grid(~`[Type]`) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"))

  }

  return(outlist)

}
