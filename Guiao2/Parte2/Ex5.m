%%% ex5

p = 0.5; % probabilidade de falha do motor (valor para testar as expressoes)

% se a probabilidade de falha de um motor é p entao (1-p) é a probabilidade
% de nao falhar



% PARA AVIAO 2 MOTORES : PROBbilidade de continuar a voar

P2 = 1-(1-p).^2;


% PARA AVIAO 4 MOTORES: probabilidade de continuar a voar

P4 = 1-(1-p).^4 - 4* p*(1-p).^3;


grafico = zeros(1,10);
grafico2 = zeros(1,10);
grafico(1) = 1-(1-0/10).^2;
grafico2(1) = 1-(1-0/10).^4 - 4* p*(1-0/10).^3;

for i = 2:10
    
    grafico(i+1) =1-(1-i/10).^2;    %%% probabilidade para aviao 2 motores
    grafico2(i+1) = 1-(1-i/10).^4 - 4* (i/10)*(1-i/10).^3;   %%% probabilidade para aviao 4 motores
  
end
subplot(2,1,1);
plot(grafico)
subplot(2,1,2);
plot(grafico2)