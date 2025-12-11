# Chi-squared Test for Homogeneity

Compare the distribution frequencies of qualitative traits between
entire collection (EC) and core set (CS) by Chi-squared test for
homogeneity (Pearson 1900; Snedecor and Irwin 1933) .

## Usage

``` r
chisquare.evaluate.core(data, names, qualitative, selected, na.omit = TRUE)
```

## Arguments

- data:

  The data as a data frame object. The data frame should possess one row
  per individual and columns with the individual names and multiple
  trait/character data.

- names:

  Name of column with the individual names as a character string.

- qualitative:

  Name of columns with the qualitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

- na.omit:

  logical. If `TRUE`, missing values (`NA`) are ignored and not included
  as a distinct factor level for analysis. Default is `TRUE`.

## Value

A a data frame with the following columns.

- Trait:

  The qualitative trait.

- EC_No.Classes:

  The number of classes in the trait for EC.

- EC_Classes:

  The frequency of the classes in the trait for EC.

- CS_No.Classes:

  The number of classes in the trait for CS.

- CS_Classes:

  The frequency of the classes in the trait for CS.

- chisq_statistic:

  The \\\chi^{2}\\ test statistic.

- chisq_pvalue:

  The p value for the test statistic.

- chisq_significance:

  The significance of the test statistic (\*: p \\\leq\\ 0.01; \*\*: p
  \\\leq\\ 0.05; ns: p \\ \> \\ 0.05).

## References

Pearson K (1900). “X. On the criterion that a given system of deviations
from the probable in the case of a correlated system of variables is
such that it can be reasonably supposed to have arisen from random
sampling.” *The London, Edinburgh, and Dublin Philosophical Magazine and
Journal of Science*, **50**(302), 157–175.  
  
Snedecor G, Irwin MR (1933). “On the chi-square test for homogeneity.”
*Iowa State College Journal of Science*, **8**, 75–81.

## See also

[`chisq.test`](https://rdrr.io/r/stats/chisq.test.html)

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

chisquare.evaluate.core(data = ec, names = "genotypes",
                        qualitative = qual, selected = core)
#>     Trait Count EC_No.Classes
#> 1    CUAL  1684             5
#> 2    LNGS  1684             3
#> 3    PTLC  1684             5
#> 4    DSTA  1684             5
#> 5    LFRT  1684             5
#> 6   LBTEF  1684             6
#> 7    CBTR  1684             3
#> 8    NMLB  1684            10
#> 9    ANGB  1684             4
#> 10 CUAL9M  1684             5
#> 11  LVC9M  1684             5
#> 12 TNPR9M  1684             5
#> 13   PL9M  1684             3
#> 14   STRP  1684             4
#> 15   STRC  1684             2
#> 16   PSTR  1684             3
#>                                                                                                                           EC_Classes
#> 1                                                         Dark green(321); Green(2); Green purple(889); Light green(48); Purple(424)
#> 2                                                                                                 Long(741); Medium(791); Short(152)
#> 3                                                          Dark green(20); Green purple(1008); Light green(50); Purple(578); Red(28)
#> 4                                           Absent(76); Central part(770); Top and bottom(50); Top part(188); Totally pigmented(600)
#> 5  100% leaf retention(1); 25-50% leaf retention(679); 50-75% leaf retention(897); <100% leaf retention(83); <25% leaf retention(24)
#> 6                                                                                      0(404); 1(250); 2(388); 3(489); 4(140); 5(13)
#> 7                                                                                                Cream(1048); White(610); Yellow(26)
#> 8                                                             0(397); 1(185); 2(308); 3(506); 4(195); 5(72); 6(15); 7(3); 8(2); 9(1)
#> 9                                                                         150-300(468); 450-600(785); 750-900(34); No branching(397)
#> 10                                                       Dark green(566); Green(47); Green purple(435); Light green(33); Purple(603)
#> 11                                                       Dark green(624); Green(14); Green purple(896); Light green(110); Purple(40)
#> 12                                                                                            1(140); 2(252); 3(301); 4(361); 5(630)
#> 13                                                                     Long (25-30cm)(887); Medium (15-20cm)(792); Short (5-10cm)(5)
#> 14                                                                              Absent(555); Intermediate(459); Long(43); Short(627)
#> 15                                                                                                         Absent(721); Present(963)
#> 16                                                       Irregular(556); Tending toward horizontal(1125); Tending toward vertical(3)
#>    CS_No.Classes
#> 1              4
#> 2              3
#> 3              5
#> 4              5
#> 5              4
#> 6              6
#> 7              3
#> 8              9
#> 9              4
#> 10             5
#> 11             5
#> 12             5
#> 13             2
#> 14             4
#> 15             2
#> 16             2
#>                                                                                                                        CS_Classes
#> 1                                                          Dark green(31); Green(0); Green purple(89); Light green(6); Purple(42)
#> 2                                                                                                 Long(72); Medium(72); Short(24)
#> 3                                                            Dark green(7); Green purple(99); Light green(12); Purple(43); Red(7)
#> 4                                            Absent(22); Central part(74); Top and bottom(6); Top part(19); Totally pigmented(47)
#> 5  100% leaf retention(0); 25-50% leaf retention(64); 50-75% leaf retention(88); <100% leaf retention(14); <25% leaf retention(2)
#> 6                                                                                         0(32); 1(25); 2(37); 3(43); 4(28); 5(3)
#> 7                                                                                                 Cream(94); White(70); Yellow(4)
#> 8                                                                0(30); 1(20); 2(30); 3(54); 4(18); 5(12); 6(2); 7(1); 8(1); 9(0)
#> 9                                                                          150-300(54); 450-600(76); 750-900(8); No branching(30)
#> 10                                                         Dark green(51); Green(8); Green purple(48); Light green(5); Purple(56)
#> 11                                                         Dark green(60); Green(4); Green purple(84); Light green(17); Purple(3)
#> 12                                                                                              1(20); 2(31); 3(31); 4(32); 5(54)
#> 13                                                                    Long (25-30cm)(86); Medium (15-20cm)(82); Short (5-10cm)(0)
#> 14                                                                               Absent(54); Intermediate(51); Long(6); Short(57)
#> 15                                                                                                       Absent(68); Present(100)
#> 16                                                      Irregular(56); Tending toward horizontal(112); Tending toward vertical(0)
#>    chisq_statistic chisq_pvalue chisq_significance
#> 1        0.5046947   0.96570343                 ns
#> 2        5.0473183   0.07829217                 ns
#> 3       25.8082829   0.00039996                 **
#> 4       24.1043807   0.00019998                 **
#> 5        3.7515039   0.36186381                 ns
#> 6       15.8517808   0.00859914                 **
#> 7        2.8705932   0.24827517                 ns
#> 8        9.0091683   0.38836116                 ns
#> 9        8.3226194   0.03949605                  *
#> 10       3.9554501   0.40755924                 ns
#> 11       7.2401831   0.12118788                 ns
#> 12       5.0840571   0.27777222                 ns
#> 13       0.6650546   0.80351965                 ns
#> 14       1.6140159   0.65923408                 ns
#> 15       0.3416413   0.57124288                 ns
#> 16       0.3043632   1.00000000                 ns
```
