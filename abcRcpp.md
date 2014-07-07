% ABC and Rcpp
% Michael Lerch

Bayesian Analysis
=================

----------------------

### Parameters and data ###

- What is a parameter

- What is data

----------------------

### Prior ###

What it is

----------------------

### Likelihood ###

----------------------

### Bayes Rule ###

----------------------

### Posterior ###

----------------------

### Using the posterior ###

----------------------

### Denominator ###

Sampling the posterior
======================

----------------------

- Metropolis-Hastings

- Gibbs

----------------------

### "Rejection sampling" ###

We want the posterior: $P(\theta| x)$.  We can sample the joint pretty easily,
$P(\theta, x) = P(\theta) P(x | \theta)$.  Now just constrain the $P(\theta,
x)$ samples to those where $x = x_{obs}$.

----------------------

### Algorithm ###

1. Sample $\theta^*$ from the prior: $P(\theta)$
2. Sample $x^*$ from the likelihood: $P(x|\theta^*)$
3. If $x^*$ is equal to the observed data, keep $\theta^*$, if not reject.

----------------------

### Ain't nobody got time for that ###

----------------------

### Speeding it up ###

1. Summary statistics (perhaps sufficient for likelihood statistics)

2. Add some wiggle room

----------------------

### Why use ABC? ###

Complicated likelihood

Rcpp
====

### Basic idea ###

Write code in C++, run in R

Because C++ is faster than R

----------------------

### Is Rcpp necessary ###

No but it makes things a bit easier

----------------------

