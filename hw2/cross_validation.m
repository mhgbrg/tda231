clear;

data = load('dataset2.mat');
X = data.x;
y = data.y;

folds = 5;

K = crossvalind('Kfold',2000,folds);

bayesFail = 0;
newFail = 0;

for k=1:folds
    trainX = X(K ~= k,:);
    trainy = y(K ~= k);
    testX = X(K == k,:);
    testy = y(K == k);

    [mu1, ~] = musig(trainX(trainy == 1,:));
    [mu2, ~] = musig(trainX(trainy == -1,:));

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