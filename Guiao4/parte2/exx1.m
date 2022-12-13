

fid = fopen('wordlist-preao-20201103.txt', 'r');
dic = textscan(fid,"%s");
fclose(fid);
dics = dic{1};

k= 3;
n = 8000;

B = iniciar(n);

for i = 1 :1000
    B = addElement(B,dics{i},k);
end

function B = iniciar(n)
    B = false(1,n);
end


function B = addElement(B,key,k)
    n = length(B);
    for i=1:k
        key = [key num2str(i)];
        h = DJB31MA(key,127);
        h = mod(h,n)+1;
        B(h) = true;
    end
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