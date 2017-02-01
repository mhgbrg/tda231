function [mu, var] = musig(x)
%MUSIG Calculates the mean and variance given some data
    [n, p] = size(x);
    
    mu = 1/n * sum(x);
    
    var = 0;
    for m=1:n
        var = var + (x(m,:)-mu) * transpose(x(m,:)-mu);
    end
    var = 1/(n*p) * var * eye(p);
end
