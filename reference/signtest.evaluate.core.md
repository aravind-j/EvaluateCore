# Sign Test

Test difference between means and variances of entire collection (EC)
and core set (CS) for quantitative traits by Sign test (\\+\\ versus
\\-\\) (Basigalup et al. 1995; Tai and Miller 2001) .

## Usage

``` r
signtest.evaluate.core(data, names, quantitative, selected)
```

## Arguments

- data:

  The data as a data frame object. The data frame should possess one row
  per individual and columns with the individual names and multiple
  trait/character data.

- names:

  Name of column with the individual names as a character string

- quantitative:

  Name of columns with the quantitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

## Value

A data frame with the following components.

- Comparison:

  The comparison measure.

- ChiSq:

  The test statistic (\\\chi^{2}\\).

- p.value:

  The p value for the test statistic.

- significance:

  The significance of the test statistic (\*: p \\\leq\\ 0.01; \*\*: p
  \\\leq\\ 0.05; ns: p \\ \> \\ 0.05).

## Details

The test statistic for Sign test (\\\chi^{2}\\) is computed as follows.

\\\chi^{2} = \frac{(N\_{1}-N\_{2})^{2}}{N\_{1}+N\_{2}}\\

Where, where \\N\_{1}\\ is the number of variables for which the mean or
variance of the CS is greater than the mean or variance of the EC
(number of \\+\\ signs); \\N\_{2}\\ is the number of variables for which
the mean or variance of the CS is less than the mean or variance of the
EC (number of \\-\\ signs). The value of \\\chi^{2}\\ is compared with a
Chi-square distribution with 1 degree of freedom.

## References

Basigalup DH, Barnes DK, Stucker RE (1995). “Development of a core
collection for perennial *Medicago* plant introductions.” *Crop
Science*, **35**(4), 1163–1168.  
  
Tai PYP, Miller JD (2001). “A Core Collection for *Saccharum spontaneum*
L. from the World Collection of Sugarcane.” *Crop Science*, **41**(3),
879–885.

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

signtest.evaluate.core(data = ec, names = "genotypes",
                       quantitative = quant, selected = core)
#>   Comparison ChiSq    p.value significance
#> 1       Mean   1.6 0.20590321           ns
#> 2   Variance   3.6 0.05777957           ns
```
