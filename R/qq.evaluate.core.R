### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2024, ICAR-NBPGR.
#
# EvaluateCore is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# EvaluateCore is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/


#' Quantile-Quantile Plots
#'
#' Plot Quantile-Quantile (QQ) plots
#' \insertCite{wilk_probability_1968}{EvaluateCore} to graphically compare the
#' probability distributions of quantitative traits between entire collection
#' (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#' @param annotate Adds the divergence/distance value between probability
#'   distributions of CS and EC as an annotation to the QQ plot. Either
#'   \code{"none"} (no annotation (Default)) or \code{"kl"} (Kullback-Leibler
#'   divergence) or  \code{"ks"} (Kolmogorov-Smirnov distance) or  \code{"ad"}
#'   (Anderson-Darling distance).
#'
#' @return A list with the \code{ggplot} objects of QQ plots of CS vs EC for
#'   each trait specified as \code{quantitative}.
#'
#' @seealso \code{\link[stats:qqnorm]{qqplot}} \code{\link[entropy]{KL.plugin}},
#'   \code{\link[stats]{ks.test}}, \code{\link[kSamples]{ad.test}},
#'   \code{\link[EvaluateCore]{pdfdist.evaluate.core}}
#'
#' @import ggplot2
#' @import ggtext
#' @importFrom stats qqplot
#' @importFrom entropy KL.plugin
#' @importFrom entropy discretize
#' @importFrom stats ks.test
#' @importFrom kSamples ad.test
#' @importFrom grDevices nclass.FD
#' @export
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' data("cassava_CC")
#' data("cassava_EC")
#'
#' ec <- cbind(genotypes = rownames(cassava_EC), cassava_EC)
#' ec$genotypes <- as.character(ec$genotypes)
#' rownames(ec) <- NULL
#'
#' core <- rownames(cassava_CC)
#'
#' quant <- c("NMSR", "TTRN", "TFWSR", "TTRW", "TFWSS", "TTSW", "TTPW", "AVPW",
#'            "ARSR", "SRDM")
#' qual <- c("CUAL", "LNGS", "PTLC", "DSTA", "LFRT", "LBTEF", "CBTR", "NMLB",
#'           "ANGB", "CUAL9M", "LVC9M", "TNPR9M", "PL9M", "STRP", "STRC",
#'           "PSTR")
#'
#' ec[, qual] <- lapply(ec[, qual],
#'                      function(x) factor(as.factor(x)))
#'
#' qq.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core)
#'
#' qq.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core, annotate = "kl")
#'
#' qq.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core, annotate = "ks")
#'
#' qq.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core, annotate = "ad")
#'
qq.evaluate.core <- function(data, names, quantitative, selected,
                             annotate = c("none", "kl", "ks", "ad")) {
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  annotate <- match.arg(annotate)

  dataf <- data[, c(names, quantitative)]

  datafcore <- dataf[dataf[, names] %in% selected, ]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  avec <- vector(mode = "list", length = length(quantitative))
  names(avec) <- quantitative

  if (annotate != "none") {

    for (i in seq_along(quantitative)) {

      if (annotate == "kl") {
        # Kullback–Leibler distance
        nbinscs <- grDevices::nclass.FD(dataf[dataf$`[Type]` == "CS",
                                              quantitative[i]])
        rangeec <- range(dataf[dataf$`[Type]` == "EC", quantitative[i]])

        g1 <- entropy::discretize(dataf[dataf$`[Type]` == "EC",
                                        quantitative[i]],
                                  nbinscs, rangeec)
        g1[g1 == 0] <- 0.000000001 #Smoothing
        g2 <- entropy::discretize(dataf[dataf$`[Type]` == "CS",
                                        quantitative[i]],
                                  nbinscs, rangeec)
        g2[g2 == 0] <- 0.000000001 #Smoothing

        kl <- entropy::KL.plugin(g1, g2)

        avec[[i]] <- paste("<i>D<sub>KL</sub></i> = ",
                           round(kl, 3), sep = "")
        rm(nbinscs, g1, g2, kl)
      }

      if (annotate == "ks") {
        # Kolmogorov-Smirnov distance
        ks <- ks.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                      dataf[dataf$`[Type]` == "CS", quantitative[i]],
                      exact = FALSE)

        avec[[i]] <- paste("<i>D<sub>KS</sub></i> = ",
                           round(ks$statistic, 3), "<sup>",
                           ifelse(ks$p.value <= 0.01, "**",
                                  ifelse(ks$p.value <= 0.05, "*", "ns")),
                           "</sup>", sep = "")

      }

      if (annotate == "ad") {
        # Anderson-Darling distance
        ad <- kSamples::ad.test(dataf[dataf$`[Type]` == "EC", quantitative[i]],
                                dataf[dataf$`[Type]` == "CS", quantitative[i]],
                                dist = TRUE)

        avec[[i]] <- paste("<i><i>D<sub>AD</sub></i> = ",
                           round(ad$ad["version 1:", "AD"], 3), "<sup>",
                           ifelse(ad$ad["version 1:",
                                        " asympt. P-value"] <= 0.01, "**",
                                  ifelse(ad$ad["version 1:",
                                               " asympt. P-value"] <= 0.05,
                                         "*",
                                         "ns")),
                           "</sup>", sep = "")
      }
    }
  }


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
    outlist[[i]] <- ggplot(qqdf, aes(x = x, y = y)) +
      geom_point() +
      geom_abline(intercept = 0, slope = 1) +
      coord_fixed(ratio = 1, xlim = xylim, ylim = xylim) +
      xlab("Core Set") +
      ylab("Entire Collection") +
      ggtitle(quantitative[i]) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"))

    if (annotate != "none") {
      outlist[[i]] <- outlist[[i]] +
        geom_richtext(x = (.05 * diff(xylim)) + xylim[1],
                      y = (.85 * diff(xylim)) + xylim[1],
                      hjust = 0, size = 3,
                      label = avec[[quantitative[i]]], fill = NA,
                      label.color = NA,
                      label.padding = grid::unit(rep(0, 4), "pt"))
    }

    rm(xylim, qqdf)
  }


  return(outlist)

}
