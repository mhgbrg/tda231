clear;

% Load data
data = load('d2.mat');

X = data.X;
Y = data.Y;
C = 1;

% Train SVM (i.e. find optimal alphas)
SVMStruct = svmtrain(X, Y, 'BoxConstraint', C, 'autoscale', false);

a = SVMStruct.Alpha;
s = SVMStruct.SupportVectors;

% Calculate w from alphas
w = transpose(s) * a
b = SVMStruct.Bias

% Use trained SVM to make predictions
Y_prediction = svmclassify(SVMStruct, X);

% Split up data for plotting
X1 = X(Y == 1, :);
X2 = X(Y == -1, :);
X_wrong = X(Y ~= Y_prediction, :);

% Plot
fig = figure;
hold on;
scatter(X_wrong(:,1), X_wrong(:,2), 50, 'o', 'yellow', 'filled');
scatter(X1(:,1), X1(:,2), '+', 'red');
scatter(X2(:,1), X2(:,2), 'x', 'blue');
scatter(s(:,1), s(:,2), 50, 'o', 'black');
ezplot(@(x1, x2) w(1)*x1 + w(2)*x2 + b);
title(sprintf('C = %d', C));
legend('Wrongly classified', '1', '-1', 'Support vectors', 'Decision boundary');

% Save figure
saveas(fig, '../figures/problem22a.eps', 'epsc')
