%%%%%% 4 %%%%%%%%
%%%%%%% 4 (a) %%%
%%%%%%%%%%%%%%%%%
dias = 365;
n= 1;
prob = 0;
while prob <= 0.5
    n = n +1;
    a = randi(dias,n,N); %linhas,colunas
    aux = 0;
    for i = 1:N
        if length(unique(a(:,i)))<n %% verifica se a coluna tem algum numero repetido
            aux = aux +1;
        end
    end
    prob = aux/N;
end

%%%%%%%%
% 4 (b)%
%%%%%%%%

dias = 365;
n= 1;
prob = 0;
while prob <= 0.9
    n = n +1;
    a = randi(dias,n,N); %linhas,colunas
    aux = 0;
    for i = 1:N
        if length(unique(a(:,i)))<n %% verifica se a coluna tem algum numero repetido
            aux = aux +1;
        end
    end
    prob = aux/N;
end