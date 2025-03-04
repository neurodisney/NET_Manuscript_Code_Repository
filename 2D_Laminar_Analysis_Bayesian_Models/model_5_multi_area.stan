
data {
  int<lower=1> Nrows;  // number of data points
  int<lower=1> Nsections;  // number of sections
  int<lower=1> Nlayers;  // number of layers
  int<lower=1> Nproteins;  // number of proteins
  int<lower=1> Nareas;  // number of areas
  int<lower=1> layer[Nrows];
  int<lower=1> section[Nrows];
  int<lower=1> protein[Nrows];
  int<lower=1> area[Nrows];
  int<lower=0> count[Nrows];
  int<lower=0> R[Nrows];
}

parameters {
  vector<lower=0>[Nsections] alpha;
  vector<lower=0>[Nlayers] beta[Nareas, Nproteins];
}

transformed parameters {
  vector<lower=0>[Nrows] lambda;
  
  for (j in 1:Nrows) {
    lambda[j] = R[j] * alpha[section[j]] * beta[area[j], protein[j], layer[j]];
  }
  
}

model {
  
  target += gamma_lpdf(alpha | 1, 1);
  for (a in 1:Nareas) {
    for (prot in 1:Nproteins) {
      target += gamma_lpdf(beta[a, prot] | 1, 1);
    }
  }
  
  target += poisson_lpmf(count | lambda);
  
}