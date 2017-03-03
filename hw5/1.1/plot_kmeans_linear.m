clear;

data = load('hw5_p1a.mat');
X = data.X;
K = 2;

Y = kmeans_linear(X, K);

y_2 = Y{2};
y_final = Y{end};
X_diff = X(y_final ~= y_2,:);

fig = figure;
scatter_clusters(X, y_final, K, '');
scatter(X_diff(:,1), X_diff(:,2), 50, 'ko');

fig_iterations = scatter_iterations(X, Y, K);

saveas(fig, '../figures/problem11b.eps', 'epsc');
saveas(fig_iterations, '../figures/problem11b_iterations.eps', 'epsc');