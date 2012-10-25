\name{Rdo_locate}
\alias{Rdo_locate}
\title{Find positions of elements in an Rd object}
\description{Find positions of elements for which a function returns
             TRUE. Along with the positions return, optionally,  the
             results of applying another function to the selected
             elements.}
\usage{
Rdo_locate(object, f = function(x) TRUE, pos_only = TRUE,
           lists = FALSE, fpos = NULL, nested = TRUE)
}
\arguments{
  \item{object}{an Rd object}
  \item{f}{a function returning TRUE if an element is desired and FALSE
    otherwise.}
  \item{pos_only}{if TRUE, return only the positions; if this argument
    is a function, return also the result of applying the function to
    the selected element, see Details.}
  \item{lists}{if FALSE, examine only leaves, if TRUE, examine also
    lists, see Details.}
  \item{fpos}{a function with two arguments, \code{object}
    and position,  it is called and the value is returned along with the
    position, see Details.}

  \item{nested}{~~ TODO: describe this argument. ~~}
}
\details{

  With the default setting of \code{lists = FALSE}, the function
  \code{f} is applied to each leave (a character string) of the Rd
  object. If \code{lists = TRUE} the function \code{f} is applied also
  to each branch (a list).

  The position of each object for which \code{f} returns TRUE is
  recorded as a numeric vector.

  If \code{fpos} is a function, it is applied to each selected element
  with two arguments, \code{object} and the position, and the result
  returned along with the position. In this case argument
  \code{pos_only} is ignored. If \code{fpos} is NULL the action depends
  on \code{pos_only}.


  If \code{pos_only = TRUE}, \code{Rdo_locate} returns a list of such
  vectors (it is not a matrix since the positions of the leaves are, in
  general, at different depths).

  If \code{pos_only} is a function, it is applied to each selected
  element and the result returned along with the position.

  Argument \code{fpos} is more powerful than \code{pos_only} but the
  latter should be sufficient and simpler to use in most cases.
}
\value{
  a list with one entry for each selected element. Each entry is a
  numeric vector or a list with two elements:
  \item{pos}{the position, a vector of positive integers,}
  \item{value}{the result of applying the function to this element.}
}
\keyword{RdoProgramming}
