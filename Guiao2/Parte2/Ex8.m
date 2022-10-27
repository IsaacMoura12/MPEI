% 8

k= 1;
y = 100 * 0.02;
prob8 = ((y^k)/factorial(k)) * exp(-y);
res = 0;
for k = 0:1
    prob8b = ((y^k)/factorial(k)) * exp(-y);
    res = res + prob8b;
end
