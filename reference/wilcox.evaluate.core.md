# Wilcoxon Rank Sum Test

Compare the medians of quantitative traits between entire collection
(EC) and core set (CS) by Wilcoxon rank sum test or
Mann-Whitney-Wilcoxon test or Mann-Whitney U test (Wilcoxon 1945; Mann
and Whitney 1947) .

## Usage

``` r
wilcox.evaluate.core(data, names, quantitative, selected)
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

- Trait:

  The quantitative trait.

- Count:

  The accession count (excluding missing data).

- EC_Med:

  The median value of the trait in EC.

- CS_Med:

  The median value of the trait in CS.

- Wilcox_pvalue:

  The p value of the Wilcoxon test for equality of medians of EC and CS.

- Wilcox_significance:

  The significance of the Wilcoxon test for equality of medians of EC
  and CS.

## References

Mann HB, Whitney DR (1947). “On a test of whether one of two random
variables is stochastically larger than the other.” *The Annals of
Mathematical Statistics*, **18**(1), 50–60.  
  
Wilcoxon F (1945). “Individual comparisons by ranking methods.”
*Biometrics Bulletin*, **1**(6), 80.

## See also

[`wilcox.test`](https://rdrr.io/r/stats/wilcox.test.html)

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

wilcox.evaluate.core(data = ec, names = "genotypes",
                     quantitative = quant, selected = core)
#>    Trait Count    EC_Med    CS_Med Wilcox_pvalue Wilcox_significance
#> 1   NMSR  1684 10.000000  9.000000    0.07142419                  ns
#> 2   TTRN  1684  3.600000  3.500000    0.88120694                  ns
#> 3  TFWSR  1684  4.200000  4.300000    0.36146710                  ns
#> 4   TTRW  1684  1.445000  1.580000    0.05166795                  ns
#> 5  TFWSS  1684  5.400000  5.400000    0.59705438                  ns
#> 6   TTSW  1684  1.933333  2.058333    0.06454022                  ns
#> 7   TTPW  1684 10.000000 10.400000    0.41477324                  ns
#> 8   AVPW  1684  3.400000  3.600000    0.04066290                   *
#> 9   ARSR  1684  1.000000  1.000000    0.54494436                  ns
#> 10  SRDM  1684 38.500000 38.150000    0.38825006                  ns
```
