N = 1e5;
imin = 6;
imax = 20;
alfabeto = ['a':'z' 'A':'Z'];
for i= 1:1e3
    keys = generate_keys_unif(N,imin,imax,alfabeto);
    equal = length(unique(keys))

end

function [keys] = generate_keys_unif(N,imin,imax,alfabeto)
%generate N words with lenth between imin and imax...
%1º determinar o cumprimento

    comp = randi([imin,imax],N,1);

%2 escolher comp caracteres de forma aleatoria 
    keys = cell(N,1); %cell array porque há tamanhos diferentes
    %repetir
    %escolger 1 caracter <=> escolher posicao no array
    for i= 1:N
        pos = randi(length(alfabeto),1,comp(i));
        word = alfabeto(pos);
        keys{i} = word;
    end
end
