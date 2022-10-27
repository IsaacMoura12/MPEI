%9
e = 1e5;
a  = randn(1,e)*2 + 14;

proba = sum(a >= 12 & a <= 16);
proba = (proba/e);


%9b

probb  = sum(a >= 10 & a <= 18);
probb = probb / e;

%9c
probc = sum(a >= 10);
probc = probc/e;
