ufile = load('u.data');
ufilms = ufile(1:end,1:3);
users = unique(ufile(:,1));
dicFilms = readcell('films.txt','Delimiter', '\t');
films = dicFilms(:,1);

Nu = length(users);
YourMoviesTable = cell(Nu, 1);

k= 100;
MinHashCat = inf(length(dicFilms),k);

Nc = length(dicFilms);

allcategories = strings(1,19);
Nallc = 19;
it = 1;
for i = 1:length(dicFilms)
    categorias = rmmissing(string(dicFilms(i,2:end)));
    for x = 1: length(categorias)
        categoria = categorias(x);
        if ~ismember(categoria,allcategories)
            allcategories(it) = categoria;
            it = it +1;
        end
    end
end

MinHashallCat = inf(length(allcategories),k);

for i = 1:Nallc
    conjunto = allcategories(i); 
    for j = 1:length(conjunto)
        chave = char(conjunto(j));
        hash = zeros(1,k);
        for kk = 1:k
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashallCat(i,:) = min([MinHashallCat(i,:); hash]);  % Valor minimo da hash para este título
    end
end

MinHashCat = inf(Nc,k);

for i = 1:Nc
    conjunto = rmmissing(string(dicFilms(i,2:end)));
    pos = [];
    for j = 1:length(conjunto)
        categoria = char(conjunto(j));
        pos = [pos find(allcategories == categoria)]; %pos das categorias
    end 
    allkeys = [];
    for kk = 1:length(pos)
        hash = MinHashallCat(pos(kk),:);
        MinHashCat(i,:) = min([MinHashCat(i,:); hash]);  % Valor minimo da hash para este título
    end  
end




tic
J=zeros(Nc);
h=waitbar(0, 'Calculating');
n2 =2;
for n1 = 1:Nc
    waitbar(n1/Nc, h);
    if n2 ~= n1
        J(n1,n2) = sum(MinHashCat(n1,:) ~= MinHashCat(n2,:))/k;
    end
end
fprintf('Tempo de calculo das distancias dadas por MinHash= %f\n',toc);
delete (h)


tic
threshold = 0.8;
SimilarMovies = cell(1,3);
k = 1;
for n1 = 1:Nc
    if J(n1,n2) < threshold
        SimilarMovies(k,:) = {char(films(n1)) char(films(n2)) J(n1,n2)};
        k = k+1;
    end
end
fprintf('Tempo de caluclo dos filmes mais similares= %f\n', toc);
fprintf('No de pares mais similares= %d\n', size(SimilarMovies, 1));






