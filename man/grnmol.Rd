\name{grnmol}
\alias{grnmol}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Grundmann-Moller integration of a function over a simplex
}
\description{
Computes an approximation to the integral of a function f(x) over a simplex S.
This is an R translation of the matlab function grnmol.m which was written
by Alan Genz.  
}
\usage{
grnmol(f,V,s) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{f}{
a (real-valued) function f that can be evaluated at all points in V.
}
  \item{V}{
a single simplex, specified by an (n x (n+1)) matrix.  The columns
V[,1],...,V[,n+1] are the vertices of the simplex. 
}
  \item{s}{
a positive integer specifying the order of the rule used
}
}
\details{
The Grundmann-Moller algorithm approximates the integral of f(x) over the simplex
V.  When f(x) is a polynomial, and s is large enough, the integral is exact.
This function is called by \code{\link{integrateSimplexPolynomial}}.
}
\value{
\item{Q}{a vector of length s+1, with Q[i] the i-th degree approximate value of the integral}
\item{nv}{number of function evaluations used}
}
\references{See reference by Grundmann and Moller in \code{\link{SimplicialCubature-package}}.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
f <- function( x ) { x[1]^2*x[4]^5 }
grnmol( f, CanonicalSimplex(4), s=4 )

}
