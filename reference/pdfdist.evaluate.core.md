# Distance Between Probability Distributions

Compute Kullback-Leibler (Kullback and Leibler 1951) ,
Kolmogorov-Smirnov (Kolmogorov 1933; Smirnov 1948) and Anderson-Darling
distances (Anderson and Darling 1952) between the probability
distributions of collection (EC) and core set (CS) for quantitative
traits.

## Usage

``` r
pdfdist.evaluate.core(data, names, quantitative, selected)
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

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

## Value

A data frame with the following columns.

- Trait:

  The quantitative trait.

- Count:

  The accession count (excluding missing data).

- KL_Distance:

  The Kullback-Leibler distance (Kullback and Leibler 1951) between EC
  and CS.

- KS_Distance:

  The Kolmogorov-Smirnov distance (Kolmogorov 1933; Smirnov 1948)
  between EC and CS.

- KS_pvalue:

  The p value of the Kolmogorov-Smirnov distance.

- AD_Distance:

  Anderson-Darling distance (Anderson and Darling 1952) between EC and
  CS.

- AD_pvalue:

  The p value of the Anderson-Darling distance.

- KS_significance:

  The significance of the Kolmogorov-Smirnov distance (\*: p \\\leq\\
  0.01; \*\*: p \\\leq\\ 0.05; ns: p \\\>\\ 0.05).

- AD_pvalue:

  The significance of the Anderson-Darling distance (\*: p \\\leq\\
  0.01; \*\*: p \\\leq\\ 0.05; ns: p \\\>\\ 0.05).

## See also

[`KL.plugin`](https://rdrr.io/pkg/entropy/man/KL.plugin.html),
[`ks.test`](https://rdrr.io/r/stats/ks.test.html),
[`ad.test`](https://rdrr.io/pkg/kSamples/man/ad.test.html)

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

pdfdist.evaluate.core(data = ec, names = "genotypes",
                      quantitative = quant, selected = core)
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#> Warning: p-value will be approximate in the presence of ties
#>    Trait Count KL_Distance KS_Distance   KS_pvalue AD_Distance AD_pvalue
#> 1   NMSR  1684  0.10939457  0.07641952 0.334275339     1.92900 0.1005100
#> 2   TTRN  1684  0.02893963  0.05164857 0.809802831     0.91063 0.4073400
#> 3  TFWSR  1684  0.11522926  0.07531671 0.351528548     1.63440 0.1472800
#> 4   TTRW  1684  0.08052342  0.12781360 0.013596639     5.21680 0.0022362
#> 5  TFWSS  1684  0.07080701  0.07183859 0.409657631     1.15520 0.2849500
#> 6   TTSW  1684  0.09799896  0.11025337 0.048766338     3.77650 0.0112240
#> 7   TTPW  1684  0.06132788  0.07479358 0.359913871     1.61630 0.1508700
#> 8   AVPW  1684  0.06382748  0.13355390 0.008597246     5.57120 0.0015109
#> 9   ARSR  1684  0.21960728  0.03422973 0.993985523     0.50026 0.7458100
#> 10  SRDM  1684  0.23403978  0.08135392 0.264146682     1.65170 0.1439400
#>    KS_significance AD_significance
#> 1               ns              ns
#> 2               ns              ns
#> 3               ns              ns
#> 4                *              **
#> 5               ns              ns
#> 6                *               *
#> 7               ns              ns
#> 8               **              **
#> 9               ns              ns
#> 10              ns              ns
```
