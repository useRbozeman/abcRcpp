% ABC and Rcpp
% Michael Lerch

Bayesian Analysis
=================

----------------------

Model and Likelihood

![](./img/model.png)

$$y = m * x + b$$

$$\mu = m * x + b$$

----------------------

Likelihood

![](./img/model.png)

$$y = \mu + \epsilon$$

$$\epsilon \sim N(0, \sigma)$$

----------------------

### Parameters ###

<br />

- The slope, $m$

- The intercept, $b$

- The variability, $\sigma$

- Collectively, $\theta$

----------------------

### Likelihood ###

<br />

$$P(Y | \theta)$$

$$P(Y | \theta, X)$$

----------------------

### Prior ###

![](./img/prior.png)

$$P(\theta)$$

----------------------

### Bayes Rule ###

<br />

$$P(\theta | Y) = \frac{P(Y|\theta)P(\theta)}{P(Y)}$$

----------------------

### Prior -> Posterior ###

![](./img/prior.png)

$$P(\theta | Y)$$

----------------------

### Prior -> Posterior ###

![](./img/posterior.png)

$$P(\theta | Y)$$

----------------------

### Using the posterior ###

![](./img/posterior.png)

----------------------

### The Denominator ###
<br />

$$P(\theta | Y) = \frac{P(Y|\theta)P(\theta)}{P(Y)}$$

Sampling the posterior
======================

----------------------

### Algorithms you may have heard of ###

<br />

- Metropolis-Hastings

- Gibbs

----------------------

```
curve(dnorm(x), xlim = c(-3, 3)
```

![](./img/dnorm.png)

----------------------

```
plot(density(rnorm(1000)), xlim = c(-3, 3))
```

![](./img/densrnorm.png)

----------------------

### "Rejection sampling" ###

<br />

Sample from the joint distribution, $P(\theta, Y) = P(\theta)P(Y|\theta)$

![](./img/joint.png)

----------------------

### "Rejection sampling" ###

<br />

Reject when the sampled $Y$ does not equal the observed

![](./img/jointreject.png)

----------------------

### Algorithm ###

<br />

1. Sample $\theta^*$ from the prior: $P(\theta)$
2. Sample $Y^*$ from the likelihood: $P(Y|\theta^*)$
3. If $Y^*$ is equal to the observed data, keep $\theta^*$, if not reject.

<!-- ---------------------- -->

<!-- ![](./img/notime.jpg) -->

----------------------

### Speeding it up ###

<br />

1. Summary statistics (perhaps sufficient)
2. Add some wiggle room

----------------------

### Why use ABC? ###

<br />

Cases where we can simulate data, we know the data generating process, but
might have difficulty writing down a likelihood.

Rcpp
====

----------------------

### Basic idea ###

<br />

Write code in C++, call from R

Because C++ is faster than R

Not a new concept but Rcpp makes this much easier

----------------------

### How scared should I be of C++? ###

<br />

- Equal signs, not assignment arrows
- Semi-colons at the end of lines
- Indexing starts at 0
- For loops have a different structure
- Type definitions

----------------------

### Examples ###

- Addition
- Fibonacci sequence
- Multiple functions

ABC and Rcpp
============

----------------------

uspop data in R

![](./img/uspop.png)

----------------------

### Proportional Growth ###

<br />

$$\frac{dp}{dt} = rp$$

<br />

$$p = p_0 e ^ {rt}$$

----------------------

### Logistic growth function ###

<br />

$$\frac{dp}{dt} = \frac{rp(K - p)}{K}$$

<br />

$$p = \frac{K}{1 + (K / p_0 - 1) e^ {- r t}}$$


