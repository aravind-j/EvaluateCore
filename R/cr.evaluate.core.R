### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2022, ICAR-NBPGR.
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


#' Coincidence Rate of Range
#'
#' Compute the following metrics to compare quantitative traits of the entire
#' collection (EC) and core set (CS). \itemize{\item{Coincidence Rate of Range
#' (\mjseqn{CR}) \insertCite{hu_methods_2000}{EvaluateCore} (originally
#' described by \insertCite{diwan_methods_1995}{EvaluateCore} as Mean range
#' ratio)} \item{Changeable Rate of Maximum (\mjseqn{CR_{\max}})
#' \insertCite{wang_assessment_2007}{EvaluateCore}} \item{Changeable Rate of
#' Minimum (\mjseqn{CR_{\min}}) \insertCite{wang_assessment_2007}{EvaluateCore}}
#' \item{Changeable Rate of Mean (\mjseqn{CR_{\mu}})
#' \insertCite{wang_assessment_2007}{EvaluateCore}} } \loadmathjax
#'
#' The Coincidence Rate of Range (\mjseqn{CR}) is computed as follows.
#'
#' \mjsdeqn{CR = \left ( \frac{1}{n} \sum_{i=1}^{n}
#' \frac{R_{CS_{i}}}{R_{EC_{i}}} \right ) \times 100}
#'
#' Where, \mjseqn{R_{CS_{i}}} is the range of the \mjseqn{i}th trait in the CS,
#' \mjseqn{R_{EC_{i}}} is the range of the \mjseqn{i}th trait in the EC and
#' \mjseqn{n} is the total number of traits.
#'
#' A representative CS should have a \mjseqn{CR} value no less than 70\%
#' \insertCite{diwan_methods_1995}{EvaluateCore} or 80\%
#' \insertCite{hu_methods_2000}{EvaluateCore}.
#'
#' The Changeable Rate of Maximum (\mjseqn{CR_{\max}}) is computed as follows.
#'
#' \mjsdeqn{CR_{\max} = \left ( \frac{1}{n} \sum_{i=1}^{n}
#' \frac{\max_{CS_{i}}}{\max_{EC_{i}}} \right ) \times 100}
#'
#' Where, \mjseqn{\max_{CS_{i}}} is the maximum value of the \mjseqn{i}th trait
#' in the CS, \mjseqn{\max_{EC_{i}}} is the maximum value of the \mjseqn{i}th
#' trait in the EC and \mjseqn{n} is the total number of traits.
#'
#' The Changeable Rate of Minimum (\mjseqn{CR_{\min}}) is computed as follows.
#'
#' \mjsdeqn{CR_{\min} = \left ( \frac{1}{n} \sum_{i=1}^{n}
#' \frac{\min_{CS_{i}}}{\min_{EC_{i}}} \right ) \times 100}
#'
#' Where, \mjseqn{\min_{CS_{i}}} is the minimum value of the \mjseqn{i}th trait
#' in the CS, \mjseqn{\min_{EC_{i}}} is the minimum value of the \mjseqn{i}th
#' trait in the EC and \mjseqn{n} is the total number of traits.
#'
#' The Changeable Rate of Mean (\mjseqn{CR_{\mu}}) is computed as follows.
#'
#' \mjsdeqn{CR_{\mu} = \left ( \frac{1}{n} \sum_{i=1}^{n}
#' \frac{\mu_{CS_{i}}}{\mu_{EC_{i}}} \right ) \times 100}
#'
#' Where, \mjseqn{\mu_{CS_{i}}} is the mean value of the \mjseqn{i}th trait in
#' the CS, \mjseqn{\mu_{EC_{i}}} is the mean value of the \mjseqn{i}th trait in
#' the EC and \mjseqn{n} is the total number of traits.
#'
#' @note \code{NaN} or \code{Inf} values for \mjsdeqn{CR_{\min}} occurs when the
#'   minimum values for some of the traits are zero.
#'
#' @inheritParams snk.evaluate.core
#'
#' @return The \mjseqn{CR} value.
#'
#' @seealso \code{\link[stats]{wilcox.test}}
#'
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
#' cr.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core)
#'
cr.evaluate.core <- function(data, names, quantitative, selected) {
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  mdiff <- snk.evaluate.core(data, names, quantitative,
                    selected)

  CR <- (sum((mdiff$CS_Max - mdiff$CS_Min) / (mdiff$EC_Max - mdiff$EC_Min)) /
           length(quantitative)) * 100

  CR_Max <- (sum(mdiff$CS_Max / mdiff$EC_Max) / length(quantitative)) * 100

  CR_Min <- (sum(mdiff$CS_Min / mdiff$EC_Min) / length(quantitative)) * 100

  CR_Mean <- (sum(mdiff$CS_Mean / mdiff$EC_Mean) / length(quantitative)) * 100

  out <- c(CR = CR, CR_Max = CR_Max, CR_Min = CR_Min, CR_Mean = CR_Mean)

  return(out)

}
