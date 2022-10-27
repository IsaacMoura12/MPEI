%   Ex2 %

%2a

N = 1e6;
n = 20;
m= 100;

experiencias = randi(m,n,N);


aux = 0;

for i= 1:N
    if length(unique(experiencias(:,i))) ==n
        aux = aux +1;
    end
end

 p = aux/N;


%2b
 
 pb = 1-p;  


 %2c  

 N = 1e6;
m = [1000, 100000];
for j = 1:length(m)
    k = m(j);
    for n = 10:10:100
        a = randi([1,k],N,n);
        for i = 1:N
            aux = zeros(1,N);
            aux(i) = length(unique(a(i,:)));
        end
        result = aux == n;
        res2 = (N - sum(result))/N;
    end
    subplot(2,1,j)
    plot(N,res2)
end
