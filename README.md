
<!-- 
<img src="https://raw.githubusercontent.com/aravind-j/EvaluateCore/master/inst/extdata/EvaluateCore.png" alt="" width="20%" />
-->

## `EvaluateCore`: Quality Evaluation of Core Collections <img src="https://raw.githubusercontent.com/aravind-j/EvaluateCore/master/inst/extdata/EvaluateCore.png" align="right" alt="logo" width="173" height = "200" style = "border: none; float: right;">

###### Version : [0.1.4.9000](https://aravind-j.github.io/EvaluateCore/); Copyright (C) 2018-2026: [ICAR-NBPGR](https://nbpgr.org.in/); License: [GPL-2\|GPL-3](https://www.r-project.org/Licenses/)

##### *Aravind, J.<sup>1</sup>, Kaur, V.<sup>2</sup>, Wankhede, D. P.<sup>3</sup> and Nanjundan, J.<sup>4</sup>*

1.  Division of Germplasm Conservation, ICAR-National Bureau of Plant
    Genetic Resources, New Delhi.
2.  Division of Germplasm Evaluation, ICAR-National Bureau of Plant
    Genetic Resources, New Delhi.
3.  Division of Genomic Resources, ICAR-National Bureau of Plant Genetic
    Resources, New Delhi.
4.  ICAR-Indian Agricultural Research Institute, Regional Station,
    Wellington, Tamil Nadu.

------------------------------------------------------------------------

