function [ YTest ] = new_classifier_vec(XTest, XTrain, YTrain)
%NEW_CLASSIFIER_VEC Helper function to run new_classifier using vectors as 
% tests

    [mu1, ~] = muvar(XTrain(YTrain == 1, :));
    [mu2, ~] = muvar(XTrain(YTrain == -1, :));
    
    YTest = zeros(size(XTest, 1), 1);
    for i=1:size(XTest, 1)
        YTest(i) = new_classifier(XTest(i,:), mu1, mu2);
    end
end