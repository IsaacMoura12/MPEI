%%%% Ex7 %%%%%


pA = 0.2;
pB = 0.3;
pC = 0.5;
pE_dado_A = 0.01;
pE_dado_B = 0.05;
pE_dado_C = 0.001;

pE = pE_dado_A *pA + pE_dado_B *pB + pE_dado_C * pC;


%%% 7a    probabilidade do erro ser do Carlos

pC_dado_E = pE_dado_C * pC/pE;

%%%% 7b   de quem e mais provavel ser o programa com erro

pC_dado_E = pE_dado_C * pC/pE;
pB_dado_E = pE_dado_B * pB/pE;
pA_dado_E = pE_dado_A * pA/pE;


%%% maior valor é do Bruno