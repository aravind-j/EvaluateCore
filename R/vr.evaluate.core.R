### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2020, ICAR-NBPGR.
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


#' Variable Rate of Coefficient of Variation
#'
#' Compute the Variable Rate of Coefficient of Variation
#' (\ifelse{html}{\out{<em>VR</em>}}{\eqn{VR}})
#' \insertCite{hu_methods_2000}{EvaluateCore} to compare quantitative traits of
#' the entire collection (EC) and core set (CS).
#'
#' The Variable Rate of Coefficient of Variation
#' (\ifelse{html}{\out{<em>VR</em>}}{\eqn{VR}}) is computed as follows.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>VR = <big>(</big>
#' <sup>1</sup>&frasl;<sub>n</sub> &sum;<sup>n</sup><sub style="line-height:
#' 1.8; margin-left: -1ex;">i=1</sub> <big>[</big>
#' <sup>CV<sub>CS<sub>i</sub></sup> &frasl; <sub>CV<sub>EC<sub>i</sub></sub>
#' <big>]</big><big>)</big> &times; 100</em></p>}}{\deqn{VR = \left (
#' \frac{1}{n} \sum_{i=1}^{n} \frac{CV_{CS_{i}}}{CV_{EC_{i}}} \right ) \times
#' 100}}
#'
#' Where,
#' \ifelse{html}{\out{<em>CV<sub>CS<sub>i</sub></sub></em>}}{\eqn{CV_{CS_{i}}}}
#' is the coefficients of variation for the
#' \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th trait in the CS,
#' \ifelse{html}{\out{<em>CV<sub>EC<sub>i</sub></sub></em>}}{\eqn{CV_{EC_{i}}}}
#' is the coefficients of variation for the
#' \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th trait in the EC and
#' \ifelse{html}{\out{<em>n</em>}}{\eqn{n}} is the total number of traits
#'
#' @inheritParams snk.evaluate.core
#'
#' @return The \ifelse{html}{\out{<em>VR</em>}}{\eqn{VR}} value.
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
#' vr.evaluate.core(data = ec, names = "genotypes",
#'                  quantitative = quant, selected = core)
#'
#'
vr.evaluate.core <- function(data, names, quantitative, selected) {
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  vdiff <- levene.evaluate.core(data, names, quantitative,
                                selected)

  VR <- (sum(vdiff$CS_CV / vdiff$EC_CV) / length(quantitative)) * 100

  return(VR)

}
