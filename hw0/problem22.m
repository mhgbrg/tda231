clear;

hold on;

X = dlmread('dataset0.txt');

xCov = cov(X);
xCor = corrcoef(X);

Y = (X - min(X)) ./ (max(X) - min(X));

surf(corrcoef(X))

figure
surf(corrcoef(Y))

figure
surf(cov(X))

figure
surf(cov(Y))