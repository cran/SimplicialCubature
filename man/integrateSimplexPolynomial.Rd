\name{integrateSimplexPolynomial}
\alias{integrateSimplexPolynomial}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Exact integration of a polynomial over a simplex
}
\description{
Computes the exact integral of a polynomial p(x) over an m-dimensional simplex S
in n-dimensional space, 1 <= m <= n.
The methods are exact for polynomials, no approximation is used.  The only
inaccuracies possible are in the floating point evaluation of knots, 
coefficients, evaluation of the polynomial, sums, and products.
}
\usage{
integrateSimplexPolynomial(p, S, method="GM")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{
a single polynomial, defined though function polyDefine.
}
  \item{S}{Either a single simplex, specified by an n x (m+1) matrix with the columns
S[,1],...,S[,n+1] giving the vertices of the simplex, or a n x (m+1) x k array with
S[,,1],...,S[,,k] each a single simplex as described above.
}
  \item{method}{
either "GM" (for the Grundmann-Moller method) or "LA" (for the Lasserre-Avrenchenkov) method
}
}
\details{
If method="GM", the Grundmann-Moller method is used; it is exact for polynomials (because the
function chooses a rule of high enough degree for the degree of the polynomial p(x)).
This is faster, requiring fewer function evaluations. This method works for n >=1 and
1 <= m <= n.

If method="LA", the algorithm splits the polynomial into terms that are homogeneous
of degree q, uses the method of Lasserre and Avrachenkov to exactly
integrate those terms, and sums over all degrees.  This method is slower, requiring 
more function evaluations.  The degree of
the polynomial has more effect on execution time than the number of terms or
number of variables.  This method only works with n > 1 and m=n.
}
\value{
\item{integral}{value of the integral}
\item{functionEvaluations}{number of function evaluations used}
}
\references{See references in \code{\link{SimplicialCubature-package}}.
}


\examples{
S <- CanonicalSimplex( 4 ) # 4-dim. simplex
p1 <- definePoly( 1.0, matrix( c(2,0,0,5), nrow=1) )
printPoly(p1)
# same as example for function grnmol( ), but explicitly using the fact that the integrand 
# function is a polynomial, and automatic selection of the order of the integration rule
integrateSimplexPolynomial( p1, S, method="GM" ) 
\donttest{integrateSimplexPolynomial( p1, S, method="LA" )}


p2 <- definePoly( c(5,-6), matrix( c(3,1,0,0,   0,0,0,7), nrow=2, byrow=TRUE)  )
printPoly( p2 )
integrateSimplexPolynomial( p2, S, method="GM" )  # correct answer  -1.352814e-05
\donttest{integrateSimplexPolynomial( p2, S, method="LA" )  # correct answer  -1.352814e-05}

# integrate random polynomials and random simplices in different dimensions
for (n in 3:5) {
  S <- matrix( rnorm(n*(n+1)), nrow=n, ncol=n+1 ) 
  p.rand <- definePoly( rnorm(1), matrix( c(4, rep(0,n-1)),  nrow=1 ) )
  #printPoly(p.rand)
  tmp1 <- integrateSimplexPolynomial( p.rand, S, method="GM" )
  tmp2 <- integrateSimplexPolynomial( p.rand, S, method="LA" )  
  cat("n=",n,"  GM integral=",tmp1$integral,"   functionEvaluations=",tmp1$functionEvaluations, 
     "  LA integral=", tmp2$integral, "   functionEvaluations=",tmp2$functionEvaluations,"\n")
}


}
