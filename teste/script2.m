load script1;


user = 0;
option = 0;

menu(user, option,MinHashSig, MinHashValue, Nu, dicFilms, YourMoviesTable,MinHashallCat,MinHashCat);

function menu(user,option, MinHashSig, MinHashValue, Nu, dicFilms, YourMoviesTable,MinHashallCat,MinHashCat)
    while(option ~=5)
        clc
        if(user == 0)
            user = str2num(input(['Insert User ID (1 to ' num2str(Nu) '): '], 's'));
        elseif (user < 1 || user > Nu)
            fprintf('User Id not valid. ');
            clc;
            user = 0;
        else

            while(option <5)
                fprintf('\nUser ID: %d Menu:', user)
                fprintf('\n1 - Your movies\n2 - Suggestion of movies based on other users\n3 - Suggestion of movies based on already evaluated movies\n4 - Movies feedback based on popularity\n5 - Exit\n')
    
                option = str2num(input('','s'));

                if isempty(option)
                    continue;
                end

                switch option
                    case 1
                        yourMovies(user, YourMoviesTable, dicFilms)
                    case 2
                        SuggestionsOtherUsers(Nu,MinHashValue,user,YourMoviesTable,dicFilms)
                    case 3
                        SuggestionsCategories(Nu,MinHashValue,user,YourMoviesTable,dicFilms,MinHashallCat,MinHashCat)
                    case 4
                        searchTitle(dicFilms, MinHashSig)
                    case 5
                        break;
                    otherwise
                        fprintf('Choose a number more than 1 and less than 5');
                end
            end
        end
    end
    end

    
function yourMovies(user,YourMoviesTable, dicFilms)
    fprintf('\nYour Movies:');
    keyMovie = YourMoviesTable{user};
    for i = 1:length(keyMovie)
        linha = keyMovie(i);
        fprintf(char(dicFilms(linha,1)))
        fprintf('\n')
    end
    fprintf('\nPress enter to continue');
    pause; clc;
end

function SuggestionsOtherUsers(Nu,MinHashValue,user,YourMoviesTable,dicFilms)
    k = 100;
    Jdistances = ones(1,Nu);
    myMovies = YourMoviesTable{user};

    for n = 1:Nu
        if n~= user
            Jdistances(n) = sum(MinHashValue(n,:) ~= MinHashValue(user,:))/k; % Distancia je Jaccard para todos os pares possiveis do
            %respetivo user
        end
    end
    
    [val,SimilarId] = min(Jdistances);
   
    
    suggestions = [];
    moviessmilarid = YourMoviesTable{SimilarId};
    for n = 1: length(moviessmilarid)
        if ~ismember(moviessmilarid(n), myMovies)
            suggestions = [suggestions string(dicFilms(moviessmilarid(n),1))];
        end
    end

    if isempty(suggestions)
        fprintf('Don t exists any suggestion')
    else
        fprintf('Film Suggestions of the user most similar:\n')
        for i = 1:length(suggestions)
            fprintf(suggestions(i) + '\n');
        end
    end
    
    Jdistances(:,SimilarId) = [];
    [val,SimilarId2] = min(Jdistances);
    suggestions = [];
    moviessmilarid = YourMoviesTable{SimilarId2};
    for n = 1: length(moviessmilarid)
        if(~ismember(moviessmilarid(n), myMovies))
            suggestions = [suggestions string(dicFilms(moviessmilarid(n),1))];
        end
    end

    if isempty(suggestions)
        fprintf('Don t exists any suggestion')
    else
        fprintf('Film Suggestions of the seconds user most similar:\n:\n')
        for i = 1:length(suggestions)
            fprintf(suggestions(i) + '\n');
        end
    end
    fprintf('\nPress enter to continue');
    pause; clc;
end

function SuggestionsCategories(Nu,MinHashValue,user,YourMoviesTable,dicFilms,MinHashallCat,MinHashCat)
   
    allmovies = YourMoviesTable{user};
    Nusermovies = length(allmovies);
    
    Nc = length(dicFilms);
    J=zeros(Nc); 
    k=100;

    h=waitbar(0, 'Calculating');
    for i = 1:Nusermovies
        waitbar(i/Nusermovies, h);
        n1 = allmovies(i);
        for n2 = 1:Nc
            if n2 ~= n1 && ~ismember(n2,allmovies)
                J(n1,n2) = sum(MinHashCat(n1,:) ~= MinHashCat(n2,:))/k;
            end
        end
    end
    
    films = dicFilms(:,1);
    threshold = 0.8;
    SimilarMovies = cell(1,3);
    k = 1;
    
    h=waitbar(0, 'Calculating');
    for i = 1:Nusermovies
        waitbar(i/Nusermovies, h);
        n1 = allmovies(i);
        for n2 = 1:Nc
            if J(n1,n2) < threshold && ~ismember(n2,allmovies)
                SimilarMovies(k,:) = {n1 n2 J(n1,n2)};
                k = k+1;
            end
        end
    end

    
    allsimilarMovies = cell2mat(SimilarMovies(:,2));
    similar2Movies = mode(allsimilarMovies,'all');

    
    fprintf('\nTwo movies most common to you: ');
    fprintf('%s, ',char(films(similar2Movies)));
    x = find(allsimilarMovies == similar2Movies);

    allsimilarMovies(x) = [];
    
    similar2Movies = mode(allsimilarMovies,'all');
    fprintf(char(films(similar2Movies)));

    fprintf('\nPress enter to continue');
    pause; clc;
end

function searchTitle(dicFilms, MinHashSig)
    str = lower(input('\nWrite a String: ', 's'));
    shingle_size = 3;  % igual numero de shingles
    K = size(MinHashSig, 2);  % manter K
    threshold = 0.99;  % Definir um threshold que nos ?? dado

    % Estrutura de cell array para os shingles
    shinglesAns = {};
    for i = 1:length(str) - shingle_size+1
        shingle = str(i:i+shingle_size-1);
        shinglesAns{i} = shingle;
    end

    % MinHash para os shingles
    MinHashString = inf(1,K);
    for j = 1:length(shinglesAns)
        chave = char(shinglesAns{j});
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave, 127);
        end
        MinHashString(1,:) = min([MinHashString(1,:); hash]);
    end

    % Dist??ncia de Jaccard
    distJ = ones(1, size(dicFilms,1));  % guarda dist??ncias
    h = waitbar(0,'Calculating');
    for i=1:size(dicFilms, 1)  % cada hashcode da string
        waitbar(i/K, h);
        distJ(i) = sum(MinHashSig(i,:) ~= MinHashString)/K;
    end
    delete(h);
    
    flag = false;  % flag para ver se foi encontrado filme
    for i = 1:5
        [val, pos] = min(distJ);  % Calcular o valor mais proximo(minimo)
        if (val <= threshold)  % Se o valor nao pertence, exclui
            flag = true;
            fprintf('%s\n', dicFilms{pos, 1});
        end
        distJ(pos) = 1;  % Retirar esse filme dando uma distancia igual a 1
    end
    
    if (~flag)
        fprintf('No movies found.\n');
    end
    fprintf('\nPress enter to continue');
    pause;clc;  % Manter info
end

