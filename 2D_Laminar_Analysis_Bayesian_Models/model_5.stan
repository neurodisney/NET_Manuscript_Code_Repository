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
}

parameters {
  vector<lower=0>[Nsections] alpha;
  vector<lower=0>[Nlayers] beta[Nproteins];
  vector<lower=0>[Nlayers] beta_5HT;
  ordered[Nq - 1] c;
}

transformed parameters {
  vector<lower=0>[Nrows] lambda;
  
  for (j in 1:Nrows) {
    lambda[j] = R[j] * alpha[section[j]] * beta[protein[j], layer[j]];
  }
  
}

model {
  vector[Nq] log_prob;
  
  target += gamma_lpdf(alpha | 1, 1);
  for (prot in 1:Nproteins) {
    target += gamma_lpdf(beta[prot] | 1, 1);
  }
  target += gamma_lpdf(beta_5HT | 1, 1);
  
  // Model 5: DBH, NET, 5HT different
  target += poisson_lpmf(count | lambda);
  
  // qualitative data
  // DBH
  for (l in 1:Nlayers) {
    for (q_level in 1:Nq) {
      log_prob[q_level] = ordered_logistic_lpmf(q_level | beta[1, l], c);
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

