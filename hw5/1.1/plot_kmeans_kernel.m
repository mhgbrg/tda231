data = load('../hw5_p1a.mat');
X = data.X;
k = 2;
sig = 0.2;
kernel = @(x1, x2) exp(-norm(x1 - x2)^2 / (2 * sig^2)); 

y = kmeans_kernel(X, k, kernel)
% 
% X1 = X(y == 1,:);
% X2 = X(y == 2,:);
% X_ = X(y~=after2,:);
% 
% hold on;
% scatter(X1(:,1), X1(:,2), 'x');
% scatter(X2(:,1), X2(:,2), '+');
% scatter(X_(:,1), X_(:,2), 50, 'ko');