clear all;
clc

probs = [   1.4620000e-01
   1.0400000e-02
   3.8800000e-02
   4.9900000e-02
   1.2570000e-01
   1.0200000e-02
   1.3000000e-02
   1.2800000e-02
   6.1800000e-02
   4.0000000e-03
   2.0000000e-04
   2.7800000e-02
   4.7400000e-02
   5.0500000e-02
   1.0730000e-01
   2.5200000e-02
   1.2000000e-02
   6.5300000e-02
   7.8100000e-02
   4.3400000e-02
   4.6300000e-02
   1.6700000e-02
   1.0000000e-04
   2.1000000e-03
   1.0000000e-04
   4.7000000e-03]

N = 1e5;
alpha = ['a':'z'];
tic
keys = generateKeys(N, 6, 20, alpha, probs);
fprintf('1b) No. Keys: %d\n', length(keys));
fprintf('    No. unique: %d\n', length(unique(keys)));
fprintf('    Running time: %f seconds\n', toc);

save 'keysb' 'keysb'

function keys = generateKeys(N, imin, imax, alpha, probs)
    keys = {};
    n = 0;
    Nalpha = length(alpha);
    if nargin == 5
        cs = cumsum(probs);
    end
    
    while n < N
        tam = randi([imin imax]);
        if nargin == 4
            aux = randi(Nalpha, 1, tam);
        else
            aux = zeros(1, tam);
            rn = rand(1, tam);
            for i = 1 : tam
                aux(i) = 1 + sum(rn(i) > cs);
            end
        end
        
        key = alpha(aux);
        n = n+1;
        keys{n} = key;
    end
end