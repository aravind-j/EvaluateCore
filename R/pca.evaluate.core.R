#' Principal Component Analysis
#'
#' Plot Box-and-Whisker plots to graphically compare the probability
#' distributions of quantitative traits between entire collection (EC) and core
#' set (CS).
#'
#' @inheritParams snk.evaluate.core
#'
#' @return
#'
#' @seealso \code{\link[prcomp]{stats}}
#'
#' @importFrom stats prcomp
#' @importFrom reshape2 melt
#' @import ggplot2
#' @export
#'
#' @examples
#'
pca.evaluate.core <- function(data, names, quantitative, selected,
                              center = TRUE, scale = TRUE, npc.plot = 6){
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

  ecpca <- prcomp(dataf[dataf$`[Type]` == "EC", quantitative],
                  center = center, scale = scale)
  cspca <- prcomp(dataf[dataf$`[Type]` == "CS", quantitative],
                  center = center, scale = scale)

  # Rotation - loadings
  ecrot <- summary(ecpca)$rotation
  csrot <- summary(cspca)$rotation

  # Importance
  ecimp <- summary(ecpca)$importance
  csimp <- summary(cspca)$importance


  # Scree plot
  ecimp2 <- as.data.frame(t(ecimp))
  ecimp2$PC <- gsub("PC", "", rownames(ecimp2))
  ecimp2$Ty <- "EC"

  csimp2 <- as.data.frame(t(csimp))
  csimp2$PC <- gsub("PC", "", rownames(csimp2))
  csimp2$Ty <- "CS"

  PCAimp <- rbind(ecimp2, csimp2)
  rm(ecimp2, csimp2)
  PCAimp$PC <- as.numeric(PCAimp$PC)

  gscree <- ggplot(data = PCAimp, aes(y = `Proportion of Variance`,
                                              x = PC)) +
    geom_bar(stat = "identity", fill = "gray", colour = "black") +
    geom_line() +
    geom_point(colour = "red") +
    scale_x_continuous(breaks = 1:10) +
    ylab("Proporiton of variance") +
    xlab("Principal component") +
    facet_grid(rows = vars(Ty)) +
    theme_bw() +
    theme(axis.text = element_text(colour = "black"))

  # Rotation plot
  pc <- 3
  ecrot2 <- as.data.frame(ecrot[, 1:npc.plot])
  ecrot2$Trait <- rownames(ecrot2)
  ecrot2$Ty <- "EC"

  csrot2 <- as.data.frame(csrot[, 1:npc.plot])
  csrot2$Trait <- rownames(csrot2)
  csrot2$Ty <- "CS"

  PCArot <- rbind(ecrot2, csrot2)
  rm(ecrot2, csrot2)

  PCArot <- reshape2::melt(data = PCArot, id.vars = c("Trait", "Ty"))

  grot <- ggplot(data = PCArot, aes(x = value, y = Trait)) +
    geom_vline(xintercept=0, colour = "red") +
    geom_point() +
    geom_segment(aes(x = 0, xend = value, yend = Trait)) +
    theme_bw() +
    facet_grid(Ty~variable) +
    theme(axis.text = element_text(colour = "black"))

  outlist <- list(`EC PC Importance` = as.data.frame(ecimp),
                  `EC PC Loadings` = as.data.frame(ecrot),
                  `CS PC Importance` = as.data.frame(csimp),
                  `CS PC Loadings` = as.data.frame(csrot),
                  `Scree Plot` = gscree,
                  `PC Loadings Plot` = grot)

  return(outlist)

}
