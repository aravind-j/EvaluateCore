# Variance of Phenotypic Frequency

Compute the Variance of Phenotypic Frequency (\\VPF\\) (Li et al. 2002)
to compare qualitative traits between entire collection (EC) and core
set (CS).

## Usage

``` r
vpf.evaluate.core(data, names, qualitative, selected, na.omit = TRUE)
```

## Arguments

- data:

  The data as a data frame object. The data frame should possess one row
  per individual and columns with the individual names and multiple
  trait/character data.

- names:

  Name of column with the individual names as a character string.

- qualitative:

  Name of columns with the qualitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

- na.omit:

  logical. If `TRUE`, missing values (`NA`) are ignored and not included
  as a distinct factor level for analysis. Default is `TRUE`.

## Value

The Variance of Phenotypic Frequency values for EC and CS.

## Details

Variance of Phenotypic Frequency (\\VPF\\) (Li et al. 2002) is computed
as follows.

\\VPF = \frac{1}{n} \sum\_{i=1}^{n}\left ( \frac{\sum\_{j=1}^{k}
(p\_{ij} - \overline{p\_{i}})^{2}}{k - 1} \right )\\

Where, \\p\_{ij}\\ denotes the proportion/fraction/frequency of
accessions in the \\i\\th phenotypic class for the \\i\\th trait,
\\\overline{p\_{i}}\\ is the mean frequency of phenotypic classes for
the \\i\\th trait, \\k\\ is the number of phenotypic classes for the
\\i\\th trait and \\n\\ is the total number of traits.

## References

Li Z, Zhang H, Zeng Y, Yang Z, Shen S, Sun C, Wang X (2002). “Studies on
sampling schemes for the establishment of core collection of rice
landraces in Yunnan, China.” *Genetic Resources and Crop Evolution*,
**49**(1), 67–74.

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

vpf.evaluate.core(data = ec, names = "genotypes",
                  qualitative = qual, selected = core)
#>     EC_VPF     CS_VPF 
#> 0.04573206 0.03154146 
```
