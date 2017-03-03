data = load('hw5_p1a.mat');
X = data.X;
k = 2;

Y = kmeans_linear(X, k);

y_2 = Y{2};
y_final = Y{end};

X1 = X(y_final == 1,:);
X2 = X(y_final == 2,:);
X_diff = X(y_final ~= y_2,:);

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), 'x');
scatter(X2(:,1), X2(:,2), '+');
scatter(X_diff(:,1), X_diff(:,2), 50, 'ko');

saveas(fig, '../figures/problem11b.eps', 'epsc');