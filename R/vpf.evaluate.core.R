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


#' Variance of Phenotypic Frequency
#'
#' Compute the Variance of Phenotypic Frequency (\mjseqn{VPF})
#' \insertCite{li_studies_2002}{EvaluateCore} to compare qualitative traits
#' between entire collection (EC) and core set (CS). \loadmathjax
#'
#' Variance of Phenotypic Frequency (\mjseqn{VPF})
#' \insertCite{li_studies_2002}{EvaluateCore} is computed as follows.
#'
#' \mjsdeqn{VPF = \frac{1}{n} \sum_{i=1}^{n}\left ( \frac{\sum_{j=1}^{k} (p_{ij}
#' - \overline{p_{i}})^{2}}{k - 1} \right )}
#'
#' Where, \mjseqn{p_{ij}} denotes the proportion/fraction/frequency of
#' accessions in the \mjseqn{i}th phenotypic class for the \mjseqn{i}th trait,
#' \mjseqn{\overline{p_{i}}} is the mean frequency of phenotypic classes for the
#' \mjseqn{i}th trait, \mjseqn{k} is the number of phenotypic classes for the
#' \mjseqn{i}th trait and \mjseqn{n} is the total number of traits.
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return The Variance of Phenotypic Frequency values for EC and CS.
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
#'                      function(x) factor(as.factor(x)))
#'
#' vpf.evaluate.core(data = ec, names = "genotypes",
#'                   qualitative = qual, selected = core)
#'
vpf.evaluate.core <- function(data, names, qualitative, selected,
                              na.omit = TRUE) {
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

  if (!na.omit) {
    dataf[, qualitative] <- lapply(dataf[, qualitative], function(x) {
      if (any(is.na(x))) {
        addNA(x)
      } else {
        x
      }
    })
  }

  vpf_ec <- lapply(dataf[dataf$`[Type]` == "EC", qualitative],
                pf_deviance)
  vpf_ec <- unlist(vpf_ec)
  vpf_ec <- sum(vpf_ec) / length(qualitative)

  vpf_cs <- lapply(dataf[dataf$`[Type]` == "CS", qualitative],
                   pf_deviance)
  vpf_cs <- unlist(vpf_cs)
  vpf_cs <- sum(vpf_cs) / length(qualitative)

  out <- c(EC_VPF = vpf_ec, CS_VPF = vpf_cs)

  return(out)

}

pf_deviance <- function(x) {

  x <- droplevels(x)

  count <- as.vector(table(x))
  total.count <- sum(count, na.rm = TRUE)

  k <- length(count)

  prob <- count / total.count

  sum(((prob - mean(prob)) ^ 2)) / (k - 1)

}
