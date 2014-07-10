#include <Rcpp.h>

#define POP 100000

using namespace Rcpp;

// [[Rcpp::export]]
IntegerVector airsample(int ni, int nf, IntegerVector passengers, int nsamps)
{
        int i, j, nsamp = 0;
        int theta_star;
        int new_pass;
        IntegerVector samps(nsamps);
        double out;
        int prev = passengers[0];

        while (nsamp < nsamps)
        {
                theta_star = ni + (rand() % (nf - ni));
                for (i=0; i<12; i++)
                {
                        new_pass = 0;
                        for (j=0; j<prev; j++)
                        {
                                new_pass += R::rhyper(POP, POP - prev, theta_star);
                        }
                }
                nsamp++;
        }
        return samps;
}
