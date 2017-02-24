clear;

data = load('d2.mat');

X = data.X;
Y = data.Y;

showPlot = false;

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

function YTest = classify(kernel, method, XTest, XTrain, YTrain, showPlot)
    if showPlot
        figure;
    end
    SVMStruct = svmtrain(XTrain, YTrain, 'ShowPlot', showPlot, 'BoxConstraint', 1, 'autoscale', false, 'kernel_function', kernel, 'method', method);
    YTest = svmclassify(SVMStruct, XTest);
end