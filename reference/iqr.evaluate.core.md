# Interquartile Range

Compute the Interquartile Range (IQR) (Upton and Cook 1996) to compare
quantitative traits of the entire collection (EC) and core set (CS).

## Usage

``` r
iqr.evaluate.core(data, names, quantitative, selected)
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

A data frame with the accession count (excluding missing data) as well
as the IQR values of the EC and CS for the traits specified as
`quantitative`.

## References

Upton G, Cook I (1996). “General summary statistics.” In *Understanding
statistics*. Oxford University Press.

## See also

[`IQR`](https://rdrr.io/r/stats/IQR.html)

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

iqr.evaluate.core(data = ec, names = "genotypes",
                  quantitative = quant, selected = core)
#>    Trait Count    EC_IQR    CS_IQR
#> 1   NMSR  1684 10.000000  9.250000
#> 2   TTRN  1684  2.500000  2.666667
#> 3  TFWSR  1684  4.800000  5.550000
#> 4   TTRW  1684  1.500000  2.266667
#> 5  TFWSS  1684  7.400000  8.300000
#> 6   TTSW  1684  2.200000  2.837500
#> 7   TTPW  1684 11.250000 13.650000
#> 8   AVPW  1684  3.470833  5.110000
#> 9   ARSR  1684  3.000000  3.000000
#> 10  SRDM  1684  6.000000  4.625000
```
