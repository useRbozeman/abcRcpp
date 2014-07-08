growth <- function(x, kappa) {
    return(1 + exp( - x / kappa * log(2)))
}

pop <- function(x, kappa) {
    return(exp(-x / kappa * log(2)))
}

evolve <- function(N, S, Food, kappa_g, kappa_d) {
    Fper <- Food / (N * S)
    Np <- N * pop(Fper, kappa_d)
    Sp <- S * growth(Fper, kappa_g)
    return(c(Np, Sp))
}

kappa_d <- .5
kappa_g <- 1
Food <- 2500
Nsim <- 10

N0 <- seq(1000, 50000, 100)
S0 <- seq(0, 4, .5)

P12 <- numeric(Nsim)
Price12 <- array(dim = c(length(N0), length(S0)), 0)

for (i in 1:length(N0))
{
    for (j in 1:length(S0))
    {
        for (r in 1:Nsim)
        {
            out <- c(N0[i], S0[j])
            for (t in 1:5)
            {
                Food <- runif(1, 2000, 3000)
                out <- evolve(out[1], out[2], Food, kappa_g, kappa_d)
            }
            if (out[2] > 12 & out[1] > 1)
            {
                P12[r] <- out[1] / (N0[i] ^ 2 * S0[j] ^ 2)
            }
            Price12[i, j] <- exp(log(mean(P12)))
        }
    }
}


filled.contour(N0, S0, Price12)
