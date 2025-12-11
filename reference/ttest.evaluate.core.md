# Student's t Test

Test difference between means of entire collection (EC) and core set
(CS) for quantitative traits by Student's t test (in particular it's
adaptation for comparison of groups with unequal variances known as
Welch's two sample t-test) (Student 1908; Welch 1947) .

## Usage

``` r
ttest.evaluate.core(data, names, quantitative, selected)
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

- Df:

  The degrees of freedom for the test.

- EC_Min:

  The minimum value of the trait in EC.

- EC_Max:

  The maximum value of the trait in EC.

- EC_Mean:

  The mean value of the trait in EC.

- EC_SE:

  The standard error of the trait in EC.

- CS_Min:

  The minimum value of the trait in CS.

- CS_Max:

  The maximum value of the trait in CS.

- CS_Mean:

  The mean value of the trait in CS.

- CS_SE:

  The standard error of the trait in CS.

- ttest_pvalue:

  The p value of the Student's t test for equality of means of EC and
  CS.

- ttest_significance:

  The significance of the Student's t test for equality of means of EC
  and CS.

## References

Student (1908). “The probable error of a mean.” *Biometrika*, **6**(1),
1–25.  
  
Welch BL (1947). “The generalization of 'student's' problem when several
different population varlances are involved.” *Biometrika*, **34**(1-2),
28–35.

## See also

[`t.test`](https://rdrr.io/r/stats/t.test.html)

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

ttest.evaluate.core(data = ec, names = "genotypes",
                    quantitative = quant, selected = core)
#>         Trait Count       Df EC_Min EC_Max   EC_Mean      EC_SE CS_Min CS_Max
#> df...1   NMSR  1684 197.5347   1.00  55.00 11.722090 0.18731651   1.00  55.00
#> df...2   TTRN  1684 191.2705   0.25  13.75  3.853909 0.04656232   0.25  13.75
#> df...3  TFWSR  1684 185.9321   0.00  40.00  5.428979 0.11045567   0.20  38.00
#> df...4   TTRW  1684 178.3429   0.00  20.20  1.897948 0.04037796   0.10  20.20
#> df...5  TFWSS  1684 189.6987   0.20  42.00  6.943052 0.14359496   0.20  42.00
#> df...6   TTSW  1684 181.2810   0.04  22.00  2.387502 0.04878843   0.10  22.00
#> df...7   TTPW  1684 187.6470   0.40  80.00 12.372031 0.23851356   0.40  80.00
#> df...8   AVPW  1684 179.8673   0.20  33.00  4.285450 0.08195995   0.20  33.00
#> df...9   ARSR  1684 213.3477   0.00  18.00  1.858076 0.05493488   0.00   8.00
#> df...10  SRDM  1684 216.2246   0.50  48.90 37.771021 0.12264395  21.90  48.10
#>           CS_Mean     CS_SE ttest_pvalue ttest_significance
#> df...1  10.892857 0.6314310  0.209505833                 ns
#> df...2   3.930655 0.1754066  0.672855738                 ns
#> df...3   6.348214 0.4696134  0.058266745                 ns
#> df...4   2.617817 0.2207393  0.001585008                 **
#> df...5   7.748214 0.5588314  0.164507433                 ns
#> df...6   3.069087 0.2381436  0.005599998                 **
#> df...7  14.096429 0.9720528  0.086559633                 ns
#> df...8   5.686905 0.4210897  0.001302429                 **
#> df...9   1.702381 0.1516377  0.335457319                 ns
#> df...10 37.730357 0.3289992  0.907907091                 ns
```
