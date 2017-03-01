clear;

data = load('medium_100_10k.mat');

vocab = data.vocab;
embeds = data.wordembeddings;

[~, ~, ~, D] = kmeans(embeds, 10);

[~, I] = min(D);

words = vocab(I);

disp(words);