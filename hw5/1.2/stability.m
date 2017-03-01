clear;

data = load('medium_100_10k.mat');

vocab = data.vocab;
embeds = data.wordembeddings;

% Run kmeans
C = kmeans(embeds, 10, 'Replicates', 1);

% Calculate N0
cavalry_class = C(strcmp(vocab, 'cavalry'));
C1 = vocab(C == cavalry_class);
C1_size = size(C1, 2);

C1
C1_size

N0 = (C1_size^2 - C1_size) / 2;

% Run kmeans again
C_ = kmeans(embeds, 10, 'Replicates', 1);

% Calculate N1
N1 = 0;
for i=1:C1_size
    
    word1 = C1(i);
    word1_class = C_(strcmp(vocab, word1));
    
    for j=i:C1_size
        
        word2 = C1(j);
        word2_class = C_(strcmp(vocab, word2));
        
        if word1_class == word2_class
            N1 = N1 + 1;
        end
        
    end
    
end

f = N1 / N0;

disp(f);