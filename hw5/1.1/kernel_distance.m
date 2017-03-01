function [ distance ] = kernel_distance(xn, Xk, kernel)
%RBF_DISTANCE Summary of this function goes here
%   Detailed explanation goes here

N = size(Xk, 1);

term1 = kernel(xn, xn);

term2 = 0;
for m=1:N
    term2 = term2 + kernel(xn, Xk(m,:));
end
term2 = 2/N * term2;

term3 = 0;
for m=1:N
    for l=1:N
        term3 = term3 + kernel(Xk(m,:), Xk(l,:));
    end
end
term3 = 1/N^2 * term3;

distance = term1 - term2 + term3;

end

