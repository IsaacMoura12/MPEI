% Ex2_A

% Espaço de amostragem - 100 notas
% igualmente provaveis, 1 resultado por nota

% Ex2_B

% Espaço de amostragem com 3 resultados
% 1 por nota ( ou 5 euros, 50, 100

% Ex2_C

x = [5 50 100];

px = [0.9 0.09 0.01];

fx = cumsum(px);

figure(1)
subplot(2,1,1)
(stem(x,px));


figure(1)
subplot(2,1,2)
stairs([4 x 101], [0 fx 1]);