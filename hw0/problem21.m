hold on

mean_ = [1; 1];
cov_ = [0.1 -0.05; -0.05 0.2];

points = arrayfun(@(x) transpose(mvnrnd(mean_, cov_)), 1:1000, 'UniformOutput', false);
values = cell2mat(cellfun(@(p) f(p, 3), points, 'UniformOutput', false));

insidePoints = points(find(values <= 0));
outsidePoints = points(find(values > 0));

ixs = cellfun(@(p) p(1), insidePoints);
iys = cellfun(@(p) p(2), insidePoints);

oxs = cellfun(@(p) p(1), outsidePoints);
oys = cellfun(@(p) p(2), outsidePoints);
 
limits = [min([oxs oys]) max([oxs oys])];

r1 = ezplot(@(x,y) f([x;y], 1), limits);
r2 = ezplot(@(x,y) f([x;y], 2), limits);
r3 = ezplot(@(x,y) f([x;y], 3), limits);

set(r1, 'Color', 'red');
set(r2, 'Color', 'magenta');
set(r3, 'Color', 'cyan');

scatter(ixs, iys, 40, 'blue');
scatter(oxs, oys, 40, 'black');

[~, outsidePointCount] = size(outsidePoints);

caption = sprintf('The number of points outside r = 3 is %i', outsidePointCount);
title(caption, 'FontSize', 14);

hold off

legend('r = 1','r = 2', 'r = 3')

function y = f(x, r)
    mean_ = [1; 1];
    cov_ = [0.1 -0.05; -0.05 0.2];
    y = (transpose(x - mean_) * inv(cov_) * (x - mean_)) ./ 2 - r;
end