# Frequency Distribution Histogram

Plot stacked frequency distribution histogram to graphically compare the
probability distributions of traits between entire collection (EC) and
core set (CS).

## Usage

``` r
freqdist.evaluate.core(
  data,
  names,
  quantitative,
  qualitative,
  selected,
  highlight = NULL,
  include.highlight = TRUE,
  highlight.se = NULL,
  highlight.col = "red",
  show.count = FALSE
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

- qualitative:

  Name of columns with the qualitative traits as a character vector.

- selected:

  Character vector with the names of individuals selected in core
  collection and present in the `names` column.

- highlight:

  Individual names to be highlighted as a character vector.

- include.highlight:

  If `TRUE`, the highlighted individuals are included in the frequency
  distribution histogram. Default is `TRUE`.

- highlight.se:

  Optional data frame of standard errors for the individuals specified
  in `highlight`. It should have the same column names as in `data`.

- highlight.col:

  The colour(s) to be used to highlighting individuals in the plot as a
  character vector of the same length as `highlight`. Must be valid
  colour values in R (named colours, hexadecimal representation, index
  of colours \[`1:8`\] in default R
  [`palette()`](https://rdrr.io/r/grDevices/palette.html) etc.).

- show.count:

  logical. If `TRUE`, the accession count excluding missing values will
  also be displayed. Default is `FALSE`.

## Value

A list with the `ggplot` objects of stacked frequency distribution
histograms plots for each trait specified as `quantitative` and
`qualitative`.

## See also

[`hist`](https://rdrr.io/r/graphics/hist.html),
[`geom_histogram`](https://ggplot2.tidyverse.org/reference/geom_histogram.html)

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
freqdist.evaluate.core(data = ec, names = "genotypes",
                       quantitative = quant, qualitative = qual,
                       selected = core)
#> $NMSR

#> 
#> $TTRN

#> 
#> $TFWSR

#> 
#> $TTRW

#> 
#> $TFWSS

#> 
#> $TTSW

#> 
#> $TTPW

#> 
#> $AVPW

#> 
#> $ARSR

#> 
#> $SRDM

#> 
#> $CUAL

#> 
#> $LNGS

#> 
#> $PTLC

#> 
#> $DSTA

#> 
#> $LFRT

#> 
#> $LBTEF

#> 
#> $CBTR

#> 
#> $NMLB

#> 
#> $ANGB

#> 
#> $CUAL9M

#> 
#> $LVC9M

#> 
#> $TNPR9M

#> 
#> $PL9M

#> 
#> $STRP

#> 
#> $STRC

#> 
#> $PSTR

#> 

checks <- c("TMe-1199", "TMe-1957", "TMe-3596", "TMe-3392")

freqdist.evaluate.core(data = ec, names = "genotypes",
                       quantitative = quant, qualitative = qual,
                       selected = core,
                       highlight = checks, highlight.col = "red")


























#> $NMSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRN
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSS
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTSW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $AVPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $ARSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $SRDM
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CUAL
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LNGS
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PTLC
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $DSTA
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LFRT
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LBTEF
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CBTR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $NMLB
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $ANGB
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CUAL9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LVC9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TNPR9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PL9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $STRP
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $STRC
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PSTR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 

quant.se <- data.frame(genotypes = checks,
                       NMSR = c(0.107, 0.099, 0.106, 0.062),
                       TTRN = c(0.081, 0.072, 0.057, 0.049),
                       TFWSR = c(0.089, 0.031, 0.092, 0.097),
                       TTRW = c(0.064, 0.031, 0.071, 0.071),
                       TFWSS = c(0.106, 0.071, 0.121, 0.066),
                       TTSW = c(0.084, 0.045, 0.066, 0.054),
                       TTPW = c(0.098, 0.052, 0.111, 0.082),
                       AVPW = c(0.074, 0.038, 0.054, 0.061),
                       ARSR = c(0.104, 0.019, 0.204, 0.044),
                       SRDM = c(0.078, 0.138, 0.076, 0.079))

freqdist.evaluate.core(data = ec, names = "genotypes",
                       quantitative = quant,
                       selected = core,
                       highlight = checks, highlight.col = "red",
                       highlight.se = quant.se)










#> $NMSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRN
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSS
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTSW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $AVPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $ARSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $SRDM
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 

freqdist.evaluate.core(data = ec, names = "genotypes",
                       quantitative = quant, qualitative = qual,
                       selected = core,
                       highlight = checks, highlight.col = "red",
                       show.count = TRUE)


























#> $NMSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRN
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTRW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TFWSS
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTSW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TTPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $AVPW
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $ARSR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $SRDM
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CUAL
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LNGS
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PTLC
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $DSTA
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LFRT
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LBTEF
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CBTR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $NMLB
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $ANGB
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $CUAL9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $LVC9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $TNPR9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PL9M
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $STRP
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $STRC
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
#> $PSTR
#> TableGrob (1 x 2) "arrange": 2 grobs
#>   z     cells    name              grob
#> 1 1 (1-1,1-1) arrange    gtable[layout]
#> 2 2 (1-1,2-2) arrange gtable[guide-box]
#> 
# }
```
