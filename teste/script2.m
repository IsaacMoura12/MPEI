load script1;


user = 0;
option = 0;

menu(user, option,MinHashSig, MinHashValue, Nu, dicFilms, YourMoviesTable);

function menu(user,option, MinHashSig, MinHashValue, Nu, dicFilms, YourMoviesTable)
    while(user == 0 ||  user < 1 || user > Nu)
        clc
        if(user == 0)
            user = str2num(input(['Insert User ID (1 to ' num2str(Nu) '): '], 's'));
        elseif (user < 1 || user > Nu)
            fprintf('User Id not valid. ');
            clc;
            user = 0;
        else

            while(option <5)
                fpritnf('\nUser ID: %d Menu:', user)
                fprintf('\n1 - Your movies\n2 - Suggestion of movies based on other users\n3 - Suggestion of movies based on already evaluated movies\n4 - Movies feedback based on popularity\n5 - Exit')
    
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
                        SuggestionsCategories(Nu,MinHashValue,user,YourMoviesTable,dicFilms)
                    otherwise
                        break;
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
        fprintf(dicFilms(linha,1))
    end
    clc;
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
    clc;
end

function SuggestionsCategories(Nu,MinHashValue,user,YourMoviesTable,dicFilms)
    cattegories
    for i = 1:length(YourMoviesTable(user))
        
    end


    clc;
end

