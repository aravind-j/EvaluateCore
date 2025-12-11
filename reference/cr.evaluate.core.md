# Coincidence Rate of Range

Compute the following metrics to compare quantitative traits of the
entire collection (EC) and core set (CS).

- Changeable Rate of Maximum (\\CR\_{\max}\\) (Wang et al. 2007)

- Changeable Rate of Minimum (\\CR\_{\min}\\) (Wang et al. 2007)

- Changeable Rate of Mean (\\CR\_{\mu}\\) (Wang et al. 2007)

## Usage

``` r
cr.evaluate.core(data, names, quantitative, selected)
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

The \\CR\\ value.

## Details

The Coincidence Rate of Range (\\CR\\) is computed as follows.

\\CR = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{R\_{CS\_{i}}}{R\_{EC\_{i}}} \right ) \times 100\\

Where, \\R\_{CS\_{i}}\\ is the range of the \\i\\th trait in the CS,
\\R\_{EC\_{i}}\\ is the range of the \\i\\th trait in the EC and \\n\\
is the total number of traits.

A representative CS should have a \\CR\\ value no less than 70% (Diwan
et al. 1995) or 80% (Hu et al. 2000) .

The Changeable Rate of Maximum (\\CR\_{\max}\\) is computed as follows.

\\CR\_{\max} = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{\max\_{CS\_{i}}}{\max\_{EC\_{i}}} \right ) \times 100\\

Where, \\\max\_{CS\_{i}}\\ is the maximum value of the \\i\\th trait in
the CS, \\\max\_{EC\_{i}}\\ is the maximum value of the \\i\\th trait in
the EC and \\n\\ is the total number of traits.

The Changeable Rate of Minimum (\\CR\_{\min}\\) is computed as follows.

\\CR\_{\min} = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{\min\_{CS\_{i}}}{\min\_{EC\_{i}}} \right ) \times 100\\

Where, \\\min\_{CS\_{i}}\\ is the minimum value of the \\i\\th trait in
the CS, \\\min\_{EC\_{i}}\\ is the minimum value of the \\i\\th trait in
the EC and \\n\\ is the total number of traits.

The Changeable Rate of Mean (\\CR\_{\mu}\\) is computed as follows.

\\CR\_{\mu} = \left ( \frac{1}{n} \sum\_{i=1}^{n}
\frac{\mu\_{CS\_{i}}}{\mu\_{EC\_{i}}} \right ) \times 100\\

Where, \\\mu\_{CS\_{i}}\\ is the mean value of the \\i\\th trait in the
CS, \\\mu\_{EC\_{i}}\\ is the mean value of the \\i\\th trait in the EC
and \\n\\ is the total number of traits.

## Note

`NaN` or `Inf` values for \\CR\_{\min}\\ occurs when the minimum values
for some of the traits are zero.

## References

Diwan N, McIntosh MS, Bauchan GR (1995). “Methods of developing a core
collection of annual *Medicago* species.” *Theoretical and Applied
Genetics*, **90**(6), 755–761.  
  
Hu J, Zhu J, Xu HM (2000). “Methods of constructing core collections by
stepwise clustering with three sampling strategies based on the
genotypic values of crops.” *Theoretical and Applied Genetics*,
**101**(1), 264–268.  
  
Wang J, Hu J, Zhang C, Zhang S (2007). “Assessment on evaluating
parameters of rice core collections constructed by genotypic values and
molecular marker information.” *Rice Science*, **14**(2), 101–110.

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

cr.evaluate.core(data = ec, names = "genotypes",
                 quantitative = quant, selected = core)
#>        CR    CR_Max    CR_Min   CR_Mean 
#>  89.23084  93.78085       NaN 112.80763 
```
