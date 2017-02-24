clear;

data = load('d1b.mat');

X = data.X;
Y = data.Y;
C = 1;

SVMStruct = svmtrain(X, Y, 'BoxConstraint', C, 'autoscale', false);

a = SVMStruct.Alpha;
s = SVMStruct.SupportVectors;

w = transpose(s) * a;
b = SVMStruct.Bias;

X1 = X(Y == 1, :);
X2 = X(Y == -1, :);

Y_prediction = svmclassify(SVMStruct, X);

X_wrong = X(Y ~= Y_prediction, :);

figure;
hold on;
scatter(X_wrong(:,1), X_wrong(:,2), 150, 'o', 'yellow', 'filled');
scatter(X1(:,1), X1(:,2), 50, '+', 'red');
scatter(X2(:,1), X2(:,2), 50, 'x', 'blue');
scatter(s(:,1), s(:,2), 100, 'o', 'black');
ezplot(@(x1, x2) w(1)*x1 + w(2)*x2 + b);
% ezplot(@(x1, x2) w(1)*x1 + w(2)*x2 + b + 1);
% ezplot(@(x1, x2) w(1)*x1 + w(2)*x2 + b - 1);
title(sprintf('C = %d', C));
legend('Wrongly classified', '1', '-1', 'Support vectors', 'Decision boundary');