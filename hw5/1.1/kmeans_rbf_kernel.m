function y = kmeans_rbf_kernel(X, k, sig)
%KMEANS_RANDOM Summary of this function goes here
%   Detailed explanation goes here
N = size(X, 1);
rbf = @(x1, x2) exp(-norm(x1 - x2)^2 / (2 * sig^2));

y = zeros(N, 1);
y_new = randi(k,N,1);

while ~isequal(y, y_new)
    
    y = y_new;
    
    term3 = zeros(k, 1);
    for c=1:k
        Xk = X(y == c,:);
        Nk = size(Xk, 1);
        for m=1:Nk
            for l=1:Nk
                term3(c) = term3(c) + rbf(Xk(m,:), Xk(l,:));
            end
        end
        term3(c) = term3(c) / Nk^2;
    end

    for n=1:N

        xn = X(n,:);
        distances = zeros(k, 1);
        for c=1:k
            Xk = X(y == c,:);
            Nk = size(Xk, 1);
            
            term2 = 0;
            for m=1:Nk
                term2 = term2 + rbf(xn, Xk(m,:));
            end
            term2 = 2/Nk * term2;
            
            dist = rbf(xn, xn) - term2 + term3(c);
            distances(c) = dist;
        end
        
        [~, index] = min(distances);
        y_new(n) = index;
    end
    
end

end