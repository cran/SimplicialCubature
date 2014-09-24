\name{CanonicalSimplex}
\alias{CanonicalSimplex}
\alias{UnitSimplex}
\alias{SimplexVolume}
\alias{JacobianS2Canonical}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Internal functions for defining/working with simplices.
}
\description{
These are utility functions that are useful when defining/working with
simplices in n-dimensional space.  
}
\usage{
CanonicalSimplex(n)
UnitSimplex(n)
SimplexVolume(S)
JacobianS2Canonical(S2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{
  positive integer giving the dimension of the space
}
  \item{S}{
an n x (n+1) matrix specifying a single n-dimensional simplex; the columns S[,1],..,S[,n+1]
give the vertices of the simplex.
}
  \item{S2}{
an n x (m+1) matrix specifying a single m-dimensional simplex, with m <= n; 
the columns S[,1],..,S[,m+1] give the vertices of the simplex.
}
}
\value{
Let e[j] be the j-th standard unit basis vector.
CanonicalSimplex(n) gives the simplex with columns being 
vertices of the canonical simplex in n-dimensions:
the n-dim. simplex with vertices (0,0,...,0) and e[1],...,e[n]. A vector
(u[1],...,u[n]) is in the canonical simplex if 0 <= u[i] <= 1 for all i
and sum(u) <= 1.  UnitSimplex(n) gives the vertices of the
unit simplex, namely  e[1],...,e[n].
A vector (u[1],...,u[n]) is in the unit simplex if 0 <= u[i] <= 1 for all i
and sum(u) == 1. SimplexVolume(S) returns the n-dim. volume of S;
JacobianS2Canonical(S2) returns the Jacobian of the transformation
from an m-dim. simplex S2 to the m-dim. canonical simplex.
}
\examples{
CanonicalSimplex(3)
UnitSimplex(3)
SimplexVolume( CanonicalSimplex(3) )  
JacobianS2Canonical( UnitSimplex(3) )

}
