#' Principal Component Analysis
#'
#' Compute Principal Component Analysis Statistics
#' \insertCite{mardia_multivariate_1979}{EvaluateCore} to compare the
#' probability distributions of quantitative traits between entire collection
#' (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#' @inheritParams base::scale
#' @param npc.plot The number of principal components for which eigen values are
#'   to be plotted. The default value is 6.
#'
#' @return
#'
#' @seealso \code{\link[stats]{prcomp}}
#'
#' @importFrom stats prcomp
#' @importFrom reshape2 melt
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
#' pca.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core,
#'                   center = TRUE, scale = TRUE, npc.plot = 4)
#'
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
