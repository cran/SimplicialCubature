\name{CanonicalSimplex}
\alias{CanonicalSimplex}
\alias{UnitSimplexV}
\alias{SimplexVolume}
\alias{SimplexSurfaceArea}
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
UnitSimplexV(n)
SimplexVolume(S)
SimplexSurfaceArea(S3)
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
the columns S2[,1],..,S2[,m+1] give the vertices of the simplex.
}
  \item{S3}{
an n x n matrix specifying a single (n-1)-dimensional simplex inside n-dimensional space; 
the columns S3[,1],..,S3[,n] give the vertices of the simplex.
}
}
\value{
Let e[j] be the j-th standard unit basis vector.
CanonicalSimplex(n) gives the simplex with columns being 
vertices of the canonical simplex in n-dimensions:
the n-dim. simplex with vertices (0,0,...,0) and e[1],...,e[n]. A vector
(u[1],...,u[n]) is in the canonical simplex if 0 <= u[i] <= 1 for all i
and sum(u) <= 1.  UnitSimplexV(n) gives the vertices (V-representation) of the
unit simplex, namely  e[1],...,e[n].
A vector (u[1],...,u[n]) is in the unit simplex if 0 <= u[i] <= 1 for all i
and sum(u) == 1. SimplexVolume(S) returns the n-dim. volume of S and
SimplexSurfaceArea(S3) computes the (n-1)-dim. surface area of S3.
JacobianS2Canonical(S2) returns the Jacobian of the transformation
from an m-dim. simplex S2 to the m-dim. canonical simplex.
}
\examples{
CanonicalSimplex(3)
UnitSimplexV(3)
SimplexVolume( CanonicalSimplex(3) ) 
SimplexSurfaceArea( UnitSimplexV(3) ) 
JacobianS2Canonical( UnitSimplexV(3) )

}
