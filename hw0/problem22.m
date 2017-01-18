clear;

X = dlmread('dataset0.txt');

xCov = cov(X);
xCor = corrcoef(X);

Y = normc(X);