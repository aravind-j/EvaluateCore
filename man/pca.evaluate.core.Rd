% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pca.evaluate.core.R
\name{pca.evaluate.core}
\alias{pca.evaluate.core}
\title{Principal Component Analysis}
\usage{
pca.evaluate.core(
  data,
  names,
  quantitative,
  selected,
  center = TRUE,
  scale = TRUE,
  npc.plot = 6
)
}
\arguments{
\item{data}{The data as a data frame object. The data frame should possess
one row per individual and columns with the individual names and multiple
trait/character data.}

\item{names}{Name of column with the individual names as a character string.}

\item{quantitative}{Name of columns with the quantitative traits as a
character vector.}

\item{selected}{Character vector with the names of individuals selected in
core collection and present in the \code{names} column.}

\item{center}{either a logical value or numeric-alike vector of length
    equal to the number of columns of \code{x}, where
    \sQuote{numeric-alike} means that \code{\link[base]{as.numeric}(.)} will
    be applied successfully if \code{\link[base]{is.numeric}(.)} is not true.}

\item{scale}{either a logical value or a numeric-alike vector of length
    equal to the number of columns of \code{x}.}

\item{npc.plot}{The number of principal components for which eigen values are
to be plotted. The default value is 6.}
}
\value{
A list with the following components. \item{EC PC Importance}{A data
  frame of importance of principal components for EC} \item{EC PC Loadings}{A
  data frame with eigen vectors of principal components for EC} \item{CS PC
  Importance}{A data frame of importance of principal components for CS}
  \item{CS PC Loadings}{A data frame with eigen vectors of principal
  components for CS} \item{Scree Plot}{The scree plot of principal components
  for EC and CS as a \code{ggplot} object.} \item{PC Loadings Plot}{A plot of
  the eigen vector values of principal components for EC and CS as specified
  by \code{npc.plot} as a \code{ggplot2} object.}
}
\description{
Compute Principal Component Analysis Statistics
\insertCite{mardia_multivariate_1979}{EvaluateCore} to compare the
probability distributions of quantitative traits between entire collection
(EC) and core set (CS).
}
\note{
If there are missing values in the quantitative data, then they will be
  imputed using the \code{\link[missMDA]{imputePCA}} function from
  \code{\link[missMDA]{missMDA}}.
}
\examples{

data("cassava_CC")
data("cassava_EC")

ec <- cbind(genotypes = rownames(cassava_EC), cassava_EC)
ec$genotypes <- as.character(ec$genotypes)
rownames(ec) <- NULL

core <- rownames(cassava_CC)

quant <- c("NMSR", "TTRN", "TFWSR", "TTRW", "TFWSS", "TTSW", "TTPW", "AVPW",
           "ARSR", "SRDM")
qual <- c("CUAL", "LNGS", "PTLC", "DSTA", "LFRT", "LBTEF", "CBTR", "NMLB",
          "ANGB", "CUAL9M", "LVC9M", "TNPR9M", "PL9M", "STRP", "STRC",
          "PSTR")

ec[, qual] <- lapply(ec[, qual],
                     function(x) factor(as.factor(x)))

pca.evaluate.core(data = ec, names = "genotypes",
                  quantitative = quant, selected = core,
                  center = TRUE, scale = TRUE, npc.plot = 4)

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link[stats]{prcomp}}
}
