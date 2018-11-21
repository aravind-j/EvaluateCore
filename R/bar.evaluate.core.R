#' Bar Plots
#'
#' Plot Bar plots to graphically compare the frequency distributions of
#' qualitative traits between entire collection (EC) and core set (CS).
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[graphics]{barplot}}, \code{\link[ggplot2]{geom_bar}}
#'
#' @import ggplot2
#' @export
#'
#' @examples
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
