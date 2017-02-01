function [ Ytest ] = new_classifier(Xtest, mu1, mu2)
%NEW_CLASSIFIER Returns a new classifier
    b = (mu1 + mu2) ./ 2;
    Ytest = sign( (mu1 - mu2) * transpose(Xtest - b) ./ norm((mu1 - mu2)));
end

