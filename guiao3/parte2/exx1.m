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
%plot(fc15)

% O prob do estado 3 é maior porque exSistem 2 estados
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

%começando no 1
n11 = zeros(1,1e5); %n de vezes que começando no estado 1 passa pelo estado 1 antes de cair no absorvente
n12 = zeros(1,1e5);
n13 = zeros(1,1e5);
media1 = zeros(1,1e5);

%1b)
b
for i = 1:1e5

    % how to use crawl()
    state = crawl(T, 1, [4,5]);
    media1(i) = length(state);
    x = state == 1;
    n11(i) = sum(x);
    x = state == 2;
    n12(i) = sum(x);
    x = state == 3;
    n13(i) = sum(x);
end 

n11 = sum(n11)/1e5;
n12 = sum(n12)/1e5;
n13 = sum(n13)/1e5;
media1 = sum(media1)/1e5

%começando no 2

n21 = zeros(1,1e5); %n de vezes que começando no estado 2 passa pelo estado 1 antes de cair no absorvente
n22 = zeros(1,1e5);
n23 = zeros(1,1e5);
media2 = zeros(1,1e5);
for i = 1:1e5

    % how to use crawl()
    state = crawl(T, 2, [4,5]);
    media2(i) = length(state);
    x = state == 1;
    n21(i) = sum(x);
    x = state == 2;
    n22(i) = sum(x);
    x = state ==3;
    n23(i) = sum(x);

end 
n21 = sum(n21)/1e5;
n22 = sum(n22)/1e5;
n23 = sum(n23)/1e5;

media2 = sum(media2)/1e5


%começando no 4
n41 = zeros(1,1e5); %n de vezes que começando no estado 2 passa pelo estado 1 antes de cair no absorvente
n42 = zeros(1,1e5);
n43 = zeros(1,1e5);

media4 = zeros(1,1e5);
for i = 1:1e5

    % how to use crawl()
    state = crawl(T, 3, [4,5]);
    media4(i) = length(state);
    x = state == 1;
    n41(i) = sum(x);
    x = state == 2;
    n42(i) = sum(x);
    x = state ==3;
    n43(i) = sum(x);

end 

n41 = sum(n41)/1e5;
n42 = sum(n42)/1e5;
n43 = sum(n43)/1e5;

media4 = sum(media4)/1e5


%1a) para o g
 Fiig = [n11 n21 n41
        n12 n22 n42
        n13 n23 n43];

 Z = R*Fiig;

 fprintf("Começando no estado 1, probabilidade  de estar no estado 3: %.4f\n",Z(1,1));
fprintf("Começando no estado 1, probabilidade de estar no estado 5: %.4f\n", Z(2,1));




% Note:
% if the Markov chain has more than 1 absorbing state the third argument
% must be a vector with the absorbing states
% for example in a chain with 5 states and considering that
% states 4 and 5 are absorbing states:
% state = crawl(H5, 1, [4 5])
%
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = first;
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
    end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end
% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end


