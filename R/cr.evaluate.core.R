### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2021, ICAR-NBPGR.
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
#' Compute the Coincidence Rate of Range
#' (\ifelse{html}{\out{<em>CR</em>}}{\eqn{CR}})
#' \insertCite{diwan_methods_1995,hu_methods_2000}{EvaluateCore} to compare
#' quantitative traits of the entire collection (EC) and core set (CS).
#' \loadmathjax
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
#' cr.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core)
#'
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

  return(CR)

}
