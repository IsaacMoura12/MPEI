%a)

%{
    A   B   C   D   E   F
A
B
C
D
E
F
%}

H = [0 0 0 0 1/3 0
    1 0 0 0 1/3 0
    0 0.5 0 1 0 0
    0 0 1 0 0 0 
    0 0.5 0 0 0 0
    0 0 0 0 1/3 0];


%fiz a transposta para ser mais facil de calcular o pagerank de cada pagina
s = sum(H');

fprintf("Exx7(a)R: As paginas com maior page rank são as paginas b e c, respetivamente com os valos %.3f %.3f\n", s(2),s(3));

%b)

fprintf("\n Exx 7 (b) R: A spider trap é CD e o dead end é F")

%c)
Hc = [0 0 0 0 1/3 1/6
      1 0 0 0 1/3 1/6
      0 0.5 0 1 0 1/6
      0 0 1 0 0 1/6 
      0 0.5 0 0 0 1/6
      0 0 0 0 1/3 1/6];

% rk+1(Pj) = rk(Pi)/di
% rk(Pi)/di este valor é dado pela linha da pagina pretendida da matriz H 

%r0(Pi)= 1/n sendo o numero de paginas

r0= [1/6
    1/6
    1/6
    1/6
    1/6
    1/6];

fprintf("\n\nExx 7(c) r: O pagrank das paginas A B C D E F respetivamemte:")

H10 = Hc*r0;
for i = 1:9
    H10 = Hc*H10;
end
H10

%d)
Hd = Hc*0.8 + (1/6*ones(6))*0.2;

Hd10 = Hd*r0;
for i = 1:9
    Hd10 = Hd*Hd10;
end

fprintf("Exx 7(d) r: O pagrank das paginas A B C D E F respetivamemte:")
Hd10

%e)

n= 0;
max_dif= 1; % máximo valor para o módulo da diferença de pageRanks
while max_dif > 1e-4
    He = Hd*r0;
    max_dif = max(abs(He - r0)); 
    r0 = He;
    n = n +1;
end


fprintf("Exx 7(e) R: No minimo são precisas %d iterações para que nenhum valor muda mais do que 1e−4 em 2 iteraçoes consecutivas",n)



