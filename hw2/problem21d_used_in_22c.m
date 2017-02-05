clear;

handwritten = load('digits.mat');
data = handwritten.data;

fives = transpose(data(:,:,5));
eights = transpose(data(:,:,5));

X = [ fives; eights ];
y = [ ones(size(fives, 1), 1); -1*ones(size(eights, 1), 1) ];

folds = 5;

K = crossvalind('Kfold',2000,folds);

bayesFail = 0;
newFail = 0;

for k=1:folds
    trainX = X(K ~= k,:);
    trainy = y(K ~= k);
    testX = X(K == k,:);
    testy = y(K == k);

    [mu1, ~] = muvar(trainX(trainy == 1,:));
    [mu2, ~] = muvar(trainX(trainy == -1,:));

    for i=1:size(testX,1)
        x = testX(i,:);
        [~, ~, k1] = sph_bayes(x, trainX, trainy);
        if k1 ~= testy(i)
            bayesFail = bayesFail + 1;
        end

        k2 = new_classifier(x, mu1, mu2);
        if k2 ~= testy(i)
            newFail = newFail + 1;
        end
    end
end

bayesFail
newFail