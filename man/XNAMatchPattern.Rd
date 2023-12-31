% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matchPattern.R
\name{XNAMatchPattern}
\alias{XNAMatchPattern}
\alias{XNAMatchPattern,XNAString,character-method}
\alias{XNAMatchPattern,XNAString,XString-method}
\title{Finds pattern in reference sequence}
\usage{
XNAMatchPattern(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto"
)

\S4method{XNAMatchPattern}{XNAString,character}(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto"
)

\S4method{XNAMatchPattern}{XNAString,XString}(
  pattern,
  subject,
  target.number = 1,
  max.mismatch = 0,
  min.mismatch = 0,
  with.indels = FALSE,
  fixed = TRUE,
  algorithm = "auto"
)
}
\arguments{
\item{pattern}{XNAString object with non-empty target slot}

\item{subject}{string or DNAString object}

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
}
\value{
an \link{XStringViews} object for \code{matchPattern}.
}
\description{
This is function finding all the occurrences of a given pattern
(typically short) in a (typically long) reference sequence
}
\examples{
s1 <-
XNAString::XNAString(
 base = Biostrings::DNAString("GCGGAGAGAGCACAGATACA"),
 sugar = "FODDDDDDDDDDDDDDDDDD",
 target = Biostrings::DNAStringSet("GGCGGAGAGAGCACAGATACA")
)
XNAString::XNAMatchPattern(
s1,
"GGCGGAGAGAGCACAGATACAGGCGGAGAGAGCACAGATACA"
)
}
