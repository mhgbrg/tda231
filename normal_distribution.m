hold on

mean_ = [1; 1];
cov_ = [0.1 -0.05; -0.05 0.2];

points = arrayfun(@(x) transpose(mvnrnd(mean_, cov_)), 1:10, 'UniformOutput', false);
celldisp(points)
% values = cellfun(@(p) f(p, 3), points, 'UniformOutput', false);

% insidePoints = points(f(points, 3) <= 0);
% outsidePoints = points(f(points, 3) > 0);
% 
% insidePoints
% outsidePoints

% for n = 1:10
%     p = points(n);
%     
%     if f(p, 3) <= 0
%         insidePoints = [insidePoints, p];
%     else
%         outsidePoints = [outsidePoints, p];
%     end
% end

% xs = cellfun(@(p) p(1), points);
% ys = cellfun(@(p) p(2), points);
% 
% limits = [min([xs ys]) max([xs ys])];

% ezplot(@(x,y) f([x;y], 1), limits);
% ezplot(@(x,y) f([x;y], 2), limits);
% ezplot(@(x,y) f([x;y], 3), limits);

% scatter(xs, ys);

function y = f(x, r)
    mean_ = [1; 1];
    cov_ = [0.1 -0.05; -0.05 0.2];

    y = (transpose(x - mean_) * inv(cov_) * (x - mean_)) ./ 2 - r;
end