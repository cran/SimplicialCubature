\name{adsimp}
\alias{adsimp}
\alias{SMPCHC}
\alias{SMPDFS}
\alias{SMPRMS}
\alias{SMPRUL}
\alias{SMPSAD}
\alias{SMPSMS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Internal functions for adaptIntegrateSimplex.
}
\description{
adsimp is a translation of Alan Genz's matlab program adsimp.m to adaptively
integrate over a simplex.  The other functions listed below are all called by
adsimp.  These functions are used internally; use at your own risk.
}
\usage{
adsimp(ND, VRTS, NF, F, MXFS, EA, ER, KEY, partitionInfo = FALSE)
SMPCHC(ND, NF, MXFS, EA, ER, SBS, KEY)
SMPDFS(ND, NF, F, TOP, SBS, VRTS)
SMPRMS(N, KEY)
SMPRUL(ND, VRTS, VOL, NF, F, G, W, PTS)
SMPSAD(ND, NF, F, MXFS, EA, ER, KEY, RCLS, SBS, VRTS, partitionInfo)
SMPSMS(N, VERTEX, NF, F, G)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ND, N}{
dimension of the space
}
  \item{VRTS, VERTEX}{
array specifying the simplices 
}
  \item{NF}{
dimension of the function; F(x) has NF coordinates
}
  \item{F}{
a function of ND variables, value F(x) has NF coordinates
}
  \item{MXFS}{
maximum number of function evaluations allowed
}
  \item{EA}{
requested absolute error
}
  \item{ER}{
requested relative error
}
  \item{KEY}{
integration rule
}
  \item{partitionInfo}{
TRUE or FALSE, see adaptIntegrateSimplex
}
  \item{SBS}{
number of subsimplices
}
  \item{TOP}{
pointer to a subsimplex
}
  \item{VOL}{
volume of a simplex
}

  \item{G}{
generators for integration rule
}

  \item{W}{
weights for an integration rule
}

  \item{PTS}{
points in an integration rule
}

  \item{RCLS}{
number of terms in an integration rule
}
}
\value{
Not meant to be used directly, they called from function adaptIntegrateSimplex(...).
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{adaptIntegrateSimplex}}
}
