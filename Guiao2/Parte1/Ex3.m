
 %ex 3

 %%%%%% 3 %%%%%%%%%%
%%%%%%(a)%%%%%%%%%%

T = 1e3;
keys = randi([1,T],N,10);
m = zeros(1,N);
for i = 1 : N
    m(i) = length(unique(keys(i,:)));
end

m = m == 10;
prob3a = 1 - sum(m)/N;

%%%%%% 3 %%%%%%%%%%
%%%%%%(b)%%%%%%%%%%

T = 1e3;
keys = randi([1,T],N,10);
m = zeros(1,N);

for i = 1 : N
    m(i) = length(unique(keys(i,:)));
end


%%%%%%%%%%% 3 %%%%%%%%%%%%
%%%%%%%%%%%(c)%%%%%%%%%%%%
N = 1e6;
T = 100:100:1000;
prob3c = zeros(1,10);

for i = T
    keys = randi([1,i],N,50);
    m = zeros(1,N);
    for k = 1 : N
        m(k) = length(unique(keys(k,:)));
    end
    result = m == 50;
    prob3c(i/100) = sum(result)/N;
end

loglog(T, prob3c);
xticks(T);
yticks(0:0.1:1);
xlim([100, 1000]);