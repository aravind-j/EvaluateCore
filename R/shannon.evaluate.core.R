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

  EC_H <- psych::shannon(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c("Accession", "`[Type]`")],
                         base =  exp(1), correct = FALSE)
  CS_H <- psych::shannon(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c("Accession", "`[Type]`")],
                         base =  exp(1), correct = FALSE)

  EC_EH <- psych::shannon(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c("Accession", "`[Type]`")],
                         base =  exp(1), correct = TRUE)
  CS_EH <- psych::shannon(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c("Accession", "`[Type]`")],
                          base =  exp(1), correct = TRUE)

  EC_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "EC", !colnames(dataf) %in% c("Accession", "`[Type]`")],
                          function(x) length(levels(droplevels(x)))))
  CS_No.Classes <- unlist(lapply(dataf[dataf$`[Type]` == "CS", !colnames(dataf) %in% c("Accession", "`[Type]`")],
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
