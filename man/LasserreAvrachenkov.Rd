\name{LasserreAvrachenkov}
\alias{LasserreAvrachenkov}
\alias{nextIntBaseB}
\alias{nextIndexLA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Internal functions for integrateSimplexPolynomial.
}
\description{
LasserreAvrachenkov implements the exact integration formula
for a homogeneous polynomial p of degree q.  The other functions
are helper functions for that.
}
\usage{
LasserreAvrachenkov(q, p, useTerm, S)
nextIndexLA(current.n, b)
nextIntBaseB(current.n, b)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{q}{
degree of the polynomial p
}
  \item{p}{
polynomial obtained by calling definePoly
}
  \item{useTerm}{
vector of booleans, telling which terms are homogeneous of degree q
}
  \item{S}{
an n x (n+1) matrix specifying a single simplex; the columns S[,1],..,S[,n+1]
give the vertices of the simplex.
}
  \item{current.n}{
vector of integers giving the base b representation of a (non-negative) integer 
}
  \item{b}{
base used for the base b representation of an integer}
}

\value{
Not meant to be called externally.
}
\references{See Lasserre and Avrachenkov, Baldoni, et al., and Konerth references in \code{\link{SimplicialCubature-package}}.
}
\seealso{
\code{\link{integrateSimplexPolynomial}}
}
