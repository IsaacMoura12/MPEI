% 6a

p = 0.001;

k = 7;

n = 8000;
y = (n * p);

prob = nchoosek(n,k)*p^k*(1-p)^(n-k);
probP = ((y^k)/factorial(k)) * exp(-y);

% lambda = (n*p)
