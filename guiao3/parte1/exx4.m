%%%%%%% 4 %%%%%%%%%
%%%%% 4(a)%%%%%%%%%

p = 0.4;
q = 0.6;

% 4 estados

%transiçoes:

AB = (1 - p)^2;
AA = p^2;
AC = p*(1-p);
AD = AC;
BA = 0;
BB = 0 ;
BC = 0;
BD = 1;
CA = 0;
CB = 0;
CC =0;
CD = 1;
DB = q*(1-q);
DA = q^2;
DC = DB;
DD = (1-q)^2;

%matriz transicao de estados
%   A B C D
%A
%B
%C
%D

T = [AA BA CA DA
    AB BB CB DB
    AC BC CC DC
    AD BD CD DD];

fprintf("4(a) \n")
T
%%%% (b)

pi = [1;0;0;0];
fprintf(" 4(b) 5 transições - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) =%.8f", T^5*pi)
fprintf(" 4(b) 10 transições - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) =%.8f", T^10*pi)
fprintf(" 4(b) 100 transições - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) =%.8f", T^100*pi)
fprintf(" 4(b) 200 transições - p(A) = %.8f, p(B) = %.8f, p(C) = %.8f, p(D) =%.8f", T^200*pi)




%(c) slide 70 I que aparece na multiplicacao é a
% identidade (comando eye slide72 devolve a matriz
% identidade

%Teoria
%Tv = v
%(T -I)v = 0
%sum(v) = 1

n = length(T);
M = [T - eye(n); ones(1,n)]; % (T -I)
x = [zeros(n,1);1];
v = M\x;

%Adiciona-se uns na ultima linha para a soma das
% colunas dar 1 ou seja que a soma de todas equaçoes
% tem de dar 1
