

addR <- function(x, y)
{
    return(x + y)
}


require(Rcpp)
sourceCpp("./addcpp.cpp")

x <- 5; y <- 10
addR(x, y)
addcpp(x, y)
