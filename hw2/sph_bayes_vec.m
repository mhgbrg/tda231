function [ YTest ] = sph_bayes_vec(XTest, XTrain, YTrain)
%SPH_BAYES_VEC Helper function to run sph_bayes using vectors as tests

    YTest = zeros(size(XTest, 1), 1);
    for i=1:size(XTest, 1)
        [ ~, ~, y] = sph_bayes(XTest(i,:), XTrain, YTrain);
        YTest(i) = y;
    end
end