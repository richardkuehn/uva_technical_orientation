#### packages ####
install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

#### euler problems ####
# euler 1
answer <- 0

for (i in 1:999) {
  if (i %% 3 == 0 | i %% 5 == 0) {
  answer <- answer + i
  print(i)
  }
}

print(answer)

# euler 2
a <- 0
b <- 1
sum_even <- 0

while (TRUE) {
    c <- a + b
    if (c > 4000000) {
      break
    }
    if (c %% 2 == 0) {
      sum_even <- sum_even + c
    }
    a <- b
    b <- c
}

print(sum_even)

# euler 3
is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  if (n %% 2 == 0) return(FALSE)
  for (i in 3:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

largest_prime_factor <- function(n) {
  if (n <= 1) return(NULL)
  largest_factor <- 1
  while (n %% 2 == 0) {
    largest_factor <- 2
    n <- n / 2
  }
  factor <- 3
  while (factor * factor <= n) {
    while (n %% factor == 0) {
      largest_factor <- factor
      n <- n / factor
    }
    factor <- factor + 2
  }
  if (n > 2) {
    largest_factor <- n
  }
  return(largest_factor)
}

number <- 600851475143
result <- largest_prime_factor(number)
print(result)


#### distributions ####
# Normal distribution
generator_normal <- function(mu, sigma, sample_size) {
  rnorm(sample_size, mean = mu, sd = sigma)
}

mean <- 50
stan_dev <- 10
sample_size <- 10000
random_numbers <- generator_normal(mean, stan_dev, sample_size)

ggplot(data.frame(x = random_numbers), aes(x)) +
  geom_histogram(bins = 20, color = "black", fill = "blue", alpha = 0.7) +
  ggtitle('Histogram of Normally Distributed Random Numbers') +
  xlab('Value') +
  ylab('Frequency')

# Uniform distribution
generator_uniform <- function(lower, upper, sample_size) {
  runif(sample_size, min = lower, max = upper)
}

lower <- 0.0
upper <- 1.0
sample_size2 <- 1000
random_numbers2 <- generator_uniform(lower, upper, sample_size2)

ggplot(data.frame(x = random_numbers2), aes(x)) +
  geom_histogram(bins = 30, color = "black", fill = "blue", alpha = 0.7) +
  ggtitle('Histogram of Uniformly Distributed Random Numbers') +
  xlab('Value') +
  ylab('Frequency')

# Binomial distribution
generator_binomial <- function(n, p, sample_size) {
  rbinom(sample_size, size = n, prob = p)
}

n <- 20
p <- 0.5
sample_size3 <- 40
random_numbers3 <- generator_binomial(n, p, sample_size3)

ggplot(data.frame(x = random_numbers3), aes(x)) +
  geom_histogram(breaks = seq(-0.5, n + 0.5, by = 1), color = "black", fill = "blue", alpha = 0.7) +
  ggtitle(paste('Histogram of Binomial(', n, ', ', p, ') Distributed Random Numbers', sep = '')) +
  xlab('Number of Successes') +
  ylab('Frequency') +
  scale_x_continuous(breaks = 0:n) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme_minimal()


#### binomial and normal converge ####
# Low binomial
n <- 20
p <- 0.5
sample_size3 <- 40
random_numbers3 <- generator_binomial(n, p, sample_size3)

ggplot(data.frame(x = random_numbers3), aes(x)) +
  geom_histogram(breaks = seq(-0.5, n + 0.5, by = 1), color = "black", fill = "blue", alpha = 0.7) +
  ggtitle(paste('Histogram of Binomial(', n, ', ', p, ') Distributed Random Numbers', sep = '')) +
  xlab('Number of Successes') +
  ylab('Frequency') +
  scale_x_continuous(breaks = 0:n) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme_minimal()

# High binomial
sample_size3 <- 4000
random_numbers3 <- generator_binomial(n, p, sample_size3)

ggplot(data.frame(x = random_numbers3), aes(x)) +
  geom_histogram(breaks = seq(-0.5, n + 0.5, by = 1), color = "black", fill = "blue", alpha = 0.7) +
  ggtitle(paste('Histogram of Binomial(', n, ', ', p, ') Distributed Random Numbers', sep = '')) +
  xlab('Number of Successes') +
  ylab('Frequency') +
  scale_x_continuous(breaks = 0:n) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme_minimal()

# Low normal
mean <- 50
stan_dev <- 10
sample_size <- 100
random_numbers1 <- generator_normal(mean, stan_dev, sample_size)

ggplot(data.frame(x = random_numbers1), aes(x)) +
  geom_histogram(bins = 20, color = "black", fill = "blue", alpha = 0.7) +
  ggtitle('Histogram of Normally Distributed Random Numbers') +
  xlab('Value') +
  ylab('Frequency')

# High normal
sample_size <- 10000
random_numbers1 <- generator_normal(mean, stan_dev, sample_size)

ggplot(data.frame(x = random_numbers1), aes(x)) +
  geom_histogram(bins = 20, color = "black", fill = "blue", alpha = 0.7) +
  ggtitle('Histogram of Normally Distributed Random Numbers') +
  xlab('Value') +
  ylab('Frequency')

