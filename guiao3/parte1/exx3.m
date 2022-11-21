%%%% Ex3:
%%% gerar matriz
n = 20;
T = rand(n);
T = T./sum(T);

%%% a)

% Matriz de transição de estados
% é estocástica pois a soma das
% colunas é igual a 1.

%%% b)

% 2 Transições:

T2 = T ^2;
a = T(20,1);
pa = a*100;
fprintf ('Prob para 2T = %.5f:\n',pa)

% 5 Transições:

T5 = T ^5;
b = T(20,1);
pb = b * 100;
fprintf ('Prob para 5T = %.5f:\n',pb)

% 10 Transições:
T10 = T ^10;
c = T(20,1);
pc = c * 100;
fprintf ('Prob para 10T = %.5f:\n',pc)

% 100 Transições:
T100 = T ^100;
d = T(20,1);
pd = d *100;
fprintf ('Prob para 100T = %.5f:\n',pd)

% Conclusão:
% O resultado da probabilidade é sempre igual