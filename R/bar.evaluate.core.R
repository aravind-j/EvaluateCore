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


#' Bar Plots
#'
#' Plot Bar plots to graphically compare the frequency distributions of
#' qualitative traits between entire collection (EC) and core set (CS).
#'
#' @inheritParams chisquare.evaluate.core
#' @param na.omit logical. If \code{TRUE}, missing values (\code{NA}) are
#'   ignored and not included in the plot as a distinct factor level. Default is
#'   \code{TRUE}.
#' @param show.count logical. If \code{TRUE}, the accession count excluding
#'   missing values will also be displayed. Default is \code{FALSE}.
#'
#' @return A list with the \code{ggplot} objects of relative frequency bar plots
#'   of CS and EC for each trait specified as \code{qualitative}.
#'
#'
#' @seealso \code{\link[graphics]{barplot}}, \code{\link[ggplot2]{geom_bar}}
#'
#' @importFrom dplyr summarise n
#' @import ggplot2
#' @export
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
#' bar.evaluate.core(data = ec, names = "genotypes",
#'                   qualitative = qual, selected = core)
#' bar.evaluate.core(data = ec, names = "genotypes",
#'                   qualitative = qual, selected = core,
#'                   show.count = TRUE)
#'
bar.evaluate.core <- function(data, names, qualitative, selected,
                              na.omit = TRUE, show.count = FALSE) {
  # Checks
  checks.evaluate.core(data = data, names = names,
                       qualitative = qualitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  dataf <- data[, c(names, qualitative)]

  datafcore <- dataf[dataf[, names] %in% selected, ]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  outlist <- vector(mode = "list", length = length(qualitative))
  names(outlist) <- qualitative

  qualitative2 <- paste("`", qualitative, "`", sep = "")

  for (i in seq_along(qualitative)) {

    if (show.count) {

      dataf_type_levels <-  levels(dataf$`[Type]`)

      dataf_count <-
        dplyr::summarise(.data = dataf[!is.na(dataf[, qualitative[i]]),],
                         .by = c("[Type]"),
                         Count = dplyr::n())
      dataf_count <- dataf_count[order(dataf_count$`[Type]`), ]

      levels(dataf$`[Type]`) <- paste(dataf_count$`[Type]`,
                                      " (n = ", dataf_count$Count, ")",
                                      sep = "")

      rm(dataf_count)
    }

    if(na.omit) {
      outlist[[i]] <- ggplot(dataf[!is.na(dataf[, qualitative[i]]), ],
                             aes_string(qualitative2[i]))
    } else {
      outlist[[i]] <- ggplot(dataf, aes_string(qualitative2[i]))
    }

    # Generate the bar plot
    outlist[[i]] <- outlist[[i]] +
      geom_bar(aes(y = ..prop.., group = 1),
               fill = "gray80", colour = "black") +
      ylab("Relative frequency") +
      xlab(qualitative[i]) +
      facet_grid(~`[Type]`) +
      theme_bw() +
      theme(axis.text = element_text(colour = "black"),
            axis.text.x = element_text(angle = 45, hjust = 1))

    if (show.count) {
      levels(dataf$`[Type]`) <- dataf_type_levels
    }

  }

  return(outlist)

}
