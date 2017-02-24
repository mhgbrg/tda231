clear;

% Load data
data = load('d2.mat');

X = data.X;
Y = data.Y;

showPlot = false;

% Use cross validation to evaluate the different kernels and optimization methods
disp('Linear kernel with SMO');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('linear', 'smo', XTest, XTrain, YTrain, showPlot)));

disp('Linear kernel with QP');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('linear', 'qp', XTest, XTrain, YTrain, showPlot)));

disp('Quadratic kernel with SMO');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('quadratic', 'smo', XTest, XTrain, YTrain, showPlot)));

disp('Quadratic kernel with QP');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('quadratic', 'qp', XTest, XTrain, YTrain, showPlot)));

disp('RBF kernel with SMO');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('rbf', 'smo', XTest, XTrain, YTrain, showPlot)));

disp('RBF kernel with QP');
fprintf('MCR: %g\n\n', cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('rbf', 'qp', XTest, XTrain, YTrain, showPlot)));

% Plot decision boundaries for RBF with all data
fig1 = figure;
svmtrain(X, Y, 'ShowPlot', true, 'BoxConstraint', 1, 'autoscale', false, 'kernel_function', 'rbf', 'method', 'smo');
title('SMO');
xlabel('x_1');
ylabel('x_2');

fig2 = figure;
svmtrain(X, Y, 'ShowPlot', true, 'BoxConstraint', 1, 'autoscale', false, 'kernel_function', 'rbf', 'method', 'qp');
title('QP');
xlabel('x_1');
ylabel('x_2');

% Save figures
saveas(fig1, '../figures/problem22c_smo.eps', 'epsc');
saveas(fig2, '../figures/problem22c_qp.eps', 'epsc');

% Classification function for SVM
function YTest = classify(kernel, method, XTest, XTrain, YTrain, showPlot)
    if showPlot
        figure;
    end
    SVMStruct = svmtrain(XTrain, YTrain, 'ShowPlot', showPlot, 'BoxConstraint', 1, 'autoscale', false, 'kernel_function', kernel, 'method', method);
    YTest = svmclassify(SVMStruct, XTest);
end