[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.5.0-6666ff.svg?logo=R)](https://cran.r-project.org/)
[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version-last-release/EvaluateCore)](https://cran.r-project.org/package=EvaluateCore)
[![Dependencies](https://tinyverse.netlify.app/status/EvaluateCore)](https://cran.r-project.org/package=EvaluateCore)
[![rstudio mirror
downloads](https://cranlogs.r-pkg.org/badges/grand-total/EvaluateCore?color=green)](https://CRAN.R-project.org/package=EvaluateCore)
[![develVersion](https://img.shields.io/badge/devel%20version-0.1.4.9000-orange.svg)](https://github.com/aravind-j/EvaluateCore)
[![Github Code
Size](https://img.shields.io/github/languages/code-size/aravind-j/EvaluateCore.svg)](https://github.com/aravind-j/EvaluateCore)
[![R-CMD-check](https://github.com/aravind-j/EvaluateCore/workflows/R-CMD-check/badge.svg)](https://github.com/aravind-j/EvaluateCore/actions)
[![Project Status:
WIP](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![Last-changedate](https://img.shields.io/badge/last%20change-2026--01--19-yellowgreen.svg)](https://github.com/aravind-j/EvaluateCore/)
[![Zenodo
DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3875930.svg)](https://doi.org/10.5281/zenodo.3875930)
[![Website -
pkgdown](https://img.shields.io/website-up-down-green-red/https/aravind-j.github.io/EvaluateCore.svg)](https://aravind-j.github.io/EvaluateCore/)
[![.](https://pro-pulsar-193905.appspot.com/UA-148941781-1/welcome-page)](https://github.com/aravind-j/google-analytics-beacon)
<!-- [![packageversion](https://img.shields.io/badge/Package%20version-0.2.3.3-orange.svg)](https://github.com/aravind-j/EvaluateCore) -->
<!-- [![GitHub Download Count](https://github-basic-badges.herokuapp.com/downloads/aravind-j/EvaluateCore/total.svg)] -->
<!-- [![Rdoc](http://www.rdocumentation.org/badges/version/EvaluateCore)](http://www.rdocumentation.org/packages/EvaluateCore) -->

------------------------------------------------------------------------

## Description

Implements various quality evaluation statistics to assess the value of
plant germplasm core collections using qualitative and quantitative
phenotypic trait data according to Odong et al. (2015)
[doi:10.1007/s00122-012-1971-y](https://doi.org/10.1007/s00122-012-1971-y).

<!-- ## System Requirements
The function `dist.evaluate.core` is a wrapper around the `evaluateCore` function of the `corehunter` package which implemented in Java 8. Hence you need to have [Java Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) (JRE) version 8 or higher for the package to work.-->

## Installation

The package can be installed from CRAN as follows:

``` r
# Install from CRAN
install.packages('EvaluateCore', dependencies=TRUE)
```

The development version can be installed from github as follows:

``` r
# Install development version from Github
devtools::install_github("aravind-j/EvaluateCore")
```

<!-- ## Detailed tutorial
For a detailed tutorial (vignette) on how to used this package type:
&#10;
``` r
browseVignettes(package = 'EvaluateCore')
```
The vignette for the latest version is also available [online](https://aravind-j.github.io/EvaluateCore/articles.html).-->

## What’s new

To know whats new in this version type:

``` r
news(package='EvaluateCore')
```

## Links

[CRAN page](https://cran.r-project.org/package=EvaluateCore)

[Github page](https://github.com/aravind-j/EvaluateCore)

[Documentation website](https://aravind-j.github.io/EvaluateCore/)

[Zenodo DOI](https://doi.org/10.5281/zenodo.3875930)

## CRAN checks

[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)

| Flavour                           | CRAN check                                                                                                                                                                                                           |
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| r-devel-linux-x86_64-debian-clang | [![CRAN check - r-devel-linux-x86_64-debian-clang](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-debian-clang/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html) |
| r-devel-linux-x86_64-debian-gcc   | [![CRAN check - r-devel-linux-x86_64-debian-gcc](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-debian-gcc/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)     |
| r-devel-linux-x86_64-fedora-clang | [![CRAN check - r-devel-linux-x86_64-fedora-clang](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-fedora-clang/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html) |
| r-devel-linux-x86_64-fedora-gcc   | [![CRAN check - r-devel-linux-x86_64-fedora-gcc](https://badges.cranchecks.info/flavor/r-devel-linux-x86_64-fedora-gcc/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)     |
| r-patched-linux-x86_64            | [![CRAN check - r-patched-linux-x86_64](https://badges.cranchecks.info/flavor/r-patched-linux-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)                       |
| r-release-linux-x86_64            | [![CRAN check - r-release-linux-x86_64](https://badges.cranchecks.info/flavor/r-release-linux-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)                       |

[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)

| Flavour                  | CRAN check                                                                                                                                                                                         |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| r-devel-windows-x86_64   | [![CRAN check - r-devel-windows-x86_64](https://badges.cranchecks.info/flavor/r-devel-windows-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)     |
| r-release-windows-x86_64 | [![CRAN check - r-release-windows-x86_64](https://badges.cranchecks.info/flavor/r-release-windows-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html) |
| r-oldrel-windows-x86_64  | [![CRAN check - r-oldrel-windows-x86_64](https://badges.cranchecks.info/flavor/r-oldrel-windows-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)   |

[![MacOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)

| Flavour                | CRAN check                                                                                                                                                                                     |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| r-release-macos-x86_64 | [![CRAN check - r-release-macos-x86_64](https://badges.cranchecks.info/flavor/r-release-macos-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html) |
| r-oldrel-macos-x86_64  | [![CRAN check - r-oldrel-macos-x86_64](https://badges.cranchecks.info/flavor/r-oldrel-macos-x86_64/EvaluateCore.svg)](https://cran.r-project.org/web/checks/check_results_EvaluateCore.html)   |

## Citing `EvaluateCore`

To cite the methods in the package use:

``` r
citation("EvaluateCore")
```

    To cite the R package 'EvaluateCore' in publications use:

      Aravind, J., Kaur, V., Wankhede, D. P. and Nanjundan, J. (2026).
      EvaluateCore: Quality Evaluation of Core Collections. R package
      version 0.1.4.9000,
      https://aravind-j.github.io/EvaluateCore/https://CRAN.R-project.org/package=EvaluateCore.

    A BibTeX entry for LaTeX users is

      @Manual{,
        title = {EvaluateCore: Quality Evaluation of Core Collections},
        author = {J. Aravind and Vikender Kaur and Dhammaprakash Pandhari Wankhede and J. Nanjundan},
        note = {R package version 0.1.4.9000 https://aravind-j.github.io/EvaluateCore/ https://CRAN.R-project.org/package=EvaluateCore},
        year = {2026},
      }

    This free and open-source software implements academic research by the
    authors and co-workers. If you use it, please support the project by
    citing the package.
