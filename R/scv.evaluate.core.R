### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2023, ICAR-NBPGR.
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


#' Synthetic Variation Coefficient
#'
#' Compute the Synthetic Variation Coefficient
#' (\mjteqn{VR\\\%}{VR\\\\\\\%}{VR\%})
#' \insertCite{dong_exploration_1998,dong_genetic_2001}{EvaluateCore} to compare
#' quantitative traits of the entire collection (EC) and core set (CS).
#' \loadmathjax
#'
#' Synthetic Variation Coefficient (\mjteqn{VR\\\%}{VR\\\\\\\%}{VR\%})
#' \insertCite{dong_exploration_1998,dong_genetic_2001}{EvaluateCore} is
#' computed as follows for the core set (CS).
#'
#' \mjtdeqn{CV(\\\%) = \left ( \frac{1}{n} \sum_{i=1}^{n} \frac{SE_{i}}{\mu_{i}}
#' \right ) \times 100}{CV(\\\\\\\%) = \left ( \frac{1}{n} \sum_{i=1}^{n}
#' \frac{SE_{j}}{\mu_{i}}  \right ) \times 100}{CV(\%) = \left ( \frac{1}{n}
#' \sum_{i=1}^{n} \frac{SE_{j}}{\mu_{i}}  \right ) \times 100}
#'
#' Where, \mjseqn{SE_{i}} is the standard error of the \mjseqn{i}th trait,
#' \mjseqn{\mu_{i}} is the mean of the \mjseqn{i}th trait and \mjseqn{n} is the
#' total number of traits.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return The Variance of Phenotypic Frequency values for EC and CS
#'
#' @import mathjaxr
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
#'                       function(x) factor(as.factor(x)))
#'
#' scv.evaluate.core(data = ec, names = "genotypes",
#'                   quantitative = quant, selected = core)
#'
scv.evaluate.core <- function(data, names, quantitative, selected) {
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

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  scv_ec <- lapply(dataf[dataf$`[Type]` == "EC", quantitative],
                function(x) sd(x) / sqrt(length(x)))
  scv_ec <- unlist(scv_ec)
  scv_ec <- mean(scv_ec) * 100

  scv_cs <- lapply(dataf[dataf$`[Type]` == "CS", quantitative],
                function(x) sd(x) / sqrt(length(x)))
  scv_cs <- unlist(scv_cs)
  scv_cs <- mean(scv_cs) * 100

  return(c(EC_SCV = scv_ec, CS_SCV = scv_cs))
}
