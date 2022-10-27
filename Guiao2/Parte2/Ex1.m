% Guiao2 Parte 2 %

% Ex1_a e Ex1_b




x = [1 2 3 4 5 6];
x = 1:6;

px = [1/6 1/6 1/6 1/6 1/6 1/6];
px = ones(1,6)/6;

fx = cumsum(px);


figure(1)
subplot(2,1,1)
(stem(x,px));


figure(1)
subplot(2,1,2)
stairs([0 x 7], [0 fx 1]);