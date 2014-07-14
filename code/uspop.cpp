#include <Rcpp.h>

#define PREC 10000

using namespace Rcpp;
using namespace std;

int closeEnough(double x, double y, double perc);

// [[Rcpp::export]]
NumericMatrix growthFit(NumericVector data, double rmu, double rsig,
                        double Kmu, double Ksig, double perc, int N)
{
        int i;
        int accept;
        int n = 0; // sample number
        NumericVector p(19);
        NumericMatrix theta(N, 2);
        double r;  // growth rate
        double K;  // carrying capacity

        // If it takes too long to find a sample that is accepted, then just
        // quit
        int tries = 0, max = 1000000;

        p[0] = data[0];

        while (n < N)
        {
                r = R::rnorm(rmu, rsig);
                K = R::rnorm(Kmu, Ksig);
                accept = 1;
                for (i=1; i<19; i++)
                {
                        // p[i] = (1 + k) * p[i - 1];
                        // p[i] = (1 + (k * y - 1) / y ) * p[i - 1];
                        p[i] = p[i - 1] * (1 + r * (K - p[i - 1]) / K);

                        p[i] += R::rnorm(0, sqrt(p[i]));


                        if ( !closeEnough(p[i], data[i], perc) )
                        {
                                accept = 0;

                                if (tries++ == max)
                                {
                                        cout << "Not working" << endl;
                                        return 0;
                                }
                                break;
                        }

                }
                if (accept == 1)
                {
                        theta(n, 0) = r;
                        theta(n, 1) = K;
                        n++;
                        tries = 0;
                }

        }


        return theta;
}

int closeEnough(double x, double y, double perc)
{
        if ( (x > (1 - perc) * y) && (x < (1 + perc) *y) )
        {
                return 1;
        } else {
                return 0;
        }
}
