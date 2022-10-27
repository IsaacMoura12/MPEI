%1a
N = 1e6;

experiencias= rand(2,N) >= 0.5;
experiencias1 = rand(5,N) >= 0.5;

p1 = sum(sum(experiencias)>= 1);
prob_a = p1/N;


%1b Valores sao iguais



%1c
p1 = sum(sum(experiencias) == 2);
p2 = sum(sum(experiencias) >= 1);
prob_c = p1/p2;

%1d
p1 = sum(sum(experiencias) == 2);
p2 = sum(experiencias(1,:)); 
prob_d = p1/p2;

%1e
p1 = sum(sum(experiencias1) == 2);
p2 = sum(experiencias1(1,:));
prob_e = p1/p2;

%1f

p1= sum(sum(experiencias1) == 2);
p2 = sum(experiencias1(1,:));
prob_f = p1/p2;