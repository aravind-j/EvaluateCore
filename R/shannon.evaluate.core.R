### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018, ICAR-NBPGR.
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


#' Shannon-Weaver Diversity Index
#'
#' Compute the Shannon-Weaver Diversity Index
#' (\ifelse{html}{\out{<i>H'</i>}}{\eqn{H'}}), Maximum diversity
#' (\ifelse{html}{\out{<i>H'<sub>max</sub></i>}}{\eqn{H'_{max}}}) and Shannon
#' Equitability Index (\ifelse{html}{\out{<i>E<sub>H</sub></i>}}{\eqn{E_{H}}})
#' \insertCite{shannon_mathematical_1949}{EvaluateCore} to compare the
#' phenotypic diversity for qualitative traits between entire collection (EC)
#' and core set (CS).
#'
#' Shannon-Weaver Diversity Index (\ifelse{html}{\out{<i>H'</i>}}{\eqn{H'}}) is
#' computed as follows.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>H' = &minus;
#' &sum;<sup>k</sup><sub style="line-height: 1.8; margin-left: -1ex;">i=1</sub>
#' p<sub>i</sub>log(p<sub>i</sub>)</em></p>}}{\deqn{H' =
#' -\sum_{i=1}^{k}p_{i}log(p_{i})}}
#'
#' Where \ifelse{html}{\out{<em>p<sub>i</sub></em>}}{\eqn{p_{i}}} denotes the
#' proportion in the group \ifelse{html}{\out{<em>k</em>}}{\eqn{k}}.
#'
#' The maximum value of the index
#' (\ifelse{html}{\out{<em>H'<sub>max</sub></em>}}{\eqn{H'_{max}}}) is
#' \ifelse{html}{\out{ln(<em>k</em>)}}{\eqn{\ln(k)}}. This value occurs when
#' each group has the same frequency.
#'
#' The Shannon equitability index
#' (\ifelse{html}{\out{<i>E<sub>H</sub></i>}}{\eqn{E_{H}}}) is the Shannon
#' diversity index divided by the maximum diversity.
#'
#' \ifelse{html}{\out{<em><p style="text-align: center;"><em>E<sub>H</sub> =
#' <sup>H</sup></em> &frasl; <sub>ln(<em>k</em>)</sub></p></em>}}{\deqn{E_{H} =
#' \frac{H}{\ln{(k)}}}}
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return A data frame with the following columns. \item{Trait}{The qualitative
#'   trait.} \item{EC_H}{The Shannon-Weaver Diversity Index
#'   (\ifelse{html}{\out{<i>H'</i>}}{\eqn{H'}}) for EC.} \item{EC_H}{The
#'   Shannon-Weaver Diversity Index (\ifelse{html}{\out{<i>H'</i>}}{\eqn{H'}})
#'   for CS.} \item{EC_Hmax}{The Maximum diversity value
#'   (\ifelse{html}{\out{<i>H'<sub>max</sub></i>}}{\eqn{H'_{max}}}) for EC.}
#'   \item{CS_Hmax}{The Maximum diversity value
#' (\ifelse{html}{\out{<i>H'<sub>max</sub></i>}}{\eqn{H'_{max}}}) for CS.}
#' \item{EC_EH}{The Shannon Equitability Index
#' (\ifelse{html}{\out{<i>E<sub>H</sub></i>}}{\eqn{E_{H}}}) for EC.} \item{CS_EH}{The Shannon
#' Equitability Index (\ifelse{html}{\out{<i>E<sub>H</sub></i>}}{\eqn{E_{H}}}) for CS.}
#'
#' @seealso \code{\link[psych:misc]{shannon}}
#'
#' @importFrom psych shannon
#' @importFrom dplyr bind_rows
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
#' shannon.evaluate.core(data = ec, names = "genotypes",
#'                       qualitative = qual, selected = core)
#'
#'
shannon.evaluate.core <- function(data, names, qualitative, selected){
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

  # dataf[, qualitative] <- lapply(dataf[, qualitative], as.integer)

  EC_H <- psych::shannon(dataf[dataf$`[Type]` == "EC",
                               !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = FALSE)
  CS_H <- psych::shannon(dataf[dataf$`[Type]` == "CS",
                               !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = FALSE)

  EC_EH <- psych::shannon(dataf[dataf$`[Type]` == "EC",
                                !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = TRUE)
  CS_EH <- psych::shannon(dataf[dataf$`[Type]` == "CS",
                                !colnames(dataf) %in% c(names, "[Type]")],
                          base =  exp(1), correct = TRUE)

  EC_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "EC",
                                       !colnames(dataf) %in% c(names,
                                                               "[Type]")],
                          function(x) length(levels(droplevels(x)))))
  CS_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "CS",
                                       !colnames(dataf) %in% c(names,
                                                               "[Type]")],
                          function(x) length(levels(droplevels(x)))))

  outdf <- cbind(EC_H = EC_H[qualitative],
                 CS_H = CS_H[qualitative],
                 EC_Hmax = log(EC_No.Classes[qualitative]),
                 CS_Hmax = log(CS_No.Classes[qualitative]),
                 EC_EH = EC_EH[qualitative],
                 CS_EH = CS_EH[qualitative])
  outdf <- data.frame(outdf)

  outdf$Trait <- rownames(outdf)
  rownames(outdf) <- NULL
  cols <- setdiff(colnames(outdf), "Trait")
  outdf <- outdf[, c("Trait", cols)]

  return(outdf)

}
