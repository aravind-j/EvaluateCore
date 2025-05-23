% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/percentdiff.evaluate.core.R
\name{percentdiff.evaluate.core}
\alias{percentdiff.evaluate.core}
\title{Percentage Difference of Means and Variances}
\usage{
percentdiff.evaluate.core(
  data,
  names,
  quantitative,
  selected,
  alpha = 0.05,
  rr.crit = 0.7
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

\item{alpha}{Type I error probability (Significance level) of difference.}

\item{rr.crit}{The critical value of range ratio considered to be acceptable
for a representative CS. The default value is 0.7.}
}
\value{
A data frame with the values of
  \mjteqn{MD\\\%_{Hu}}{MD\\\\\\\%_{Hu}}{MD\%_{Hu}},
  \mjteqn{VD\\\%_{Hu}}{VD\\\\\\\%_{Hu}}{VD\%_{Hu}},
  \mjteqn{MD\\\%_{Kim}}{MD\\\\\\\%_{Kim}}{MD\%_{Kim}},
  \mjteqn{VD\\\%_{Kim}}{VD\\\\\\\%_{Kim}}{VD\%_{Kim}} and
  \mjteqn{\overline{d}D\\\%}{\overline{d}D\\\\\\\%}{\overline{d}D\%}.
}
\description{
Compute the following differences between the entire collection (EC) and core
set (CS). \itemize{ \item Percentage of significant differences of mean
(\mjteqn{MD\\\%_{Hu}}{MD\\\\\\\%_{Hu}}{MD\%_{Hu}})
\insertCite{hu_methods_2000}{EvaluateCore} \item Percentage of significant
differences of variance (\mjteqn{VD\\\%_{Hu}}{VD\\\\\\\%_{Hu}}{VD\%_{Hu}})
\insertCite{hu_methods_2000}{EvaluateCore} \item Average of absolute
differences between means
(\mjteqn{MD\\\%_{Kim}}{MD\\\\\\\%_{Kim}}{MD\%_{Kim}})
\insertCite{kim_PowerCore_2007}{EvaluateCore} \item Average of absolute
differences between variances
(\mjteqn{VD\\\%_{Kim}}{VD\\\\\\\%_{Kim}}{VD\%_{Kim}})
\insertCite{kim_PowerCore_2007}{EvaluateCore} \item Percentage difference
between the mean squared Euclidean distance among accessions
(\mjteqn{\overline{d}D\\\%}{\overline{d}D\\\\\\\%}{\overline{d}D\%})
\insertCite{studnicki_comparing_2013}{EvaluateCore} \item Percentage of range
ratios smaller than 0.70 (\mjseqn{S_{RR_{0.7}}})
\insertCite{diwan_methods_1995}{EvaluateCore} } \loadmathjax
}
\details{
The differences are computed as follows.

\mjtdeqn{MD\\\%_{Hu} = \left ( \frac{S_{t}}{n} \right ) \times
100}{MD\\\\\\\%_{Hu} = \left ( \frac{S_{t}}{n} \right ) \times 100}{MD\%_{Hu}
= \left ( \frac{S_{t}}{n} \right ) \times 100}

Where, \mjseqn{S_{t}} is the number of traits with a significant difference
between the means of the EC and the CS and \mjseqn{n} is the total number of
traits. A representative core should have
\mjteqn{MD\\\%_{Hu}}{MD\\\\\\\%_{Hu}}{MD\%_{Hu}} < 20 \% and \mjseqn{CR} > 80
\% \insertCite{hu_methods_2000}{EvaluateCore}.

\mjtdeqn{VD\\\%_{Hu} = \left ( \frac{S_{F}}{n} \right ) \times
100}{VD\\\\\\\%_{Hu} = \left ( \frac{S_{F}}{n} \right ) \times 100}{VD\%_{Hu}
= \left ( \frac{S_{F}}{n} \right ) \times 100}

Where, \mjseqn{S_{F}} is the number of traits with a significant difference
between the variances of the EC and the CS and \mjseqn{n} is the total number
of traits. Larger \mjteqn{VD\\\%_{Hu}}{VD\\\\\\\%_{Hu}}{VD\%_{Hu}} value
indicates a more diverse core set.

\mjtdeqn{MD\\\%_{Kim} = \left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
M_{EC_{i}}-M_{CS_{i}} \right |}{M_{CS_{i}}} \right ) \times
100}{MD\\\\\\\%_{Kim} = \left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
M_{EC_{i}}-M_{CS_{i}} \right |}{M_{CS_{i}}} \right ) \times 100}{MD\%_{Kim} =
\left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left | M_{EC_{i}}-M_{CS_{i}} \right
|}{M_{CS_{i}}} \right ) \times 100}

