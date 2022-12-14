%Os estados absorventes devem ficar nas ultimas linhas e colunas
% Forma canonica
% T = [Q 0
%      R I] I- matriz identidade
%F = (I-Q)^(-1)
% sum(F)
% n º de transicoes de cada estado transitorio antes da absorveçao
% B = R*F
% B(i,j): começando num estado j com ela a prob de cada estado de
% absorveção i


% Q = 1 2 4
%    1
%    2
%    4 
Q = [0.8 0.2 0  %Q- mastriz de estados não absoreventes para
    0 0.6 0.1   % estados não absorventes
    0.3 0.2 0.4]';

% R =  3 5
%    1
%    2
%    4 
R = [0 0
     0.3 0
     0 0.1]';

I = eye(2,2);

zero = zeros(3,2); %linhas,colunas

T = [Q zero
      R I];

%%%%%% (b e c) %%%%%%5
%%%%%%%%%%%%%%%%%

fb = zeros(1,100);
fc13 = zeros(1,100);
fc15 = zeros(1,100);

for i = 1:100
    aux = T^i;
    fb(i) = aux(2,1);
    fc13(i) = aux(4,1);
    fc15(i) = aux(5,1);
end

%plot(fb)
plot(fc15)

% O prob do estado 3 é maior porque existem 2 estados
%absorventes e o estado absorevnete que tende mais para 1 
%é o que tem o caminho de transição mais prob





% d) Matriz Q (feito em cima)
fprintf("d)\n");
display(Q);


% e) Matriz Fundamental
fprintf("e)\n")
I = eye(3,3);
F = I -Q;
F = F^(-1); % = inv(F)
display(F);

% f)
t = F';
tmp = [1
       1
       1];
t = F * tmp;
fprintf("f)\n")
fprintf("Número de passos antes da absorção:\n");
fprintf("Começando no estado 1: %.4f\n", t(1));
fprintf("Começando no estado 2: %.4f\n", t(2));
fprintf("Começando no estado 4: %.4f\n", t(3));


% g) Matriz B das probabilidades de absorção
 B = R * F;
fprintf("g)\n")
fprintf("Começando no estado 1, probabilidade  de estar no estado 3: %.4f\n",B(1,1));
fprintf("Começando no estado 1, probabilidade de estar no estado 5: %.4f\n", B(2,1));
