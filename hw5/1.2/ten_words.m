clear;

data = load('medium_100_10k.mat');
vocab = data.vocab;
embeds = data.wordembeddings;

% Get distances to centroids for each data point.
[~, ~, ~, D] = kmeans(embeds, 10);

% Extract indices for points with smallest distances for each centroid.
[~, I] = min(D);

% Find the words that correspond to the indices.
words = vocab(I);

disp(words);