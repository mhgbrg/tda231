clear;
addpath('./tSNE_matlab');

samples = 1000;
k = 10;

data = load('medium_100_10k.mat');

vocab = data.vocab;
embeds = data.wordembeddings;

[ y, ind ] = datasample(vocab, samples);
X = embeds(ind,:);

X_ = tsne(X);

C = kmeans(X, k);

markers = ['o', '+', '*', 'x', 's', 'd', '^', 'v', 'p', 'h'];

fig = figure;
hold on;
for i=1:k
    X_i = X_(C == i, :);
    scatter(X_i(:,1), X_i(:,2), markers(i));
end

saveas(fig, '../figures/problem12d.eps', 'epsc');