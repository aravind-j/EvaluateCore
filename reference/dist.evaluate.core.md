# Distance Measures

Compute average Entry-to-nearest-entry distance (\\E\text{-}EN\\),
Accession-to-nearest-entry distance (\\E\text{-}EN\\) and Entry-to-entry
distance (\\E\text{-}EN\\) (Odong et al. 2013) to evaluate a core set
(CS) selected from an entire collection (EC).

## Usage

``` r
dist.evaluate.core(data, names, quantitative, qualitative, selected, d = NULL)
```

## Arguments

- data:

  The data as a data frame object. The data frame should possess one row
  per individual and columns with the individual names and multiple
  trait/character data.

- names:

  Name of column with the individual names as a character string.

- quantitative:

  Name of columns with the quantitative traits as a character vector.

- qualitative:

  Name of columns with the qualitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

- d:

  A distance matrix of class "`dist`" with individual names in the
  `names` column in `data` as labels. If `NULL` (default), then a
  distance matrix is computed using Gower's metric. (Gower 1971) .

## Value

A data frame with the average values of \\E\text{-}EN\\, \\E\text{-}EN\\
and \\E\text{-}EN\\.

## References

Gower JC (1971). “A general coefficient of similarity and some of its
properties.” *Biometrics*, **27**(4), 857–871.  
  
Odong TL, Jansen J, van Eeuwijk FA, van Hintum TJL (2013). “Quality of
core collections for effective utilisation of genetic resources review,
discussion and interpretation.” *Theoretical and Applied Genetics*,
**126**(2), 289–305.

## See also

[`evaluateCore`](https://rdrr.io/pkg/corehunter/man/evaluateCore.html)

## Examples

``` r
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

dist.evaluate.core(data = ec, names = "genotypes", quantitative = quant,
                   qualitative = qual, selected = core)
#>   Average.distance     Value
#> 1             E-NE 0.2592901
#> 2             A-NE 0.1537492
#> 3              E-E 0.4461421

# \donttest{
####################################
# Compare with corehunter
####################################

library(corehunter)
#> Loading required package: rJava
# Prepare phenotype dataset
dtype <- c(rep("RD", length(quant)),
           rep("NS", length(qual)))
rownames(ec) <- ec[, "genotypes"]
ecdata <- corehunter::phenotypes(data = ec[, c(quant, qual)],
                                 types = dtype)

# Compute average distances
EN <- evaluateCore(core = rownames(cassava_CC), data = ecdata,
                   objective = objective("EN", "GD"))
AN <- evaluateCore(core = rownames(cassava_CC), data = ecdata,
                   objective = objective("AN", "GD"))
EE <- evaluateCore(core = rownames(cassava_CC), data = ecdata,
                   objective = objective("EE", "GD"))
EN
#> [1] 0.2592901
AN
#> [1] 0.1537492
EE
#> [1] 0.4461421
# }
```
