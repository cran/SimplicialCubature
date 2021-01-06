\name{adaptIntegrateSimplex}
\alias{adaptIntegrateSimplex}
\alias{adaptIntegrateVectorFunc}
\alias{original.coordinates}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Integrate a general function over a simplex
}
\description{
Adaptive integration of a function f(x) of n variables over an m-dimensional simplex S,
1 <= m <= n.  More generally,
f can be a vector valued function and S can be a list of simplices.
}
\usage{
adaptIntegrateSimplex(f, S, fDim = 1L, maxEvals = 10000L, absError = 0, tol = 1e-05, 
     integRule = 3L, partitionInfo = FALSE, ...)
adaptIntegrateVectorFunc( intervals, fDim, f, maxEvals, absError, tol, 
     partitionInfo=FALSE, ...  )
original.coordinates( u, S  )           
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{f}{
a function of n-variables (where n is determined by S) or a vector valued function (if fDim > 1). During the 
cubature process, f will be called with a single point x and it is assumed f(x) returns a vector of length fDim.
}
  \item{S}{
a simplex or list of simplices that specify the region of integration.  
A single simplex S is given by an n x (m+1) matrix, where n is the dimension of the underlying space
and m is the dimension of the simplex, 1 <= m <= n.
In this case, the columns S[,1],...,S[,m+1] are the vertices of the m-dimensional simplex.  
If S is an n x (m+1) x k array, then the region of integration is the union of
the simplices S[,,1],...,S[,,k], each of the above form.  
}
  \item{fDim}{
integer dimension of the integrand function. 
}
  \item{maxEvals}{
integer maximum number of function evaluations allowed
}
  \item{absError}{
requested absolute error in the computation of the integral
}
  \item{tol}{
requested relative error in the computation of the integral
}
  \item{integRule}{
integer in the range 1:4 specifying degree of integration rule:
a (2*integRule+1) degree integration rule is used in function adsimp.
}
  \item{partitionInfo}{
if FALSE, then only the results of the computations are returned.  
If TRUE, then partition information is also returned for the final subdivision of the region.
This will require more memory, but sometimes that information can be useful
for other purposes.
}
  \item{\dots}{
optional arguments to integrand function f(x,...)
}
  \item{intervals}{
(1 x 2 x k) array of intervals for univariate integration
}
  \item{u}{
point in m-dim. space
}
}
\details{
If m=n, then an R translation of Alan Genz's function adsimp(...) is used to evaluate the n-dimensional integral.
It works by adaptively splitting the region of integration into finer partitions, always splitting the simplex
with the largest estimated error.

If 1 < m < n, then the integral is evaluated by mapping the m-simplex in R^n  to
the canonical simplex in m-dimensional space, using function adsimp on that `full' m-dimensional integral, and correcting
with the Jacobian of the transformation.  

If m=1, the function adaptIntegrateVectorFunc is used to evaluate the line intergral.  
It uses the built-in R function integrate (from QUADPACK 1-dimensional adaptive quadrature) 
to evaluate the line integral.  Since it does not provide access to the final subdivision,
partitionInfo=TRUE in the univariate case returns the original partition information.  So, if a fine
parition is desired in the m=1 case, start with a fine partition.  For consistentcy with adaptIntegrateSimplex,
it is assumed that the integrand function f computes fDim values when called with a single x value.  Since
the integrate function does not handle vector integrands, the ingration is done one coordinate at a time.
This will be inefficient when fDim > 1 and evaluation of f is complicated; consistent behavior of the integrand function was choosen over
efficiency.
}

\value{A list containing:
    \item{integral}{estimated value of the integral, it is a vector if fDim > 1}
    \item{estAbsError}{estimated absolute error}
    \item{functionEvaluations}{count of number of function evaluations}
    \item{returnCode}{integer status: returnCode=0 is a successful return;
      non-zero error values are described by next variable}
    \item{message}{text message explaining returnCode; "OK" for normal return}    
    \item{subsimplices}{
          if partitionInfo=TRUE, this gives an array of subsimplices, see function adsimp for more details.}
    \item{subsimplicesIntegral}{
          if partitionInfo=TRUE, this array gives estimated values of each component of the integral on each 
                subsimplex, see function adsimp for more details.}
    \item{subsimplicesAbsError}{
          if partitionInfo=TRUE, this array gives estimated values of the absolute error of each component of the integral on each 
                subsimplex, see function adsimp for more details.}
    \item{subsimplicesVolume}{
          if partitionInfo=TRUE, vector of m-dim. volumes of subsimplices; this is not d-dim. volume if m < n.}

}

\references{
See references to Genz and Cool (2003) in \code{\link{SimplicialCubature-package}}.
}
\note{No check is done on the simplices to see that they are disjoint.  

When m > 1 and fDim > 1, adsimp uses the same grid for each coordinate of f.

When m=1 and fDim > 1, the
components of the integral are evaluated independently, with an upper limit of maxEvals function evaluations for
each component.  This means that 
(a) a different grid may be used for each component, 
and (b) the return variable functionEvaluations is the sum of the number of function evaluations for each component;
it may be up to maxEvals*fDim.

In keeping with Genz's original code, the vertices of the simplex described by S are column vectors, not
row vectors.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
n <- 4
S <- CanonicalSimplex( n )
f1 <- function( x ) { x[1]^3 } 
adaptIntegrateSimplex( f1, S )   # correct answer 0.00119047619
str( adaptIntegrateSimplex( f1, S, partitionInfo=TRUE ) ) # same result, with more info returned

# test with vector valued integrand
f2 <- function( x ) { c(x[1]^3,x[3]^4) } 
adaptIntegrateSimplex( f2, S, fDim=2 )  # correct answer 0.00119047619 0.0005952380952

# test with vector valued integrand and extra arguments
f3 <- function( x, extra.arg ) { extra.arg*c(x[1]^3,x[3]^4) } # multiple of f2 above
adaptIntegrateSimplex( f3, S, fDim=2, extra.arg=100 )  # correct answer 0.119047619 0.05952380952

# integrate over lower dimensional simplices
adaptIntegrateSimplex( f1, UnitSimplexV(4) )  # answer =  0.01666667

f4 <- function(x) { 1 }
#  2-dim integral, exact answer area of unit simplex = sqrt(3)/2 = 0.8660254...
adaptIntegrateSimplex( f4, UnitSimplexV(3) ) 

# line integral over diamond in 2-dim, exact answer=arclength=4*sqrt(2)=5.656854...
S4 <- array( c( 1,0, 0,1,  0,1, -1,0,  -1,0, 0,-1,  0,-1, 1,0) , dim=c(2,2,4)  )
adaptIntegrateSimplex( f4, S4 ) 
adaptIntegrateSimplex( f4, S4, partitionInfo=TRUE ) 

}
