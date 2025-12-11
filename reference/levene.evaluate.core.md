# Levene's Test

Test for of variances of the entire collection (EC) and core set (CS)
for quantitative traits by Levene's test (Levene 1960) .

## Usage

``` r
levene.evaluate.core(data, names, quantitative, selected)
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

A data frame with the following columns

- Trait:

  The quantitative trait.

- Count:

  The accession count (excluding missing data).

- Df:

  The degrees of freedom for the test.

- EC_V:

  The variance of the EC.

- CS_V:

  The variance of the CS.

- EC_CV:

  The coefficient of variance of the EC.

- CS_CV:

  The coefficient of variance of the CS.

- Levene_Fvalue:

  The test statistic.

- Levene_pvalue:

  The p value for the test statistic.

- Levene_significance:

  The significance of the test statistic (\*: p \\\leq\\ 0.01; \*\*: p
  \\\leq\\ 0.05; ns: p \\ \> \\ 0.05).

## References

Levene H (1960). “Robust tests for equality of variances.” In Olkin I,
Ghurye SG, Hoeffding W, Madow WG, Mann HB (eds.), *Contribution to
Probability and Statistics: Essays in Honor of Harold Hotelling*,
278–292. Stanford University Press, Palo Alto, CA.

## See also

[`leveneTest`](https://rdrr.io/pkg/car/man/leveneTest.html)

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

levene.evaluate.core(data = ec, names = "genotypes",
                     quantitative = quant, selected = core)
#>    Trait Count Df      EC_V       CS_V     EC_CV     CS_CV Levene_Fvalue
#> 1   NMSR  1684  1 59.087307  66.982464 0.6557556 0.7513439    0.08138887
#> 2   TTRN  1684  1  3.650995   5.168937 0.4957973 0.5784099    4.48085067
#> 3  TFWSR  1684  1 20.545565  37.050176 0.8349124 0.9588343    9.73620667
#> 4   TTRW  1684  1  2.745559   8.185938 0.8730338 1.0929363   32.17078669
#> 5  TFWSS  1684  1 34.723261  52.465146 0.8487110 0.9348325    5.47834742
#> 6   TTSW  1684  1  4.008444   9.527677 0.8385793 1.0057366   20.99595381
#> 7   TTPW  1684  1 95.800602 158.740945 0.7911214 0.8937898    8.23203952
#> 8   AVPW  1684  1 11.312159  29.789173 0.7848312 0.9597393   32.84901670
#> 9   ARSR  1684  1  5.082044   3.862988 1.2132652 1.1545293    0.37336766
#> 10  SRDM  1684  1 25.329950  18.184402 0.1332473 0.1130209    5.02652477
#>    Levene_pvalue Levene_significance
#> 1   7.754559e-01                  ns
#> 2   3.440983e-02                   *
#> 3   1.834623e-03                  **
#> 4   1.635197e-08                  **
#> 5   1.935920e-02                   *
#> 6   4.910026e-06                  **
#> 7   4.162436e-03                  **
#> 8   1.160456e-08                  **
#> 9   5.412494e-01                  ns
#> 10  2.508002e-02                   *
```
