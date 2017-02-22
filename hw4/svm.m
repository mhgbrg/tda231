clear;

data = load('d1b.mat');

X = data.X;
Y = data.Y;

% X1 = X(Y == 1, :);
% X2 = X(Y == -1, :);
% scatter(X1(:,1), X1(:,2), 30, 'x');
% scatter(X2(:,1), X2(:,2), 30, 'o');

SVMStruct = svmtrain(X, Y, 'ShowPlot', true, 'BoxConstraint', 1)

