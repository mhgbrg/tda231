mean_ = [1; 1];
cov_ = [0.1 -0.05; -0.05 0.2];

points = arrayfun(@(x) mvnrnd(mean_, cov_), 1:1000, 'UniformOutput', false);

xs = cellfun(@(p) p(1), points);
ys = cellfun(@(p) p(2), points);

scatter(xs, ys)

fplot(@(x) f(x, 1))

function y = f(x, r)
    mean_ = [1; 1];
    cov_ = [0.1 -0.05; -0.05 0.2];

    y = (transpose(x - mean_) * inv(cov_) * (x - mean_)) / 2 - r;
end