Where, \mjseqn{M_{EC_{i}}} is the mean of the EC for the \mjseqn{i}th trait,
\mjseqn{M_{CS_{i}}} is the mean of the CS for the \mjseqn{i}th trait and
\mjseqn{n} is the total number of traits.

\mjtdeqn{VD\\\%_{Kim} = \left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
V_{EC_{i}}-V_{CS_{i}} \right |}{V_{CS_{i}}} \right ) \times
100}{VD\\\\\\\%_{Kim} = \left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
V_{EC_{i}}-V_{CS_{i}} \right |}{V_{CS_{i}}} \right ) \times 100}{VD\%_{Kim} =
\left ( \frac{1}{n}\sum_{i=1}^{n} \frac{\left | V_{EC_{i}}-V_{CS_{i}} \right
|}{V_{CS_{i}}} \right ) \times 100}

Where, \mjseqn{V_{EC_{i}}} is the variance of the EC for the \mjseqn{i}th
trait, \mjseqn{V_{CS_{i}}} is the variance of the CS for the \mjseqn{i}th
trait and \mjseqn{n} is the total number of traits.

\mjtdeqn{\overline{d}D\\\% =
\frac{\overline{d}_{CS}-\overline{d}_{EC}}{\overline{d}_{EC}} \times
100}{\overline{d}D\\\\\\\% =
\frac{\overline{d}_{CS}-\overline{d}_{EC}}{\overline{d}_{EC}} \times
100}{\overline{d}D\\% =
\frac{\overline{d}_{CS}-\overline{d}_{EC}}{\overline{d}_{EC}} \times 100}

Where, \mjseqn{\overline{d}_{CS}} is the mean squared Euclidean distance
among accessions in the CS and \mjseqn{\overline{d}_{EC}} is the mean squared
Euclidean distance among accessions in the EC.

Percentage of range ratios smaller than 0.70
\insertCite{diwan_methods_1995}{EvaluateCore} is computed as follows.

\mjtdeqn{RR\\\%_{0.7} = \left ( \frac{S_{RR_{0.7}}}{n} \right ) \times
100}{RR\\\\\\\%_{0.7} = \left ( \frac{S_{RR_{0.7}}}{n} \right ) \times
100}{RR\%_{0.7} = \left ( \frac{S_{RR_{0.7}}}{n} \right ) \times 100}

Where, \mjseqn{S_{RR_{0.7}}} is the number of traits with a range ratio
smaller than 0.7 (\mjseqn{\frac{R_{CS_{i}}}{R_{EC_{i}}} < 0.7}).
\mjseqn{R_{CS_{i}}} is the range of the \mjseqn{i}th trait in the CS,
\mjseqn{R_{EC_{i}}} is the range of the \mjseqn{i}th trait in the EC and
\mjseqn{n} is the total number of traits.
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

percentdiff.evaluate.core(data = ec, names = "genotypes",
                          quantitative = quant, selected = core)

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link[EvaluateCore]{snk.evaluate.core}},
  \code{\link[EvaluateCore]{snk.evaluate.core}}
}
