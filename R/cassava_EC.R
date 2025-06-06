### This file is part of 'EvaluateCore' package for R.

### Copyright (C) 2018-2025, ICAR-NBPGR.
#
# EvaluateCore is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# EvaluateCore is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/

#' IITA Cassava Germplasm Data - Entire Collection
#'
#' An example germplasm characterisation data of a subset of IITA Cassava
#' collection
#' \insertCite{international_institute_of_tropical_agriculture_cassava_2019}{EvaluateCore}.
#' Includes data on 26 (out of 62) descriptors for 1684 (out of 2170)
#' accessions. It is used to demonstrate the various functions of
#' \code{EvaluateCore} package.
#'
#' Further details on how the example dataset was built from the original data
#' is available
#' \href{https://aravind-j.github.io/EvaluateCore/articles/additional/Example_Core_Data.html}{online}.
#'
#' @format A data frame with 58 columns: \describe{ \item{CUAL}{Colour of
#'   unexpanded apical leaves} \item{LNGS}{Length of stipules}
#'   \item{PTLC}{Petiole colour} \item{DSTA}{Distribution of anthocyanin}
#'   \item{LFRT}{Leaf retention} \item{LBTEF}{Level of branching at the end of
#'   flowering} \item{CBTR}{Colour of boiled tuberous root} \item{NMLB}{Number
#'   of levels of branching} \item{ANGB}{Angle of branching}
#'   \item{CUAL9M}{Colours of unexpanded apical leaves at 9 months}
#'   \item{LVC9M}{Leaf vein colour at 9 months} \item{TNPR9M}{Total number of
#'   plants remaining per accession at 9 months} \item{PL9M}{Petiole length at 9
#'   months} \item{STRP}{Storage root peduncle} \item{STRC}{Storage root
#'   constrictions} \item{PSTR}{Position of root} \item{NMSR}{Number of storage
#'   root per plant} \item{TTRN}{Total root number per plant} \item{TFWSR}{Total
#'   fresh weight of storage root per plant} \item{TTRW}{Total root weight per
#'   plant} \item{TFWSS}{Total fresh weight of storage shoot per plant}
#'   \item{TTSW}{Total shoot weight per plant} \item{TTPW}{Total plant weight}
#'   \item{AVPW}{Average plant weight} \item{ARSR}{Amount of rotted storage root
#'   per plant} \item{SRDM}{Storage root dry matter} }
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' data(cassava_EC)
#' summary(cassava_EC)
#'
#' quant <- c("NMSR", "TTRN", "TFWSR", "TTRW", "TFWSS", "TTSW", "TTPW", "AVPW",
#'            "ARSR", "SRDM")
#' qual <- c("CUAL", "LNGS", "PTLC", "DSTA", "LFRT", "LBTEF", "CBTR", "NMLB",
#'           "ANGB", "CUAL9M", "LVC9M", "TNPR9M", "PL9M", "STRP", "STRC",
#'           "PSTR")
#'
#' lapply(seq_along(cassava_EC[, qual]),
#'        function(i) barplot(table(cassava_EC[, qual][, i]),
#'                            xlab = names(cassava_EC[, qual])[i]))
#'
#' lapply(seq_along(cassava_EC[, quant]),
#'        function(i) hist(table(cassava_EC[, quant][, i]),
#'                         xlab = names(cassava_EC[, quant])[i],
#'                         main = ""))
#'
"cassava_EC"
