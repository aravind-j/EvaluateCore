#' Box Plots
#'
#' Plot Box-and-Whisker plots to graphically compare the probability
#' distributions of quantitative traits between entire collection (EC) and core
#' set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[graphics]{boxplot}}
#'
#' @import ggplot2
#' @export
#'
#' @examples
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
    outlist[[i]] <- ggplot(dataf, aes_string(y = quantitative2[i], x = "`[Type]`")) +
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
