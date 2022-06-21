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


#' Diversity Indices
#'
#' Compute the following diversity indices to compare the phenotypic diversity
#' for qualitative traits between entire collection (EC) and core set (CS).
#' \itemize{ \item{Simpson's Index (\mjseqn{D})
#' \insertCite{simpson_measurement_1949}{EvaluateCore}} \item{Nei's Diversity
#' Index or Nei's Variation Index or Simpson's Index of Diversity or Gini's
#' Diversity Index or Gini-Simpson Index (\mjseqn{H})
#' \insertCite{gini_variabilita_1912,gini_variabilita_1912-2,nei_analysis_1973}{EvaluateCore}}
#' \item{Maximum Nei's Diversity/Variation Index or Maximum Simpson's Index of
#' Diversity (\mjseqn{H_{max}})
#' \insertCite{hennink_interpretation_1990}{EvaluateCore}} \item{Simpson's
#' Reciprocal Index (\mjseqn{D_{R}})
#' \insertCite{hennink_interpretation_1990}{EvaluateCore}} \item{Relative Nei's
#' Diversity/Variation Index or Relative Simpson's Index of Diversity
#' (\mjseqn{H'}) \insertCite{hennink_interpretation_1990}{EvaluateCore}}
#' \item{Shannon or Shannon-Weaver or Shannon-Weiner Diversity Index
#' (\mjseqn{I}) \insertCite{shannon_mathematical_1949}{EvaluateCore}}
#' \item{Maximum Shannon-Weaver Diversity Index (\mjseqn{I_{max}})
#' \insertCite{hennink_interpretation_1990}{EvaluateCore}} \item{Relative
#' Shannon-Weaver Diversity Index or Shannon Equitability Index (\mjseqn{I'})
#' \insertCite{hennink_interpretation_1990}{EvaluateCore}} \item{McIntosh
#' Diversity Index (\mjseqn{D_{Mc}})
#' \insertCite{mcintosh_index_1967}{EvaluateCore}} } \loadmathjax
#'
#' Simpson's index (\mjseqn{D}) which estimates the probability that two
#' accessions randomly selected will belong to the same phenotypic class of a
#' trait, is computed as follows
#' \insertCite{simpson_measurement_1949}{EvaluateCore}.
#'
#' \mjsdeqn{D = \sum_{i = 1}^{k}p_{i}^{2}}
#'
#' Where, \mjseqn{p_{i}} denotes the proportion/fraction/frequency of accessions
#' in the \mjseqn{i}th phenotypic class for a trait and \mjseqn{k} is the number
#' of phenotypic classes for the trait.
#'
#' The value of \mjseqn{D} can range from 0 to 1 with 0 representing maximum
#' diversity and 1, no diversity.
#'
#' \mjseqn{D} is subtracted from 1 to give Nei's diversity index or Nei's
#' variation index or Simpson's index of diversity or Gini's diversity index or
#' Gini-Simpson index \mjseqn{H}. Greater the value of \mjseqn{H}, greater the
#' diversity
#' \insertCite{gini_variabilita_1912,gini_variabilita_1912-2,nei_analysis_1973}{EvaluateCore}
#' with a range from 0 to 1.
#'
#' \mjsdeqn{H = 1 - D}
#'
#' The maximum value of \mjseqn{H}, \mjseqn{H_{max}} occurs when accessions are
#' uniformly distributed across the phenotypic classes and is computed as
#' follows \insertCite{hennink_interpretation_1990}{EvaluateCore}.
#'
#' \mjsdeqn{H_{max} = 1 - \frac{1}{k}}
#'
#' Reciprocal of \mjseqn{D} gives the Simpson's reciprocal index
#' (\mjseqn{D_{R}}) \insertCite{hennink_interpretation_1990}{EvaluateCore} and
#' can range from 1 to \mjseqn{k}.
#'
#' \mjsdeqn{D_{R} = \frac{1}{D}}
#'
#' Relative Nei's diversity/variation index or Relative Simpson's index of
#' diversity (\mjseqn{H'})
#' \insertCite{hennink_interpretation_1990}{EvaluateCore} is defined as follows.
#'
#' \mjsdeqn{H' = \frac{H}{H_{max}}}
#'
#' An index of information \mjseqn{I}, was described by
#' \insertCite{shannon_mathematical_1949;textual}{EvaluateCore} as follows.
#'
#' \mjsdeqn{I = -\sum_{i=1}^{k}p_{i} \log_{2}(p_{i})}
#'
#' \mjseqn{I} is described as Shannon or Shannon-Weaver or Shannon-Weiner
#' diversity index in literature.
#'
#' Alternatively, \mjseqn{I} is also computed using natural logarithm instead of
#' logarithm to base 2.
#'
#' \mjsdeqn{I = -\sum_{i=1}^{k}p_{i} \ln(p_{i})}
#'
#' The maximum value of \mjseqn{I} (\mjseqn{I_{max}}) is \mjseqn{\ln(k)}. This
#' value occurs when each phenotypic class for a trait has the same proportion
#' of accessions.
#'
#' \mjsdeqn{I_{max} = \log_{2}(k)} OR \mjsdeqn{I_{max} = \ln(k)}
#'
#' The relative Shannon-Weaver diversity index or Shannon equitability index
#' (\mjseqn{I'}) is the Shannon diversity index (\mjseqn{I}) divided by the
#' maximum diversity (\mjseqn{I_{max}}).
#'
#' \mjsdeqn{I' = \frac{I}{I_{max}}}
#'
#' A similar index of diversity was described by
#' \insertCite{mcintosh_index_1967;textual}{EvaluateCore} as follows
#' (\mjseqn{D_{Mc}}).
#'
#' \mjsdeqn{D_{Mc} = \frac{N - \sqrt{\sum_{i=1}^{k}n_{i}^2}}{N - \sqrt{N}}}
#'
#' Where, \mjseqn{n_{i}} denotes the number of accessions in the \mjseqn{i}th
#' phenotypic class for a trait and \mjseqn{N} is the total number of accessions
#' so that \mjseqn{p_{i} = {n_{i}}/{N}}.
#'
#' @inheritParams chisquare.evaluate.core
#'
#' @return A data frame with the following columns. \item{Trait}{The qualitative
#'   trait.} \item{EC_No.Classes}{The number of classes in the trait for EC.}
#'   \item{EC_D}{The Simpson's Index (\mjseqn{D}) for EC.} \item{EC_H}{Nei's
#'   Diversity Index (\mjseqn{H}) for EC.} \item{EC_H.max}{Maximum Nei's
#'   Diversity Index (\mjseqn{H_{max}}) for EC.} \item{EC_D.inv}{Simpson's
#'   Reciprocal Index (\mjseqn{D_{R}}) for EC.} \item{EC_H.rel}{Relative Nei's
#'   Diversity Index (\mjseqn{H'}) for EC.} \item{EC_I}{Shannon-Weaver Diversity
#'   Index (\mjseqn{I}) for EC.} \item{EC_I.max}{Maximum Shannon-Weaver
#'   Diversity Index (\mjseqn{I_{max}}) for EC.} \item{EC_I.rel}{Relative
#'   Shannon-Weaver Diversity Index (\mjseqn{I'}) for EC.}
#'   \item{EC_D.Mc}{McIntosh Diversity Index (\mjseqn{D_{Mc}}) for EC.}
#'   \item{CS_No.Classes}{The number of classes in the trait for CS.}
#'   \item{CS_D}{The Simpson's Index (\mjseqn{D}) for CS.} \item{CS_H}{Nei's
#'   Diversity Index (\mjseqn{H}) for CS.} \item{CS_H.max}{Maximum Nei's
#'   Diversity Index (\mjseqn{H_{max}}) for CS.} \item{CS_D.inv}{Simpson's
#'   Reciprocal Index (\mjseqn{D_{R}}) for CS.} \item{CS_H.rel}{Relative Nei's
#'   Diversity Index (\mjseqn{H'}) for CS.} \item{CS_I}{Shannon-Weaver Diversity
#'   Index (\mjseqn{I}) for CS.} \item{CS_I.max}{Maximum Shannon-Weaver
#'   Diversity Index (\mjseqn{I_{max}}) for CS.} \item{CS_I.rel}{Relative
#'   Shannon-Weaver Diversity Index (\mjseqn{I'}) for CS.}
#'   \item{CS_D.Mc}{McIntosh Diversity Index (\mjseqn{D_{Mc}}) for CS.}.
#'
#' @seealso \code{\link[psych:misc]{shannon}}, \code{\link[vegan]{diversity}}
#'
#' @importFrom dplyr bind_rows
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
#' diversity.evaluate.core(data = ec, names = "genotypes",
#'                         qualitative = qual, selected = core)
#'
diversity.evaluate.core <- function(data, names, qualitative, selected) {

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

  EC.indices <- lapply(dataf[dataf$`[Type]` == "EC",
                             !colnames(dataf) %in% c(names, "[Type]")],
                       diversity.indices)
  EC.indices <- do.call(rbind, EC.indices)
  colnames(EC.indices) <- paste("EC_", colnames(EC.indices), sep = "")

  CS.indices <- lapply(dataf[dataf$`[Type]` == "CS",
                             !colnames(dataf) %in% c(names, "[Type]")],
                       diversity.indices)
  CS.indices <- do.call(rbind, CS.indices)
  colnames(CS.indices) <- paste("CS_", colnames(CS.indices), sep = "")

  df.order <- order(c(1:ncol(EC.indices), 1:ncol(CS.indices)))


  outdf <- cbind(EC.indices, CS.indices)[, df.order]
  outdf <- data.frame(outdf)

  outdf$Trait <- rownames(outdf)
  rownames(outdf) <- NULL
  cols <- setdiff(colnames(outdf), "Trait")
  outdf <- outdf[, c("Trait", cols)]

  return(outdf)

}


diversity.indices <- function(x, base = 2) {
if (is.factor(x)) {

  count <- as.vector(table(x))
  total.count <- sum(count, na.rm = TRUE)

  prob <- count / total.count

  k <- length(count)

  D <- sum(prob ^ 2) # Simpson's index (D)
  H <- 1 - D  # Nei's variation /Simpson's index of diversity/Gini's diversity
  H.max <- 1 - (1 / k) # Max Simpson's index of diversity
  D.inv <- 1 / D # Reciprocal D
  H.rel <- H / H.max # Relative H
  I <- - sum(prob * log(prob, base=base)) # SHannon Weaver diversity index
  I.max <- log(k) # Max I
  I.rel <- I / I.max # Shannon equitability index
  D.Mc <- (total.count - sqrt(sum(count ^ 2))) / # McIntosh Index
    (total.count - sqrt(total.count))

  out <- c(No.Classes = k,
           D = D,
           H = H,
           H.max = H.max,
           D.inv = D.inv,
           H.rel = H.rel,
           I = I,
           I.max = I.max,
           I.rel = I.rel,
           D.Mc = D.Mc)

  return(out)

} else{
  stop('"x" should be vector of type factor.')
}
}
