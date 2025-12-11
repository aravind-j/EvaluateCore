# Synthetic Variation Coefficient

Compute the Synthetic Variation Coefficient (\\CV\\\\) (Dong 1998; Dong
et al. 2001) to compare quantitative traits of the entire collection
(EC) and core set (CS).

## Usage

``` r
scv.evaluate.core(data, names, quantitative, selected)
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

The Synthetic Variation Coefficient values for EC and CS

## Details

Synthetic Variation Coefficient (\\CV\\\\) (Dong 1998; Dong et al. 2001)
is computed as follows for the core set (CS).

\\CV(\\) = \left ( \frac{1}{n} \sum\_{i=1}^{n} \frac{SE\_{j}}{\mu\_{i}}
\right ) \times 100\\

Where, \\SE\_{i}\\ is the standard error of the \\i\\th trait,
\\\mu\_{i}\\ is the mean of the \\i\\th trait and \\n\\ is the total
number of traits.

## References

Dong YS (1998). “Exploration on genetic diversity center for cultivated
soybean in China.” *Chinese Crops Journal*, **1**, 18–19.  
  
Dong YS, Zhuang BC, Zhao LM, Sun H, He MY (2001). “The genetic diversity
of annual wild soybeans grown in China.” *Theoretical and Applied
Genetics*, **103**(1), 98–103.

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

scv.evaluate.core(data = ec, names = "genotypes",
                  quantitative = quant, selected = core)
#>   EC_SCV   CS_SCV 
#> 10.75148 41.67945 
```
