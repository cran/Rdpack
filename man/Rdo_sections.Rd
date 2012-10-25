\name{Rdo_sections}
\alias{Rdo_sections}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Locate the sections in Rd objects}
\description{Locate the Rd sections in an Rd object and return a list of
  their positions and names.}
\usage{
Rdo_sections(rdo)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rdo}{an Rd object}
}
\details{
  Locate all Rd sections in an Rd object. This includes the predefined
  section and the user defined sections. Sections wrapped in
  \verb{#ifdef} directives are also given.

  \code{Rdo_sections} returns a list with one entry for each section in
  \code{rdo}. This entry is a list with components \code{"pos"} and
  \code{"title"} giving the position (suitable for use in \verb{"[["})
  and the title of the section.  For user defined sections the actual
  name is returned, not "section".

  The names of the sections are returned as single strings without
  attributes. The titles of predefined sections are single words but
  user defined sections may have longer titles and sometimes contain
  basic markup.
}
\value{
  A list giving the positions and titles of the sections in \code{rdo}
  as described in 'Details'.
}
\author{Georgi N. Boshnakov}
\keyword{RdoProgramming}
