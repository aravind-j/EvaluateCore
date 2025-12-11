# Percentage Difference of Means and Variances

Compute the following differences between the entire collection (EC) and
core set (CS).

- Percentage of significant differences of mean (\\MD\\\_{Hu}\\) (Hu et
  al. 2000)

- Percentage of significant differences of variance (\\VD\\\_{Hu}\\) (Hu
  et al. 2000)

- Average of absolute differences between means (\\MD\\\_{Kim}\\) (Kim
  et al. 2007)

- Average of absolute differences between variances (\\VD\\\_{Kim}\\)
  (Kim et al. 2007)

- Percentage difference between the mean squared Euclidean distance
  among accessions (\\\overline{d}D\\\\) (Studnicki et al. 2013)

- Percentage of range ratios smaller than 0.70 (\\S\_{RR\_{0.7}}\\)
  (Diwan et al. 1995)

## Usage

``` r
percentdiff.evaluate.core(
  data,
  names,
  quantitative,
  selected,
  alpha = 0.05,
  rr.crit = 0.7
)
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

- alpha:

  Type I error probability (Significance level) of difference.

- rr.crit:

  The critical value of range ratio considered to be acceptable for a
  representative CS. The default value is 0.7.

## Value

A data frame with the values of \\MD\\\_{Hu}\\, \\VD\\\_{Hu}\\,
\\MD\\\_{Kim}\\, \\VD\\\_{Kim}\\ and \\\overline{d}D\\\\.

## Details

The differences are computed as follows.

\\MD\\\_{Hu} = \left ( \frac{S\_{t}}{n} \right ) \times 100\\

Where, \\S\_{t}\\ is the number of traits with a significant difference
between the means of the EC and the CS and \\n\\ is the total number of
traits. A representative core should have \\MD\\\_{Hu}\\ \< 20 % and
\\CR\\ \> 80 % (Hu et al. 2000) .

\\VD\\\_{Hu} = \left ( \frac{S\_{F}}{n} \right ) \times 100\\

Where, \\S\_{F}\\ is the number of traits with a significant difference
between the variances of the EC and the CS and \\n\\ is the total number
of traits. Larger \\VD\\\_{Hu}\\ value indicates a more diverse core
set.

\\MD\\\_{Kim} = \left ( \frac{1}{n}\sum\_{i=1}^{n} \frac{\left \|
M\_{EC\_{i}}-M\_{CS\_{i}} \right \|}{M\_{CS\_{i}}} \right ) \times 100\\

Where, \\M\_{EC\_{i}}\\ is the mean of the EC for the \\i\\th trait,
\\M\_{CS\_{i}}\\ is the mean of the CS for the \\i\\th trait and \\n\\
is the total number of traits.

\\VD\\\_{Kim} = \left ( \frac{1}{n}\sum\_{i=1}^{n} \frac{\left \|
V\_{EC\_{i}}-V\_{CS\_{i}} \right \|}{V\_{CS\_{i}}} \right ) \times 100\\

Where, \\V\_{EC\_{i}}\\ is the variance of the EC for the \\i\\th trait,
\\V\_{CS\_{i}}\\ is the variance of the CS for the \\i\\th trait and
\\n\\ is the total number of traits.

\\\overline{d}D\\ =
\frac{\overline{d}\_{CS}-\overline{d}\_{EC}}{\overline{d}\_{EC}} \times
100\\

Where, \\\overline{d}\_{CS}\\ is the mean squared Euclidean distance
among accessions in the CS and \\\overline{d}\_{EC}\\ is the mean
squared Euclidean distance among accessions in the EC.

Percentage of range ratios smaller than 0.70 (Diwan et al. 1995) is
computed as follows.

\\RR\\\_{0.7} = \left ( \frac{S\_{RR\_{0.7}}}{n} \right ) \times 100\\

Where, \\S\_{RR\_{0.7}}\\ is the number of traits with a range ratio
smaller than 0.7 (\\\frac{R\_{CS\_{i}}}{R\_{EC\_{i}}} \< 0.7\\).
\\R\_{CS\_{i}}\\ is the range of the \\i\\th trait in the CS,
\\R\_{EC\_{i}}\\ is the range of the \\i\\th trait in the EC and \\n\\
is the total number of traits.

## References

Diwan N, McIntosh MS, Bauchan GR (1995). “Methods of developing a core
collection of annual *Medicago* species.” *Theoretical and Applied
Genetics*, **90**(6), 755–761.  
  
Hu J, Zhu J, Xu HM (2000). “Methods of constructing core collections by
stepwise clustering with three sampling strategies based on the
genotypic values of crops.” *Theoretical and Applied Genetics*,
**101**(1), 264–268.  
  
Kim K, Chung H, Cho G, Ma K, Chandrabalan D, Gwag J, Kim T, Cho E, Park
Y (2007). “PowerCore: A program applying the advanced M strategy with a
heuristic search for establishing core sets.” *Bioinformatics*,
**23**(16), 2155–2162.  
  
Studnicki M, Madry W, Schmidt J (2013). “Comparing the efficiency of
sampling strategies to establish a representative in the
phenotypic-based genetic diversity core collection of orchardgrass
(*Dactylis glomerata* L.).” *Czech Journal of Genetics and Plant
Breeding*, **49**(1), 36–47.

## See also

[`snk.evaluate.core`](https://aravind-j.github.io/EvaluateCore/reference/snk.evaluate.core.md),
[`snk.evaluate.core`](https://aravind-j.github.io/EvaluateCore/reference/snk.evaluate.core.md)

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

percentdiff.evaluate.core(data = ec, names = "genotypes",
                          quantitative = quant, selected = core)
#>   MDPercent_Hu VDPercent_Hu MDPercent_Kim VDPercent_Kim DDPercent RR
#> 1           50           80      13.02737      41.64331   18.2052 20
```
