\name{Rdo_collect_aliases}
\alias{Rdo_collect_aliases}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Collect aliases in an Rd object}
\description{Collect aliases in an Rd object}
\usage{
Rdo_collect_aliases(rdo)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rdo}{an Rd object}
}
\details{
  \code{Rdo_collect_aliases} finds all aliases in \code{rdo} and returns
  them as a named character vector. The name of an alias  is usually the
  empty string, \code{""}, but it may also be  "windows" or "unix" if
  the alias is wrapped in a \verb{#ifdef} directive with the
  corresponding first argument.
}
\value{
  a named character vector
}
\author{Georgi N. Boshnakov}
\examples{
# this needs "timezones.Rd".
#
# infile <- file.path(R.home(), "src/library/base/man/timezones.Rd")
# rd <- parse_Rd(infile)
#
# # this contains an element windows = "TZDIR"
# Rdo_collect_aliases(rd)
#
# # this does not contain "TZDIR"
# sapply(rd[which(tools:::RdTags(rd)=="\\alias")], as.character)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{RdoProgramming}
