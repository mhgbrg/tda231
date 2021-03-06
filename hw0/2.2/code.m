clear;
figure;

X = dlmread('dataset0.txt');
Y = (X - min(X)) ./ (max(X) - min(X));

xCov = cov(X);
xCor = corrcoef(X);
yCov = cov(Y);
yCor = corrcoef(Y);

minCor = min(min(yCor));
[f1,f2] = find(yCor == minCor);

scatter(Y(:,f1(1)), Y(:,f2(1)), 10, 'black', 'filled');
title(sprintf('Correlation for features %i and %i is %.4f', f1(1), f2(1), minCor));

figure;
colormap copper

subplot(2,2,1)
imagesc(xCor)
title('correlation X')
colorbar

subplot(2,2,2)
imagesc(yCor)
title('correlation Y')
colorbar

subplot(2,2,3)
imagesc(xCov)
title('covariance X')
colorbar

subplot(2,2,4)
imagesc(yCov)
title('covariance Y')
colorbar
