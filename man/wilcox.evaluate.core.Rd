% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wilcox.evaluate.core.R
\name{wilcox.evaluate.core}
\alias{wilcox.evaluate.core}
\title{Wilcoxon Rank Sum Test}
\usage{
wilcox.evaluate.core(data, names, quantitative, selected)
}
\arguments{
\item{data}{The data as a data frame object. The data frame should possess
one row per individual and columns with the individual names and multiple
trait/character data.}

\item{names}{Name of column with the individual names as a character string}

\item{quantitative}{Name of columns with the quantitative traits as a
character vector.}

\item{selected}{Character vector with the names of individuals selected in
core collection and present in the \code{names} column.}
}
\value{
\item{Trait}{The quantitative trait.} \item{EC_Med}{The median value
  of the trait in EC.} \item{CS_Med}{The median value of the trait in CS.}
  \item{Wilcox_pvalue}{The p value of the Wilcoxon test for equality of
  medians of EC and CS.} \item{Wilcox_significance}{The significance of the
  Wilcoxon test for equality of medians of EC and CS.}
}
\description{
Compare the medians of quantitative traits between entire collection (EC) and
core set (CS) by Wilcoxon rank sum test or Mann-Whitney-Wilcoxon test or
Mann-Whitney U test
\insertCite{wilcoxon_individual_1945,mann_test_1947}{EvaluateCore}.
}
\examples{

####################################
# Use data from R package ccChooser
####################################

library(ccChooser)
data("dactylis_CC")
data("dactylis_EC")

ec <- cbind(genotypes = rownames(dactylis_EC), dactylis_EC[, -1])
ec$genotypes <- as.character(ec$genotypes)
rownames(ec) <- NULL
ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
                                    function(x) cut(x, breaks = 4))
ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
                                    function(x) factor(as.numeric(x)))
head(ec)

core <- rownames(dactylis_CC)

quant <- c("X2", "X3", "X4", "X5", "X8")
qual <- c("X1", "X6", "X7")

####################################
# EvaluateCore
####################################

wilcox.evaluate.core(data = ec, names = "genotypes",
                     quantitative = quant, selected = core)


}
\references{
\insertAllCited{}
}
\seealso{
\code{\link[stats]{wilcox.test}}
}
