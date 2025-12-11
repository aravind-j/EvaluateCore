# Shannon-Weaver Diversity Index

Compute the Shannon-Weaver Diversity Index (\\H'\\), Maximum diversity
(\\H'\_{max}\\) and Shannon Equitability Index (\\E\_{H}\\) (Shannon and
Weaver 1949) to compare the phenotypic diversity for qualitative traits
between entire collection (EC) and core set (CS).

## Usage

``` r
shannon.evaluate.core(data, names, qualitative, selected)
```

## Value

A data frame with the following columns.

- Trait:

  The qualitative trait.

- EC_H:

  The Shannon-Weaver Diversity Index (\\H'\\) for EC.

- EC_H:

  The Shannon-Weaver Diversity Index (\\H'\\) for CS.

- EC_Hmax:

  The Maximum diversity value (\\H'\_{max}\\) for EC.

- CS_Hmax:

  The Maximum diversity value (\\H'\_{max}\\) for CS.

- EC_EH:

  The Shannon Equitability Index (\\E\_{H}\\) for EC.

- CS_EH:

  The Shannon Equitability Index (\\E\_{H}\\) for CS.

## Details

Shannon-Weaver Diversity Index (\\H'\\) is computed as follows.

\\H' = -\sum\_{i=1}^{k}p\_{i} \ln(p\_{i})\\

Where \\p\_{i}\\ denotes the proportion in the group \\k\\.

The maximum value of the index (\\H'\_{max}\\) is \\\ln(k)\\. This value
occurs when each group has the same frequency.

The Shannon equitability index (\\E\_{H}\\) is the Shannon diversity
index divided by the maximum diversity.

\\E\_{H} = \frac{H'}{\ln{(k)}}\\

## References

Shannon CE, Weaver W (1949). *The Mathematical Theory of Communication*,
number v. 2 in The Mathematical Theory of Communication. University of
Illinois Press.

## See also

[`shannon`](https://rdrr.io/pkg/psych/man/misc.html)

[`EvaluateCore-deprecated`](https://aravind-j.github.io/EvaluateCore/reference/EvaluateCore-deprecated.md)

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

shannon.evaluate.core(data = ec, names = "genotypes",
                      qualitative = qual, selected = core)
#> Warning: `shannon.evaluate.core()` was deprecated in EvaluateCore 0.1.3.
#> Please use `diversity.evaluate.core()` instead.
#>     Trait      EC_H      CS_H   EC_Hmax   CS_Hmax     EC_EH     CS_EH
#> 1    CUAL 1.1098536 1.1139942 1.6094379 1.3862944 0.6895908 0.8035770
#> 2    LNGS 0.9332401 1.0042425 1.0986123 1.0986123 0.8494718 0.9141009
#> 3    PTLC 0.8994139 1.1137849 1.6094379 1.6094379 0.5588373 0.6920334
#> 4    DSTA 1.2145172 1.3492284 1.6094379 1.6094379 0.7546220 0.8383227
#> 5    LFRT 0.9150959 0.9661827 1.6094379 1.3862944 0.5685810 0.6969535
#> 6   LBTEF 1.5672607 1.6518891 1.7917595 1.7917595 0.8747048 0.9219369
#> 7    CBTR 0.7273939 0.7786690 1.0986123 1.0986123 0.6621025 0.7087751
#> 8    NMLB 1.7054447 1.7750146 2.3025851 2.1972246 0.7406652 0.8078440
#> 9    ANGB 1.1310864 1.1762716 1.3862944 1.3862944 0.8159064 0.8485006
#> 10 CUAL9M 1.2608051 1.3356118 1.6094379 1.6094379 0.7833823 0.8298622
#> 11  LVC9M 1.0104787 1.1069704 1.6094379 1.6094379 0.6278457 0.6877994
#> 12 TNPR9M 1.4967570 1.5577108 1.6094379 1.6094379 0.9299874 0.9678601
#> 13   PL9M 0.7097358 0.6928637 1.0986123 0.6931472 0.6460294 0.9995910
#> 14   STRP 1.1816193 1.2124597 1.3862944 1.3862944 0.8523582 0.8746048
#> 15   STRC 0.6827857 0.6748953 0.6931472 0.6931472 0.9850516 0.9736681
#> 16   PSTR 0.6466388 0.6365142 1.0986123 0.6931472 0.5885960 0.9182958
```
