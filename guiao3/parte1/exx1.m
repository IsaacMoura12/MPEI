%%%%%%%%%%%%%%%%
%%%%Exx 1 (a)%%%
%%%%%%%%%%%%%%%%

m_tprob = [0.7 0.8
           0.3 0.2];
%o que corresponde cada valor das linhas e colunas da matriz
            % NFaltar | Faltar 
%N faltar
%Faltar
m_t0 = [1;0];

resulta = (m_tprob*m_t0);
resulta = m_tprob * resulta;
fprintf("Ex 3.1(a) P= %.6f\n", resulta(1));


%%%%%%%%%%%%%%%%%%
%%%%% 1 (b) %%%%%%


m_t0 = [0;1];

resultb = (m_tprob*m_t0);
resultb = m_tprob * resultb;
fprintf("Ex 3.1(b) P= %.6f\n", resultb(1));

%%%%%%%%%%%%%%%%%%
%%%%% 1 (c) %%%%%%

m_t0 = [1;0];

mtx = (m_tprob*m_t0);

for i = 1 :29
    mtx = m_tprob *mtx ;
end

fprintf("Ex 3.1(c) P= %.6f\n", mtx(1))


%%%%%%%%%%%%%%%%%%
%%%%% 1 (d) %%%%%%

m_t0 = [0.85;0.15];
mtx = m_t0;
grafico = zeros(1,30);

grafico(1) = m_t0(2);

for i = 2 :30
    mtx = m_tprob *mtx ;
    grafico(i) = mtx(2);
end

plot(grafico, '-o')




