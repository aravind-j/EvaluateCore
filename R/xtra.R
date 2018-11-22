
wlcm <- paste0("\n",
               "--------------------------------------------------------------------------------\n",
               "Welcome to EvaluateCore version ", utils::packageDescription("EvaluateCore")$Version, "\n",
               "\n", "\n",
               "# To know how to use this package type:", "\n",
               "  browseVignettes(package = 'EvaluateCore')", "\n", "  for the package vignette.", "\n",
               "\n",
               "# To know whats new in this version type:", "\n",
               "  news(package='EvaluateCore')", "\n", "  for the NEWS file.", "\n",
               "\n",
               "# To cite the methods in the package type:", "\n",
               "  citation(package='EvaluateCore')","\n",
               "\n",
               "# To suppress this message use:", "\n",
               "  suppressPackageStartupMessages(library(EvaluateCore))", "\n",
               "--------------------------------------------------------------------------------\n")

.onAttach <- function(lib, pkg,...){
  packageStartupMessage(wlcm)

}

#' @import rJava
.onLoad <- function(libname, pkgname){
  rJava::.jpackage("corehunter")
  rJava::.jpackage(pkgname, lib.loc = libname)

  # check Java version
  req.version <- 8
  version.string <- J("java.lang.System")$getProperty("java.version")
  version <- as.integer(strsplit(version.string, ".", fixed = TRUE)[[1]][2])
  if (version < req.version) {
    stop(sprintf(
      'Java version %d or later required for "dist.evaluate.core()". Found version %d.',
      req.version, version
    ))
  }
}
