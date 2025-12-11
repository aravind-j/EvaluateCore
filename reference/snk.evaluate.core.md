# Student-Newman-Keuls Test

Test difference between means of entire collection (EC) and core set
(CS) for quantitative traits by Newman-Keuls or Student-Newman-Keuls
test (Newman 1939; Keuls 1952) .

## Usage

``` r
snk.evaluate.core(data, names, quantitative, selected)
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

A data frame with the following components.

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

- SNK_pvalue:

  The p value of the Student-Newman-Keuls test for equality of means of
  EC and CS.

- SNK_significance:

  The significance of the Student-Newman-Keuls test for equality of
  means of EC and CS.

## References

Keuls M (1952). “The use of the ,,studentized range" in connection with
an analysis of variance.” *Euphytica*, **1**(2), 112–122.  
  
Newman D (1939). “The distribution of range in samples from a normal
population, expressed in terms of an independent estimate of standard
deviation.” *Biometrika*, **31**(1-2), 20–30.

## See also

[`SNK.test`](https://rdrr.io/pkg/agricolae/man/SNK.test.html)

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

snk.evaluate.core(data = ec, names = "genotypes",
                  quantitative = quant, selected = core)
#>    Trait Count   Df EC_Min EC_Max   EC_Mean      EC_SE CS_Min CS_Max   CS_Mean
#> 1   NMSR  1684 1850   1.00  55.00 11.722090 0.18731651   1.00  55.00 10.892857
#> 2   TTRN  1684 1850   0.25  13.75  3.853909 0.04656232   0.25  13.75  3.930655
#> 3  TFWSR  1684 1850   0.00  40.00  5.428979 0.11045567   0.20  38.00  6.348214
#> 4   TTRW  1684 1850   0.00  20.20  1.897948 0.04037796   0.10  20.20  2.617817
#> 5  TFWSS  1684 1850   0.20  42.00  6.943052 0.14359496   0.20  42.00  7.748214
#> 6   TTSW  1684 1850   0.04  22.00  2.387502 0.04878843   0.10  22.00  3.069087
#> 7   TTPW  1684 1850   0.40  80.00 12.372031 0.23851356   0.40  80.00 14.096429
#> 8   AVPW  1684 1850   0.20  33.00  4.285450 0.08195995   0.20  33.00  5.686905
#> 9   ARSR  1684 1850   0.00  18.00  1.858076 0.05493488   0.00   8.00  1.702381
#> 10  SRDM  1684 1850   0.50  48.90 37.771021 0.12264395  21.90  48.10 37.730357
#>        CS_SE SNK_pvalue SNK_significance
#> 1  0.6314310     0.1852               ns
#> 2  0.1754066     0.6261               ns
#> 3  0.4696134     0.0156                *
#> 4  0.2207393     0.0000               **
#> 5  0.5588314     0.0989               ns
#> 6  0.2381436     0.0001               **
#> 7  0.9720528     0.0345                *
#> 8  0.4210897     0.0000               **
#> 9  0.1516377     0.3882               ns
#> 10 0.3289992     0.9194               ns
```
