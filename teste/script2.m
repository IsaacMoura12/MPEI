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
    pause; clc;
end

function SuggestionsOtherUsers(Nu,MinHashValue,user,YourMoviesTable,dicFilms)
    k = 100;
    Jdistances = ones(1,Nu);

    for n = 1:Nu
        if n~= user
            Jdistances(n) = sum(MinHashValue(n,:) ~= MinHashValue(user,:))/k; % Distancia je Jaccard para todos os pares possiveis do
            %respetivo user
        end
    end

    [val,SimilarId] = min(Jdistances);

    suggestions = [];
    for n = 1: length(YourMoviesTable{SimilarId})
        if(~ismember(YourMoviesTable{SimilarId}(n), YourMoviesTable{user}))
            suggestions = [suggestions string(dicFilms(n,1))];
        end
    end

    if isempty(suggestions)
        fprintf('Don t exists any suggestion')
    else
        fprintf('Film Suggestions:\n')
        for i = 1:length(suggestions)
            fprintf(suggestions(i) + '\n');
        end
    end
    pause; clc;
end

function SuggestionsCategories(Nu,MinHashValue,user,YourMoviesTable,dicFilms,MinHashallCat,MinHashCat)
   
    allmovies = YourMoviesTable{user};
    
    Nc = length(dicFilms);
    J=zeros(Nc);
    k=100;

    h=waitbar(0, 'Calculating');
    for i = 1:length(allmovies)
        waitbar(i/length(allmovies), h);
        n2 = allmovies(i);
        for n1 = 1:Nc
            if n2 ~= n1
                J(n1,n2) = sum(MinHashCat(n1,:) ~= MinHashCat(n2,:))/k;
            end
        end
    end
    
    films = dicFilms(:,1);
    threshold = 0.8;
    SimilarMovies = cell(1,3);
    k = 1;
    for n1 = 1:Nc
        if J(n1,n2) < threshold
            SimilarMovies(k,:) = {char(films(n1)) char(films(n2)) J(n1,n2)};
            k = k+1;
        end
    end


    clc;
end

