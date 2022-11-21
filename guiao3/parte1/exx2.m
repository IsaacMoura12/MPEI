%{
    A   B   C
A   
B
C

%}

T = [1/3 1/3 1/3
    1/4 0.55 1/5
    0 0.5 0.5]';

fprintf("Confirmamos que a matriz é estocástica porque a " + ...
    "soma de cada coluna é 1 e todas as entradas são não negativas," + ...
    "como podemos ver no resultado a seguir que corresponde a soma de cada coluna :\n");
disp(sum(T));

%b)
% vetor relativo aos estado x é a percentagem de alunos
% relativa ao total que é suposto
% estar por grupo
x0 = [4/6
    1/6
    1/6];

%c)

% x^(k+1) = Tx^(k)

x1 = T*x0;
x30 = x1;

for i= 1:29
    x30 = T*x30;
end

fprintf("Resultado do 2 (c) é %d para o grupo A, %d para o grupo B e %d para o grupo C\n", round(x30(1)*90),round(x30(2)*90),round(x30(3)*90))



%d)
x0d = [1/3
    1/3
    1/3];

x30d = x0d *T;

for i = 1:29
    x30d = x30d*T
end

fprintf("Resultado do 2 (d) é %d para o grupo A, %d para o grupo B e %d para o grupo C\n", round(x30d(1)*90),round(x30d(2)*90),round(x30d(3)*90))




