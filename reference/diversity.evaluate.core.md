# Diversity Indices

Compute the following diversity indices and perform corresponding
statistical tests to compare the phenotypic diversity for qualitative
traits between entire collection (EC) and core set (CS).

- Simpson's and related indices

  - Simpson's Index (\\d\\) (Simpson 1949; Peet 1974)

  - Simpson's Index of Diversity or Gini's Diversity Index or
    Gini-Simpson Index or Nei's Diversity Index or Nei's Variation Index
    (\\D\\) or Hurlbert’s probability of interspecific encounter
    (\\PIE\\) (Gini 1912, 1912; Greenberg 1956; Berger and Parker 1970;
    Hurlbert 1971; Nei 1973; Peet 1974)

  - Maximum Simpson's Index of Diversity or Maximum Nei's
    Diversity/Variation Index (\\D\_{max}\\) (Hennink and Zeven 1990)

  - Simpson's Reciprocal Index or Hill's \\N\_{2}\\ (\\D\_{R}\\) or
    Effective number of Species (or Classes) (\\ENS\_{d}\\) (Williams
    1964; Hill 1973)

  - Relative Simpson's Index of Diversity or Relative Nei's
    Diversity/Variation Index (\\D'\\) (Hennink and Zeven 1990)

  - Simpson’s evenness or equitability (\\D\_{e}\\) (Pielou 1966; Hill
    1973)

- Shannon-Weaver and related indices

  - Shannon or Shannon-Weaver or Shannon-Wiener Diversity Index or
    Shannon entropy (\\H\\) (Shannon and Weaver 1949; Peet 1974)

  - Maximum Shannon-Weaver Diversity Index (\\H\_{max}\\) (Hennink and
    Zeven 1990)

  - Relative Shannon-Weaver Diversity Index or Shannon Equitability
    Index (\\H'\\) or Pielou's Evenness (\\J\\) (Pielou 1966; Hennink
    and Zeven 1990)

  - Effective number of species (or Classes) for the Shannon - Weaver
    Diversity Index (\\ENS\_{H}\\) or Hill's \\N\_{1}\\ (Macarthur 1965;
    Hill 1973)

- McIntosh's measures of diversity

  - McIntosh Diversity Index (\\D\_{Mc}\\) (McIntosh 1967; Peet 1974)

  - McIntosh Evenness Index (\\E\_{Mc}\\) (Pielou 1975)

## Usage

``` r
diversity.evaluate.core(
  data,
  names,
  qualitative,
  selected,
  base = 2,
  R = 1000,
  na.omit = TRUE
)
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

- base:

  The logarithm base to be used for computation of Shannon-Weaver
  Diversity Index (\\I\\). Default is 2.

- R:

  The number of bootstrap replicates. Default is 1000.

- na.omit:

  logical. If `TRUE`, missing values (`NA`) are ignored and not included
  as a distinct factor level for computation. Default is `TRUE`.

## Value

A list with three data frames as follows.

- simpson:

  EC_No.Classes

  :   The number of classes in the trait for EC.

  CS_No.Classes

  :   The number of classes in the trait for CS.

  EC_d

  :   The Simpson's Index (\\d\\) for EC.

  EC_D

  :   The Simpson's Index of Diversity (\\D\\) for EC.

  EC_D.max

  :   The Maximum Simpson's Index of Diversity (\\D\_{max}\\) for EC.

  EC_D.inv

  :   The Simpson's Reciprocal Index (\\D\_{R}\\) for EC.

  EC_D.rel

  :   The Relative Reciprocal Index (\\D'\\) for EC.

  EC_D.e

  :   The Shannon's evenness or equitability (\\D\_{e}\\) for EC.

  EC_d.V

  :   The variance of \\d\\ for EC according to (Simpson 1949) .

  EC_d.boot.V

  :   The bootstrap variance of \\d\\ for EC.

  CS_d

  :   The Simpson's Index (\\d\\) for CS.

  CS_D

  :   The Simpson's Index of Diversity (\\D\\) for CS.

  CS_D.max

  :   The Maximum Simpson's Index of Diversity (\\D\_{max}\\) for CS.

  CS_D.inv

  :   The Simpson's Reciprocal Index (\\D\_{R}\\) for CS.

  CS_D.rel

  :   The Relative Reciprocal Index (\\D'\\) for CS.

  CS_D.e

  :   The Shannon's evenness or equitability (\\D\_{e}\\) for CS.

  CS_d.V

  :   The variance of \\d\\ for CS according to (Simpson 1949) .

  CS_d.boot.V

  :   The bootstrap variance of \\d\\ for CS.

  d.t.df

  :   The degrees of freedom for t test.

  d.t.stat

  :   The t statistic.

  d.t.pvalue

  :   The p value for t test.

  d.t.significance

  :   The significance of t test for t-test

  d.boot.z.df

  :   The degrees of freedom for bootstrap z score.

  d.boot.z.stat

  :   The bootstrap z score.

  d.boot.z.pvalue

  :   The p value of z score.

  d.boot.z.significance

  :   The significance of z score.

- shannon:

  EC_No.Classes

  :   The number of classes in the trait for EC.

  CS_No.Classes

  :   The number of classes in the trait for CS.

  EC_I

  :   The Shannon-Weaver Diversity Index (\\I\\) for EC.

  EC_I.max

  :   The Maximum Shannon-Weaver Diversity Index (\\I\_{max}\\) for EC.

  EC_I.rel

  :   The Relative Shannon-Weaver Diversity Index (\\I'\\) for EC.

  EC_I.ens

  :   The Effective Number of Species (or Classes) for Shannon-Weaver
      Diversity Index (\\ENS\_{H}\\) for EC

  EC_I.V

  :   The variance of \\I\\ for EC according to (Hutcheson 1970) .

  EC_I.boot.V

  :   The bootstrap variance of \\I\\ for EC.

  CS_I

  :   The Shannon-Weaver Diversity Index (\\I\\) for CS.

  CS_I.max

  :   The Maximum Shannon-Weaver Diversity Index (\\I\_{max}\\) for CS.

  CS_I.rel

  :   The Relative Shannon-Weaver Diversity Index (\\I'\\) for CS.

  CS_I.ens

  :   The Effective Number of Species (or Classes) for Shannon-Weaver
      Diversity Index (\\ENS\_{H}\\) for CS.

  CS_I.V

  :   The variance of \\I\\ for CS according to (Hutcheson 1970) .

  CS_I.boot.V

  :   The bootstrap variance of \\I\\ for CS.

  I.t.stat

  :   The t statistic.

  I.t.df

  :   The degrees of freedom for t test.

  I.t.pvalue

  :   The p value for t test.

  I.t.significance

  :   The significance of t test for t-test

  I.boot.z.df

  :   The degrees of freedom for bootstrap z score.

  I.boot.z.stat

  :   The bootstrap z score.

  I.boot.z.pvalue

  :   The p value of z score.

  I.boot.z.significance

  :   The significance of z score.

- mcintosh:

  CS_No.Classes

  :   The number of classes in the trait for CS.

  EC_D.Mc

  :   The McIntosh Diversity Index (\\D\_{Mc}\\) for EC.

  EC_E.Mc

  :   The McIntosh Evenness Index (\\E\_{Mc}\\) for EC.

  CS_D.Mc

  :   The McIntosh Diversity Index (\\D\_{Mc}\\) for CS.

  CS_E.Mc

  :   The McIntosh Evenness Index (\\E\_{Mc}\\) for CS.

  M.boot.z.stat

  :   The bootstrap z score.

  M.boot.z.df

  :   The degrees of freedom for bootstrap z score.

  M.boot.z.pvalue

  :   The p value of z score.

  M.boot.z.significance

  :   The significance of z score.

## Details

The diversity indices and the corresponding statistical tests
implemented in `diversity.evaluate.core` are as follows.

### Simpson's and Related Indices

Simpson's index (\\d\\) which estimates the probability that two
accessions randomly selected will belong to the same phenotypic class of
a trait, is computed as follows (Simpson 1949; Peet 1974) .

\\d = \sum\_{i = 1}^{k}p\_{i}^{2}\\

Where, \\p\_{i}\\ denotes the proportion/fraction/frequency of
accessions in the \\i\\th phenotypic class for a trait and \\k\\ is the
number of phenotypic classes for the trait.

The value of \\d\\ can range from 0 to 1 with 0 representing maximum
diversity and 1, no diversity.

\\d\\ is subtracted from 1 to give Simpson's index of diversity (\\D\\)
(Greenberg 1956; Berger and Parker 1970; Hurlbert 1971; Peet 1974;
Hennink and Zeven 1990) originally suggested by Gini (1912, 1912) and
described in literature as Gini's diversity index or Gini-Simpson index.
It is the same as Nei's diversity index or Nei's variation index (Nei
1973; Hennink and Zeven 1990) . Greater the value of \\D\\, greater the
diversity with a range from 0 to 1.

\\D = 1 - d\\

The maximum value of \\D\\, \\D\_{max}\\ occurs when accessions are
uniformly distributed across the phenotypic classes and is computed as
follows (Hennink and Zeven 1990) .

\\D\_{max} = 1 - \frac{1}{k}\\

Reciprocal of \\d\\ gives the Simpson's reciprocal index (\\D\_{R}\\)
(Williams 1964; Hennink and Zeven 1990) and can range from 1 to \\k\\.
This was also described in Hill (1973) as \\N\_{2}\\ or as Effective
number of Species (or Classes) (\\ENS\_{d}\\).

\\D\_{R} = \frac{1}{d}\\

Relative Simpson's index of diversity or Relative Nei's
diversity/variation index (\\H'\\) (Hennink and Zeven 1990) is defined
as follows (Peet 1974) .

\\D' = \frac{D}{D\_{max}}\\

Simpson’s evenness or equitability (\\D\_{e}\\ is described as follows
(Pielou 1966; Hill 1973) .

\\D\_{e} = \frac{1}{d \cdot k}\\

Differences in Simpson's diversity index for qualitative traits of EC
and CS can be tested by a t-test using the associated variance estimate
described in Simpson (1949) (Lyons and Hutcheson 1978) .

The t statistic is computed as follows.

\\t = \frac{d\_{EC} - d\_{CS}}{\sqrt{V\_{d\_{EC}} + V\_{d\_{CS}}}}\\

Where, the variance of \\d\\ (\\V\_{d}\\) is,

\\V\_{d} = \frac{4N(N-1)(N-2)\sum\_{i=1}^{k}(p\_{i})^{3} +
2N(N-1)\sum\_{i=1}^{k}(p\_{i})^{2} - 2N(N-1)(2N-3) \left(
\sum\_{i=1}^{k}(p\_{i})^{2} \right)^{2}}{\[N(N-1)\]^{2}}\\

The associated degrees of freedom is computed as follows.

\\df = (k\_{EC} - 1) + (k\_{CS} - 1)\\

Where, \\k\_{EC}\\ and \\k\_{CS}\\ are the number of phenotypic classes
in the trait for EC and CS respectively.

### Shannon-Weaver and Related Indices

An index of information \\H\\, was described by Shannon and Weaver
(1949) as follows.

\\H = -\sum\_{i=1}^{k}p\_{i} \log\_{2}(p\_{i})\\

\\H\\ is described as Shannon or Shannon-Weaver or Shannon-Wiener
diversity index or Shannon entropy in literature (Shannon and Weaver
1949; Peet 1974) .

Alternatively, \\H\\ is also computed using natural logarithm instead of
logarithm to base 2.

\\H = -\sum\_{i=1}^{k}p\_{i} \ln(p\_{i})\\

The maximum value of \\H\\ (\\H\_{max}\\) is \\\ln(k)\\. This value
occurs when each phenotypic class for a trait has the same proportion of
accessions (Hennink and Zeven 1990) .

\\H\_{max} = \log\_{2}(k)\\\\ \textrm{OR} \\\\ H\_{max} = \ln(k)\\

The relative Shannon-Weaver diversity index or Shannon equitability
index (\\H'\\) or Pielou's Evenness (\\J\\) is the Shannon diversity
index (\\I\\) divided by the maximum diversity (\\H\_{max}\\) (Pielou
1966; Hennink and Zeven 1990) .

\\H' = \frac{H}{H\_{max}}\\

Macarthur (1965) described the Effective number of Species (or Classes)
for the Shannon index (\\ENS\_{H}\\) as follows.

\\ENS\_{H} = e^{H}\\

Differences in Shannon-Weaver diversity index for qualitative traits of
EC and CS can be tested by Hutcheson t-test (Hutcheson 1970) .

The Hutcheson t statistic is computed as follows.

\\t = \frac{H\_{EC} - H\_{CS}}{\sqrt{V\_{H\_{EC}} + V\_{H\_{CS}}}}\\

Where, the variance of \\H\\ (\\V\_{H}\\) is,

\\V\_{H} = \frac{\sum\_{i=1}^{k}n\_{i}(\log\_{2}{n\_{i}})^{2}
\frac{(\sum\_{i=1}^{k}\log\_{2}{n\_{i}})^2}{N}}{N^{2}}\\

\\\textrm{OR}\\

\\V\_{H} = \frac{\sum\_{i=1}^{k}n\_{i}(\ln{n\_{i}})^{2}
\frac{(\sum\_{i=1}^{k}\ln{n\_{i}})^2}{N}}{N^{2}}\\

The associated degrees of freedom is approximated as follows.

\\df = \frac{(V\_{H\_{EC}} +
V\_{H\_{CS}})^{2}}{\frac{V\_{H\_{EC}}^{2}}{N\_{EC}} +
\frac{V\_{H\_{CS}}^{2}}{N\_{CS}}}\\

### McIntosh's Measure of Diversity

A similar index of diversity was described by McIntosh (1967) as follows
(\\D\_{Mc}\\) (Peet 1974) .

\\D\_{Mc} = \frac{N - \sqrt{\sum\_{i=1}^{k}n\_{i}^2}}{N - \sqrt{N}}\\

Where, \\n\_{i}\\ denotes the number of accessions in the \\i\\th
phenotypic class for a trait and \\N\\ is the total number of accessions
so that \\p\_{i} = {n\_{i}}/{N}\\.

An additional measure of evenness was proposed by Pielou (1975) as
follows.

\\E\_{Mc} = \frac{N - \sqrt{\sum\_{i=1}^{k}n\_{i}^2}}{N -
\frac{N}{\sqrt{S}}}\\

### Testing for difference with bootstrapping

Bootstrap statistics are employed to test the difference between the
Simpson, Shannon-Weaver and McIntosh indices for qualitative traits of
EC and CS (Solow 1993) .

If \\I\_{EC}\\ and \\I\_{CS}\\ are the diversity indices with the
original number of accessions, then random samples of the same size as
the original are repeatedly generated (with replacement) \\R\\ times and
the corresponding diversity index is computed for each sample.

\\I\_{EC}^{\*} = \lbrace H\_{EC\_{1}}, H\_{EC\_{}}, \cdots, H\_{EC\_{R}}
\rbrace\\

\\I\_{CS}^{\*} = \lbrace H\_{CS\_{1}}, H\_{CS\_{}}, \cdots, H\_{CS\_{R}}
\rbrace\\

Then the bootstrap null sample \\I\_{0}\\ is computed as follows.

\\\Delta^{\*} = I\_{EC}^{\*} - I\_{CS}^{\*}\\

\\I\_{0} = \Delta^{\*} - \overline{\Delta^{\*}}\\

Where, \\\overline{\Delta^{\*}}\\ is the mean of \\\Delta^{\*}\\.

Now the original difference in diversity indices (\\\Delta\_{0} =
I\_{EC} - I\_{CS}\\) is tested against mean of bootstrap null sample
(\\I\_{0}\\) by a z test. The z score test statistic is computed as
follows.

\\z = \frac{\Delta\_{0} - \overline{H\_{0}}}{\sqrt{V\_{H\_{0}}}}\\

Where, \\\overline{H\_{0}}\\ and \\V\_{H\_{0}}\\ are the mean and
variance of the bootstrap null sample \\H\_{0}\\.

The corresponding degrees of freedom is estimated as follows.

\\df = (k\_{EC} - 1) + (k\_{CS} - 1)\\

## References

Berger WH, Parker FL (1970). “Diversity of planktonic foraminifera in
deep-sea sediments.” *Science*, **168**(3937), 1345–1347.  
  
Gini C (1912). *Variabilita e Mutabilita. Contributo allo Studio delle
Distribuzioni e delle Relazioni Statistiche. \[Fasc. I.\]*. Tipogr. di
P. Cuppini, Bologna.  
  
Gini C (1912). “Variabilita e mutabilita.” In Pizetti E, Salvemini T
(eds.), *Memorie di Metodologica Statistica*. Liberia Eredi Virgilio
Veschi, Roma, Italy.  
  
Greenberg JH (1956). “The measurement of linguistic diversity.”
*Language*, **32**(1), 109.  
  
Hennink S, Zeven AC (1990). “The interpretation of Nei and
Shannon-Weaver within population variation indices.” *Euphytica*,
**51**(3), 235–240.  
  
Hill MO (1973). “Diversity and evenness: A unifying notation and its
consequences.” *Ecology*, **54**(2), 427–432.  
  
Hurlbert SH (1971). “The nonconcept of species diversity: a critique and
alternative parameters.” *Ecology*, **52**(4), 577–586.  
  
Hutcheson K (1970). “A test for comparing diversities based on the
Shannon formula.” *Journal of Theoretical Biology*, **29**(1),
151–154.  
  
Lyons NI, Hutcheson K (1978). “C20. Comparing diversities: Gini's
index.” *Journal of Statistical Computation and Simulation*, **8**(1),
75–78.  
  
Macarthur RH (1965). “Patterns of species diversity.” *Biological
Reviews*, **40**(4), 510–533.  
  
McIntosh RP (1967). “An index of diversity and the relation of certain
concepts to diversity.” *Ecology*, **48**(3), 392–404.  
  
Nei M (1973). “Analysis of gene diversity in subdivided populations.”
*Proceedings of the National Academy of Sciences*, **70**(12),
3321–3323.  
  
Peet RK (1974). “The measurement of species diversity.” *Annual Review
of Ecology and Systematics*, **5**(1), 285–307.  
  
Pielou EC (1966). “The measurement of diversity in different types of
biological collections.” *Journal of Theoretical Biology*, **13**,
131–144.  
  
Pielou EC (1975). *Ecological diversity*. New York : Wiley. ISBN
978-0-471-68925-6.  
  
Shannon CE, Weaver W (1949). *The Mathematical Theory of Communication*,
number v. 2 in The Mathematical Theory of Communication. University of
Illinois Press.  
  
Simpson EH (1949). “Measurement of diversity.” *Nature*, **163**(4148),
688–688.  
  
Solow AR (1993). “A simple test for change in community structure.” *The
Journal of Animal Ecology*, **62**(1), 191.  
  
Williams CB (1964). *Patterns in the Balance of Nature and Related
Problems in Quantitative Ecology*. Academic Press.

## See also

[`shannon`](https://rdrr.io/pkg/psych/man/misc.html),
[`diversity`](https://vegandevs.github.io/vegan/reference/diversity.html),
[`boot`](https://rdrr.io/pkg/boot/man/boot.html)

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

# \donttest{
diversity.evaluate.core(data = ec, names = "genotypes",
                        qualitative = qual, selected = core)
#> $simpson
#>     Trait EC_No.Classes CS_No.Classes              EC_d              EC_D
#> 1    CUAL             5             4 0.379231526565524 0.620768473434476
#> 2    LNGS             3             3 0.422400150078142 0.577599849921858
#> 3    PTLC             5             5 0.477398006104682 0.522601993895318
#> 4    DSTA             5             5 0.351400071089646 0.648599928910354
#> 5    LFRT             5             4 0.448935347916114 0.551064652083886
#> 6   LBTEF             6             6 0.223971174841036 0.776028825158964
#> 7    CBTR             3             3  0.51874284166756  0.48125715833244
#> 8    NMLB            10             9 0.206703725435988 0.793296274564012
#> 9    ANGB             4             4 0.350516387291879  0.64948361270812
#> 10 CUAL9M             5             5 0.309073521363567 0.690926478636433
#> 11  LVC9M             5             5 0.425299451029954 0.574700548970046
#> 12 TNPR9M             5             5 0.247165582455527 0.752834417544473
#> 13   PL9M             3             2 0.498635332682619 0.501364667317381
#> 14   STRP             4             4 0.322189843207836 0.677810156792164
#> 15   STRC             2             2 0.510325630074306 0.489674369925694
#> 16   PSTR             3             2 0.555306757465823 0.444693242534177
#>             EC_D.max         EC_D.inv          EC_D.rel            EC_D.e
#> 1                0.8 2.63691156971154 0.775960591793095  0.32218131003573
#> 2  0.666666666666667 2.36742340128195 0.866399774882787 0.577100796301158
#> 3                0.8 2.09468826265002 0.653252492369147 0.382700415107987
#> 4                0.8 2.84575924216273 0.810749911137942 0.308356493865177
#> 5                0.8 2.22749223165839 0.688830815104857 0.362933821365038
#> 6  0.833333333333333 4.46486026922774 0.931234590190757  0.21476865454389
#> 7  0.666666666666667 1.92773744459853  0.72188573749866 0.692630390139725
#> 8                0.9 4.83784217188518 0.881440305071124 0.126056308602935
#> 9               0.75 2.85293366089411 0.865978150277494 0.384921182164377
#> 10               0.8 3.23547612745411 0.863658098295541 0.289466399369593
#> 11               0.8 2.35128448338761 0.718375686212558 0.348007323741784
#> 12               0.8 4.04587074812462 0.941043021930592 0.265662668096846
#> 13 0.666666666666667   2.005473608579 0.752047000976072 0.664852062904388
#> 14              0.75 3.10376016215672 0.903746875722886 0.368834838921803
#> 15               0.5  1.9595331707216 0.979348739851389  1.02108672764693
#> 16 0.666666666666667 1.80080646697613 0.667039863801265 0.749580388120504
#>                  EC_d.V          EC_d.boot.V              CS_d
#> 1   6.2401326584027e-05 6.68533450338314e-05 0.378472222222222
#> 2  2.66303075243519e-05 2.65879113857189e-05 0.387755102040816
#> 3  6.43256463380354e-05 6.50363094034534e-05 0.421343537414966
#> 4  4.49202770089222e-05 4.79746735208086e-05 0.303500566893424
#> 5  3.64033438958824e-05 3.49356184489191e-05 0.426587301587302
#> 6  1.01110395238633e-05 9.78416887814862e-06 0.200538548752834
#> 7  4.63756492257553e-05 4.76384743057889e-05 0.487244897959184
#> 8  1.57355754103247e-05 1.55424381336112e-05 0.198058390022676
#> 9  3.10366375721298e-05 3.19616815160651e-05 0.342120181405896
#> 10 1.34905804296262e-05 1.35390135457135e-05 0.288052721088435
#> 11 4.98247003940664e-05 4.73810044068571e-05 0.388676303854875
#> 12 2.56650302792209e-05 2.63678232813366e-05   0.2218679138322
#> 13 3.79031161219311e-06 3.95700024252201e-06 0.500283446712018
#> 14 9.34647324671549e-06 9.00891406453171e-06 0.311862244897959
#> 15 1.21791747807758e-05 1.11259330666434e-05 0.518140589569161
#> 16  6.1357244865428e-05 5.79882678523648e-05 0.555555555555556
#>                 CS_D          CS_D.max         CS_D.inv          CS_D.rel
#> 1  0.621527777777778              0.75 2.64220183486239 0.828703703703704
#> 2  0.612244897959184 0.666666666666667 2.57894736842105 0.918367346938775
#> 3  0.578656462585034               0.8 2.37336024217962 0.723320578231292
#> 4  0.696499433106576               0.8 3.29488676161569  0.87062429138322
#> 5  0.573412698412698              0.75 2.34418604651163 0.764550264550265
#> 6  0.799461451247165 0.833333333333333 4.98657243816254 0.959353741496599
#> 7  0.512755102040816 0.666666666666667 2.05235602094241 0.769132653061224
#> 8  0.801941609977324 0.888888888888889 5.04901610017889  0.90218431122449
#> 9  0.657879818594104              0.75 2.92294946147473 0.877173091458806
#> 10 0.711947278911565               0.8 3.47158671586716 0.889934098639456
#> 11 0.611323696145125               0.8 2.57283500455789 0.764154620181406
#> 12   0.7781320861678               0.8 4.50718620249122 0.972665107709751
#> 13 0.499716553287982               0.5 1.99886685552408 0.999433106575964
#> 14 0.688137755102041              0.75 3.20654396728016 0.917517006802721
#> 15 0.481859410430839               0.5 1.92997811816193 0.963718820861678
#> 16 0.444444444444444               0.5              1.8 0.888888888888889
#>               CS_D.e               CS_d.V          CS_d.boot.V d.t.df
#> 1  0.402234636871508 0.000664974207441762 0.000711409006695385      7
#> 2  0.544444444444444 0.000253494320337725 0.000240277035602111      4
#> 3  0.345628214548126  0.00106773305088108  0.00104909427501709      8
#> 4  0.287150269610337 0.000464316667250201   0.0004640806330644      8
#> 5   0.43598615916955 0.000434218289438062 0.000428639235160984      7
#> 6   0.20847367488034 6.05627470284696e-05 6.05634678928432e-05     10
#> 7  0.650082918739635 0.000257136051752956 0.000271330248841789      4
#> 8  0.138552619952284 0.000216132859442877 0.000204816497715932     17
#> 9  0.380008616975442 0.000360254817691854   0.0003537099748542      6
#> 10 0.280919677515676 0.000144703074224106 0.000152475008559194      8
#> 11 0.327158919670801 0.000503057233986995 0.000488621895795101      8
#> 12 0.257025771787633 0.000134121919501297 0.000143869065469617      8
#> 13  1.00056721497448 2.11737525161229e-05  1.4057939053243e-05      3
#> 14 0.363299351251158 8.69838142388246e-05 8.64975280349916e-05      6
#> 15  1.03764705882353  0.00022467592663519 0.000201749293623147      2
#> 16             1.125   0.0006019706618509 0.000601085481209453      3
#>                d.t.stat         d.t.pvalue d.t.significance d.boot.z.df
#> 1      0.02815376878219  0.978325351754391               ns           7
#> 2      2.06997700767549   0.10723294813912               ns           4
#> 3      1.66600295615056  0.134274950280504               ns           8
#> 4      2.12261420536943 0.0665538249488767               ns           8
#> 5       1.0301574783912  0.337209790540494               ns           7
#> 6      2.78735177789005 0.0192068432217533                *          10
#> 7      1.80798358527422  0.144886591272101               ns           4
#> 8     0.567755084270463  0.577623407084813               ns          17
#> 9     0.424456215383704  0.686031514328123               ns           6
#> 10      1.6713011659847  0.133206249679844               ns           8
#> 11     1.55754090990284  0.157957033254602               ns           8
#> 12     2.00128917457502 0.0803555866511265               ns           8
#> 13   -0.329859967245678  0.763196306139146               ns           3
#> 14     1.05224751693921  0.333206278005286               ns           6
#> 15   -0.507791421657648  0.662061546648583               ns           2
#> 16 -0.00966012858117728   0.99289893656246               ns           3
#>          d.boot.z.stat    d.boot.z.pvalue d.boot.z.significance
#> 1   0.0276014468259671   0.97875044140037                    ns
#> 2     2.11134701701347   0.10233493680879                    ns
#> 3     1.67600791343304  0.132263448642767                    ns
#> 4     2.12071979935888 0.0667503673247065                    ns
#> 5     1.03756609320658  0.333978621629479                    ns
#> 6     2.77065034924187 0.0197652293840094                     *
#> 7     1.76028327597653  0.153166166195353                    ns
#> 8    0.577008613944405  0.571496330602201                    ns
#> 9    0.425217529507766  0.685506175360378                    ns
#> 10    1.63791870182241  0.140072980275729                    ns
#> 11    1.58556233614025  0.151499007860614                    ns
#> 12    1.93374355649653 0.0892037747747804                    ns
#> 13    0.39244722767569   0.72094875991824                    ns
#> 14    1.03972126692463  0.338541348748645                    ns
#> 15    0.54146070930643   0.64244084391876                    ns
#> 16 0.00959298293692684     0.992948292625                    ns
#> 
#> $shannon
#>     Trait EC_No.Classes CS_No.Classes              EC_I          EC_I.max
#> 1    CUAL             5             4  1.60118025300384   1.6094379124341
#> 2    LNGS             3             3  1.34638092645118  1.09861228866811
#> 3    PTLC             5             5  1.29757991678528   1.6094379124341
#> 4    DSTA             5             5  1.75217791456181   1.6094379124341
#> 5    LFRT             5             4  1.32020430332539   1.6094379124341
#> 6   LBTEF             6             6  2.26107917725546  1.79175946922805
#> 7    CBTR             3             3  1.04940762729587  1.09861228866811
#> 8    NMLB            10             9  2.46043656290491  2.30258509299405
#> 9    ANGB             4             4  1.63181278826841  1.38629436111989
#> 10 CUAL9M             5             5  1.81895733334165   1.6094379124341
#> 11  LVC9M             5             5  1.45781261313429   1.6094379124341
#> 12 TNPR9M             5             5  2.15936383275215   1.6094379124341
#> 13   PL9M             3             2  1.02393231699601  1.09861228866811
#> 14   STRP             4             4  1.70471635517281  1.38629436111989
#> 15   STRC             2             2 0.985051563686417 0.693147180559945
#> 16   PSTR             3             2 0.932902628052214  1.09861228866811
#>             EC_I.rel         EC_I.ens               EC_I.V          EC_I.boot.V
#> 1  0.994869227718287 4.95888170692978 0.000495550546246209 0.000483808510194458
#> 2   1.22552873323805 3.84349045523356  0.00026683714279372 0.000269948802236365
#> 3  0.806231732681647 3.66042740085471  0.00076741293709653 0.000765752404583755
#> 4   1.08868934988106 5.76714936682217 0.000644551217715297 0.000699283275380162
#> 5     0.820289054412 3.74418624882682   0.0005480962422548 0.000517842713945963
#> 6   1.26193231630002 9.59343660098374 0.000259759685726472 0.000271033385039332
#> 7  0.955211987086096 2.85595882482654 0.000312696844542415 0.000303798121154971
#> 8   1.06855402234261  11.709922542064 0.000496178249738945 0.000505626109031182
#> 9   1.17710410864701 5.11313535399957 0.000306008701151613  0.00030810953251426
#> 10  1.13018173567856 6.16542661257166 0.000397228605602063 0.000382025104334203
#> 11  0.90578990458197 4.29655102280072 0.000698631874341118 0.000665418478253527
#> 12  1.34168818571345 8.66562311895419 0.000264448274894998 0.000279879360986154
#> 13 0.932023360340673 2.78412131411744 0.000100041535943681 0.000101884272024935
#> 14  1.22969291586506 5.49982544890899  0.00021912035039574 0.000213652548557445
#> 15  1.42112900595031 2.67794996583331 2.53468656861686e-05 2.75676958917147e-05
#> 16 0.849164566676391 2.54187660232952 0.000206905486943159 0.000215549640442331
#>                 CS_I          CS_I.max          CS_I.rel         CS_I.ens
#> 1   1.60715392433211  1.38629436111989  1.15931649828959 4.98859309107096
#> 2   1.44881563572518  1.09861228866811  1.31876882378736 4.25806842343285
#> 3   1.60685189446012   1.6094379124341 0.998393216691366 4.98708661445017
#> 4   1.94652505102181   1.6094379124341  1.20944401519528  7.0043056374023
#> 5   1.39390699808299  1.38629436111989  1.00549135679738   4.030566747009
#> 6    2.3831722498942  1.79175946922805    1.330073757568  10.839233139215
#> 7   1.12338192727968  1.09861228866811  1.02254629669362 3.07523686413742
#> 8   2.56080478714959  2.19722457733622  1.16547248449867 12.9462320853624
#> 9   1.69700114892879  1.38629436111989  1.22412757097122 5.45755642804107
#> 10  1.92688046691671   1.6094379124341  1.19723814881589 6.86805167421241
#> 11  1.59702066650884   1.6094379124341 0.992284731315619 4.93829764981337
#> 12  2.24730159981114   1.6094379124341  1.39632699245436 9.46216863896461
#> 13 0.999591034189098 0.693147180559945  1.44210502794168 2.71717037141627
#> 14  1.74920954558179  1.38629436111989  1.26178796844324 5.75005572221205
#> 15  0.97366806454962 0.693147180559945  1.40470608819769 2.64763837799998
#> 16  0.91829583405449 0.693147180559945  1.32482084585941 2.50501778435487
#>                  CS_I.V          CS_I.boot.V           I.t.stat
#> 1   0.00466900952090494   0.0047929123394758 -0.083123660050637
#> 2   0.00183098114336171  0.00187875640207067  -2.23647066374941
#> 3   0.00915269666156106  0.00931911218476163  -3.10514822627186
#> 4   0.00501290672204481  0.00517797969455639  -2.58385107753543
#> 5   0.00481441616742965  0.00488761731418891  -1.00646624014807
#> 6   0.00172264312694065  0.00187862560896072  -2.74217439229004
#> 7   0.00290287113955504  0.00298070544341396  -1.30452382793487
#> 8   0.00546163553548553  0.00547694938695042   -1.3003275918761
#> 9   0.00354899161566695  0.00362924040839815  -1.04992396937323
#> 10  0.00380714696318465  0.00434669657011922  -1.66442333074281
#> 11  0.00676974620846264  0.00669021208688097  -1.61083557606938
#> 12  0.00129552549169971   0.0013166833981556  -2.22646968440541
#> 13 7.02197242512667e-06 4.24533303750304e-05   2.35246259571922
#> 14   0.0020863467552808  0.00212088460832853 -0.926646485957522
#> 15 0.000443961107972778 0.000438689236849775   0.52546865211132
#> 16  0.00132275132275134  0.00146139768748281  0.373471875118422
#>              I.t.df          I.t.pvalue I.t.significance I.boot.z.df
#> 1  205.323489838581   0.933834195011031               ns           7
#> 2  220.068588438007  0.0263241034578902                *           4
#> 3  197.214845421711 0.00218182272218803               **           8
#> 4  213.627424864319  0.0104369229742795                *           8
#> 5   208.16009186019   0.315359849464886               ns           7
#> 6  221.982338302534 0.00660128212793374               **          10
#> 7   205.90491319267   0.193511253079244               ns           4
#> 8  199.746997945695   0.194987041994507               ns          17
#> 9  198.073409342984   0.295032389672131               ns           6
#> 10 204.664065671499   0.097558069731458               ns           8
#> 11 204.247107694347   0.108759859193219               ns           8
#> 12 242.577447747539  0.0269016983557465                *           8
#> 13 1837.93308927511  0.0187545059227561                *           3
#> 14 204.916304701679     0.3552001943646               ns           6
#> 15 187.669671190779   0.599877733009115               ns           2
#> 16 224.120762900574   0.709150296735105               ns           3
#>         I.boot.z.stat    I.boot.z.pvalue I.boot.z.significance
#> 1  0.0817336348245371  0.937146464242981                    ns
#> 2     2.2064267784542 0.0919914613051522                    ns
#> 3    3.08665470359158 0.0149652109934245                     *
#> 4    2.57117798516249 0.0330669187074517                     *
#> 5    1.01631020857175  0.343315003404297                    ns
#> 6    2.66359626201418 0.0237522092011334                     *
#> 7    1.28540612042092  0.268024804385408                    ns
#> 8     1.2958056339159  0.212360842372221                    ns
#> 9    1.04598381571325  0.335865437056982                    ns
#> 10    1.5855588008592  0.151499807281787                    ns
#> 11   1.60319190075875  0.147559909191939                    ns
#> 12   2.20200971458306 0.0588093099330856                    ns
#> 13   1.98106680901202  0.141910185247115                    ns
#> 14  0.935780231278676  0.385503284430038                    ns
#> 15  0.532654452382285  0.647528455859605                    ns
#> 16  0.355800409404779  0.745538558892587                    ns
#> 
#> $mcintosh
#>     Trait EC_No.Classes CS_No.Classes           EC_D.Mc           EC_E.Mc
#> 1    CUAL             5             4 0.393778012434178 0.480227786771547
#> 2    LNGS             3             3 0.358820738546382 0.525115218256116
#> 3    PTLC             5             5 0.316779500161785 0.386325070099539
#> 4    DSTA             5             5 0.417380876241608 0.509012408283666
#> 5    LFRT             5             4 0.338215427137732 0.412467026846746
#> 6   LBTEF             6             6 0.539900644138108 0.632092884556734
#> 7    CBTR             3             3 0.286749615427161 0.419642932289509
#> 8    NMLB            10             9 0.558974562677424 0.605947984498653
#> 9    ANGB             4             4 0.418145333938704 0.543941007506402
#> 10 CUAL9M             5             5 0.455147453452433 0.555070235829135
#> 11  LVC9M             5             5 0.356538441668976 0.434812664331503
#> 12 TNPR9M             5             5 0.515402077468806  0.62855312166947
#> 13   PL9M             3             2 0.301198604544138 0.440788265484237
#> 14   STRP             4             4 0.443181993303366 0.576509745249164
#> 15   STRC             2             2 0.292763414762376 0.571258413744031
#> 16   PSTR             3             2 0.261175379595452 0.382216387533749
#>              CS_D.Mc           CS_E.Mc     M.boot.z.stat M.boot.z.df
#> 1  0.416968887221027 0.513065385542589  1.00391168633292           7
#> 2   0.40884307929476 0.565950226384141  3.39520672163674           4
#> 3  0.380225207834671 0.438612745225263  2.28323260882762           8
#> 4  0.486635921075666 0.561363930823417   3.3110316235721           8
#> 5  0.375861861492538 0.462484652422527  2.15395666678097           7
#> 6  0.598348264293068 0.662621632177028  5.96821850593738          10
#> 7  0.327215963767637 0.452956056123639  2.99754729409007           4
#> 8  0.601358283540837 0.624332795289677  2.42994156651831          17
#> 9  0.449791785009108 0.553452793870588  1.80568141934553           6
#> 10 0.502026774187731 0.579118209592271   3.8867793107122           8
#> 11 0.408042032313971 0.470701132572847  2.53855378664644           8
#> 12 0.573194332783244 0.661214287399217  4.24645671583821           8
#> 13 0.317162433070916 0.585385640236862  4.42355476586344           3
#> 14 0.478468357680793  0.58873829661372  3.81879071089912           6
#> 15 0.303603702882552 0.560360337349431 0.913484492624288           2
#> 16 0.275932675604997  0.50928801500014   0.8043452846734           3
#>         M.boot.z.pvalue M.boot.z.significance
#> 1     0.348854575801086                    ns
#> 2    0.0273980949692247                     *
#> 3     0.051809250272037                    ns
#> 4    0.0106817822611812                     *
#> 5    0.0682139277106039                    ns
#> 6  0.000137837562706689                    **
#> 7    0.0400387096312927                     *
#> 8    0.0264706618143546                     *
#> 9      0.12099659678039                    ns
#> 10  0.00463023359089327                    **
#> 11   0.0347890152183959                     *
#> 12  0.00281266593084537                    **
#> 13   0.0214543888693413                     *
#> 14  0.00877307594548063                    **
#> 15    0.457416629856141                    ns
#> 16    0.480033356696624                    ns
#> 
# }
```
