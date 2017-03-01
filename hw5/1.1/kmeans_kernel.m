function [ y ] = kmeans_kernel(X, k, kernel)
%KMEANS_RANDOM Summary of this function goes here
%   Detailed explanation goes here
N = size(X, 1);

y = randi(k,N,1);
y_new = zeros(N, 1);

while ~isequal(y, y_new)

    y_new = y;
    for n=1:N
        n
        
        x = X(n,:);
        distances = zeros(k, 1);
        for i=1:k
            Xk = X(y == k,:);
            dist = kernel_distance(x, Xk, kernel);
            distances(i) = dist;
        end
        
        [~, index] = min(distances);
        y_new(n) = index;
       disp('klar'); 
    end
    
end

end