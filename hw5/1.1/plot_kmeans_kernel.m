clear;

data = load('hw5_p1b.mat');
X = data.X;
k = 2;
sig = .2;

rbf = @(x1, x2) exp(-norm(x1 - x2)^2 / (2 * sig^2));

Y = kmeans_kernel(X, k, rbf);

y = Y{end};

X1 = X(y == 1,:);
X2 = X(y == 2,:);

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), 'x');
scatter(X2(:,1), X2(:,2), '+');

saveas(fig, '../figures/problem11d.eps', 'epsc');