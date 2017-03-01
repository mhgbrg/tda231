function [ y, after2 ] = kmeans_random( X, k)
%KMEANS_RANDOM Summary of this function goes here
%   Detailed explanation goes here
N = size(X, 1);
y = zeros(N, 1);

mu = zeros(k, 0);
mu_new = datasample(X, k, 'Replace', false);

j = 1;
while ~isequal(mu, mu_new)
    mu = mu_new;
    for n=1:N
        x = X(n,:);
        distances = zeros(k, 1);
        for i=1:k
            muk = mu(i, :);
            dist = norm(x - muk);
            distances(i) = dist;
        end
        [~, index] = min(distances);
        y(n) = index;
    end

    for i=1:k
        xk = X(y == i,:);
        mu_new(i,:) = mean(xk);
    end
    
    if j == 2
        after2 = y;
    end
    j = j + 1;
    
end

end