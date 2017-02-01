handwritten = load('digits.mat');
data = handwritten.data;

train5 = transpose(data(:,1:900,5));
train8 = transpose(data(:,1:900,8));

test5 = transpose(data(:,901:1100,5));
test8 = transpose(data(:,901:1100,8));

[mu1, var1] = musig(train5);
[mu2, var2] = musig(train8);

errors = 0;
for i=1:size(test5, 1)
    
    x = test5(i,:);
    k = new_classifier(x, mu1, mu2);
    
    if k == -1
        errors = errors + 1;
    end
end

errors = 0;
for i=1:size(test8, 1)
    
    x = test8(i,:);
    k = new_classifier(x, mu2, mu1);
    
    if k == -1
        errors = errors + 1;
    end
end

