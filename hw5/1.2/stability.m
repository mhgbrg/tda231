clear;

data = load('medium_100_10k.mat');
vocab = data.vocab;
embeds = data.wordembeddings;

runs = 10;

f = 0;

for p=1:runs
    % Run kmeans
    C = kmeans(embeds, 10, 'Replicates', 1);

    % Calculate N0
    cavalry_class = C(strcmp(vocab, 'cavalry'));
    C1 = find(C == cavalry_class);
    C1_size = size(C1, 1);
    N0 = (C1_size^2 - C1_size) / 2;

    % Run kmeans again
    C_ = kmeans(embeds, 10, 'Replicates', 1);

    % Calculate N1
    N1 = 0;

    for i=1:C1_size
        word1_index = C1(i);
        word1_class = C_(word1_index);

        for j=(i+1):C1_size
            word2_index = C1(j);
            word2_class = C_(word2_index);

            if word1_class == word2_class
                N1 = N1 + 1;
            end
        end
    end

    % Calculate accumulative f
    f = f + N1 / N0;
end

% Average f over all runs
f = f / runs
