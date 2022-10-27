% 7
y = 15;
k = 0;
prob7 = ((y^k)/factorial(k)) * exp(-y);

%7b

k = 11;
y = 15;
res = 0;

for k = 0:10
    prob7b = ((y^k)/factorial(k)) * exp(-y);
    res = res + prob7b;
end

res = 1- res;