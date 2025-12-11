# Ratio of Phenotype Retained

Compute the Ratio of Phenotype Retained (\\RPR\\) (Li et al. 2002) to
compare qualitative traits between entire collection (EC) and core set
(CS).

## Usage

``` r
rpr.evaluate.core(data, names, qualitative, selected, na.omit = TRUE)
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

The Ratio of Phenotype Retained value.

## Details

Ratio of Phenotype Retained (\\RPR\\) (Kim et al. 2007) is computed as
follows.

\\RPR = \frac{\sum\_{i=1}^{n} k\_{CS\_{i}}}{\sum\_{i=1}^{n}
k\_{EC\_{i}}}\\

Where, \\k\_{CS\_{i}}\\ is the number of phenotypic classes in CS for
the \\i\\th trait, \\k\_{EC\_{i}}\\ is the number of phenotypic classes
in EC for the \\i\\th trait and \\n\\ is the total number of traits.

## References

Kim K, Chung H, Cho G, Ma K, Chandrabalan D, Gwag J, Kim T, Cho E, Park
Y (2007). “PowerCore: A program applying the advanced M strategy with a
heuristic search for establishing core sets.” *Bioinformatics*,
**23**(16), 2155–2162.  
  
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

rpr.evaluate.core(data = ec, names = "genotypes",
                  qualitative = qual, selected = core)
#> [1] 0.9315068
```
