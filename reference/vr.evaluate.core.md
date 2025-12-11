# Variable Rate of Coefficient of Variation

Compute the Variable Rate of Coefficient of Variation (\\VR\\) (Hu et
al. 2000) to compare quantitative traits of the entire collection (EC)
and core set (CS).

## Usage

``` r
vr.evaluate.core(data, names, quantitative, selected)
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

The \\VR\\ value.

## Details

The Variable Rate of Coefficient of Variation (\\VR\\) is computed as
follows.

\\VR = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{CV\_{CS\_{i}}}{CV\_{EC\_{i}}} \right ) \times 100\\

Where, \\CV\_{CS\_{i}}\\ is the coefficients of variation for the
\\i\\th trait in the CS, \\CV\_{EC\_{i}}\\ is the coefficients of
variation for the \\i\\th trait in the EC and \\n\\ is the total number
of traits

## References

Hu J, Zhu J, Xu HM (2000). “Methods of constructing core collections by
stepwise clustering with three sampling strategies based on the
genotypic values of crops.” *Theoretical and Applied Genetics*,
**101**(1), 264–268.

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

vr.evaluate.core(data = ec, names = "genotypes",
                 quantitative = quant, selected = core)
#> [1] 111.6594
```
