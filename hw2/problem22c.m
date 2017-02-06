clear;

handwritten = load('digits.mat');
data = handwritten.data;

scaled = data ./ 255;
vars = zeros(32, 1100, 10);
for i=1:size(scaled, 2)
    for j=1:10
        
        x = scaled(:,i,j);
        y = reshape(x, 16, 16);
        
        x_ = [ var(y,0,1) transpose(var(y,0,2)) ];
        
        vars(:,i,j) = transpose(x_);
        
    end
    
end

% =========== Test misclassification rate using actual values ============ %

fives = transpose(data(:,:,5));
eights = transpose(data(:,:,8));

fivesAndEightsX = [ fives; eights ];
fivesAndEightsY = [ ones(size(fives, 1), 1); -1*ones(size(eights, 1), 1) ];

disp('new_classifier:')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) nc(XT, xt, yt)));

disp('sph_bayes:')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) sph(XT, xt, yt)));

% =============Test misclassification rate using variances =============== %

fives = transpose(vars(:,:,5));
eights = transpose(vars(:,:,8));

fivesAndEightsX = [ fives; eights ];
fivesAndEightsY = [ ones(size(fives, 1), 1); -1*ones(size(eights, 1), 1) ];

disp('new_classifier (variance):')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) nc(XT, xt, yt)));

disp('sph_bayes: (variance)')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) sph(XT, xt, yt)));

% ============================ %

function [ YTest ] = sph(XTest, XTrain, YTrain)
%sph Helper function to run sph_bayes using vectors
%   Detailed explanation goes here
    YTest = zeros(size(XTest, 1), 1);
    for i=1:size(XTest, 1)
        [ ~, ~, y] = sph_bayes(XTest(i,:), XTrain, YTrain);
        YTest(i) = y;
    end
end

function [ YTest ] = nc(XTest, XTrain, YTrain)

    [mu1, ~] = muvar(XTrain(YTrain == 1, :));
    [mu2, ~] = muvar(XTrain(YTrain == -1, :));
    
    YTest = zeros(size(XTest, 1), 1);
    for i=1:size(XTest, 1)
        YTest(i) = new_classifier(XTest(i,:), mu1, mu2);
    end
end