% Ex4_a

n = 0;  %valor a definir em ciclo while
aniversarios = randi([1,365]);
p = 0;
exp = 1e5;

while (p) <= 0.5
    
    p = randi([1,365],exp,n);
    n = n+1;
end



%outro Ex4_a


exp = 1e5;

for n = 10:100
    aniversarios = randi([1,365],exp,n);
    c = zeros(1,exp);
    for i = 1:exp
        c(i) = length(unique(aniversarios(i,:)));
    end
    favoraveis = c == n;
    prob = 1 - sum(favoraveis)/exp;
    if (prob > 0.5)
        break;
    end
end
%disp(n);


 % Ex4_b


N = 1e5;
p = 0;
n = 1;
while p< 0.9
    n = n+1;
    experiencias = randi(365,n,N);
    counter = 0;
for i = 1:N

    if length(unique(experiencias(:,i)))<n
        counter = counter +1;
    end
end

p4b = counter/N;

end