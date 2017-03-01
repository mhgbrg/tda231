data = load('../hw5_p1b.mat');
X = data.X;
k = 2;
sig = .2;

[ y, after1 ] = kmeans_rbf_kernel(X, k, sig);
X1 = X(y == 1,:);
X2 = X(y == 2,:);

X1_ = X(after1 == 1,:);
X2_ = X(after1 == 2,:);

% y
figure;
hold on;
scatter(X1(:,1), X1(:,2), 'x');
scatter(X2(:,1), X2(:,2), '+');

% after1
figure;
hold on;
scatter(X1_(:,1), X1_(:,2), 'x');
scatter(X2_(:,1), X2_(:,2), '+');