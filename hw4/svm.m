clear;
fig = figure
hold on

data = load('d1b.mat');

X = data.X;
Y = data.Y;

X1 = X(Y == 1, :);
X2 = X(Y == -1, :);
scatter(X1(:,1), X1(:,2), 30, 'x');
scatter(X2(:,1), X2(:,2), 30, 'o');

SVMStruct = svmtrain(X, Y, 'BoxConstraint', 10000)


ind = SVMStruct.SupportVectorIndices;
a = SVMStruct.Alpha;
b = SVMStruct.Bias;

w = [0; 0];
for n=1:size(a)
    w = w + a(n) * Y(ind(n)) * transpose(X(ind(n),:));
end

ezplot(@(x1, x2) w(1)*x1 + w(2)*x2)