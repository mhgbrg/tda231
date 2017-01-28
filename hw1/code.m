clear;
fig = figure;
hold on;

data = load('dataset1.mat');
x = data.x;

[mu, sigma] = sge(x);

c1 = circle(mu, 1*sigma);
c2 = circle(mu, 2*sigma);
c3 = circle(mu, 3*sigma);
set(c1, 'Color', 'red');
set(c2, 'Color', 'magenta');
set(c3, 'Color', 'cyan');

scatter(x(:,1), x(:,2));

outside1 = 0;
outside2 = 0;
outside3 = 0;

[n,~] = size(x);
for i=1:n
   p = x(i,:);
   if circlef(p, mu, 3*sigma) > 0
       outside1 = outside1 + 1;
       outside2 = outside2 + 1;
       outside3 = outside3 + 1;
   elseif circlef(p, mu, 2*sigma) > 0
       outside1 = outside1 + 1;
       outside2 = outside2 + 1;
   elseif circlef(p, mu, 1*sigma) > 0
       outside1 = outside1 + 1;
   end
end

fraction1 = outside1 / n;
fraction2 = outside2 / n;
fraction3 = outside3 / n;

title('dataset1');
legend(num2str(fraction1), num2str(fraction2), num2str(fraction3))

saveas(fig, 'plot.eps', 'epsc')

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
    [n p] = size(x);
    mu = 1/n * sum(x);
    s = zeros(n,1);
    for m=1:n
        s(m) = (x(m,:)-mu) * transpose(x(m,:)-mu);
    end
    sigma = sqrt(1/(n*p) * sum(s));
end

% Function for a circle with radius r and center at coordinate c.
function f = circlef(p,c,r)
    x = p(1);
    y = p(2);
    cx = c(1);
    cy = c(2);
    f = (x - cx)^2 + (y - cy)^2 - r^2;
end

% Plots a circle with radius r and center at coordinate c.
function plot = circle(c,r)
    cx = c(1);
    cy = c(2);
    plot = ezplot(@(x,y) (x - cx)^2 + (y - cy)^2 - r^2, [cx-1.2*r cx+1.2*r cy-1.2*r cy+1.2*r]);
end
