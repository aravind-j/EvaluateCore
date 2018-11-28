#' Percentage Difference of Means and Variances
#'
#' Compute the following differences between the entire collection (EC) and core
#' set (CS). \itemize{ \item Percentage of significant differences of mean
#' (\ifelse{html}{\out{<em>MD\%<sub>Hu</sub></em>}}{\eqn{MD\%_{Hu}}})
#' \insertCite{hu_methods_2000}{EvaluateCore} \item Percentage of significant
#' differences of variance
#' (\ifelse{html}{\out{<em>VD\%<sub>Hu</sub></em>}}{\eqn{VD\%_{Hu}}})
#' \insertCite{hu_methods_2000}{EvaluateCore} \item Average of absolute
#' differences between means
#' (\ifelse{html}{\out{<em>MD\%<sub>Kim</sub></em>}}{\eqn{MD\%_{Kim}}})
#' \insertCite{kim_powercore:_2007}{EvaluateCore} \item Average of absolute
#' differences between variances
#' (\ifelse{html}{\out{<em>VD\%<sub>Kim</sub></em>}}{\eqn{VD\%_{Kim}}})
#' \insertCite{kim_powercore:_2007}{EvaluateCore} \item Percentage difference
#' between the mean squared Euclidean distance among accessions
#' (\ifelse{html}{\out{<em><span
#' style="text-decoration:overline">d</span>D\%</em>}}{\eqn{\overline{d}D\%}})
#' \insertCite{studnicki_comparing_2013}{EvaluateCore} }
#'
#' The differences are computed as follows.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>MD\%<sub>Hu</sub></em>
#' = <big>(</big><sup>S<sub>t</sub></sup> &frasl; <sub>n</sub><big>)</big>
#' &times; 100</p>}}{\deqn{MD\%_{Hu} = \left ( \frac{S_{t}}{n} \right ) \times
#' 100}}
#'
#' Where, \ifelse{html}{\out{<em>S<sub>t</sub></em>}}{\eqn{S_{t}}} is the number
#' of traits with a significant difference between the means of the EC and the
#' CS and \ifelse{html}{\out{<em>n</em>}}{\eqn{n}} is the total number of
#' traits.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>VD\%<sub>Hu</sub></em>
#' = <big>(</big><sup>S<sub>t</sub></sup> &frasl; <sub>n</sub><big>)</big>
#' &times; 100</p>}}{\deqn{VD\%_{Hu} = \left ( \frac{S_{t}}{n} \right ) \times
#' 100}}
#'
#' Where, \ifelse{html}{\out{<em>S<sub>t</sub></em>}}{\eqn{S_{t}}} is the number
#' of traits with a significant difference between the variances of the EC and
#' the CS and \ifelse{html}{\out{<em>n</em>}}{\eqn{n}} is the total number of
#' traits.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>MD\%<sub>Kim</sub> =
#' <sup>1</sup>&frasl;<sub>n</sub> &sum;<sup>n</sup><sub style="line-height:
#' 1.8; margin-left: -1ex;">i=1</sub> <big>[</big>
#' <sup>|M<sub>EC<sub>i</sub></sub> &minus; M<sub>CS<sub>i</sub></sub>|</sup>
#' &frasl; <sub>M<sub>CS<sub>i</sub></sub></sub> <big>]</big>  &times;
#' 100</em></p>}}{\deqn{MD\%_{Kim} = \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
#' M_{EC_{i}}-M_{CS_{i}} \right |}{M_{CS_{i}}}}}
#'
#' Where,
#' \ifelse{html}{\out{<em>M<sub>EC<sub>i</sub></sub></em>}}{\eqn{M_{EC_{i}}}} is
#' the mean of the EC for the \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th trait,
#' \ifelse{html}{\out{<em>M<sub>CS<sub>i</sub></sub></em>}}{\eqn{M_{CS_{i}}}} is
#' the mean of the CS for the \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th trait
#' and \ifelse{html}{\out{<em>n</em>}}{\eqn{n}} is the total number of traits.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em>VD\%<sub>Kim</sub> =
#' <sup>1</sup>&frasl;<sub>n</sub> &sum;<sup>n</sup><sub style="line-height:
#' 1.8; margin-left: -1ex;">i=1</sub> <big>[</big>
#' <sup>|V<sub>EC<sub>i</sub></sub> &minus; V<sub>CS<sub>i</sub></sub>|</sup>
#' &frasl; <sub>V<sub>CS<sub>i</sub></sub></sub> <big>]</big>  &times;
#' 100</em></p>}}{\deqn{VD\%_{Kim} = \frac{1}{n}\sum_{i=1}^{n} \frac{\left |
#' V_{EC_{i}}-V_{CS_{i}} \right |}{V_{CS_{i}}}}}
#'
#' Where,
#' \ifelse{html}{\out{<em>V<sub>EC<sub>i</sub></sub></em>}}{\eqn{V_{EC_{i}}}} is
#' the variance of the EC for the \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th
#' trait,
#' \ifelse{html}{\out{<em>V<sub>CS<sub>i</sub></sub></em>}}{\eqn{V_{CS_{i}}}} is
#' the variance of the CS for the \ifelse{html}{\out{<em>i</em>}}{\eqn{i}}th
#' trait and \ifelse{html}{\out{<em>n</em>}}{\eqn{n}} is the total number of
#' traits.
#'
#' \ifelse{html}{\out{<p style="text-align: center;"><em><span
#' style="text-decoration: overline;">d</span>D\% = <big>[ </big><sup><span
#' style="text-decoration: overline;">d</span>D<sub>CS</sub> &minus; <span
#' style="text-decoration: overline;">d</span>D<sub>EC</sub></sup> &frasl;
#' <sub><span style="text-decoration:
#' overline;">d</span>D<sub>EC</sub></sub><big> ] </big>&times; 100<br
#' /></em></p>}}{\deqn{\overline{d}D\% =
#' \frac{\overline{d}_{CS}-\overline{d}_{EC}}{\overline{d}_{EC}} \times 100}}
#'
#' Where, \ifelse{html}{\out{<em><span style="text-decoration:
#' overline;">d</span>D<sub>CS</sub></em>}}{\eqn{\overline{d}_{CS}}} is the mean
#' squared Euclidean distance among accessions in the CS and
#' \ifelse{html}{\out{<em><span style="text-decoration:
#' overline;">d</span>D<sub>EC</sub></em>}}{\eqn{\overline{d}_{EC}}} is the mean
#' squared Euclidean distance among accessions in the EC.
#'
#' @inheritParams snk.evaluate.core
#' @param alpha Type I error probability (Significance level) of difference.
#'
#' @return A data frame with the values of
#'   \ifelse{html}{\out{<em>MD\%<sub>Hu</sub></em>}}{\eqn{MD\%_{Hu}}},
#'   \ifelse{html}{\out{<em>VD\%<sub>Hu</sub></em>}}{\eqn{VD\%_{Hu}}},
#'   \ifelse{html}{\out{<em>MD\%<sub>Kim</sub></em>}}{\eqn{MD\%_{Kim}}},
#'   \ifelse{html}{\out{<em>VD\%<sub>Kim</sub></em>}}{\eqn{VD\%_{Kim}}} and
#'   \ifelse{html}{\out{<em><span
#'   style="text-decoration:overline">d</span>D\%</em>}}{\eqn{\overline{d}D\%}}.
#'
#' @seealso \code{\link[EvaluateCore]{snk.evaluate.core}},
#'   \code{\link[EvaluateCore]{snk.evaluate.core}}
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
#' percentdiff.evaluate.core(data = ec, names = "genotypes",
#'                           quantitative = quant, selected = core)
#'
#'
percentdiff.evaluate.core <- function(data, names, quantitative,
                              selected, alpha = 0.05){
  # Checks
  checks.evaluate.core(data = data, names = names,
                       quantitative = quantitative,
                       selected = selected)

  if (any(c("tbl_dataf", "tbl") %in% class(data))) {
    warning('"data" is of type tibble\nCoercing to data frame')
    data <- as.data.frame(data)
  }

  # Check alpha value
  if (!(0 < alpha && alpha < 1)) {
    stop('"alpha" should be between 0 and 1 (0 < alpha < 1)')
  }

  dataf <- data[, c(names, quantitative)]

  datafcore <- dataf[dataf[,names] %in% selected,]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  d_EC <- mean(cluster::daisy(dataf[dataf$`[Type]` == "EC", quantitative],
                              metric = "euclidean"))
  d_CS <- mean(cluster::daisy(dataf[dataf$`[Type]` == "CS", quantitative],
                              metric = "euclidean"))

  mdiff <- snk.evaluate.core(data, names, quantitative, selected)
  vdiff <- levene.evaluate.core(data, names, quantitative, selected)

  outdf <- data.frame(MDPercent_Hu = (sum(mdiff$SNK_pvalue <= alpha)/ length(quantitative)) * 100,
                      VDPercent_Hu = (sum(vdiff$Levene_pvalue <= alpha)/ length(quantitative)) * 100,
                      MDPercent_Kim = (sum(abs(mdiff$EC_Mean - mdiff$CS_Mean)/mdiff$CS_Mean)/length(quantitative)) * 100,
                      VDPercent_Kim = (sum(abs(vdiff$EC_V - vdiff$CS_V)/vdiff$CS_V)/length(quantitative)) * 100,
                      DDPercent = ((d_CS - d_EC)/d_EC) * 100)

  return(outdf)

}
