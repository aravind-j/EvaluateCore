# Class Coverage

Compute the Class Coverage (Kim et al. 2007) to compare the distribution
frequencies of qualitative traits between entire collection (EC) and
core set (CS).

## Usage

``` r
coverage.evaluate.core(data, names, qualitative, selected, na.omit = TRUE)
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

The Class Coverage value.

## Details

Class Coverage (Kim et al. 2007) is computed as follows.

\\Class\\ Coverage = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{k\_{CS\_{i}}}{k\_{EC\_{i}}} \right ) \times 100\\

Where, \\k\_{CS\_{i}}\\ is the number of phenotypic classes in CS for
the \\i\\th trait, \\k\_{EC\_{i}}\\ is the number of phenotypic classes
in EC for the \\i\\th trait and \\n\\ is the total number of traits.

## References

Kim K, Chung H, Cho G, Ma K, Chandrabalan D, Gwag J, Kim T, Cho E, Park
Y (2007). “PowerCore: A program applying the advanced M strategy with a
heuristic search for establishing core sets.” *Bioinformatics*,
**23**(16), 2155–2162.

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

coverage.evaluate.core(data = ec, names = "genotypes",
                       qualitative = qual, selected = core)
#> [1] 92.70833
```
