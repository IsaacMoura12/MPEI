% Ex5

%a1

lado = 1/6;
N = 1e5;


n = 0;
possiveis = randi(6,2,N); % todos lancamentos

add = sum(possiveis,1); % matriz das somas
for i = 1:length(add)
    if add(i) == 9
        n = n+1;
    end
end

p5a = n/N;

% a2

%segundo valor e par

N = 1e5;
n = 1;
possiveis = randi(6,2,N); % todos lancamentos

for i = 1:length(possiveis)
    tmp = possiveis(2,i);
    if mod(tmp,2)==0
        n= n+1;
    end


end

p2 = n/N;

% a3
N = 1e5;


caso = 0;
n = 1;
possiveis = randi(6,2,N); % todos lancamentos


for i = 1:length(possiveis)
    
    if possiveis(2,i) == 5 || possiveis(1,i) ==5
        n = n+1;
    end

end
    p3 = n/N;

%a4

N = 1e5;


caso = 0;
n = 1;
possiveis = randi(6,2,N); % todos lancamentos


for i = 1:length(possiveis)
    
    if possiveis(2,i) ~= 1 && possiveis(1,i) ~= 1
        n = n+1;
    end

    

end
    p4 = n/N;