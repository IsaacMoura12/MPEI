%%%%%%%%%%% 5 %%%%%%%%
%%%%%%%%%%% 5(A)%%%%%%%

T = [0.7 .2 .1
    .2 .3 .5
    0.3 0.3 0.4]'


%alinea (b)

% ex: 1º -> sol 
% 5º -> chva?
% 8º -> nuvens?
% estados: sol- 1; nuvens -2; chuva-3
%T4 = T^4; -> 4 dias depois
%T3 = T^3
%
%prob 5º chuva = T4 *(3,1)
%prob 8º chuva = T4(3,1) * T3(2,3)


fprintf("5 (b) Prob de n chover nem 2º dia nem no 3º %.6f\n", T(1,1)*T(1,1))


%alinea (c)
% casos = sol sol sol; sol sol nuvens; sol nuvens sol; sol nuvens nuvens
p= T(1,1)*T(1,1) + T(1,1)*T(2,1) + T(2,1)*T(1,2) +T(2,1)*T(2,2);
fprintf("5 (b) Prob e de nao chover nem no segundo dia nem no terceiro dia de janeiro quando o primeiro dia e de sol %.6f\n",p)

%alinea (d)

u = [1;0;0];
aux = u;

for i = 1:30
    u = T*u;
    aux = aux + u
end

noDiasSol = aux(1);
noDiasNuvens = aux(2);
noDiasChuva = aux(3);

% (e)



%parecido ao d

%(f)

u = [1;0;0];
aux2 = 0.1*u(1) + 0.3*u(2) + 0.5*u(3);

for i = 1:30
    u = T*u;
    aux2 = aux2 + 0.1*u(1) + 0.3*u(2) + 0.5*u(3);
end

noDiasDores = aux2;




