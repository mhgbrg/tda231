clear;

hold on;

X = dlmread('dataset0.txt');

xCov = cov(X);
xCor = corrcoef(X);

Y = (X - min(X)) ./ (max(X) - min(X));

colormap copper

subplot(2,2,1)
imagesc(corrcoef(X))
title('correlation X')
colorbar

subplot(2,2,2)
imagesc(corrcoef(Y))
title('correlation Y')
colorbar

subplot(2,2,3)
imagesc(cov(X))
title('covariance X')
colorbar

subplot(2,2,4)
imagesc(cov(Y))
title('covariance Y')
colorbar
