#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
double addcpp(double x, double y)
{
        return x + y;
}
