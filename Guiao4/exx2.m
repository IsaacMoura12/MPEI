N = 1e5;
imin = 6;
imax = 20;
alfabeto = ['a':'z' 'A':'Z'];
hashcodes = zeros(1,N);
atribuicoes = zeros(1,N);

for k =1:N
    keys = generate_keys_unif(N,imin,imax,alfabeto);
    hash = string2hash(keys);
    hash = rem(hash,T) +1;
    hashcodes(k) = hash;
    atribuicoes(hash) = atribuicoes(hash) + 1;
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
        for k=1:size(str,2) 
            hash = mod(hash * 33 + str(:,k), 2^32-1); 
        end
    case 'sdbm'
        hash = zeros(size(str,1),1);
        for k=1:size(str,2) 
            hash = mod(hash * 65599 + str(:,k), 2^32-1);
        end
    otherwise
        error('string_hash:inputs','unknown type');
end
end