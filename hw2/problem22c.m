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
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) new_classifier_vec(XT, xt, yt)));

disp('sph_bayes:')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) sph_bayes_vec(XT, xt, yt)));

% =============Test misclassification rate using variances =============== %

fives = transpose(vars(:,:,5));
eights = transpose(vars(:,:,8));

fivesAndEightsX = [ fives; eights ];
fivesAndEightsY = [ ones(size(fives, 1), 1); -1*ones(size(eights, 1), 1) ];

disp('new_classifier (variance):')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) new_classifier_vec(XT, xt, yt)));

disp('sph_bayes: (variance)')
disp(cross_validate(fivesAndEightsX, fivesAndEightsY, @(XT, xt, yt) sph_bayes_vec(XT, xt, yt)));