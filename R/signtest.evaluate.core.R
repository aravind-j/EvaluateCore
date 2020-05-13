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


#' Sign Test
#'
#' Test difference between means and variances of entire collection (EC) and
#' core set (CS) for quantitative traits by Sign test
#' (\ifelse{html}{\out{&plus;}}{\eqn{+}} versus
#' \ifelse{html}{\out{&minus;}}{\eqn{-}})
#' \insertCite{basigalup_development_1995,tai_core_2001}{EvaluateCore}.
#'
#' The test statistic for Sign test
#' (\ifelse{html}{\out{<em>&chi;<sup>2</sup></em>}}{\eqn{\chi^{2}}}) is computed
#' as follows.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>&chi;<sup>2</sup> =
#' <sup>(N<sub>1</sub> &minus; N<sub>2</sub>)<sup>2</sup></sup> &frasl;
#' <sub>(N<sub>1</sub> &plus; N<sub>2</sub>)</sub></em></p>}}{\deqn{\chi^{2} =
#' \frac{(N_{1}-N_{2})^{2}}{N_{1}+N_{2}}}}
#'
#' Where, where \ifelse{html}{\out{<em>N<sub>1</sub></em>}}{\eqn{N_{1}}} is the
#' number of variables for which the mean or variance of the CS is greater than
#' the mean or variance of the EC (number of
#' \ifelse{html}{\out{&plus;}}{\eqn{+}} signs);
#' \ifelse{html}{\out{<em>N<sub>2</sub></em>}}{\eqn{N_{2}}} is the number of
#' variables for which the mean or variance of the CS is less than the mean or
#' variance of the EC (number of \ifelse{html}{\out{&minus;}}{\eqn{-}} signs).
#' The value of \ifelse{html}{\out{<em>&chi;<sup>2</sup></em>}}{\eqn{\chi^{2}}}
#' is compared with a Chi-square distribution with 1 degree of freedom.
#'
#' @param data The data as a data frame object. The data frame should possess
#'   one row per individual and columns with the individual names and multiple
#'   trait/character data.
#' @param names Name of column with the individual names as a character string
#' @param quantitative Name of columns with the quantitative traits as a
#'   character vector.
#' @param selected Character vector with the names of individuals selected in
#'   core collection and present in the \code{names} column.
#'
#' @return A data frame with the following components. \item{Comparison}{The
#'   comparison measure.} \item{ChiSq}{The test statistic
#'   (\ifelse{html}{\out{<em>&chi;<sup>2</sup></em>}}{\eqn{\chi^{2}}}).}
#'   \item{p.value}{The p value for the test statistic.} \item{significance}{The
#'   significance of the test statistic (*: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.01; **: p
#'   \ifelse{html}{\out{&leq;}}{\eqn{\leq}} 0.05; ns: p
#'   \ifelse{html}{\out{&gt;}}{\eqn{>}} 0.05).}
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
#' signtest.evaluate.core(data = ec, names = "genotypes",
#'                        quantitative = quant, selected = core)
#'
#'
signtest.evaluate.core <- function(data, names, quantitative, selected) {
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
  vdiff <- levene.evaluate.core(data, names, quantitative,
                                selected)

  mn1 <- sum(mdiff$CS_Mean > mdiff$EC_Mean)
  mn2 <- sum(mdiff$CS_Mean < mdiff$EC_Mean)
  mteststat <- ((mn1 - mn2)^2) / (mn1 + mn2)

  vn1 <- sum(vdiff$CS_CV > vdiff$EC_CV)
  vn2 <- sum(vdiff$CS_CV < vdiff$EC_CV)
  vteststat <- ((vn1 - vn2)^2) / (vn1 + vn2)

  mpvalue <- pchisq(mteststat, df = 1, lower.tail = FALSE)

  vpvalue <- pchisq(vteststat, df = 1, lower.tail = FALSE)

  outdf <- data.frame(Comparison = c("Mean", "Variance"),
                      ChiSq = c(mteststat, vteststat),
                      p.value = c(mpvalue, vpvalue),
                      stringsAsFactors = FALSE, row.names = NULL)

  outdf$significance <- ifelse(outdf$p.value <= 0.01, "**",
         ifelse(outdf$p.value <= 0.05, "*", "ns"))

  return(outdf)

}
