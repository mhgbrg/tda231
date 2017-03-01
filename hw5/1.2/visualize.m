clear;
addpath('./tSNE_matlab');

data = load('medium_100_10k.mat');

vocab = data.vocab;
embeds = data.wordembeddings;

[ y, ind ] = datasample(vocab, 1000);
X = embeds(ind,:);

X_ = tsne(X);

C = kmeans(X, 10);

figure;
hold on;
for i=1:10
    X_i = X_(C == i, :);
    scatter(X_i(:,1), X_i(:,2));
end