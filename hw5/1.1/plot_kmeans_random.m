data = load('hw5_p1a.mat');
X = data.X;
k = 2;

[ y, after2 ] = kmeans_random(X, k);

X1 = X(y == 1,:);
X2 = X(y == 2,:);
X_ = X(y~=after2,:);

fig = figure;
hold on;
scatter(X1(:,1), X1(:,2), 'x');
scatter(X2(:,1), X2(:,2), '+');
scatter(X_(:,1), X_(:,2), 50, 'ko');

saveas(fig, '../figures/problem11b.eps', 'epsc');