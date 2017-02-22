clear;

data = load('d2.mat');

X = data.X;
Y = data.Y;

disp('Linear kernel with SMO');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('linear', 'smo', XTest, XTrain, YTrain)));

disp('Linear kernel with QP');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('linear', 'qp', XTest, XTrain, YTrain)));

disp('Quadratic kernel with SMO');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('quadratic', 'smo', XTest, XTrain, YTrain)));

disp('Quadratic kernel with QP');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('quadratic', 'qp', XTest, XTrain, YTrain)));

disp('RBF kernel with SMO');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('rbf', 'smo', XTest, XTrain, YTrain)));

disp('RBF kernel with QP');
disp(cross_validate(X, Y, @(XTest, XTrain, YTrain) classify('rbf', 'qp', XTest, XTrain, YTrain)));

function YTest = classify(kernel, method, XTest, XTrain, YTrain)
    SVMStruct = svmtrain(XTrain, YTrain, 'ShowPlot', true, 'BoxConstraint', 1, 'autoscale', false, 'kernel_function', kernel, 'method', method);
    YTest = svmclassify(SVMStruct, XTest);
end