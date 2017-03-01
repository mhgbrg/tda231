clear;

data = load('hw5_p1b.mat');
X = data.X;
k = 2;
sig = .2;

y = kmeans_rbf_kernel(X, k, sig);
X1 = X(y == 1,:);
X2 = X(y == 2,:);

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), 'x');
scatter(X2(:,1), X2(:,2), '+');

saveas(fig, '../figures/problem11d.eps', 'epsc');