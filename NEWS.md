
# EvaluateCore  0.1.4

## NEW FUNCTIONS:
* `rpr.evaluate.core` - Added Ratio of Phenotype Retained (Li et al., 2002).
* `vpf.evaluate.core` - Added Variance of Phenotypic Frequency (Li et al., 2002).
* `scv.evaluate.core` - Added Synthetic Variation Coefficient (Dong, 1998; Dong et al., 2001).

## UPDATED FUNCTIONS:
* `snk.evaluate.core`, `wilcox.evaluate.core`, `ttest.evaluate.core`, `signtest.evaluate.core`, `levene.evaluate.core`, `iqr.evaluate.core`, `cr.evaluate.core`, `vr.evaluate.core`, `scv.evaluate.core`, `box.evaluate.core`, `pdfdist.evaluate.core`, `qq.evaluate.core`, `percentdiff.evaluate.core`, `pca.evaluate.core`, `bar.evaluate.core`, `chisquare.evaluate.core`, `coverage.evaluate.core`, `diversity.evaluate.core`, `rpr.evaluate.core`, `vpf.evaluate.core`, `corr.evaluate.core`, `dist.evaluate.core` & `freqdist.evaluate.core` - Updated to handle missing date (ignore or impute missing data and also display of counts).
* `cr.evaluate.core` - Added computation of Changeable Rate of Maximum, Minimum and Mean (Wang et al. 2007).
* `percentdiff.evaluate.core` - Added Percentage of range ratios smaller than 0.70 (Diwan et al. 1998).

# EvaluateCore  0.1.3

## NEW FUNCTIONS:
* `diversity.evaluate.core` - Upgraded `shannon.evaluate.core` (now deprecated) with even more diversity indices.

## UPDATED FUNCTIONS:
* `box.evaluate.core` - Replace deprecated arg from `ggplot2::stat_summary`.
* `freqdist.evaluate.core` - Fix x scale limit.

## OTHER NOTES: 
* Fixed minor typos in `bar.evaluate.core`, `dit.evaluate.core` and `freqdist.evaluate.core`.
* Fixed missing `mathjaxr` in Namespace.
* Remove dependency on `ccChooser` as it is depreciated. Add `cassava_EC` and `cassava_CC` datasets and use it in all the examples instead of `ccChooser::dactylis_EC` and `ccChooser::dactylis_CC`.

# EvaluateCore  0.1.2

## OTHER NOTES: 
* Converted all equations in Rd files to `MathJax`using `mathjaxr`.
* Fixed 'LazyData' is specified without a 'data' directory (as there is no `/data` folder).

# EvaluateCore  0.1.1

* First release

## NEW FUNCTIONS:
* `freqdist.evaluate.core` - Plots frequency distribution histograms.

# EvaluateCore  0.1.0

* Pre-release

# EvaluateCore  0.0.0.9000

* Pre-release
