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

save Usermovies YourMoviesTable



%% Calcula a distancia de Jaccard entre todos os pares pela definicao.
J = zeros(Nu, Nu); % array para guardar distancias
h = waitbar(0,'Calculating');

for n1= 1:Nu
    waitbar(n1/Nu,h);
    for n2= n1+1:Nu
        A = cell2mat(set{n1});
        B = cell2mat(set{n1});
        C = intersect(A,B);
        D = union(A,B);
    end
end
delete (h)

%% Com base na distancia, determina pares com
%% distancia inferior a um limiar predefinido
threshold = 0.4 % limiar de decisao
% Array para guardar pares similares (user1, user2, distancia)
SimilarUsers= zeros(1,3);
k= 1;
for n1= 1:Nu
    for n2= n1+1:Nu
        if % ......
            SimilarUsers(k,:)= [users(n1) users(n2) J(n1,n2)]
            k= k+1;
        end
    end
end