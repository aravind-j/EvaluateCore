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
#' @inheritParams chisquare.evaluate.core
#'
#' @return
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

  datafcore <- dataf[dataf[,names] %in% selected,]

  dataf$`[Type]` <- "EC"
  datafcore$`[Type]` <- "CS"

  dataf <- rbind(dataf, datafcore)
  rm(datafcore)

  dataf$`[Type]` <- as.factor(dataf$`[Type]`)

  # dataf[, qualitative] <- lapply(dataf[, qualitative], as.integer)

  EC_H <- psych::shannon(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = FALSE)
  CS_H <- psych::shannon(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = FALSE)

  EC_EH <- psych::shannon(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c(names, "[Type]")],
                         base =  exp(1), correct = TRUE)
  CS_EH <- psych::shannon(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c(names, "[Type]")],
                          base =  exp(1), correct = TRUE)

  EC_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c(names, "[Type]")],
                          function(x) length(levels(droplevels(x)))))
  CS_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c(names, "[Type]")],
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
