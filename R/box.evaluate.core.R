### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2025, ICAR-NBPGR.
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


#' Box Plots
#'
#' Plot Box-and-Whisker plots
#' \insertCite{tukey_exploratory_1970,mcgill_variations_1978}{EvaluateCore} to
#' graphically compare the probability distributions of quantitative traits
#' between entire collection (EC) and core set (CS).
#'
#' @inheritParams snk.evaluate.core
#' @param show.count logical. If \code{TRUE}, the accession count excluding
#'   missing values will also be displayed. Default is \code{FALSE}.
#'
#' @return A list with the \code{ggplot} objects of box plots of CS and EC for
#'   each trait specified as \code{quantitative}.
#'
#' @seealso \code{\link[graphics]{boxplot}}, \code{\link[ggplot2]{geom_boxplot}}
#'
#' @importFrom dplyr summarise n
#' @import ggplot2
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
#' box.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core)
#'
#' box.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core, show.count = TRUE)
#'
box.evaluate.core <- function(data, names, quantitative, selected,
                              show.count = FALSE) {
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  dataf <- data[, c(names, quantitative)]

  datafcore <- dataf[dataf[, names] %in% selected, ]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  outlist <- vector(mode = "list", length = length(quantitative))
  names(outlist) <- quantitative

  # quantitative2 <- paste("`", quantitative, "`", sep = "")

  for (i in seq_along(quantitative)) {

    if (show.count) {
      dataf_count <-
        dplyr::summarise(.data = dataf[!is.na(dataf[, quantitative[i]]),],
                         .by = c("[Type]"),
                         Count = dplyr::n(),
                         Mean = mean(get(quantitative[i]), na.rm = TRUE))
      dataf_count <- dataf_count[order(dataf_count$`[Type]`), ]
    }

    # Generate the box plot
    outlist[[i]] <- ggplot(dataf[!is.na(dataf[, quantitative[i]]), ],
                           aes(y = .data[[quantitative[i]]], x = `[Type]`)) +
      geom_boxplot(fill = "lemonchiffon") +
      stat_summary(fun = mean, geom = "point",
                   shape = 18, size = 3, color = "red", na.rm = TRUE) +
      xlab("Collection") +
      ylab(quantitative[i]) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"))

    if (show.count) {
      outlist[[i]] <-
        outlist[[i]] +
        scale_x_discrete(labels = paste(dataf_count$`[Type]`,
                                        "\n(n = ", dataf_count$Count, ")",
                                        sep = ""))
      rm(dataf_count)
    }

  }

  return(outlist)

}
