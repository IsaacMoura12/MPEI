tamanhos = [5e5, 1e6, 2e6];

load keys.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%string2hash%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tamanhos = [5e5, 1e6, 2e6];
for j = 1 : length(tamanhos)
    cont = 0;
    vectorTableS = zeros(1, tamanhos(j));
    hashCodes = zeros(1, length(keys));
    tic
    for i = 1 : length(keys)
        hashCodes(i) = mod(string2hash(keys{i}), length(vectorTableS));
        if vectorTableS(hashCodes(i)) > 0 
            cont = cont + 1;
        end

        vectorTableS(hashCodes(i)) = vectorTableS(hashCodes(i)) + 1;
    end
    fprintf('Chaining HashTable %d djb2\n', tamanhos(j));
    fprintf('Number of Collisions: %d\n', cont);
    fprintf('Number of atributions: %d\n', max(vectorTableS));
    fprintf('Running time: %f seconds\n', toc);
    h = hashCodes/length(vectorTableS);
    histogram(hashCodes, 100)
    fprintf('Momento 2: medio  - %f teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f teorico - %f\n\n', mean(h.^10),1/(10+1));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%string2hash%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DJB31MA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1 : length(tamanhos)
    cont = 0;
    vectorTableS = zeros(1, tamanhos(j));
    hashCodes = zeros(1, length(keys));
    tic
    for i = 1 : length(keys)
        hashCodes(i) = mod(DJB31MA(keys{i}, 127), length(vectorTableS));
        if vectorTableS(hashCodes(i)) > 0 
            cont = cont + 1;
        end

        vectorTableS(hashCodes(i)) = vectorTableS(hashCodes(i)) + 1;
    end
    fprintf('Chaining HashTable %d DJB21MA\n', tamanhos(j));
    fprintf('Number of Collisions: %d\n', cont);
    fprintf('Number of atributions: %d\n', max(vectorTableS));
    fprintf('Running time: %f seconds\n', toc);
    h = hashCodes/length(vectorTableS);
    %histogram(hashCodes, 100)
    fprintf('Momento 2: medio  - %f teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f teorico - %f\n\n', mean(h.^10),1/(10+1));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DJB31MA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%hashstring%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j = 1 : length(tamanhos)
    cont = 0;
    vectorTableS = zeros(1, tamanhos(j));
    hashCodes = zeros(1, length(keys));
    tic
    for i = 1 : length(keys)
        hashCodes(i) = mod(hashstring(keys{i}, length(vectorTableS)), length(vectorTableS));
        if vectorTableS(hashCodes(i)) > 0 
            cont = cont + 1;
        end

        vectorTableS(hashCodes(i)) = vectorTableS(hashCodes(i)) + 1;
    end
    fprintf('Chaining HashTable %d hashstring\n', tamanhos(j));
    fprintf('Number of Collisions: %d\n', cont);
    fprintf('Number of atributions: %d\n', max(vectorTableS));
    fprintf('Running time: %f seconds\n', toc);
    h = hashCodes/length(vectorTableS);
    %histogram(hashCodes, 100)
    fprintf('Momento 2: medio  - %f teorico - %f\n', mean(h.^2),1/(2+1));
    fprintf('Momento 5: medio  - %f teorico - %f\n', mean(h.^5),1/(5+1));
    fprintf('Momento 10: medio - %f teorico - %f\n\n', mean(h.^10),1/(10+1));
end


function hash=string2hash(str,type)
% This function generates a hash value from a text string
%
% hash=string2hash(str,type);
%
% inputs,
%   str : The text string, or array with text strings.
% outputs,
%   hash : The hash value, integer value between 0 and 2^32-1
%   type : Type of has 'djb2' (default) or 'sdbm'
%
% From c-code on : http://www.cse.yorku.ca/~oz/hash.html 
%
% djb2
%  this algorithm was first reported by dan bernstein many years ago 
%  in comp.lang.c
%
% sdbm
%  this algorithm was created for sdbm (a public-domain reimplementation of
%  ndbm) database library. it was found to do well in scrambling bits, 
%  causing better distribution of the keys and fewer splits. it also happens
%  to be a good general hashing function with good distribution.
%
% example,
%
%  hash=string2hash('hello world');
%  disp(hash);
%
% Function is written by D.Kroon University of Twente (June 2010)


% From string to double array
str=double(str);
if(nargin<2), type='djb2'; end
switch(type)
    case 'djb2'
        hash = 5381*ones(size(str,1),1); 
        for i=1:size(str,2)
            hash = mod(hash * 33 + str(:,i), 2^32-1); 
        end
    case 'sdbm'
        hash = zeros(size(str,1),1);
        for i=1:size(str,2)
            hash = mod(hash * 65599 + str(:,i), 2^32-1);
        end
    otherwise
        error('string_hash:inputs','unknown type');
end
end




function code =  hashstring(chave, tablesize)
%  baseado em hashstring the Programação II

len=length(chave);
chave= double(chave);
hash=0;

for i=1:len  

    c = chave(i)+33;
    %hash = ((hash<<3) + (hash>>28) + c);
    hash= (bitshift(hash,3)+ bitshift(hash,-28))+c;
end
code=mod(hash,tablesize);
end

function h= DJB31MA( chave, seed)
% implementação da hash function DJB31MA com base no algoritmo obtido
% no resumo 2014(PJF) que está em C
%
%  chave    array de caracteres com a chave
%  seed     semente que permite obter vários hash codes para a mesma chave
%
%  h        hashcode devolvido
len= length(chave);
chave= double(chave);
h= seed;
for i=1:len
    h = mod(31 * h + chave(i), 2^32 -1) ;
end
end

