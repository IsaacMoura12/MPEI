ufile = load('u.data');
ufilms = ufile(1:end,1:2);
users = unique(ufile(:,1));
dicFilms = readcell('films.txt', 'Delimiter', '\t');

Nu = length(users);
YourMoviesTable = cell(Nu, 1);

for i = 1:Nu
    x = find(ufilms(:,1) == users(i));
    YourMoviesTable{i} = [YourMoviesTable{i} ufilms(x,2)];
end


K = 100; 
MinHashValue = inf(Nu,K);


for i = 1:Nu
    conjunto = YourMoviesTable{i}; 
    for j = 1:length(conjunto)
        chave = char(conjunto(j));
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        MinHashValue(i,:) = min([MinHashValue(i,:); hash]);  % Valor minimo da hash para este título
    end
end




%save Usermovies YourMoviesTable



