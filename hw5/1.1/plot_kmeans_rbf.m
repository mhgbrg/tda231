clear;

data = load('hw5_p1b.mat');
X = data.X;
K = 2;

sig = .2;
rbf_kernel = @(x1, x2) exp(-norm(x1 - x2)^2 / (2 * sig^2));

Y_linear = kmeans_linear(X, K);
Y_kernel = kmeans_kernel(X, K, rbf_kernel);

y_linear = Y_linear{end};
y_kernel = Y_kernel{end};

fig_linear = figure;
scatter_clusters(X, y_linear, K, 'Linear');
fig_kernel = figure;
scatter_clusters(X, y_kernel, K, 'Kernel');

fig_iterations = scatter_iterations(X, Y_kernel, K);

saveas(fig_linear, '../figures/problem11d_linear.eps', 'epsc');
saveas(fig_kernel, '../figures/problem11d_kernel.eps', 'epsc');
saveas(fig_iterations, '../figures/problem11d_iterations.eps', 'epsc');