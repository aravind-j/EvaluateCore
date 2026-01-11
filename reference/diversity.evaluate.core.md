# Diversity Indices

Compute the following diversity indices and perform corresponding
statistical tests to compare the phenotypic diversity for qualitative
traits between entire collection (EC) and core set (CS).

- Simpson's and related indices

  - Simpson's Index (\\d\\) (Simpson 1949; Peet 1974)

  - Simpson's Index of Diversity or Gini's Diversity Index or
    Gini-Simpson Index or Nei's Diversity Index or Nei's Variation Index
    (\\D\\) (Gini 1912, 1912; Greenberg 1956; Berger and Parker 1970;
    Nei 1973; Peet 1974)

  - Maximum Simpson's Index of Diversity or Maximum Nei's
    Diversity/Variation Index (\\D\_{max}\\) (Hennink and Zeven 1990)

  - Simpson's Reciprocal Index or Hill's \\N\_{2}\\ (\\D\_{R}\\)
    (Williams 1964; Hill 1973)

  - Relative Simpson's Index of Diversity or Relative Nei's
    Diversity/Variation Index (\\D'\\) (Hennink and Zeven 1990)

- Shannon-Weaver and related indices

  - Shannon or Shannon-Weaver or Shannon-Weiner Diversity Index (\\H\\)
    (Shannon and Weaver 1949; Peet 1974)

  - Maximum Shannon-Weaver Diversity Index (\\H\_{max}\\) (Hennink and
    Zeven 1990)

  - Relative Shannon-Weaver Diversity Index or Shannon Equitability
    Index (\\H'\\) or Pielou's Evenness (\\J\\) (Hennink and Zeven 1990)

- McIntosh Diversity Index

  - McIntosh Diversity Index (\\D\_{Mc}\\) (McIntosh 1967; Peet 1974)

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

  :   The McIntosh Index (\\D\_{Mc}\\) for EC.

  CS_D.Mc

  :   The McIntosh Index (\\D\_{Mc}\\) for CS.

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

### Simpson's and related indices

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
(Greenberg 1956; Berger and Parker 1970; Peet 1974; Hennink and Zeven
1990) originally suggested by Gini (1912, 1912) and described in
literature as Gini's diversity index or Gini-Simpson index. It is the
same as Nei's diversity index or Nei's variation index (Nei 1973;
Hennink and Zeven 1990) . Greater the value of \\D\\, greater the
diversity with a range from 0 to 1.

\\D = 1 - d\\

The maximum value of \\D\\, \\D\_{max}\\ occurs when accessions are
uniformly distributed across the phenotypic classes and is computed as
follows (Hennink and Zeven 1990) .

\\D\_{max} = 1 - \frac{1}{k}\\

Reciprocal of \\d\\ gives the Simpson's reciprocal index (\\D\_{R}\\)
(Williams 1964; Hennink and Zeven 1990) and can range from 1 to \\k\\.
This was also described in Hill (1973) as (\\N\_{2}\\).

\\D\_{R} = \frac{1}{d}\\

Relative Simpson's index of diversity or Relative Nei's
diversity/variation index (\\H'\\) (Hennink and Zeven 1990) is defined
as follows (Peet 1974) .

\\D' = \frac{D}{D\_{max}}\\

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

### Shannon-Weaver and related indices

An index of information \\H\\, was described by Shannon and Weaver
(1949) as follows.

\\H = -\sum\_{i=1}^{k}p\_{i} \log\_{2}(p\_{i})\\

\\H\\ is described as Shannon or Shannon-Weaver or Shannon-Weiner
diversity index in literature.

Alternatively, \\H\\ is also computed using natural logarithm instead of
logarithm to base 2.

\\H = -\sum\_{i=1}^{k}p\_{i} \ln(p\_{i})\\

The maximum value of \\H\\ (\\H\_{max}\\) is \\\ln(k)\\. This value
occurs when each phenotypic class for a trait has the same proportion of
accessions.

\\H\_{max} = \log\_{2}(k)\\\\ \textrm{OR} \\\\ H\_{max} = \ln(k)\\

The relative Shannon-Weaver diversity index or Shannon equitability
index (\\H'\\) or Pielou's Evenness (\\J\\) is the Shannon diversity
index (\\I\\) divided by the maximum diversity (\\H\_{max}\\).

\\H' = \frac{H}{H\_{max}}\\

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

### McIntosh Diversity Index

A similar index of diversity was described by McIntosh (1967) as follows
(\\D\_{Mc}\\) (Peet 1974) .

\\D\_{Mc} = \frac{N - \sqrt{\sum\_{i=1}^{k}n\_{i}^2}}{N - \sqrt{N}}\\

Where, \\n\_{i}\\ denotes the number of accessions in the \\i\\th
phenotypic class for a trait and \\N\\ is the total number of accessions
so that \\p\_{i} = {n\_{i}}/{N}\\.

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
  
Hutcheson K (1970). “A test for comparing diversities based on the
Shannon formula.” *Journal of Theoretical Biology*, **29**(1),
151–154.  
  
Lyons NI, Hutcheson K (1978). “C20. Comparing diversities: Gini's
index.” *Journal of Statistical Computation and Simulation*, **8**(1),
75–78.  
  
McIntosh RP (1967). “An index of diversity and the relation of certain
concepts to diversity.” *Ecology*, **48**(3), 392–404.  
  
Nei M (1973). “Analysis of gene diversity in subdivided populations.”
*Proceedings of the National Academy of Sciences*, **70**(12),
3321–3323.  
  
Peet RK (1974). “The measurement of species diversity.” *Annual Review
of Ecology and Systematics*, **5**(1), 285–307.  
  
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
#>             EC_D.max         EC_D.inv          EC_D.rel               EC_d.V
#> 1                0.8 2.63691156971154 0.775960591793095  6.2401326584027e-05
#> 2  0.666666666666667 2.36742340128195 0.866399774882787 2.66303075243519e-05
#> 3                0.8 2.09468826265002 0.653252492369147 6.43256463380354e-05
#> 4                0.8 2.84575924216273 0.810749911137942 4.49202770089222e-05
#> 5                0.8 2.22749223165839 0.688830815104857 3.64033438958825e-05
#> 6  0.833333333333333 4.46486026922774 0.931234590190757 1.01110395238633e-05
#> 7  0.666666666666667 1.92773744459853  0.72188573749866 4.63756492257553e-05
#> 8                0.9 4.83784217188518 0.881440305071124 1.57355754103247e-05
#> 9               0.75 2.85293366089411 0.865978150277494 3.10366375721298e-05
#> 10               0.8 3.23547612745411 0.863658098295541 1.34905804296262e-05
#> 11               0.8 2.35128448338761 0.718375686212558 4.98247003940663e-05
#> 12               0.8 4.04587074812462 0.941043021930592 2.56650302792209e-05
#> 13 0.666666666666667   2.005473608579 0.752047000976072 3.79031161219323e-06
#> 14              0.75 3.10376016215672 0.903746875722886 9.34647324671549e-06
#> 15               0.5  1.9595331707216 0.979348739851389 1.21791747807758e-05
#> 16 0.666666666666667 1.80080646697613 0.667039863801265  6.1357244865428e-05
#>             EC_d.boot.V              CS_d              CS_D          CS_D.max
#> 1  6.68750117708326e-05 0.378472222222222 0.621527777777778              0.75
#> 2  2.65811066561584e-05 0.387755102040816 0.612244897959184 0.666666666666667
#> 3  6.50509760875086e-05 0.421343537414966 0.578656462585034               0.8
#> 4  4.79613335074667e-05 0.303500566893424 0.696499433106576               0.8
#> 5  3.49448546349972e-05 0.426587301587302 0.573412698412698              0.75
#> 6  9.78006680330427e-06 0.200538548752834 0.799461451247165 0.833333333333333
#> 7  4.76343377864573e-05 0.487244897959184 0.512755102040816 0.666666666666667
#> 8  1.55372775046521e-05 0.198058390022676 0.801941609977324 0.888888888888889
#> 9  3.19525542264521e-05 0.342120181405896 0.657879818594104              0.75
#> 10 1.35415192137175e-05 0.288052721088435 0.711947278911565               0.8
#> 11 4.74038435990513e-05 0.388676303854875 0.611323696145125               0.8
#> 12   2.636407723636e-05   0.2218679138322   0.7781320861678               0.8
#> 13 3.95703022757023e-06 0.500283446712018 0.499716553287982               0.5
#> 14 9.00340235241142e-06 0.311862244897959 0.688137755102041              0.75
#> 15 1.11330159341353e-05 0.518140589569161 0.481859410430839               0.5
#> 16 5.80204406696967e-05 0.555555555555556 0.444444444444444               0.5
#>            CS_D.inv          CS_D.rel               CS_d.V          CS_d.boot.V
#> 1  2.64220183486239 0.828703703703704 0.000664974207441761 0.000711254556902111
#> 2  2.57894736842105 0.918367346938775 0.000253494320337725 0.000240257761836584
#> 3  2.37336024217962 0.723320578231292  0.00106773305088108  0.00104798654736355
#> 4  3.29488676161569  0.87062429138322 0.000464316667250201 0.000464735179959108
#> 5  2.34418604651163 0.764550264550265 0.000434218289438062 0.000428477928488368
#> 6  4.98657243816254 0.959353741496599 6.05627470284696e-05  6.0452161171105e-05
#> 7  2.05235602094241 0.769132653061224 0.000257136051752956 0.000270835513259535
#> 8  5.04901610017889  0.90218431122449 0.000216132859442877 0.000204518681279425
#> 9  2.92294946147473 0.877173091458806 0.000360254817691854 0.000352890437968318
#> 10 3.47158671586716 0.889934098639456 0.000144703074224106 0.000152287794801069
#> 11 2.57283500455789 0.764154620181406 0.000503057233986995 0.000487240519916225
#> 12 4.50718620249122 0.972665107709751 0.000134121919501297 0.000143697014401447
#> 13 1.99886685552408 0.999433106575964 2.11737525161229e-05 1.40416164854234e-05
#> 14 3.20654396728016 0.917517006802721 8.69838142388246e-05 8.63936473121947e-05
#> 15 1.92997811816193 0.963718820861678  0.00022467592663519 0.000201952305242796
#> 16              1.8 0.888888888888889 0.000601970661850899 0.000601207763998725
#>    d.t.df             d.t.stat         d.t.pvalue d.t.significance d.boot.z.df
#> 1       7     0.02815376878219  0.978325351754391               ns           7
#> 2       4     2.06997700767549   0.10723294813912               ns           4
#> 3       8     1.66600295615057  0.134274950280504               ns           8
#> 4       8     2.12261420536943 0.0665538249488766               ns           8
#> 5       7      1.0301574783912  0.337209790540494               ns           7
#> 6      10     2.78735177789005 0.0192068432217533                *          10
#> 7       4     1.80798358527422  0.144886591272101               ns           4
#> 8      17    0.567755084270463  0.577623407084813               ns          17
#> 9       6    0.424456215383704  0.686031514328123               ns           6
#> 10      8      1.6713011659847  0.133206249679844               ns           8
#> 11      8     1.55754090990284  0.157957033254601               ns           8
#> 12      8     2.00128917457502 0.0803555866511265               ns           8
#> 13      3   -0.329859967245677  0.763196306139146               ns           3
#> 14      6     1.05224751693921  0.333206278005286               ns           6
#> 15      2   -0.507791421657648  0.662061546648583               ns           2
#> 16      3 -0.00966012858117729   0.99289893656246               ns           3
#>          d.boot.z.stat    d.boot.z.pvalue d.boot.z.significance
#> 1   0.0275212882188481  0.978812135373164                    ns
#> 2     2.14817887304654  0.098182032704849                    ns
#> 3     1.68166677243456   0.13113810025065                    ns
#> 4     2.09891549611266  0.069053916740305                    ns
#> 5     1.03166697933988  0.336549450852584                    ns
#> 6     2.82533970685804 0.0179951522790031                     *
#> 7     1.73767783492423  0.157264335515885                    ns
#> 8    0.581591476650998  0.568474385095018                    ns
#> 9    0.426083455919101  0.684908883579996                    ns
#> 10     1.6305427679191  0.141633454275904                    ns
#> 11    1.56637783409065  0.155893973673908                    ns
#> 12     1.9863174533999 0.0822405673333897                    ns
#> 13    0.38950879498154  0.722904437177963                    ns
#> 14    1.05400674082793  0.332462522918394                    ns
#> 15   0.542596692443321  0.641786855685194                    ns
#> 16 0.00948924181640027  0.993024548633537                    ns
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
#>             EC_I.rel               EC_I.V          EC_I.boot.V
#> 1  0.994869227718287 0.000495550546246209 0.000483712338849248
#> 2   1.22552873323805  0.00026683714279372 0.000270031896212135
#> 3  0.806231732681647  0.00076741293709653 0.000765753466729798
#> 4   1.08868934988106 0.000644551217715297 0.000699114782445066
#> 5     0.820289054412   0.0005480962422548 0.000517967395505657
#> 6   1.26193231630002 0.000259759685726472 0.000270960747240493
#> 7  0.955211987086096 0.000312696844542415 0.000303746752454349
#> 8   1.06855402234261 0.000496178249738945 0.000505419831711688
#> 9   1.17710410864701 0.000306008701151613 0.000308011811117831
#> 10  1.13018173567856 0.000397228605602063 0.000382066367282386
#> 11  0.90578990458197 0.000698631874341118  0.00066531132699232
#> 12  1.34168818571345 0.000264448274894998 0.000279996361013181
#> 13 0.932023360340673 0.000100041535943681 0.000101885631821939
#> 14  1.22969291586506  0.00021912035039574 0.000213669110846319
#> 15  1.42112900595031 2.53468656861686e-05 2.75749116254995e-05
#> 16 0.849164566676391 0.000206905486943159 0.000215626202139427
#>                 CS_I          CS_I.max          CS_I.rel               CS_I.V
#> 1   1.60715392433211  1.38629436111989  1.15931649828959  0.00466900952090494
#> 2   1.44881563572518  1.09861228866811  1.31876882378736  0.00183098114336171
#> 3   1.60685189446012   1.6094379124341 0.998393216691366  0.00915269666156106
#> 4   1.94652505102181   1.6094379124341  1.20944401519528  0.00501290672204481
#> 5   1.39390699808299  1.38629436111989  1.00549135679738  0.00481441616742965
#> 6    2.3831722498942  1.79175946922805    1.330073757568  0.00172264312694065
#> 7   1.12338192727968  1.09861228866811  1.02254629669362  0.00290287113955504
#> 8   2.56080478714959  2.19722457733622  1.16547248449867  0.00546163553548553
#> 9   1.69700114892879  1.38629436111989  1.22412757097122  0.00354899161566695
#> 10  1.92688046691671   1.6094379124341  1.19723814881589  0.00380714696318465
#> 11  1.59702066650884   1.6094379124341 0.992284731315619  0.00676974620846264
#> 12  2.24730159981114   1.6094379124341  1.39632699245436  0.00129552549169971
#> 13 0.999591034189098 0.693147180559945  1.44210502794168 7.02197242512667e-06
#> 14  1.74920954558179  1.38629436111989  1.26178796844324   0.0020863467552808
#> 15  0.97366806454962 0.693147180559945  1.40470608819769 0.000443961107972778
#> 16  0.91829583405449 0.693147180559945  1.32482084585941  0.00132275132275134
#>             CS_I.boot.V           I.t.stat           I.t.df          I.t.pvalue
#> 1   0.00480057355817968 -0.083123660050637 205.323489838581   0.933834195011031
#> 2   0.00187582523489003  -2.23647066374941 220.068588438007  0.0263241034578902
#> 3   0.00931692085852008  -3.10514822627186 197.214845421711 0.00218182272218803
#> 4   0.00517355690951426  -2.58385107753543 213.627424864319  0.0104369229742795
#> 5   0.00488793329864121  -1.00646624014807  208.16009186019   0.315359849464886
#> 6   0.00188540992637979  -2.74217439229004 221.982338302534 0.00660128212793374
#> 7   0.00298363121894339  -1.30452382793487  205.90491319267   0.193511253079244
#> 8   0.00546757466250246   -1.3003275918761 199.746997945695   0.194987041994507
#> 9   0.00363110411244662  -1.04992396937323 198.073409342984   0.295032389672131
#> 10  0.00434151206919941  -1.66442333074281 204.664065671499   0.097558069731458
#> 11  0.00669096782843366  -1.61083557606938 204.247107694347   0.108759859193219
#> 12  0.00131598463869385  -2.22646968440541 242.577447747539  0.0269016983557465
#> 13 4.25209205129464e-05   2.35246259571922 1837.93308927511  0.0187545059227561
#> 14  0.00212048454008538 -0.926646485957522 204.916304701679     0.3552001943646
#> 15 0.000440238137447901   0.52546865211132 187.669671190779   0.599877733009115
#> 16  0.00145971081458055  0.373471875118422 224.120762900574   0.709150296735105
#>    I.t.significance I.boot.z.df      I.boot.z.stat    I.boot.z.pvalue
#> 1                ns           7 0.0816151261682393  0.937237366880844
#> 2                 *           4   2.20804536110578 0.0918257677192241
#> 3                **           8   3.08699009808722 0.0149576074571947
#> 4                 *           8   2.53734329919595 0.0348546381941696
#> 5                ns           7  0.989361829502098  0.355443761348068
#> 6                **          10   2.63447567425041 0.0249696070188221
#> 7                ns           4   1.27767390552231  0.270478762219057
#> 8                ns          17   1.30252773052818  0.210106229408213
#> 9                ns           6   1.03779040230213  0.339369867309314
#> 10               ns           8   1.57822986458477  0.153165342145742
#> 11               ns           8   1.60829881122977  0.146436407724478
#> 12                *           8   2.18775796377732 0.0601308095874048
#> 13                *           3   2.02010593122144  0.136642216305489
#> 14               ns           6  0.920412488631991   0.39285907429174
#> 15               ns           2  0.529555857008772  0.649326086935845
#> 16               ns           3  0.358406267034263  0.743776008270476
#>    I.boot.z.significance
#> 1                     ns
#> 2                     ns
#> 3                      *
#> 4                      *
#> 5                     ns
#> 6                      *
#> 7                     ns
#> 8                     ns
#> 9                     ns
#> 10                    ns
#> 11                    ns
#> 12                    ns
#> 13                    ns
#> 14                    ns
#> 15                    ns
#> 16                    ns
#> 
#> $mcintosh
#>     Trait EC_No.Classes CS_No.Classes           EC_D.Mc           CS_D.Mc
#> 1    CUAL             5             4 0.393778012434178 0.416968887221027
#> 2    LNGS             3             3 0.358820738546382  0.40884307929476
#> 3    PTLC             5             5 0.316779500161785 0.380225207834671
#> 4    DSTA             5             5 0.417380876241608 0.486635921075666
#> 5    LFRT             5             4 0.338215427137732 0.375861861492538
#> 6   LBTEF             6             6 0.539900644138108 0.598348264293068
#> 7    CBTR             3             3 0.286749615427161 0.327215963767637
#> 8    NMLB            10             9 0.558974562677424 0.601358283540837
#> 9    ANGB             4             4 0.418145333938704 0.449791785009108
#> 10 CUAL9M             5             5 0.455147453452433 0.502026774187731
#> 11  LVC9M             5             5 0.356538441668976 0.408042032313971
#> 12 TNPR9M             5             5 0.515402077468806 0.573194332783244
#> 13   PL9M             3             2 0.301198604544138 0.317162433070916
#> 14   STRP             4             4 0.443181993303366 0.478468357680793
#> 15   STRC             2             2 0.292763414762376 0.303603702882552
#> 16   PSTR             3             2 0.261175379595452 0.275932675604997
#>        M.boot.z.stat M.boot.z.df      M.boot.z.pvalue M.boot.z.significance
#> 1   0.99460293625151           7    0.353059203135146                    ns
#> 2   3.46783277479897           4   0.0256341480264864                     *
#> 3    2.2738192752375           8    0.052576089898046                    ns
#> 4   3.25064028587058           8   0.0116898700454197                     *
#> 5   2.15010573810129           7   0.0686029150382776                    ns
#> 6   5.92988531160087          10 0.000145105134520755                    **
#> 7   2.96146258220075           4   0.0414941513850029                     *
#> 8   2.43902555318006          17   0.0259867089753573                     *
#> 9   1.80927337245031           6    0.120396110387685                    ns
#> 10  3.88926220676601           8  0.00461403041701568                    **
#> 11  2.52849788059365           8   0.0353379983338816                     *
#> 12  4.19030542335567           8  0.00303649104150158                    **
#> 13  4.50532682556703           3   0.0204253515117484                     *
#> 14  3.85325830114453           6  0.00842801033696131                    **
#> 15 0.911854542963119           2    0.458100293127608                    ns
#> 16 0.819045753756123           3    0.472768376779912                    ns
#> 
# }
```
