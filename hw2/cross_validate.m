function [ mcr ] = cross_validate(X, Y, classify)
%CROSS_VALIDATE Summary of this function goes here
%   Detailed explanation goes here
    folds = 5;
    
    K = crossvalind('Kfold', size(Y, 1),folds);

    fails = 0;
    
    for k=1:folds
        
        XTrain = X(K ~= k,:);
        YTrain = Y(K ~= k);
        XTest = X(K == k,:);
        YTest = Y(K == k);
        
        result = classify(XTest, XTrain, YTrain);
        for i=1:size(result, 1)
            if result(i) ~= YTest(i)
                fails = fails + 1;
            end
        end
    end
    
    mcr = fails ./ size(Y, 1);

end

