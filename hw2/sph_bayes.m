function [ P1, P2, Ytest ] = sph_bayes(Xtest, X, y)
%SPH_BAYES Computes the probability of a test point x
%   Computes the probability of a test point x
%   from class p1 and p2

    [mu1, sig1] = muvar(X(y == 1,:));
    [mu2, sig2] = muvar(X(y == -1,:));

    L1 = mvnpdf(Xtest, mu1, sig1);
    L2 = mvnpdf(Xtest, mu2, sig2);
    
    P1 = exp(log(L1) - log(L1 + L2));
    P2 = exp(log(L2) - log(L1 + L2));
    
    
    
    if P1 > P2
        Ytest = 1;
    else
        Ytest = -1;
    end

end