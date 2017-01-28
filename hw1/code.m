sge([2 1; 3 7; 4 5])

% SGE Mean and variance estimator for spherical Gaussian distribution                               
%
% x     : Data matrix of size n x p where each row represents a 
%         p-dimensional data point e.g. 
%            x = [2 1;
%                 3 7;
%                 4 5 ] is a dataset having 3 samples each
%                 having two co-ordinates.
%
% mu    : Estimated mean of the dataset [mu_1 mu_2 ... mu_p] 
% sigma : Estimated standard deviation of the dataset (number)                 
function [mu, sigma] = sge(x)
    [n p] = size(x)
    mu = 1/n * sum(x)
    sigma = 1/(n*p) * sum(transpose(x((1:n),:)-mu) * (x((1:n),:)-mu))
end