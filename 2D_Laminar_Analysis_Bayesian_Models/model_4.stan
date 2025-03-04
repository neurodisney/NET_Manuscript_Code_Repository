data {
  int<lower=1> Nrows;  // number of data points
  int<lower=1> Nsections;  // number of sections
  int<lower=1> Nlayers;  // number of layers
  int<lower=1> Nproteins;  // number of proteins
  int<lower=1> layer[Nrows];
  int<lower=1> section[Nrows];
  int<lower=1> protein[Nrows];
  int<lower=0> count[Nrows];
  int<lower=0> R[Nrows];
  int<lower=2> Nq;  // number of qualitative categories
  int<lower=1> Nqobs;  // number of qualitative observations
  vector<lower=0, upper=1>[Nq] q[Nlayers, Nproteins];
  int<lower=1> sec2prot[Nsections];
}

parameters {
  vector<lower=0>[Nsections] alpha;
  vector<lower=0>[Nlayers] beta;
  vector<lower=0>[Nlayers] beta_5HT;
  ordered[Nq - 1] c;
  real<lower=0> a[Nproteins];  // hierarchical shape
  real<lower=0> b[Nproteins];  // hierarchical rate
}

transformed parameters {
  vector<lower=0>[Nrows] lambda;
  
  for (j in 1:Nrows) {
    lambda[j] = R[j] * alpha[section[j]] * beta[layer[j]];
  }
  
}

model {
  vector[Nq] log_prob;
  
  target += gamma_lpdf(a | 1, 1);
  target += gamma_lpdf(b | 1, 1);
  
  for (sec in 1:Nsections) {
    target += gamma_lpdf(alpha[sec] | a[sec2prot[sec]], b[sec2prot[sec]]);
  }
  target += gamma_lpdf(beta_5HT | 1, 1);
  target += gamma_lpdf(beta | 1, 1);
  
  // Model 3: NET = rho * DBH, 5HT different
  target += poisson_lpmf(count | lambda);
  
  // qualitative data
  // DBH
  for (l in 1:Nlayers) {
    for (q_level in 1:Nq) {
      log_prob[q_level] = ordered_logistic_lpmf(q_level | beta[l], c); 
    } 
    target += Nqobs * q[l,1]' * log_prob;
  }
  
  // 5-HT
  for (l in 1:Nlayers) {
    for (q_level in 1:Nq) {
      log_prob[q_level] = ordered_logistic_lpmf(q_level | beta_5HT[l], c); 
    } 
    target += Nqobs * q[l,2]' * log_prob;
  }
  
}

generated quantities {
  real<lower=0> alpha_gen[Nproteins];
  real rho;
  
  alpha_gen = gamma_rng(a, b);
  rho = alpha_gen[2]/alpha_gen[1];
}

