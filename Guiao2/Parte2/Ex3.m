% Ex3 %


% 3a

x = [0 1 2 3 4];

px = [];

N= 1e5; %nu´mero de experieˆncias
p = 0.5; %probabilidade de cara
k = 0; %nu´mero de caras
n = 4; %nu´mero de lanc¸amentos
while k <5
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao= sum(sucessos)/N;

px(k+1) = probSimulacao;

k= k+1;

end

fx = cumsum(px);


figure(2)
stairs([0 x 5],[0 fx 1]);


%%%%%%%% 3(b)%%%%%%%
%%%%%%%%%%%%%%%%%%%%


media = sum(x.^px);
aux = (x - media).^ 2;
variancia = sum (aux .^ px);
dp = sqrt(variancia);

%%%%%% 3 (d) %%%%%
%%%%%%%%%%%%%%%%%%


%prob de sair 0
p = 0.5;
n = 4;
f3 = zeros(1,5);
k =0;
f3(1) = nchoosek(n,k)*p^k*(1-p)^(n-k);
for k = 1:4
    f3(k+1) = nchoosek(n,k)*p^k*(1-p)^(n-k) + f3(k) ;
end


%%%%%%%%%%%%%%
%%%%%% 3 (e)%%
%%%%%%%%%%%%%%
media = sum(x.*f3);
aux = (x-media).^2;
variancia = sum(aux.*f3);
fprintf("exx 3 (e) media: %f\n variancia: %f\n", media, variancia);



%%%%%%%%%%%%%%
%%%%%% 3 (f)%%
%%%%%%%%%%%%%%

%i)
fprintf("Prob exx 3 (f) i) %f\n", 1 -f3(2));

%ii)
fprintf("Prob exx 3 (f) ii) %f\n", f3(2));

%iii)
fprintf("Prob exx 3 (f) iii) %f\n", (f3(4) - f3(1)));