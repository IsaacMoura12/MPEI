

% ler as palavras do ficheiro:
fid = fopen("wordlist-preao-20201103.txt", "r");
dicionario = textscan(fid,"%s");
fclose(fid);
dicionarios=dicionario{1};

bloom = false(1,8000);


k = 3;
n = 8000;
B=iniciar(n);

for i = 1:1000
    B=addElem(B,dicionarios{i},k);
end

contador = 0;
for i = 1001:11000
    
    res=checkElement(B,dicionarios{i},k);
    if res
        contador = contador +1;
    end

end

media = contador/10000*100;


function B=iniciar(n)
B = false(1,n);
end

function B =addElem(B,key,k)
    n = length(B);

    for i =1:k
        key = [key num2str(i)];
        h = DJB31MA(key,127);
        h = mod(h,n)+1;
        B(h) = true;
    end

end




function res=checkElement(B,key,k)
n = length(B);
res = true;
    for i = 1:k
        key = [key num2str(i)];
        h = DJB31MA(key,127);
        h = mod(h,n)+1;
        if ~B(h)
            res = false;
            break;
        end
    end
end











% hash function:
% seed : recomendado 127
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