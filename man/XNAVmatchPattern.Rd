% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matchPattern.R
\name{XNAVmatchPattern}
\alias{XNAVmatchPattern}
\alias{XNAVmatchPattern,XNAString,character-method}
\alias{XNAVmatchPattern,XNAString,XStringSet-method}
\alias{XNAVmatchPattern,XNAString,BSgenome-method}
\title{This is function finding all the occurrences of a given pattern
(typically short) in a (typically long) set of reference sequences.}
\usage{
XNAVmatchPattern(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto",
  exclude = "",
  maskList = logical(0),
  userMask = IRanges::IRangesList(),
  invertUserMask = FALSE
)

\S4method{XNAVmatchPattern}{XNAString,character}(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto"
)

\S4method{XNAVmatchPattern}{XNAString,XStringSet}(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto"
)

\S4method{XNAVmatchPattern}{XNAString,BSgenome}(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto",
  exclude = "",
  maskList = logical(0),
  userMask = IRanges::IRangesList(),
  invertUserMask = FALSE
)
}
\arguments{
\item{pattern}{XNAString object with non-empty target slot}

\item{subject}{string, string vector or
DNAString / DNAStringSet / chromosome from BSgenome  object}

\item{target.number}{numeric - if target is a multi-element vector,
then specify which element in use. 1 is the default}

\item{max.mismatch}{The maximum number of mismatching letters allowed.
If non-zero, an algorithm that supports inexact matching is used.}

\item{min.mismatch}{The minimum number of mismatching letters allowed.
If non-zero, an algorithm that supports inexact matching is used.}

\item{with.indels}{If TRUE then indels are allowed. In that case,
min.mismatch must be 0 and max.mismatch is interpreted as the maximum
"edit distance" allowed between the pattern and a match. Note that in order
to avoid pollution by redundant matches, only the "best local matches" are
returned. Roughly speaking, a "best local match" is a match that is locally
both the closest (to the pattern P) and the shortest.}

\item{fixed}{If TRUE (the default), an IUPAC ambiguity code in the pattern
can only match the same code in the subject, and vice versa. If FALSE, an
IUPAC ambiguity code in the pattern can match any letter in the subject that
is associated with the code, and vice versa.}

\item{algorithm}{One of the following: "auto", "naive-exact",
"naive-inexact", "boyer-moore", "shift-or" or "indels".}

\item{exclude}{A character vector with strings that will be used to filter
out chromosomes whose names match these strings. Needed for BSParams object
if subject is a chromosome object from BSgenome}

\item{maskList}{A named logical vector of maskStates preferred when used with
a BSGenome object. When using the bsapply function, the masks will be set to
the states in this vector.}

\item{userMask}{An IntegerRangesList, containing a mask to be applied
to each chromosome.}

\item{invertUserMask}{Whether the userMask should be inverted.}
}
\value{
An \link{MIndex} object for \code{vmatchPattern}.
}
\description{
This is function finding all the occurrences of a given pattern
(typically short) in a (typically long) set of reference sequences.

Implementation of this method is based on vmatchPatterrm method from BSgenome
}
\examples{
s3 <-
XNAString::XNAString(
 base = "GCGGAGAGAGCACAGATACA",
 sugar = "FODDDDDDDDDDDDDDDDDD",
 target = Biostrings::DNAStringSet(
     c("AAAAGCTTTACAAAATCCAAGATC", "GGCGGAGAGAGCACAGATACA")
 )
)
chrom <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38$chr1
result <- XNAString::XNAMatchPattern(s3, chrom)
}
