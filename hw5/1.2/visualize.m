clear;
addpath('./tSNE_matlab');
addpath('../helpers');

data = load('medium_100_10k.mat');
vocab = data.vocab;
embeds = data.wordembeddings;

samples = 1000;
K = 10;

% Sample dataset
X = datasample(embeds, samples, 'Replace', false);

% Classify data
y = kmeans(X, K);

% Project data to two dimensions using t-SNE
X_ = tsne(X);

% Plot projected data points 
fig = figure;
scatter_clusters(X_, y, K, '');

% saveas(fig, '../figures/problem12d.eps', 'epsc');